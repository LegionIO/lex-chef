# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Role
          def list_roles(**)
            { roles: connection(**).get('roles').body }
          end

          def get_role(name:, **)
            { role: connection(**).get("roles/#{name}").body }
          end

          def create_role(name:, run_list: [], **)
            resp = connection(**).post('roles', { name: name, run_list: run_list })
            { created: true, role: resp.body }
          end

          def delete_role(name:, **)
            { deleted: true, role: connection(**).delete("roles/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
