RSpec.describe Locust::Keywords::AdditionalProperties do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: type }, nil) }
  let(:source)  { { "type" => "string" } }
  let(:type)    { "object" }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "additionalProperties" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#schema" do
    subject { keyword.schema }

    context "with a true source" do
      let(:source) { true }

      it { is_expected.to be_nil }
    end

    context "with a false source" do
      let(:source) { false }

      it { is_expected.to be_nil }
    end

    context "with a hash source" do
      it { is_expected.to be_kind_of Locust::Keywords::Object }
      its(:source) { is_expected.to eq source }
      its(:parent) { is_expected.to eq keyword }
    end

    context "with another source" do
      let(:source) { 1 }

      it { is_expected.to be_kind_of Locust::Keywords::Object }
      its(:source) { is_expected.to eq source }
      its(:parent) { is_expected.to eq keyword }
    end
  end

  describe "#allowed?" do
    subject { keyword.allowed? }

    context "with a hash source" do
      let(:source) { { "type" => "object" } }

      it { is_expected.to eq true }
    end

    context "with a true source" do
      let(:source) { true }

      it { is_expected.to eq true }
    end

    context "with a false source" do
      let(:source) { false }

      it { is_expected.to eq false }
    end

    context "with another source" do
      let(:source) { 1 }

      it { is_expected.to eq true }
    end
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent describes not an object" do
      let(:type) { "array" }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when source is the true value" do
      let(:source) { true }

      it { is_expected.to eq [] }
    end

    context "when source is the false value" do
      let(:source) { false }

      it { is_expected.to eq [] }
    end

    context "when source is a valid schema" do
      let(:source) { { "type" => "string" } }

      it { is_expected.to eq [] }
    end

    context "when source is an invalid schema" do
      let(:source) { {} }

      it { is_expected.not_to be_empty }
    end

    context "when source is neither boolean, nor a schema" do
      let(:source) { "foo" }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object has no additional properties" do
      let(:object) { {} }

      it { is_expected.to eq [] }
    end

    context "when object has additional properties" do
      let(:object) { { "foo" => "bar" } }

      context "when additional properties are enabled" do
        let(:source) { true }

        it { is_expected.to eq [] }
      end

      context "when all additional properties are valid" do
        let(:source) { { type: "string" } }

        it { is_expected.to eq [] }
      end

      context "when some additional property is invalid" do
        let(:source) { { type: "integer" } }

        it { is_expected.not_to be_empty }
      end

      context "when additional properties are forbidden" do
        let(:source) { false }

        it { is_expected.not_to be_empty }
      end
    end

    context "when object is not a hash" do
      let(:object) { 1 }

      it { is_expected.to eq [] }
    end

    context "when schema is invalid" do
      let(:parent) { Locust::Schema.call(nil, nil) }
      let(:source) { false }
      let(:object) { { "foo" => "bar" } }

      it { is_expected.to eq [] }
    end
  end
end
