RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }

  describe ".call" do
    subject { schema }

    let(:types)  { Locust::Keywords }
    let(:source) do
      {
        "type"             => :number,
        "format"           => :magic,
        "enum"             => [12.5],
        "readOnly"         => true,
        "const"            => 12.5,
        "default"          => 12.5,
        "example"          => 12.5,
        "multipleOf"       => 2.5,
        "maximum"          => 12.5,
        "minimum"          => 12.5,
        "exclusiveMaximum" => 13.1,
        "exclusiveMinimum" => 11.3,
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

    its(:type)              { is_expected.to eq "number" }
    its(:format)            { is_expected.to eq "magic" }
    its(:enum)              { is_expected.to eq [12.5] }
    its(:const)             { is_expected.to eq 12.5 }
    its(:default)           { is_expected.to eq 12.5 }
    its(:example)           { is_expected.to eq 12.5 }
    its(:multiple_of)       { is_expected.to eq 2.5 }
    its(:maximum)           { is_expected.to eq 12.5 }
    its(:minimum)           { is_expected.to eq 12.5 }
    its(:exclusive_maximum) { is_expected.to eq 13.1 }
    its(:exclusive_minimum) { is_expected.to eq 11.3 }
    its(:xml)               { is_expected.to be_kind_of types::XML }
    its("xml.name")         { is_expected.to eq "MagicNumber" }
    its("xml.namespace")    { is_expected.to eq "https://example.com" }
    its("xml.prefix")       { is_expected.to eq "params" }
    its("xml.attribute")    { is_expected.to eq true }
    its("xml.wrapped")      { is_expected.to eq true }
  end

  describe "#errors" do
    subject { schema.errors object, "x" }

    let(:source) { { "type" => "number" } }

    context "when object satisfies all the constraints" do
      let(:object) { 25.to_r / 2 }
      let(:source) do
        {
          "type"             => :number,
          "enum"             => [12.5],
          "const"            => 12.5,
          "multipleOf"       => 2.5,
          "maximum"          => 12.5,
          "minimum"          => 12.5,
          "exclusiveMaximum" => 13.1,
          "exclusiveMinimum" => 11.3,
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
      before { source["exclusiveMinimum"] = 12.5 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'exclusiveMaximum' constraint" do
      before { source["exclusiveMaximum"] = 12.5 }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'type' constraint" do
      let(:object) { :foo }
      it { is_expected.not_to be_empty }
    end
  end
end
