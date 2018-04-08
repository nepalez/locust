class Locust::Keywords::OneOf
  class Verifier < Locust::Verifier
    validate :object_satisfies_a_requirement
    validate :object_satisfies_exactly_one_requirement

    private

    def count
      @count ||= schema.data.count { |item| item.verify(object).empty? }
    end

    def object_satisfies_a_requirement
      return unless schema.data&.count&.positive?
      return unless count.zero?
      errors << message("It should satisfy some schema.")
    end

    def object_satisfies_exactly_one_requirement
      return unless schema.data&.count&.positive?
      return unless count > 1
      errors << message("It should satisfy exactly one of given schemas.")
    end
  end
end
