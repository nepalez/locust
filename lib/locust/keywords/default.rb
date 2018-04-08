module Locust::Keywords
  #
  # @private
  #
  class Default < Locust::Schema
    require_relative "default/validator"

    keyword   "default"
    validator Validator
  end
end
