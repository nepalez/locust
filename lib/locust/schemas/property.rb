module Locust::Schemas
  #
  # @private
  # Element of the 'properties' keyword
  #
  class Property < Base
    keyword { "properties[#{key}]" }
    option  :key

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
