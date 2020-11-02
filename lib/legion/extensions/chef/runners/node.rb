module Legion
  module Extensions
    module Chef
      module Runners
        module Node
          def list(**); end

          def add(**); end

          def delete(**); end

          def get(**); end

          def update(**); end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
