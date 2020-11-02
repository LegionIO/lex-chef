module Legion
  module Extensions
    module Chef
      module Runners
        module Organization
          # https://docs.chef.io/api_chef_server/#organizations
          def list(**); end

          def get(**); end

          def create(**); end

          def delete(**); end

          def update(**); end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
