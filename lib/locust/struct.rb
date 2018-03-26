class Locust
  #
  # The node of a nested structure
  #
  # Every node carries several optional [#options],
  # including the reference to its [#parent],
  # and the [#source] object for its data.
  #
  class Struct
    require_relative "struct/dsl"
    extend Dry::Initializer
    extend DSL
    option :parent
    option :source

    #
    # The hash of known options assigned to the instance
    #
    # @return [Hash<Symbol, Object>]
    #
    def options
      @options ||= self.class.dry_initializer.attributes(self)
    end

    #
    # The ordered list of all the parent nodes from the root of the schema
    #
    # @return [Array<Locust::Struct>]
    #
    def parents
      @parents ||= parent.is_a?(Locust::Struct) ? parent.parents + [parent] : []
    end

    #
    # @abstract
    # Keyword name of the concrete schema
    #
    # @return [String, nil]
    #
    def keyword
      @keyword ||= instance_eval(&self.class.keyword) if self.class.keyword
    end

    #
    # Array of steps from root to the current schema
    #
    # @return [Array<String>]
    #
    def full_path
      @full_path ||= (parents + [self]).map(&:keyword).compact
    end

    #
    # Checks correctness of the schema and returns its errors
    #
    # @return [Array<String>]
    #
    def validate
      Array self.class.validator&.call(self)
    end
  end
end
