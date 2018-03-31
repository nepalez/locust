RSpec.describe Locust::Keywords::Object do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }

  describe ".call" do
    subject { schema }

    let(:source) { { "type" => "array" } }

    its(:keyword) { is_expected.to be_nil }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "additional_properties" do
    subject { schema.additional_properties }

    let(:source) do
      {
        "type" => "object",
        "additionalProperties" => { "type" => "string" },
      }
    end

    it { is_expected.to be_a Locust::Keywords::AdditionalProperties }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["additionalProperties"] }
  end

  describe "all_of" do
    subject { schema.all_of }

    let(:source) do
      {
        "type" => "object",
        "allOf" => [
          { "type" => "array", "minItems" => 12 },
          { "type" => "array", "maxItems" => 13 },
        ],
      }
    end

    it { is_expected.to be_a Locust::Keywords::AllOf }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["allOf"] }
  end

  describe "any_of" do
    subject { schema.any_of }

    let(:source) do
      {
        "type" => "object",
        "anyOf" => [
          { "type" => "array", "minItems" => 12 },
          { "type" => "array", "maxItems" => 13 },
        ],
      }
    end

    it { is_expected.to be_a Locust::Keywords::AnyOf }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["anyOf"] }
  end

  describe "items" do
    subject { schema.items }

    let(:source) do
      {
        "type"  => "array",
        "items" => { "type" => "string" },
      }
    end

    it { is_expected.to be_a Locust::Keywords::Items }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["items"] }
  end

  describe "enum" do
    subject { schema.enum }

    let(:source) do
      {
        "type" => "integer",
        "enum" => [-1, 0, 1],
      }
    end

    it { is_expected.to be_a Locust::Keywords::Enum }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["enum"] }
  end

  describe "exclusive_maximum" do
    subject { schema.exclusive_maximum }

    let(:source) do
      {
        "type" => "integer",
        "exclusiveMaximum" => 5,
      }
    end

    it { is_expected.to be_a Locust::Keywords::ExclusiveMaximum }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["exclusiveMaximum"] }
  end

  describe "exclusive_minimum" do
    subject { schema.exclusive_minimum }

    let(:source) do
      {
        "type" => "integer",
        "exclusiveMinimum" => 3,
      }
    end

    it { is_expected.to be_a Locust::Keywords::ExclusiveMinimum }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["exclusiveMinimum"] }
  end

  describe "format" do
    subject { schema.format }

    let(:source) do
      {
        "type" => "string",
        "format" => "uuid",
      }
    end

    it { is_expected.to be_a Locust::Keywords::Format }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["format"] }
  end

  describe "items" do
    subject { schema.items }

    let(:source) do
      {
        "type" => "object",
        "items" => { "type" => "string" },
      }
    end

    it { is_expected.to be_a Locust::Keywords::Items }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["items"] }
  end

  describe "max_items" do
    subject { schema.max_items }

    let(:source) do
      {
        "type" => "array",
        "maxItems" => 4,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MaxItems }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["maxItems"] }
  end

  describe "max_properties" do
    subject { schema.max_properties }

    let(:source) do
      {
        "type" => "object",
        "maxProperties" => 9,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MaxProperties }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["maxProperties"] }
  end

  describe "maximum" do
    subject { schema.maximum }

    let(:source) do
      {
        "type" => "integer",
        "maximum" => 3,
      }
    end

    it { is_expected.to be_a Locust::Keywords::Maximum }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["maximum"] }
  end

  describe "min_items" do
    subject { schema.min_items }

    let(:source) do
      {
        "type" => "array",
        "minItems" => 3,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MinItems }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["minItems"] }
  end

  describe "min_properties" do
    subject { schema.min_properties }

    let(:source) do
      {
        "type" => "object",
        "minProperties" => 4,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MinProperties }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["minProperties"] }
  end

  describe "minimum" do
    subject { schema.minimum }

    let(:source) do
      {
        "type" => "string",
        "minimum" => 4,
      }
    end

    it { is_expected.to be_a Locust::Keywords::Minimum }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["minimum"] }
  end

  describe "multiple_of" do
    subject { schema.multiple_of }

    let(:source) do
      {
        "type" => "integer",
        "multipleOf" => 3,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MultipleOf }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["multipleOf"] }
  end

  describe "not" do
    subject { schema.not }

    let(:source) do
      {
        "type" => "object",
        "not"  => { "type" => "array", "minItems" => 12 },
      }
    end

    it { is_expected.to be_a Locust::Keywords::Not }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["not"] }
  end

  describe "nullable" do
    subject { schema.nullable }

    let(:source) do
      {
        "type" => "array",
        "nullable" => true,
      }
    end

    it { is_expected.to be_a Locust::Keywords::Nullable }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["nullable"] }
  end

  describe "one_of" do
    subject { schema.one_of }

    let(:source) do
      {
        "type" => "object",
        "oneOf" => [
          { "type" => "array", "minItems" => 12 },
          { "type" => "array", "maxItems" => 13 },
        ],
      }
    end

    it { is_expected.to be_a Locust::Keywords::OneOf }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["oneOf"] }
  end

  describe "properties" do
    subject { schema.properties }

    let(:source) do
      {
        "type" => "object",
        "properties" => {
          "id" => { "type" => "integer" },
          "name" => { "type" => "string" },
        },
      }
    end

    it { is_expected.to be_a Locust::Keywords::Properties }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["properties"] }
  end

  describe "read_only" do
    subject { schema.read_only }

    let(:source) do
      {
        "type" => "array",
        "readOnly" => true,
      }
    end

    it { is_expected.to be_a Locust::Keywords::ReadOnly }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["readOnly"] }
  end

  describe "required" do
    subject { schema.required }

    let(:source) do
      {
        "type"     => "object",
        "required" => %w[id name],
      }
    end

    it { is_expected.to be_a Locust::Keywords::Required }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["required"] }
  end

  describe "type" do
    subject { schema.type }

    let(:source) { { "type" => "array" } }

    it { is_expected.to be_a Locust::Keywords::Type }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq "array" }
  end

  describe "unique_items" do
    subject { schema.unique_items }

    let(:source) do
      {
        "type" => "array",
        "uniqueItems" => true,
      }
    end

    it { is_expected.to be_a Locust::Keywords::UniqueItems }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["uniqueItems"] }
  end

  describe "write_only" do
    subject { schema.write_only }

    let(:source) do
      {
        "type" => "array",
        "writeOnly" => true,
      }
    end

    it { is_expected.to be_a Locust::Keywords::WriteOnly }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["writeOnly"] }
  end

  describe "xml" do
    subject { schema.xml }

    let(:source) do
      {
        "type" => "object",
        "xml" => { "attribute" => true },
      }
    end

    it { is_expected.to be_a Locust::Keywords::Xml }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["xml"] }
  end
end
