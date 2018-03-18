RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }

  describe ".call" do
    subject { schema }

    let(:types)  { Locust::Keywords }
    let(:source) do
      {
        "type"             => :integer,
        "format"           => :magic,
        "enum"             => [12],
        "readOnly"         => true,
        "const"            => 12,
        "default"          => 12,
        "example"          => 12,
        "multipleOf"       => 3,
        "maximum"          => 12,
        "minimum"          => 12,
        "exclusiveMaximum" => 13,
        "exclusiveMinimum" => 11,
        "xml"              => {
          "name"      => "MagicNumber",
          "namespace" => "https://example.com",
          "prefix"    => "params",
          "attribute" => true,
          "wrapped"   => true,
        },
      }
    end

    it { is_expected.to be_kind_of described_class }
    it { is_expected.to be_kind_of described_class::Numeric }

    its(:type)              { is_expected.to eq "integer" }
    its(:format)            { is_expected.to eq "magic" }
    its(:enum)              { is_expected.to eq [12] }
    its(:const)             { is_expected.to eq 12 }
    its(:default)           { is_expected.to eq 12 }
    its(:example)           { is_expected.to eq 12 }
    its(:multiple_of)       { is_expected.to eq 3 }
    its(:maximum)           { is_expected.to eq 12 }
    its(:minimum)           { is_expected.to eq 12 }
    its(:exclusive_maximum) { is_expected.to eq 13 }
    its(:exclusive_minimum) { is_expected.to eq 11 }
    its(:xml)               { is_expected.to be_kind_of types::XML }
    its("xml.name")         { is_expected.to eq "MagicNumber" }
    its("xml.namespace")    { is_expected.to eq "https://example.com" }
    its("xml.prefix")       { is_expected.to eq "params" }
    its("xml.attribute")    { is_expected.to eq true }
    its("xml.wrapped")      { is_expected.to eq true }
  end

  describe "#errors" do
    subject { schema.errors object, "x" }

    let(:source) { { "type" => "integer" } }

    context "when object satisfies all the constraints" do
      let(:object) { 12 }
      let(:source) do
        {
          "type"             => :integer,
          "enum"             => [12],
          "const"            => 12,
          "multipleOf"       => 3,
          "maximum"          => 12,
          "minimum"          => 12,
          "exclusiveMaximum" => 13,
          "exclusiveMinimum" => 11,
        }
      end

      it { is_expected.to be_empty }
    end

    context "when object breaks the 'const' constraint" do
      before { source["const"] = 11 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'enum' constraint" do
      before { source["enum"] = [11, 13] }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'multipleOf' constraint" do
      before { source["multipleOf"] = 5 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'maximum' constraint" do
      before { source["maximum"] = 11 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'minimum' constraint" do
      before { source["minimum"] = 13 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'exclusiveMinimum' constraint" do
      before { source["exclusiveMinimum"] = 12 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'exclusiveMaximum' constraint" do
      before { source["exclusiveMaximum"] = 12 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'type' constraint" do
      let(:object) { 12.0 }
      it { is_expected.not_to be_empty }
    end
  end
end
