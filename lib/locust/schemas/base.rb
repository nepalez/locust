module Locust::Schemas
  #
  # The node of a nested structure
  #
  # Every node carries several optional [#options],
  # including the reference to its [#parent],
  # and the [#source] object for its data.
  #
  # @private
  # @abstract
  #
  class Base
    extend Dry::Initializer

    # @private
    class << self
      def keyword(string = nil, &block)
        return @keyword ||= nil unless string || block
        @keyword = block ? block : proc { string }
      end

      def validator(klass = nil)
        return @validator ||= nil unless klass
        @validator = klass
      end

      def option(name, type = nil, **opts)
        attribute = name.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
        super(name, type, as: attribute, optional: true, **opts)
      end

      def call(source, parent = nil)
        return source if source.instance_of?(self)
        data = source.is_a?(Hash) ? symbolize_keys(source) : {}
        new(parent: parent, source: source, **data)
      end

      def [](source, parent)
        call(source, parent)
      end

      private

      def symbolize_keys(data)
        return {} unless data.is_a? Hash
        data.each_with_object({}) { |(key, val), obj| obj[key.to_sym] = val }
      end
    end

    option :parent
    option :source
    option :title

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
    # @return [Array<Locust::Schemas::Base>]
    #
    def parents
      @parents ||= if parent.is_a?(Locust::Schemas::Base)
                     parent.parents + [parent]
                   else
                     []
                   end
    end

    #
    # @abstract
    # Keyword name of the concrete schema
    #
    # @return [String, nil]
    #
    def keyword
      @keyword ||= case self.class.keyword
                   when Proc   then instance_exec(&self.class.keyword)
                   when String then self.class.keyword
                   end
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
