RSpec.describe Locust::Keywords::Property do
  let(:keyword) { described_class.call source, parent }
  let(:source)  { { key: "foo", source: { "type" => "integer" } } }
  let(:parent)  { Locust::Keywords::Object.call({ type: "object" }, nil) }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "properties[foo]" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source[:source] }
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

    context "when source is not a valid schema" do
      let(:source) { { key: "foo", source: nil } }

      it { is_expected.not_to be_empty }
    end

    context "when key is empty" do
      let(:source) { { key: "", source: { "type" => "integer" } } }

      it { is_expected.not_to be_empty }
    end
  end
end
