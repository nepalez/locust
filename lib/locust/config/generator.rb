class Locust::Config
  #
  # Definition for custom generator
  #
  class Generator < SimpleDelegator
    #
    # Whether a generated value allows mutation
    #
    # @return [Boolean]
    #
    def immutable?
      @immutable
    end

    private

    def initialize(block, immutable: false)
      @immutable = true & immutable
      return super(block) if block&.arity&.zero?
      raise TypeError, "Define a generator as a block without arguments"
    end
  end
end
