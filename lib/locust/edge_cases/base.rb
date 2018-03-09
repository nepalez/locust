class Locust::EdgeCases
  #
  # @abstract
  # Base class for edge case definitions
  #
  # When define a custom edge case for an instance of [Loust::Schema::Object]
  # you should answer 3 questions:
  #
  # - Whether a case is applicable for the schema or should be [#skip]ped?
  # - How to generate a value for the [#schema]?
  # - How to check if a value satisfies the [#schema] or should be [#drop]ped?
  #
  # We need post-checks because for many cases we can neither extract value
  # from the schema directly. For example, its tricky to provide a value
  # that would a-priori satisfy a `pattern`.
  #
  # In some cases we can use a pre-check whether the schema is applicable.
  # For example, in the case of [Locust::EdgeCases::EmptyString] we can check
  # if the only provided value `""` would satisfy the `pattern`, or we should
  # skip the whole case.
  #
  # @example
  #   skip { pattern&.reject?("") }
  #
  # Other cases can be more tricky. For example, when we have both a complex
  # pattern and a mutator which would generate complex structure, we cannot
  # made a check in advance. In this case we can take a risk, try building
  # a value and check the result against the schema. In case of failure
  #
  # @example
  #   value { rand(100, 300).times.map { "x" }.join("-") }
  #   drop  { pattern.nil? || value[pattern] }
  #
  # The last case leads to worse performance (because of try-n-drop approach),
  # but it helps building a bit more mutations on big sequences of tries,
  # and finding more "vulnerabilities" in a tested API.
  #
  # Notice that in both callbacks you can access object schema directly.
  # In the `check_after` you can also access the generated value.
  #
  class Base < SimpleDelegator
    #
    # Public DSL for defining a custom edge case
    #
    class << self
      #
      # Adds the check of whether a case is applicable to the schema
      #
      # @param [Proc] block
      #   The block without arguments to be executed in the instance scope
      # @return [self]
      #
      def skip(&block)
        skips << valid_block(block)
        self
      end

      #
      # Defines a method to build a value
      #
      # @param [Proc] block
      #   The block without arguments to be executed in the schema scope
      # @return [self]
      #
      def value(&block)
        define_method(:value, &valid_block(block))
        self
      end

      #
      # Adds the check of whether a generated value satisfies the schema
      #
      # @param [Proc] block
      #   The block without arguments to be executed in the schema scope
      #   with a direct access to generated [#value]
      # @return [self]
      #
      def drop(&block)
        drops << valid_block(block)
        self
      end

      private

      def valid_block(block)
        return block if block&.arity&.zero?
        raise TypeError, "Use a block without arguments"
      end

      def skips
        @skips ||= []
      end

      def drops
        @drops ||= []
      end

      def inherited(klass)
        super
        klass.send :instance_variable_set, :@skips, skips.dup
        klass.send :instance_variable_set, :@drops, drops.dup
      end
    end

    #
    # @!attribute [r] schema
    # @return [Locust::Schema::Object] schema for which a value is generated
    #
    alias schema __getobj__

    #
    # Check whether an edge case is applicable to the [#schema]
    #
    def applicable?
      self.class.send(:skips).none? { |skip| instance_exec(&skip) }
    end

    #
    # Builds a value described by the [#schema]
    #
    # @return [Locust::EdgeCases::NotApplicableError]
    #   if the result is not applicable to the [#schema]
    #
    def call
      result = Result.new(schema, value)

      if self.class.send(:drops).any? { |drop| result.instance_exec(&drop) }
        NotApplicableError
      else
        result.value
      end
    end

    private

    def initialize(schema)
      super Locust::Schema::Object[schema]
    end
  end
end
