# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Node
          def list_nodes(**)
            resp = connection(**).get('nodes')
            { nodes: resp.body }
          end

          def get_node(name:, **)
            resp = connection(**).get("nodes/#{name}")
            { node: resp.body }
          end

          def create_node(name:, run_list: [], **opts)
            body = { name: name, run_list: run_list }
            body[:automatic] = opts[:automatic] if opts[:automatic]
            body[:default] = opts[:default_attrs] if opts[:default_attrs]
            resp = connection(**opts).post('nodes', body)
            { created: true, node: resp.body }
          end

          def update_node(name:, **opts)
            body = {}
            body[:run_list] = opts[:run_list] if opts[:run_list]
            body[:automatic] = opts[:automatic] if opts[:automatic]
            resp = connection(**opts).put("nodes/#{name}", body)
            { updated: true, node: resp.body }
          end

          def delete_node(name:, **)
            resp = connection(**).delete("nodes/#{name}")
            { deleted: true, node: resp.body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
