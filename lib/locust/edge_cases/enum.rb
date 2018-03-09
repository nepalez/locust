class Locust::EdgeCases
  #
  # Selects enum value defined by a schema
  #
  class EnumGenerator < Base
    # skip the case not applicable to schemas:
    skip { !key? :enum }

    # value generator
    value { enum.sample }
  end
end
