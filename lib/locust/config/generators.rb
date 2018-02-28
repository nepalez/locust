class Locust::Config
  #
  # Collection of generators for some format
  #
  class Generators
    include Enumerable

    #
    # Iterates by the collection of all generators
    #
    # @return [Enumerator<Locust::Config::Generator>]
    #
    def each
      return to_enum unless block_given?
      @collection.each do |item|
        next if @mutable_only && item.immutable?
        yield(item)
      end
    end

    #
    # @!method add(options)
    # Adds new generator to the collection
    #
    # @option options [Boolean] :immutable Whether values should be mutated
    # @yield A block with a lazy definition for generated value
    # @return [self]
    #
    def add(**options, &block)
      @collection << Generator.new(block, options)
      self
    end

    #
    # Filter the collection that keeps mutable generators only
    #
    # @return [Locust::Config::Generators]
    #
    def mutable
      self.class.new(@collection, mutable_only: true)
    end

    private

    def initialize(collection = nil, mutable_only: false)
      @mutable_only = mutable_only
      @collection   = collection.to_a
    end
  end
end
