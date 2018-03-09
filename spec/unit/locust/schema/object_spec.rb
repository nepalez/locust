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

    context "with a full schema" do
      let(:schema) do
        {
          "type"     => :string,
          "format"   => :email,
          "enum"     => %w[foo@bar.baz],
          "readOnly" => true,
          "const"    => "foo@bar.baz",
          "default"  => "foo@bar.baz",
          "example"  => "foo@bar.baz",
          "xml"      => {
            "name"      => "email",
            "namespace" => "https://example.com",
            "prefix"    => "params",
            "attribute" => true,
            "wrapped"   => true,
          },
        }
      end

      its(:type)           { is_expected.to eq "string" }
      its(:format)         { is_expected.to eq "email" }
      its(:enum)           { is_expected.to eq %w[foo@bar.baz] }
      its(:read_only)      { is_expected.to eq true }
      its(:const)          { is_expected.to eq "foo@bar.baz" }
      its(:default)        { is_expected.to eq "foo@bar.baz" }
      its(:example)        { is_expected.to eq "foo@bar.baz" }
      its(:xml)            { is_expected.to be_kind_of Locust::Schema::XML }
      its("xml.name")      { is_expected.to eq "email" }
      its("xml.namespace") { is_expected.to eq "https://example.com" }
      its("xml.prefix")    { is_expected.to eq "params" }
      its("xml.attribute") { is_expected.to eq true }
      its("xml.wrapped")   { is_expected.to eq true }
    end

    context "with a minimal schema" do
      let(:schema) do
        { "type" => "null" }
      end

      it "applies default options" do
        expect(subject.options.keys).to match_array %i[type read_only xml]
      end

      its(:type)         { is_expected.to eq "null" }
      its(:read_only)    { is_expected.to eq false }
      its("xml.options") { is_expected.to eq attribute: false, wrapped: false }
    end

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
end
