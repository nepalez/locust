module Locust::Schema
  #
  # @private
  # Element of the 'properties' keyword
  #
  class Property < Locust::Struct
    keyword { "properties[#{key}]" }
    option  :key

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
