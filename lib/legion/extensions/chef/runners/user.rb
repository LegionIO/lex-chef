# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module User
          def list_users(**)
            { users: connection(**).get('users').body }
          end

          def get_user(name:, **)
            { user: connection(**).get("users/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
