class Locust
  #
  # Container for the global configuration of the Locust
  #
  module Config
    module_function

    require_relative "config/generator"
    require_relative "config/generators"
  end
end
