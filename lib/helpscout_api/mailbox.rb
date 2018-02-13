module HelpscoutApi
  class Mailbox < Client

    attr_accessor :auth_params

    def initialize(client, auth_params)
      @client = client
      @auth_params = auth_params
    end
    
  end
end
