RSpec.describe Locust::Keywords::Object do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "type" => "array" } }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to be_nil }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#additional_properties" do
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

  describe "#all_of" do
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

  describe "#any_of" do
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

  describe "#items" do
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

  describe "#enum" do
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

  describe "#exclusive_maximum" do
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

  describe "#exclusive_minimum" do
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

  describe "#format" do
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

  describe "#items" do
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

  describe "#max_items" do
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

  describe "#max_length" do
    subject { schema.max_length }

    let(:source) do
      {
        "type" => "array",
        "maxLength" => 3,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MaxLength }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["maxLength"] }
  end

  describe "#max_properties" do
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

  describe "#maximum" do
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

  describe "#min_items" do
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

  describe "#min_length" do
    subject { schema.min_length }

    let(:source) do
      {
        "type" => "array",
        "minLength" => 3,
      }
    end

    it { is_expected.to be_a Locust::Keywords::MinLength }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["minLength"] }
  end

  describe "#min_properties" do
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

  describe "#minimum" do
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

  describe "#multiple_of" do
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

  describe "#not" do
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

  describe "#nullable" do
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

  describe "#one_of" do
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

  describe "#pattern" do
    subject { schema.pattern }

    let(:source) do
      {
        "type" => "object",
        "pattern" => '\w+',
      }
    end

    it { is_expected.to be_a Locust::Keywords::Pattern }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq source["pattern"] }
  end

  describe "#properties" do
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

  describe "#required" do
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

  describe "#type" do
    subject { schema.type }

    let(:source) { { "type" => "array" } }

    it { is_expected.to be_a Locust::Keywords::Type }
    its(:parent) { is_expected.to eq schema }
    its(:source) { is_expected.to eq "array" }
  end

  describe "#unique_items" do
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

  describe "#xml" do
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

  describe "#validate" do
    subject { schema.validate }

    context "when object has the type property" do
      let(:source) { { type: "integer" } }

      it { is_expected.to eq [] }
    end

    context "when object has the anyOf property" do
      let(:source) { { format: "email", anyOf: [{ type: "integer" }] } }

      it { is_expected.to eq [] }
    end

    context "when object has the oneOf property" do
      let(:source) { { format: "email", oneOf: [{ type: "integer" }] } }

      it { is_expected.to eq [] }
    end

    context "when object has no type, anyOf, oneOf properties" do
      let(:source) { { format: "email" } }

      it { is_expected.not_to be_empty }
    end

    context "when some of its options is not valid" do
      let(:source) { { type: "string", minLength: -1 } }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { schema.verify object }

    let(:source) { { type: "string" } }

    context "when object satisfies all restrictions" do
      let(:object) { "foo" }

      it { is_expected.to eq [] }
    end

    context "when object not satisfies the type restriction" do
      let(:object) { 1 }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the additionalProperties restriction" do
      let(:source) { { type: "object", additionalProperties: false } }
      let(:object) { { foo: "bar" } }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the allOf restriction" do
      let(:source) { { type: "number", allOf: { type: "number", maximum: 2 } } }
      let(:object) { 3 }

      xit { is_expected.not_to be_empty }
    end

    context "when object not satisfies the anyOf restriction" do
      let(:source) { { type: "number", anyOf: { type: "number", maximum: 2 } } }
      let(:object) { 3 }

      xit { is_expected.not_to be_empty }
    end

    context "when object not satisfies the enum restriction" do
      let(:source) { { type: "number", enum: [1, 2] } }
      let(:object) { 3 }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the format restriction" do
      let(:source) { { type: "string", format: "date" } }
      let(:object) { "foo" }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the items restriction" do
      let(:source) { { type: "array", items: { type: "number" } } }
      let(:object) { %w[foo] }

      xit { is_expected.not_to be_empty }
    end

    context "when object not satisfies the maxItems restriction" do
      let(:source) { { type: "array", maxItems: 2 } }
      let(:object) { %w[foo bar baz] }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the maxLength restriction" do
      let(:source) { { type: "string", maxLength: 2 } }
      let(:object) { "foo" }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the maxProperties restriction" do
      let(:source) { { type: "object", maxProperties: 2 } }
      let(:object) { { foo: 1, bar: 2, baz: 3 } }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the maximum restriction" do
      let(:source) { { type: "number", maximum: 2 } }
      let(:object) { 3 }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the minItems restriction" do
      let(:source) { { type: "array", minItems: 2 } }
      let(:object) { %w[foo] }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the minLength restriction" do
      let(:source) { { type: "string", minLength: 2 } }
      let(:object) { "f" }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the minProperties restriction" do
      let(:source) { { type: "object", minProperties: 2 } }
      let(:object) { { foo: 1 } }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the minimum restriction" do
      let(:source) { { type: "number", minimum: 2 } }
      let(:object) { 1 }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the multipleOf restriction" do
      let(:source) { { type: "number", multipleOf: 2 } }
      let(:object) { 3 }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the oneOf restriction" do
      let(:source) { { oneOf: [{ type: "number" }] } }
      let(:object) { "foo" }

      xit { is_expected.not_to be_empty }
    end

    context "when object not satisfies the pattern restriction" do
      let(:source) { { type: "string", pattern: "foo" } }
      let(:object) { "bar" }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the properties restriction" do
      let(:object) { { foo: 3 } }
      let(:source) do
        { type: "object", properties: { foo: { "type" => "number" } } }
      end

      xit { is_expected.not_to be_empty }
    end

    context "when object not satisfies the required restriction" do
      let(:source) { { type: "object", required: %w[foo] } }
      let(:object) { { bar: "baz" } }

      it { is_expected.not_to be_empty }
    end

    context "when object not satisfies the uniqueItems restriction" do
      let(:source) { { type: "array", uniqueItems: true } }
      let(:object) { %w[bar bar] }

      it { is_expected.not_to be_empty }
    end
  end
end
