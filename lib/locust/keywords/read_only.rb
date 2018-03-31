module Locust::Keywords
  #
  # @private
  # @see The 'readOnly' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-10.3
  #
  class ReadOnly < Locust::Schema
    require_relative "read_only/validator"

    keyword "readOnly"
  end
end
