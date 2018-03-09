class Locust::EdgeCases
  #
  # Generates an empty string
  #
  class EmptyString < Base
    # skip the case not applicable to schemas:
    skip { type != "string" }
    skip { const }
    skip { enum }
    skip { min_length.to_i.positive? }
    skip { pattern&.reject? "" }
    skip { %w[email dateTime date byte].include? format }
    skip { format && custom_format? && !specified? }

    # value generator
    value { "" }

    private

    def custom_format?
      !%w[password string].include? format
    end

    def specified?
      pattern || min_length
    end
  end
end
