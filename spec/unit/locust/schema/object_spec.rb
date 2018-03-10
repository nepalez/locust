RSpec.describe Locust::Schema::Object do
  let(:types)  { Locust::Schema::Keywords }
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

    context "with a schema of a string" do
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

    context "with a schema of an integer" do
      let(:schema) do
        {
          "type"             => :integer,
          "format"           => :magic,
          "enum"             => %w[12.5],
          "readOnly"         => true,
          "const"            => "12.5",
          "default"          => "12.5",
          "example"          => "12.5",
          "multipleOf"       => "3.1",
          "maximum"          => "12.5",
          "minimum"          => "12.5",
          "exclusiveMaximum" => "13.1",
          "exclusiveMinimum" => "11.3",
          "xml"              => {
            "name"      => "MagicNumber",
            "namespace" => "https://example.com",
            "prefix"    => "params",
            "attribute" => true,
            "wrapped"   => true,
          },
        }
      end

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

    context "with a schema of a number" do
      let(:schema) do
        {
          "type"             => :number,
          "format"           => :magic,
          "enum"             => %w[12.5],
          "readOnly"         => true,
          "const"            => "12.5",
          "default"          => "12.5",
          "example"          => "12.5",
          "multipleOf"       => "2.5",
          "maximum"          => "12.5",
          "minimum"          => "12.5",
          "exclusiveMaximum" => "13.1",
          "exclusiveMinimum" => "11.3",
          "xml"              => {
            "name"      => "MagicNumber",
            "namespace" => "https://example.com",
            "prefix"    => "params",
            "attribute" => true,
            "wrapped"   => true,
          },
        }
      end

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

    context "with a schema of an array" do
      let(:schema) do
        {
          "type"        => :array,
          "format"      => :tuple,
          "readOnly"    => true,
          "minItems"    => "1",
          "maxItems"    => "3",
          "uniqueItems" => true,
          "items"       => [
            { "type" => "integer" },
            { "type" => "number" },
            { "type" => "number" },
          ],
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

      its(:type)              { is_expected.to eq "array" }
      its(:format)            { is_expected.to eq "tuple" }
      its(:default)           { is_expected.to eq [1] }
      its(:example)           { is_expected.to eq [1, 2.5, 3.5] }
      its(:unique_items)      { is_expected.to eq true }
      its(:max_items)         { is_expected.to eq 3 }
      its(:min_items)         { is_expected.to eq 1 }
      its("items.first.type") { is_expected.to eq "integer" }
      its(:xml)               { is_expected.to be_kind_of types::XML }
      its("xml.name")         { is_expected.to eq "MagicNumber" }
      its("xml.namespace")    { is_expected.to eq "https://example.com" }
      its("xml.prefix")       { is_expected.to eq "params" }
      its("xml.attribute")    { is_expected.to eq true }
      its("xml.wrapped")      { is_expected.to eq true }
    end

    context "with a schema of an object" do
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
    end

    context "with a minimal schema" do
      let(:schema) do
        { "type" => "null" }
      end

      it "applies default options" do
        expect(subject.options.keys).to match_array %i[type xml]
      end

      its(:type)         { is_expected.to eq "null" }
      its("xml.options") { is_expected.to eq attribute: false, wrapped: false }
    end

    context "without any type" do
      before { schema.delete "type" }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with an improper type" do
      before { schema["type"] = "foo" }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with an improper format" do
      before { schema["format"] = nil }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end

    context "with an improper enum" do
      before { schema["enum"] = nil }

      it "raises Locust::Schema::DefinitionError" do
        expect { subject }.to raise_error(Locust::Schema::DefinitionError)
      end
    end
  end
end
