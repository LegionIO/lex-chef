# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Environment
          def list_environments(**)
            { environments: connection(**).get('environments').body }
          end

          def get_environment(name:, **)
            { environment: connection(**).get("environments/#{name}").body }
          end

          def create_environment(name:, **)
            resp = connection(**).post('environments', { name: name })
            { created: true, environment: resp.body }
          end

          def delete_environment(name:, **)
            { deleted: true, environment: connection(**).delete("environments/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
