module Locust::Keywords
  #
  # @private
  # @see The 'writeOnly' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-10.3
  #
  class WriteOnly < Locust::Schema
    require_relative "write_only/validator"

    keyword "writeOnly"
  end
end
