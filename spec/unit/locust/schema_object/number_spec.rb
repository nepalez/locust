RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:types)  { Locust::Validators }
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

  describe ".call" do
    subject { schema }

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
end
