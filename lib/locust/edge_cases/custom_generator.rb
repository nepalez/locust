class Locust::EdgeCases
  #
  # Uses custom generator to provide a value
  #
  # Ensures that at least one applicable value is returned by [Locust]
  # for custom formatted object schemas -- even when we can neither mutate
  # the value, nor apply another edge case.
  #
  class CustomGenerator < Base
    # skip the case not applicable to schemas:
    skip { generators.empty? }

    # value generator
    value { generators.sample.call }
  end
end
