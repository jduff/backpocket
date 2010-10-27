# http://www.viget.com/extend/practical-uses-of-ruby-blocks/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed:+Viget+Extend
#
# <% list_items_for Article.published.most_recent(4) do |article| %>
#   <%= link_to article.title, article %>
# <% end %>
#
# Output:
#
# <li class="first"><a href="/articles/4">Article #4</a></li>
# <li><a href="/articles/3">Article #3</a></li>
# <li><a href="/articles/2">Article #2</a></li>
# <li class="last"><a href="/articles/1">Article #1</a></li>

module Backpocket
  module ActionView
    module ListItemsFor
      def list_items_for(collection, opts = {}, &block)
        opts.reverse_merge!(:first_class => "first", :last_class => "last")

        concat(collection.map { |item|
          html_class = [
            opts[:class],
            (opts[:first_class] if item == collection.first),
            (opts[:last_class] if item == collection.last)
          ]

          content_tag :li, capture(item, &block), :class => html_class.compact * " "
        }.join)
      end
    end
  end
end
