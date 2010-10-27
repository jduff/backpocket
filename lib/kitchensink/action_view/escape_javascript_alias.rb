module Kitchensink
  module ActionView
    module EscapeJavascriptAlias
      def self.included(base)
        base.class_eval do
          alias :js :escape_javascript
        end
      end
    end
  end
end
