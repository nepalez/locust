module Locust::Keywords
  #
  # @private
  # Element of the 'properties' keyword
  #
  class Property < Locust::Schema
    require_relative "property/validator"

    keyword { "properties[#{key}]" }
    option  :key

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
