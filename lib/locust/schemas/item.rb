module Locust::Schemas
  #
  # @private
  # @see The element of 'items' keyword
  #
  class Item < Base
    keyword { "items[#{index}]" }
    option  :index

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
