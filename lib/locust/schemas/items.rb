module Locust::Schemas
  #
  # @private
  # @see The 'items' keyword in JSON Schemas Specification (several values)
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
  #
  class Items < Base
    keyword "items"

    def schema
      return @schema if instance_variable_defined? :@schema
      @schema = Object.call(source, self) if source.is_a?(Hash)
    end

    def data
      return @list if instance_variable_defined? :@list
      return @list = [] unless source.is_a?(Array)
      @list = source.map.with_index do |item, index|
        Item.call({ source: item, index: index }, parent)
      end
    end

    def [](index)
      data[index]
    end
  end
end
