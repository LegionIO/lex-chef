# frozen_string_literal: true

require 'legion/extensions/chef/version'
require 'legion/extensions/chef/helpers/client'
require 'legion/extensions/chef/runners/node'
require 'legion/extensions/chef/runners/organization'
require 'legion/extensions/chef/runners/cookbook'
require 'legion/extensions/chef/runners/environment'
require 'legion/extensions/chef/runners/role'
require 'legion/extensions/chef/runners/group'
require 'legion/extensions/chef/runners/policy'
require 'legion/extensions/chef/runners/data'
require 'legion/extensions/chef/runners/license'
require 'legion/extensions/chef/runners/user'
require 'legion/extensions/chef/runners/search'

module Legion
  module Extensions
    module Chef
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
