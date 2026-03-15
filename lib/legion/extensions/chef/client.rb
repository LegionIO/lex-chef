# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/node'
require_relative 'runners/organization'
require_relative 'runners/cookbook'
require_relative 'runners/environment'
require_relative 'runners/role'
require_relative 'runners/group'
require_relative 'runners/policy'
require_relative 'runners/data'
require_relative 'runners/license'
require_relative 'runners/user'
require_relative 'runners/search'

module Legion
  module Extensions
    module Chef
      class Client
        include Helpers::Client
        include Runners::Node
        include Runners::Organization
        include Runners::Cookbook
        include Runners::Environment
        include Runners::Role
        include Runners::Group
        include Runners::Policy
        include Runners::Data
        include Runners::License
        include Runners::User
        include Runners::Search

        attr_reader :opts

        def initialize(url: 'https://localhost/organizations/default', client_name: nil, api_key: nil, **extra)
          @opts = { url: url, client_name: client_name, api_key: api_key, **extra }.compact
        end

        def connection(**override)
          super(**@opts, **override)
        end
      end
    end
  end
end
