RSpec.describe Locust::Keywords::Properties do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "object" }, nil) }
  let(:source)  { { "foo" => { "type" => "integer" } } }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "properties" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#schemas" do
    subject { keyword.schemas }

    context "with a hash" do
      it { is_expected.to be_a Hash }
      its(:keys) { is_expected.to match_array %w[foo] }
    end

    context "with invalid source" do
      let(:source) { 3 }

      it { is_expected.to eq({}) }
    end
  end

  describe "#[]" do
    subject { keyword[:foo] }

    it { is_expected.to be_a Locust::Keywords::Property }
    its(:schema) { is_expected.to be_a Locust::Keywords::Object }
    its(:source) { is_expected.to eq "type" => "integer" }
    its(:parent) { is_expected.to eq parent }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent describes not an object" do
      let(:parent) { Locust::Keywords::Object.call({ type: "array" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when some schema is invalid" do
      let(:source) { { "foo" => { "type" => "foo" } } }

      it { is_expected.not_to be_empty }
    end

    context "when source is empty" do
      let(:source) { {} }

      it { is_expected.not_to be_empty }
    end

    context "when source is not a hash" do
      let(:source) { 2 }

      it { is_expected.not_to be_empty }
    end
  end
end
