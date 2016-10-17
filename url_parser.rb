class UrlParser

  def initialize(new_url)
    @new_url = new_url
  end

  def scheme
     @scheme = @new_url.split("://").first
   end
   def domain
     @ndomain = @new_url.split("://").last.split(":").first
   end
   def port
     @port = @new_url.split(":").last.split("/").first
     if @port == "" && scheme == "http"
        "80"
     elsif @port == "" && scheme = "https"
       "443"
   else
     @port
   end
 end
   def path
     @path = @new_url.split("/").last.split("?").first
     if @path == ""
       return nil
     else
       @path
     end
   end
   def query_string
     @query_string = @new_url.split("?").last.split("#").first
     @split1 = query_string.split("&")
     @split1.map! do |value|
       value.split("=")
   end
   @split1.to_h
 end
   def fragment_id
     @fragment_id = @new_url.split("#").last
   end
 end


p UrlParser.new"http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat"
