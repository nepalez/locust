RSpec.describe Locust::SchemaObject do
  subject { described_class.call schema }

  let(:types)  { Locust::Validators }
  let(:schema) do
    {
      "type"      => :string,
      "format"    => :email,
      "enum"      => %i[foo@bar.baz],
      "readOnly"  => true,
      "const"     => :"foo@bar.baz",
      "default"   => :"foo@bar.baz",
      "example"   => :"foo@bar.baz",
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
