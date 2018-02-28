class Locust::Config
  #
  # Configuration for the custom format
  #
  class Format
    # @private
    attr_reader :generators

    #
    # @!method add(options)
    # Registers a new value generator for specifications that use this format
    #
    # @option (see Locust::Config::Generators#add)
    # @yield  (see Locust::Config::Generators#add)
    # @return [self]
    #
    def generator(**options, &block)
      @generators.add(**options, &block)
      self
    end

    private

    def initialize
      @generators = Generators.new
    end
  end
end
