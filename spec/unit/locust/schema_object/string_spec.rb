RSpec.describe Locust::SchemaObject do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }

  describe ".call" do
    subject { schema }

    let(:types)  { Locust::Validators }
    let(:source) do
      {
        "type"      => :string,
        "format"    => :email,
        "enum"      => %w[foo@bar.baz],
        "readOnly"  => true,
        "const"     => "foo@bar.baz",
        "default"   => "foo@bar.baz",
        "example"   => "foo@bar.baz",
        "minLength" => "1",
        "maxLength" => "12",
        "pattern"   => '\w+',
        "xml"       => {
          "name"      => "email",
          "namespace" => "https://example.com",
          "prefix"    => "params",
          "attribute" => true,
          "wrapped"   => true,
        },
      }
    end

    it { is_expected.to be_kind_of described_class }
    it { is_expected.to be_kind_of described_class::String }

    its(:type)           { is_expected.to eq "string" }
    its(:format)         { is_expected.to eq "email" }
    its(:enum)           { is_expected.to eq %w[foo@bar.baz] }
    its(:const)          { is_expected.to eq "foo@bar.baz" }
    its(:default)        { is_expected.to eq "foo@bar.baz" }
    its(:example)        { is_expected.to eq "foo@bar.baz" }
    its(:min_length)     { is_expected.to eq 1 }
    its(:max_length)     { is_expected.to eq 12 }
    its(:pattern)        { is_expected.to be_kind_of types::Pattern }
    its(:xml)            { is_expected.to be_kind_of types::XML }
    its("xml.name")      { is_expected.to eq "email" }
    its("xml.namespace") { is_expected.to eq "https://example.com" }
    its("xml.prefix")    { is_expected.to eq "params" }
    its("xml.attribute") { is_expected.to eq true }
    its("xml.wrapped")   { is_expected.to eq true }
  end

  describe "#errors" do
    subject { schema.errors object, "x" }

    let(:source) { { "type" => "string" } }

    context "when object satisfies all the constraints" do
      let(:object) { "foo@bar.baz" }
      let(:source) do
        {
          "type"      => :string,
          "enum"      => %w[foo@bar.baz],
          "const"     => "foo@bar.baz",
          "minLength" => "11",
          "maxLength" => "11",
          "pattern"   => '\w+\@\w+\.\w+',
        }
      end

      it { is_expected.to be_empty }
    end

    context "when object breaks the 'const' constraint" do
      before { source["const"] = true }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'enum' constraint" do
      before { source["enum"] = [true] }
      let(:object) { false }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'minLength' constraint" do
      before { source["minLength"] = 4 }
      let(:object) { "foo" }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'maxLength' constraint" do
      before { source["maxLength"] = 4 }
      let(:object) { "foobar" }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'pattern' constraint" do
      before { source["pattern"] = 'o$' }
      let(:object) { "bar" }

      it { is_expected.not_to be_empty }
    end

    context "when object breaks the 'type' constraint" do
      let(:object) { nil }
      it { is_expected.not_to be_empty }
    end
  end
end
