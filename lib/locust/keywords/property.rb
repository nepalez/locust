module Locust::Keywords
  #
  # @private
  # Element of the 'properties' keyword
  #
  class Property < Locust::Schema
    require_relative "property/validator"

    option :key

    keyword   { "properties[#{key}]" }
    validator Validator

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
