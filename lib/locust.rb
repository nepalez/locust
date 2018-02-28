require "dry-initializer"

#
# Edge-case examples generator for mutation testing of public APIs
#
class Locust
  # Result of generation if the schema object forbids the case
  NotApplicableError = Class.new(StandardError)

  require_relative "locust/config"
end
