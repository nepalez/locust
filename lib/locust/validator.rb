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
      def validate(key)
        validators << key
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
      @errors  = []
      @message = "Invalid schema at '#{Array(full_path).join(".")}'."
      self.class.send(:validators).map { |item| __send__(item) }
    end

    def message(text = nil)
      [@message, text].compact.join(" ")
    end
  end
end
