module Locust::Schema
  #
  # @private
  # @see The 'const' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.3
  #
  class Const < Locust::Struct
    keyword "const"

    def verify(data, *path)
      data == source ? [] : __data_error__(path)
    end

    def validate
      parent.verify(source, *full_path)
    end
  end
end
