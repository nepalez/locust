RSpec.describe Locust::SchemaObject do
  subject { described_class.call schema }

  let(:types) { Locust::Validators }
  let(:schema) do
    {
      "type"        => :array,
      "format"      => :tuple,
      "readOnly"    => true,
      "minItems"    => "1",
      "maxItems"    => "3",
      "uniqueItems" => true,
      "default"     => [1],
      "example"     => [1, 2.5, 3.5],
      "xml"         => {
        "name"      => "MagicNumber",
        "namespace" => "https://example.com",
        "prefix"    => "params",
        "attribute" => true,
        "wrapped"   => true,
      },
    }
  end

  it { is_expected.to be_kind_of described_class }
  it { is_expected.to be_kind_of described_class::Array }

  its(:type)              { is_expected.to eq "array" }
  its(:format)            { is_expected.to eq "tuple" }
  its(:default)           { is_expected.to eq [1] }
  its(:example)           { is_expected.to eq [1, 2.5, 3.5] }
  its(:unique_items)      { is_expected.to eq true }
  its(:max_items)         { is_expected.to eq 3 }
  its(:min_items)         { is_expected.to eq 1 }
  its(:xml)               { is_expected.to be_kind_of types::XML }
  its("xml.name")         { is_expected.to eq "MagicNumber" }
  its("xml.namespace")    { is_expected.to eq "https://example.com" }
  its("xml.prefix")       { is_expected.to eq "params" }
  its("xml.attribute")    { is_expected.to eq true }
  its("xml.wrapped")      { is_expected.to eq true }

  context "with hash for items" do
    before { schema["items"] = { "type" => "integer" } }

    its(:items) { is_expected.to be_nil }
    its(:item)  { is_expected.to be_a Locust::SchemaObject }
    its("item.type") { is_expected.to eq "integer" }
  end

  context "with array of items" do
    before do
      schema["items"] = [
        { "type" => "integer" },
        { "type" => "number" },
        { "type" => "number" },
      ]
    end

    its(:items) { is_expected.to be_a Locust::Validators::Items }
    its(:item)  { is_expected.to be_nil }
    its("items.first.type") { is_expected.to eq "integer" }
  end
end
