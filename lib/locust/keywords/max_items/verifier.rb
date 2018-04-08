class Locust::Keywords::MaxItems
  class Verifier < Locust::Verifier
    validate :number_of_items_satisfies_the_limit

    private

    def number_of_items_satisfies_the_limit
      return unless object.is_a? Array
      return if object.count <= schema.source
      errors << message
    end
  end
end
