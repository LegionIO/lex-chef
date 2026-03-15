# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Search
          def search(index:, query: '*:*', rows: 1000, start: 0, **)
            resp = connection(**).get("search/#{index}", { q: query, rows: rows, start: start })
            { total: resp.body['total'], rows: resp.body['rows'] }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
