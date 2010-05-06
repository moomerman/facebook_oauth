module FacebookOAuth
  class Client
    
    def me(id = 'me')
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def album(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def event(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def group(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def link(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def note(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def page(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def photo(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def post(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def status(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def user(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
    def video(id)
      FacebookOAuth::FacebookObject.new(id, self)
    end
    
  end
  
  class FacebookObject
    def initialize(oid, client)
      @oid = oid
      @client = client
    end
    
    def info
      @client.send(:_get, @oid)
    end
    
    def method_missing(a)
      puts a.inspect
      @client.send(:_get, "#{@oid}/#{a.to_s}")
    end
    
  end
end