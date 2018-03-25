module Locust::Schema
  #
  # @private
  #
  class Default < Locust::Struct
    keyword "default"

    def validate
      parent.verify(source, *full_path)
    end
  end
end
