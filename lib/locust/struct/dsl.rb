class Locust::Struct
  #
  # @private
  # Features to construct and navigate nested structs
  #
  module DSL
    def keyword(string = nil, &block)
      return @keyword ||= nil unless string || block

      if block&.arity&.> 0
        raise TypeError, "keyword requires block to have no arguments"
      end

      @keyword = block ? block : proc { string }
    end

    def option(name, type = nil, **opts)
      tap do
        attribute = name.to_s.gsub(/([a-z])([A-Z])/, '\1_\2').downcase
        super(name, type, as: attribute, optional: true, **opts)
      end
    end

    def call(source, parent)
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
end
