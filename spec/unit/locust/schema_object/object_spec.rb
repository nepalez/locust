RSpec.describe Locust::SchemaObject do
  subject { described_class.call schema }

  let(:types)  { Locust::Validators }
  let(:schema) do
    {
      "type"          => :object,
      "format"        => :user,
      "readOnly"      => true,
      "required"      => %i[id name],
      "maxProperties" => 4,
      "minProperties" => 3,
      "example"       => [1, 2.5, 3.5],
      "properties"    => {
        "id"     => { "type" => "integer", "minimum" => 1 },
        "name"   => { "type" => "string",  "minimum" => "human_name" },
        "admin"  => { "type" => "boolean", "default" => "false" },
        "active" => { "type" => "boolean", "default" => "true" },
      },
      "xml"           => {
        "name"        => "MagicNumber",
        "namespace"   => "https://example.com",
        "prefix"      => "params",
        "attribute"   => true,
        "wrapped"     => true,
      },
    }
  end

  it { is_expected.to be_kind_of described_class }
  it { is_expected.to be_kind_of described_class::Object }

  its(:type)             { is_expected.to eq "object" }
  its(:format)           { is_expected.to eq "user" }
  its(:required)         { is_expected.to eq %w[id name] }
  its(:max_properties)   { is_expected.to eq 4 }
  its(:min_properties)   { is_expected.to eq 3 }
  its(:properties)       { is_expected.to be_a types::Properties }
  its("properties.keys") { is_expected.to eq %w[id name admin active] }
  its(:xml)              { is_expected.to be_kind_of types::XML }
  its("xml.name")        { is_expected.to eq "MagicNumber" }
  its("xml.namespace")   { is_expected.to eq "https://example.com" }
  its("xml.prefix")      { is_expected.to eq "params" }
  its("xml.attribute")   { is_expected.to eq true }
  its("xml.wrapped")     { is_expected.to eq true }

  it "assigns back reference to itself as a parent of all properties" do
    parents = subject.properties.values.map(&:parent).uniq
    expect(parents).to contain_exactly subject
  end

  it "assigns names to all properties" do
    names = subject.properties.values.map(&:name)
    expect(names).to match_array %w[id name admin active]
  end
end
