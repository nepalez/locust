class Locust
  class Struct
    #
    # @private
    # The definitions for a specific subclass of the [Locust::Struct].
    #
    class Definition
      #
      # Builds the definition with a block of private setters
      #
      # @param  [Proc] block The definitions for the struct
      # @return [Locust::Struct::Definition]
      #
      def self.new(&block)
        super.tap { |record| record.instance_exec(&block) if block }
      end

      #
      # Prepares a value argument for the struct
      #
      # @param  [Object] value The argument to initialize a struct with
      # @return [Object] the coerced value
      #
      def prepare(value)
        @coercers.inject(value) { |result, coercer| coercer.call(result) }
      end

      #
      # Checks whether an initialized struct is valid
      #
      # @param  [Locust::Struct] struct
      # @return [Boolean]
      #
      def valid?(struct)
        @validators.all? { |validator| struct.instance_exec(&validator) }
      end

      #
      # Returns the local name of the nested struct (w/o parent names)
      #
      # @param  [Locust::Struct] struct
      # @return [String]
      #
      def local_name(struct)
        (@name.is_a?(Proc) ? struct.instance_exec(&@name) : @name)&.to_s
      end

      #
      # Returns the description of all the requirements to the struct
      #
      # @param  [Locust::Struct] struct
      # @return [String]
      #
      def desc(struct)
        (@desc.is_a?(Proc) ? struct.instance_exec(&@desc) : @desc)&.to_s
      end

      private

      def initialize
        @coercers   = []
        @validators = []
        @name = nil
        @desc = nil
      end

      def coerce(&block)
        case block&.arity
        when 1 then @coercers << block
        else raise "The coerce helper requires a block with one argument"
        end

        self
      end

      def validate(&block)
        case block&.arity
        when 0 then @validators << block
        else raise "The validate helper requires a block without arguments"
        end

        self
      end

      def describe(value = nil, &block)
        case block&.arity
        when 0   then @desc = block
        when nil then @desc = value
        else raise "The describe helper accepts a block without arguments"
        end

        self
      end

      def name(value = nil, &block)
        case block&.arity
        when 0   then @name = block
        when nil then @name = value
        else raise "The name helper accepts a block without arguments"
        end

        self
      end
    end
  end
end
