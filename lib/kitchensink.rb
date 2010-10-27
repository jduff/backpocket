module Kitchensink
  # Your code goes here...
end

require 'kitchensink/core/if_present'

if defined?(Rails)
  module Kitchensink
    class Railtie < Rails::Railtie
      rake_tasks do
        load File.expand_path('../kitchensink/tasks/db_recreate.rb', __FILE__)
      end
    end
  end
end

if defined?(ActiveRecord)
  require 'kitchensink/active_record/arel_table_accessor'
  ActiveRecord::Base.send(:include, Kitchensink::ActiveRecord::ArelTableAccessor)
end

if defined?(ActionView)
  require 'kitchensink/action_view/list_items_for'
  ActionView::Base.send(:include, Kitchensink::ActionView::ListItemsFor)

  require 'kitchensink/action_view/escape_javascript_alias'
  ActionView::Base.send(:include, Kitchensink::ActionView::EscapeJavascriptAlias)
end
