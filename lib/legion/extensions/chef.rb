require 'legion/extensions/chef/version'

module Legion
  module Extensions
    module Chef
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
