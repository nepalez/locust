class Locust::Config
  #
  # Configuration for the custom format
  #
  class Format
    # @private
    attr_reader :generators
    # @private
    attr_reader :validators

    #
    # Registers a new value generator for specifications that use this format
    #
    # @param  [Proc] block
    # @return [self]
    #
    def generate(&block)
      unless block&.arity&.zero?
        raise TypeError, "A generator must be a block without arguments"
      end

      @generators << block
      self
    end

    #
    # Registers a new value generator for specifications that use this format
    #
    # @param  [Proc] block
    # @return [self]
    #
    def validate(&block)
      unless block&.arity == 1
        raise TypeError, "A validator must be a block with exactly one argument"
      end

      @validators << block
      self
    end

    #
    # Validates given object
    #
    # @param  [Object] object
    # @return [Boolean]
    #
    def check(object)
      @validators.inject(true) { |result, item| result && item.call(object) }
    end

    private

    def initialize
      @generators = []
      @validators = []
    end
  end
end
