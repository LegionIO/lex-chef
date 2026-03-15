# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Chef
      module Helpers
        module Client
          def connection(url: 'https://localhost/organizations/default', client_name: nil, api_key: nil, **)
            Faraday.new(url: url) do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.headers['X-Chef-Version'] = '18.0'
              conn.headers['X-Ops-UserId'] = client_name if client_name
              conn.headers['Authorization'] = "Bearer #{api_key}" if api_key
              conn.headers['Accept'] = 'application/json'
              conn.adapter Faraday.default_adapter
            end
          end
        end
      end
    end
  end
end
