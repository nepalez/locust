module Locust::Schemas
  #
  # @private
  # @see The 'nullable' keyword
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#schemaNullable
  #
  class Nullable < Base
    keyword "nullable"
  end
end
