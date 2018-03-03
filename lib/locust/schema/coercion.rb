module Locust::Schema
  #
  # @private
  # Provides coercion functionality for using classes as
  # dry-initializer option/param types.
  #
  module Coercion
    def new(value)
      value.is_a?(self) ? value : super
    end
    alias :call :new
  end
end
