# frozen_string_literal: true

module Legion
  module Extensions
    module Chef
      module Runners
        module License
          def get_license(**)
            { license: connection(**).get('license').body }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
