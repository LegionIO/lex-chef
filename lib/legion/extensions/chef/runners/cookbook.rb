# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Cookbook
          def list_cookbooks(**)
            { cookbooks: connection(**).get('cookbooks').body }
          end

          def get_cookbook(name:, **)
            { cookbook: connection(**).get("cookbooks/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
