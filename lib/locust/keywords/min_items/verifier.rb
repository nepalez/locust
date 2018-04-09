class Locust::Keywords::MinItems
  class Verifier < Locust::Verifier
    validate :number_of_items_satisfies_the_limit

    private

    def continue?
      errors.empty? && schema.validate.empty? && object.is_a?(Array)
    end

    def number_of_items_satisfies_the_limit
      return unless continue?
      return if object.count >= schema.source
      errors << message
    end
  end
end
