module CasperApi
  class Connection
    BASE_URL = 'https://casper.factorylabs.com:8443/JSSResource'

    attr_accessor :options

    def initialize(username, password)
      @username = username
      @password = password
      @base_url = BASE_URL
    end

    def options
      { :basic_auth => { :username => @username, :password => @password } }
    end


    def get(uri)
      HTTParty.get(@base_url + uri, options)
    end
  end
end
