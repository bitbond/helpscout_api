module HelpscoutApi
  class Conversation < Client

    attr_accessor :auth_params

    def initialize(client, auth_params)
      @client = client
      @auth_params = auth_params
    end

    def list(mailbox_id:, **params)
      response = self.class.get "/mailboxes/#{mailbox_id}#{resource_path}.json", basic_auth: @auth_params, query: params
      handle response
    end

  end
end
