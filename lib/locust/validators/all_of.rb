module Locust::Validators
  #
  # Checks the 'allOf' keyword definition
  #
  class AllOf < Base
    validate :source_is_an_array
    validate :source_has_elements

    private

    def source_is_an_array
      return if source.is_a? Array
      errors << message("Its value MUST be an array.")
    end

    def source_has_elements
      return if errors.any?
      return if source.count.positive?
      errors << message("Its value MUST have at least one element.")
    end
  end
end
