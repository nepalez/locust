RSpec.describe Locust::Schema::Object do
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

    it { is_expected.to be_a Locust::Schema::AdditionalProperties }
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

    it { is_expected.to be_a Locust::Schema::AllOf }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["allOf"] }
  end

  describe "const" do
    subject { schema.const }

    let(:source) do
      {
        "type" => "string",
        "const" => "active",
      }
    end

    it { is_expected.to be_a Locust::Schema::Const }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["const"] }
  end

  describe "items" do
    subject { schema.items }

    let(:source) do
      {
        "type"  => "array",
        "items" => { "type" => "string" },
      }
    end

    it { is_expected.to be_a Locust::Schema::Items }
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

    it { is_expected.to be_a Locust::Schema::Enum }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["enum"] }
  end

  describe "example" do
    subject { schema.example }

    let(:source) do
      {
        "type" => "object",
        "example" => { "id" => 12, "name" => "Joe" },
      }
    end

    it { is_expected.to be_a Locust::Schema::Example }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["example"] }
  end

  describe "exclusive_maximum" do
    subject { schema.exclusive_maximum }

    let(:source) do
      {
        "type" => "integer",
        "exclusiveMaximum" => 5,
      }
    end

    it { is_expected.to be_a Locust::Schema::ExclusiveMaximum }
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

    it { is_expected.to be_a Locust::Schema::ExclusiveMinimum }
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

    it { is_expected.to be_a Locust::Schema::Format }
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

    it { is_expected.to be_a Locust::Schema::Items }
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

    it { is_expected.to be_a Locust::Schema::MaxItems }
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

    it { is_expected.to be_a Locust::Schema::MaxProperties }
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

    it { is_expected.to be_a Locust::Schema::Maximum }
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

    it { is_expected.to be_a Locust::Schema::MinItems }
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

    it { is_expected.to be_a Locust::Schema::MinProperties }
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

    it { is_expected.to be_a Locust::Schema::Minimum }
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

    it { is_expected.to be_a Locust::Schema::MultipleOf }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["multipleOf"] }
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

    it { is_expected.to be_a Locust::Schema::Properties }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["properties"] }
  end

  describe "required" do
    subject { schema.required }

    let(:source) do
      {
        "type"     => "object",
        "required" => %w[id name],
      }
    end

    it { is_expected.to be_a Locust::Schema::Required }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["required"] }
  end

  describe "type" do
    subject { schema.type }

    let(:source) { { "type" => "array" } }

    it { is_expected.to be_a Locust::Schema::Type }
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

    it { is_expected.to be_a Locust::Schema::UniqueItems }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["uniqueItems"] }
  end

  describe "xml" do
    subject { schema.xml }

    let(:source) do
      {
        "type" => "object",
        "xml" => { "attribute" => true },
      }
    end

    it { is_expected.to be_a Locust::Schema::XML }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["xml"] }
  end
end
