module Locust::Keywords
  #
  # @private
  # @see The 'items' keyword in JSON Keywords Specification (several values)
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.1
  #
  class Items < Locust::Schema
    require_relative "items/validator"
    require_relative "items/verifier"

    keyword   "items"
    validator Validator
    verifier  Verifier

    def schema
      return @schema if instance_variable_defined? :@schema
      @schema = Object.call(source, self) if source.is_a?(Hash)
    end

    def schemas
      return @schemas if instance_variable_defined? :@schemas
      return @schemas = [] unless source.is_a?(Array)
      @list = source.map.with_index do |item, index|
        Item.call({ source: item, index: index }, parent)
      end
    end

    def [](index)
      schemas[index]
    end
  end
end
