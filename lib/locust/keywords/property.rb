module Locust::Keywords
  #
  # @private
  # Element of the 'properties' keyword
  #
  class Property < Locust::Schema
    require_relative "property/validator"
    require_relative "property/verifier"

    option :key

    keyword   { "properties[#{key}]" }
    validator Validator
    verifier  Verifier

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
