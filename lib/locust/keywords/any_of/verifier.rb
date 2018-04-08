class Locust::Keywords::AnyOf
  class Verifier < Locust::Verifier
    validate :object_satisfies_some_requirement

    private

    def count
      @count ||= schema.data.count { |item| item.verify(object).empty? }
    end

    def object_satisfies_some_requirement
      return unless schema.data&.count&.positive?
      return unless count.zero?
      errors << message("It should satisfy some schema.")
    end
  end
end
