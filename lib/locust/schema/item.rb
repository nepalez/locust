module Locust::Schema
  #
  # @private
  # @see The element of 'items' keyword
  #
  class Item < Locust::Struct
    keyword { "items[#{index}]" }
    option  :index

    def schema
      @schema ||= Object.call(source, self)
    end

    def chidlren
      [schema]
    end
  end
end
