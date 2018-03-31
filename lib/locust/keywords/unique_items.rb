module Locust::Keywords
  #
  # @private
  # @see The 'minimum' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.5
  #
  class UniqueItems < Locust::Schema
    require_relative "unique_items/validator"

    keyword "uniqueItems"
  end
end
