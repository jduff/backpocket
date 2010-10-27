module Kitchensink
  module ActiveRecord
    module ArelTableAccessor
      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def [](val)
          arel_table[val]
        end
      end
    end
  end
end
