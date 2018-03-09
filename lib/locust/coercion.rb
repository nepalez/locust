class Locust
  #
  # @private
  # Provides coercion functionality for using classes as
  # dry-initializer option/param types.
  #
  module Coercion
    def new(value)
      value.is_a?(self) ? value : super
    end

    def call(value)
      new(value)
    end

    def [](value)
      call(value)
    end
  end
end
