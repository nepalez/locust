module Locust::Validators
  #
  # Checks the type keyword definition
  #
  class Format < Base
    validate :source_is_a_string
    validate :source_is_not_empty

    private

    def source_is_a_string
      return if source.is_a?(String)
      errors << message("Its value MUST be a string.")
    end

    def source_is_not_empty
      return if errors.any?
      return unless source == ""
      errors << message("Its value MUST not be empty.")
    end
  end
end
