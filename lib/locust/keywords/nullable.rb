module Locust::Keywords
  #
  # @private
  # @see The 'nullable' keyword
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#schemaNullable
  #
  class Nullable < Locust::Schema
    require_relative "nullable/validator"

    keyword "nullable"
  end
end
