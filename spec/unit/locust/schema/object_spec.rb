RSpec.describe Locust::Schema::Object do
  let(:object) { described_class.call schema }
  let(:schema) do
    {
      "type"   => "string",
      "format" => "email",
      "foo"    => "bar",
    }
  end

  describe ".call" do
    subject { object }

    context "without any type" do
      before { schema.delete "type" }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with an improper type" do
      before { schema["type"] = "foo" }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with an improper format" do
      before { schema["format"] = nil }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with an improper enum" do
      before { schema["enum"] = nil }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#options" do
    subject { object.options }

    it "returns a hash of known options with symbolized keys" do
      expect(subject).to eq type: "string", format: "email"
    end
  end
end
