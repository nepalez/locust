class Locust
  #
  # Enumerable collection and the namespace for edge case generators
  #
  class EdgeCases
    include Enumerable

    require_relative "edge_cases/result"
    require_relative "edge_cases/base"
    require_relative "edge_cases/empty_string"

    # Result of generation if the schema object forbids the case
    NotApplicableError = Locust::NotApplicableError

    # List of edge cases
    All = constants.map { |name| EdgeCases.const_get(name) }
                   .select { |c| c.is_a?(Class) && c.superclass == Base }
                   .freeze

    #
    # Iterates by the collection of edge case instances applicable to the schema
    #
    # @yieldparam [Locust::EdgeCases::Base]
    # @return [Enumerator<Locust::EdgeCases::Base>]
    #
    def each
      block_given? ? @collection.each { |edge_case| yield(edge_case) } : to_enum
    end

    #
    # Returns a sample instance of applicable edge cases
    #
    # @return [Locust::EdgeCases::Base]
    #
    def sample
      @collection.sample
    end

    private

    def initialize(object_schema)
      @collection ||= All.map { |klass| klass.new(object_schema) }
                         .select(&:applicable?)
                         .shuffle
    end
  end
end
