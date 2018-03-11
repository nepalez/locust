class Locust
  #
  # @private
  # Provides coercion functionality for using classes as
  # dry-initializer option/param types.
  #
  module Coercion
    def new(value)
      case value
      when self then value
      when Hash then super symbolize_keys(value)
      else           super value
      end
    end

    def call(value)
      new(value)
    end

    def [](value)
      call(value)
    end

    private

    def symbolize_keys(value)
      Hash(value).each_with_object({}) { |(k, v), o| o[k.to_sym] = v }
    rescue
      raise Locust::InvalidSchemaError,
            "Invalid value #{value.inspect} for the schema." \
            " The value MUST be a hash."
    end
  end
end
