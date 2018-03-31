module Locust::Keywords
  #
  # @private
  # @see The 'additionalProperties' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.6
  #
  class AdditionalProperties < Locust::Schema
    require_relative "additional_properties/validator"

    keyword "additionalProperties"

    def schema
      @schema ||= Object[source, self] unless [true, false].include? source
    end

    def allowed?
      !!source
    end
  end
end
