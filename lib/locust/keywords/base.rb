class Locust
  module Keywords
    #
    # @abstract
    # Base class for validators
    #
    class Base < SimpleDelegator
      extend Coercion

      #
      # @!method errors(path, object)
      #
      # @abstract
      # Method to check whether an object is valid
      #
      # @param  [String] path The path to object from the root of the schema
      # @param  [Object] object
      # @return [Array<String>] list of validation errors
      #
      def errors(_, _)
        []
      end

      #
      # The human-readable representation of the validator
      #
      # @return [String]
      #
      def to_str
        "#{self.class.name}[#{self}]"
      end

      #
      # The human-readable representation of the validator
      #
      # @return [String]
      #
      def inspect
        to_str
      end

      #
      # The name of the schema keyword
      #
      # @return [String]
      #
      def keyword
        self.class.name.tap { |line| line[0].downcase! }
      end

      #
      # The reference to the parent schema
      #
      # @return [String]
      #
      attr_reader :parent

      private

      def initialize(parent, value)
        @parent = parent
        super(value)
      end
    end
  end
end
