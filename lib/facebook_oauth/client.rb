require 'facebook_oauth/objects'

module FacebookOAuth
  class Client
    
    def initialize(options = {})
      @application_id = options[:application_id]
      @application_secret = options[:application_secret]
      @callback = options[:callback]
      @token = options[:token]
    end
  
    def authorize_url(options = {})
      options[:scope] ||= 'offline_access,publish_stream'
      client.auth_code.authorize_url(
        :client_id => @application_id,
        :redirect_uri => options[:callback] || @callback,
        :scope => options[:scope]
      )
    end
    
    def authorize(options = {})
      @access_token ||= client.auth_code.get_token(
        options[:code],
        :redirect_uri => options[:callback] || @callback,
        :parse => :query
      )
      
      @token = @access_token.token
      @access_token
    end
    
    private
      def client
        @client ||= OAuth2::Client.new(
          @application_id,
          @application_secret,
          { :site=>"https://graph.facebook.com", :token_url => "/oauth/access_token" }
        )
      end

      def access_token
        @access_token ||= OAuth2::AccessToken.new(client, @token)
        @access_token.options[:mode] = :query
        @access_token.options[:param_name] = :access_token
        @access_token
      end
      
      def _get(url)
        oauth_response = access_token.get(url).parsed
        JSON.parse(oauth_response) rescue oauth_response
      end

      def _post(url, params={}, headers={})
        oauth_response = access_token.post(url, :params => params, :headers => headers).parsed
        JSON.parse(oauth_response) rescue oauth_response
      end

      def _delete(url)
        oauth_response = access_token.delete(url).parsed
        JSON.parse(oauth_response) rescue oauth_response
      end
  end
end
   
