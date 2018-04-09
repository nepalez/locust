module Locust::Keywords
  #
  # @private
  # @see The element of 'items' keyword
  #
  class Item < Locust::Schema
    require_relative "item/validator"
    require_relative "item/verifier"

    option :index

    keyword   { "items[#{index}]" }
    validator Validator
    verifier  Verifier

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
