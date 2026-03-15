# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Group
          def list_groups(**)
            { groups: connection(**).get('groups').body }
          end

          def get_group(name:, **)
            { group: connection(**).get("groups/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
