# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Organization
          # https://docs.chef.io/api_chef_server/#organizations
          def list_organizations(**)
            resp = connection(**).get('/organizations')
            { organizations: resp.body }
          end

          def get_organization(name:, **)
            resp = connection(**).get("/organizations/#{name}")
            { organization: resp.body }
          end

          def create_organization(name:, full_name:, **)
            resp = connection(**).post('/organizations', { name: name, full_name: full_name })
            { created: true, organization: resp.body }
          end

          def update_organization(name:, full_name:, **)
            resp = connection(**).put("/organizations/#{name}", { full_name: full_name })
            { updated: true, organization: resp.body }
          end

          def delete_organization(name:, **)
            resp = connection(**).delete("/organizations/#{name}")
            { deleted: true, organization: resp.body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
