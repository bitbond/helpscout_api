require 'httparty'

module HelpscoutApi

  class Client
    include HTTParty
    format :json

    HEADERS = { "Content-Type" => "application/json" }
    API_VERSION  = "v1"

    headers HEADERS
    base_uri "https://api.helpscout.net/#{API_VERSION}/"

    attr_accessor :auth_params

    class << self
      attr_accessor :api_token
      @api_token = nil
    end

    def initialize
      @auth_params = { username: self.class.api_token, password: "X" }
    end

    def list(**params)
      response = self.class.get "#{resource_path}.json", basic_auth: @auth_params, query: params
      handle response
    end

    def get(id, **params)
      response = self.class.get "#{resource_path}/#{id}.json", basic_auth: @auth_params, query: params
      handle response
    end

    def create(**params)
      response = self.class.post "#{resource_path}.json", basic_auth: @auth_params, body: params.to_json
      handle response
    end

    def mailboxes
      HelpscoutApi::Mailbox.new(self, @auth_params)
    end

    def conversations
      HelpscoutApi::Conversation.new(self, @auth_params)
    end

    def resource_path
      klass = self.class.name.split('::').last
      klass[0] = klass[0].chr.downcase

      if klass.end_with?('y')
        "/#{klass.chop}ies"
      elsif klass.end_with?('x')
        "/#{klass}es"
      else
        "/#{klass}s"
      end
    end

    def handle response
      case response.code
      when 200..299
        response.parsed_response
      when 400..404
        raise HTTParty::Error, response.parsed_response['error']
      when 500..600
        raise HTTParty::Error, response.parsed_response['error']
      else
        raise StandardError, 'Unknown error'
      end
    end

  end
end
