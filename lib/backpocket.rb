module Backpocket
  # Your code goes here...
end

require 'backpocket/core/if_present'

if defined?(Rails)
  module Backpocket
    class Railtie < Rails::Railtie
      rake_tasks do
        load File.expand_path('../backpocket/tasks/db_recreate.rb', __FILE__)
      end
    end
  end
end

if defined?(ActiveRecord)
  require 'backpocket/active_record/arel_table_accessor'
  ActiveRecord::Base.send(:include, Backpocket::ActiveRecord::ArelTableAccessor)
end

if defined?(ActionView)
  require 'backpocket/action_view/list_items_for'
  ActionView::Base.send(:include, Backpocket::ActionView::ListItemsFor)

  require 'backpocket/action_view/escape_javascript_alias'
  ActionView::Base.send(:include, Backpocket::ActionView::EscapeJavascriptAlias)
end
