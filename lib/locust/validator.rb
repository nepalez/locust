class Locust
  #
  # Base class for schema-specific validators
  #
  # It decorates the schema with methods to check its correctness.
  #
  # Subclasses should define their validators: procs or methods,
  # that return arrays of errors.
  #
  # @private
  # @abstract
  #
  class Validator < SimpleDelegator
    class << self
      def validate(key = nil, &block)
        validators << (block || key)
      end

      def call(schema)
        new(schema).errors
      end

      private

      def validators
        @validators ||= []
      end
    end

    attr_reader :errors

    private

    def initialize(schema)
      super
      @errors = []
      self.class.send(:validators).map do |item|
        item.is_a?(Proc) ? instance_exec(&item) : __send__(item)
      end
    end

    def message
      "Invalid schema '#{full_path}'."
    end
  end
end
