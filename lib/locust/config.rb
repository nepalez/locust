class Locust
  #
  # Container for the global configuration of the Locust
  #
  class Config
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
    # @param [Proc]  block The block with format definition
    # @return [self]
    #
    def format(name, &block)
      formats[name.to_s] = Format.new if formats[name.to_s] == DEFAULT
      formats[name.to_s].instance_exec(&block) if block
      self
    end

    private

    DEFAULT = Format.new

    def initialize
      @formats = Hash.new DEFAULT
    end
  end
end
