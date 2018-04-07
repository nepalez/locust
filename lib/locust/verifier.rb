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
  class Verifier
    class << self
      def validate(key)
        validators << key
      end

      private

      def validators
        @validators ||= []
      end
    end

    attr_reader :schema, :object, :path, :errors

    private

    def initialize(schema, object, *path)
      @schema  = schema
      @object  = object
      @path    = path
      @errors  = []
      @message = "The object '#{object_path}'" \
                 " does not satisfy the schema '#{schema_path}'."

      self.class.send(:validators).map { |item| __send__(item) }
    end

    def object_path
      path.each_with_object("") do |item, obj|
        if item.is_a?(Integer)
          obj << "[#{item}]"
        else
          obj << (obj.empty? ? item : ".#{item}")
        end
      end
    end

    def schema_path
      Array(schema.full_path).join(".")
    end

    def message(text = nil)
      [@message, text].compact.join(" ")
    end
  end
end
