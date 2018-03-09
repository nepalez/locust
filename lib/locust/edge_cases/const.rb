class Locust::EdgeCases
  #
  # Uses const value defined by a schema
  #
  # Ensures that at least one applicable value is returned by [Locust]
  # for object schemas with a "const" key.
  #
  class ConstGenerator < Base
    # skip the case not applicable to schemas:
    skip { !key? :const }

    # value generator
    value { const }
  end
end
