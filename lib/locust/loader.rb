class Locust
  # @private
  class Loader
    extend Dry::Initializer
    param :path

    def call
      raise TypeError, "The #{path} is not a string" unless path.is_a? String
      try_json || try_yaml || content
    end

    def self.call(path)
      new(path).call
    end

    private

    def uri
      @uri ||= URI path
    end

    def content
      @content ||= case uri
                   when URI::HTTP, URI::HTTPS then Net::HTTP.get(uri)
                   else File.read(path)
                   end
    end

    def try_json
      JSON.load content
    rescue
      nil
    end

    def try_yaml
      YAML.load content
    rescue
      nil
    end
  end
end
