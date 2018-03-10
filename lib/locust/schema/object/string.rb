class Locust::Schema::Object
  #
  # Describes objects of the 'string' type
  #
  # @see Schema Object in OpenAPI 2.0 specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
  #
  # @see Validation Keywords for Strings in JSON Schema specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.3
  #
  class String < self
    option :maxLength, proc(&:to_i),      optional: true, as: :max_length
    option :minLength, proc(&:to_i),      optional: true, as: :min_length
    option :pattern,   Keywords::Pattern, optional: true

    # stringify values
    option :const,   optional: true, type: proc(&:to_s)
    option :default, optional: true, type: proc(&:to_s)
    option :example, optional: true, type: proc(&:to_s)
    option :enum,    optional: true,
                     type: ->(v) { Keywords::Enum.call Array(v).map(&:to_s) }
  end
end
