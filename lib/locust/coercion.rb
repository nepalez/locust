class Locust
  #
  # @private
  # Provides coercion functionality for using classes as
  # dry-initializer option/param types.
  #
  module Coercion
    def new(parent, value)
      case value
      when self then value
      when Hash then super(parent, symbolize_keys(value))
      else           super(parent, value)
      end
    end

    def call(value, parent)
      new(parent, value)
    end

    def [](value, parent)
      call(parent, value)
    end

    private

    def symbolize_keys(value)
      Hash(value).each_with_object({}) { |(k, v), o| o[k.to_sym] = v }
    rescue
      raise InvalidSchemaError,
            "Invalid value #{value.inspect} for the schema." \
            " The value MUST be a hash."
    end
  end
end
