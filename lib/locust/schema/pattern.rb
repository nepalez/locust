module Locust::Schema
  #
  # @private
  # Container for definition of the 'pattern' part of object schema
  #
  # @see
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.2.3
  #
  class Pattern < SimpleDelegator
    extend Coercion

    def accept?(string)
      !reject?(string)
    end

    def reject?(string)
      !match(string.to_s)
    end

    private

    def initialize(value)
      super Regexp.new(value.to_s)
    rescue
      raise ArgumentError,
            "Invalid value #{value.inspect} for the 'pattern' keyword." \
            " The value of this keyword MUST be a string." \
            " This string SHOULD be a valid regular expression," \
            " according to the ECMA 262 regular expression dialect."
    end
  end
end