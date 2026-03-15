# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Policy
          def list_policies(**)
            { policies: connection(**).get('policies').body }
          end

          def get_policy(name:, **)
            { policy: connection(**).get("policies/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
