RSpec.describe Locust::Keywords::Required do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "object" }, nil) }
  let(:source)  { %w[foo bar] }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "required" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#data" do
    subject { keyword.data }

    it { is_expected.to eq %w[foo bar] }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent describes not an object" do
      let(:parent) { Locust::Keywords::Object.call({ type: "array" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.new(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when source contains non-strings" do
      let(:source) { ["id", 1] }

      it { is_expected.not_to be_empty }
    end

    context "when source is not unique" do
      let(:source) { %w[id name name] }

      it { is_expected.not_to be_empty }
    end

    context "when a source is an empty array" do
      let(:source) { [] }

      it { is_expected.not_to be_empty }
    end

    context "when a source is not an array" do
      let(:source) { "id" }

      it { is_expected.not_to be_empty }
    end
  end

  describe "#verify" do
    subject { keyword.verify object }

    context "when object has all required properties" do
      let(:object) { { foo: :FOO, bar: :BAR } }

      it { is_expected.to eq [] }
    end

    context "when object miss required properties" do
      let(:object) { { foo: :FOO, baz: :BAZ } }

      it { is_expected.not_to be_empty }
    end

    context "when object is not a hash" do
      let(:object) { %w[foo bar] }

      it { is_expected.to eq [] }
    end
  end
end
