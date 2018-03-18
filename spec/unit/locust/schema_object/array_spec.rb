RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }

  describe ".call" do
    subject { schema }

    let(:types)  { Locust::Keywords }
    let(:source) do
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

    its(:type)           { is_expected.to eq "array" }
    its(:format)         { is_expected.to eq "tuple" }
    its(:default)        { is_expected.to eq [1] }
    its(:example)        { is_expected.to eq [1, 2.5, 3.5] }
    its(:unique_items)   { is_expected.to eq true }
    its(:max_items)      { is_expected.to eq 3 }
    its(:min_items)      { is_expected.to eq 1 }
    its(:xml)            { is_expected.to be_kind_of types::XML }
    its("xml.name")      { is_expected.to eq "MagicNumber" }
    its("xml.namespace") { is_expected.to eq "https://example.com" }
    its("xml.prefix")    { is_expected.to eq "params" }
    its("xml.attribute") { is_expected.to eq true }
    its("xml.wrapped")   { is_expected.to eq true }

    context "with hash for items" do
      before { source["items"] = { "type" => "integer" } }

      its(:items) { is_expected.to be_nil }
      its(:item)  { is_expected.to be_a types::Item }
      its("item.type") { is_expected.to eq "integer" }
    end

    context "with array of items" do
      before do
        source["items"] = [
          { "type" => "integer" },
          { "type" => "number" },
          { "type" => "number" },
        ]
      end

      its(:items) { is_expected.to be_a types::Items }
      its(:item)  { is_expected.to be_nil }
      its("items.first.type") { is_expected.to eq "integer" }
    end
  end

  describe "#errors" do
    subject { schema.errors object, "x" }

    let(:source) { { "type" => "array" } }

    context "when object satisfies all the constraints" do
      let(:object) { %w[foo bar baz] }
      let(:source) do
        {
          "type"  => :array,
          "items" => {
            "type"    => "string",
            "pattern" => '^\w',
          },
          "minItems"    => "2",
          "maxItems"    => "4",
          "uniqueItems" => true,
        }
      end

      it { is_expected.to be_empty }
    end

    context "when object breaks the 'const' constraint" do
      before { source["const"] = %w[foo] }
      let(:object) { %w[foo bar] }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'enum' constraint" do
      before { source["const"] = [%w[foo], %w[bar]] }
      let(:object) { %w[foo bar] }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'minItems' constraint" do
      before { source["minItems"] = 3 }
      let(:object) { %w[foo bar] }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'maxItems' constraint" do
      before { source["maxItems"] = 3 }
      let(:object) { %w[foo bar baz qux] }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'uniqueItems' constraint" do
      before { source["uniqueItems"] = true }
      let(:object) { %w[foo bar bar] }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'item' constraint" do
      before { source["item"] = { "type" => "string", "pattern" => 'r$' } }
      let(:object) { %w[foo bar baz] }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'type' constraint" do
      let(:object) { "foo" }
      it { is_expected.not_to be_empty }
    end
  end
end
