# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module Data
          def list_data_bags(**)
            { data_bags: connection(**).get('data').body }
          end

          def get_data_bag(name:, **)
            { data_bag: connection(**).get("data/#{name}").body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
