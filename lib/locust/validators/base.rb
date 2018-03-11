class Locust
  module Validators
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
    end
  end
end
