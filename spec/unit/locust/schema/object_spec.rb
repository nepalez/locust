RSpec.describe Locust::Schema::Object do
  subject      { described_class.call schema }
  let(:schema) { { "type" => "null" } }

  context "with a minimal schema" do
    it "applies default options" do
      expect(subject.options.keys).to match_array %i[type xml]
    end

    its(:type)         { is_expected.to eq "null" }
    its("xml.options") { is_expected.to eq attribute: false, wrapped: false }
  end

  context "without any type" do
    before { schema.delete "type" }

    it "raises Locust::Schema::DefinitionError" do
      expect { subject }.to raise_error(Locust::Schema::DefinitionError)
    end
  end

  context "with an improper type" do
    before { schema["type"] = "foo" }

    it "raises Locust::Schema::DefinitionError" do
      expect { subject }.to raise_error(Locust::Schema::DefinitionError)
    end
  end

  context "with an improper format" do
    before { schema["format"] = nil }

    it "raises Locust::Schema::DefinitionError" do
      expect { subject }.to raise_error(Locust::Schema::DefinitionError)
    end
  end

  context "with an improper enum" do
    before { schema["enum"] = nil }

    it "raises Locust::Schema::DefinitionError" do
      expect { subject }.to raise_error(Locust::Schema::DefinitionError)
    end
  end
end
