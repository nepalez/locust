class Locust
  #
  # Container for the global configuration of the Locust
  #
  class Config
    require_relative "config/generator"
    require_relative "config/generators"
    require_relative "config/format"

    #
    # @!attribute [r] formats
    # @return [Hash<String, Locust::Config::Format>] format definitions
    #
    attr_reader :formats

    #
    # Creates or updates a definition for named format
    #
    # @param [#to_s] name  The unique name of the format
    # @return [self]
    #
    def format(name)
      formats[name.to_s] = Format.new if formats[name.to_s] == DEFAULT
      yield formats[name.to_s] if block_given?
      self
    end

    private

    DEFAULT = Format.new

    def initialize
      @formats = Hash.new DEFAULT
    end
  end
end
