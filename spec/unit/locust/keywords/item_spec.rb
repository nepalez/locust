RSpec.describe Locust::Keywords::Item do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "array" }, nil) }
  let(:data)    { { "type" => "integer" } }
  let(:source)  { { source: data, index: 13 } }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "items[13]" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq data }
    its(:index)   { is_expected.to eq 13 }
  end

  describe "#schema" do
    subject { keyword.schema }

    it { is_expected.to be_kind_of Locust::Keywords::Object }
    its(:source) { is_expected.to eq data }
    its(:parent) { is_expected.to eq keyword }
  end

  describe "#validate" do
    subject { keyword.validate }

    it { is_expected.to eq [] }

    context "when parent schema describes not an array" do
      let(:parent) { Locust::Keywords::Object.call({ type: "object" }, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when parent is not an object" do
      let(:parent) { Locust::Schema.call(nil, nil) }

      it { is_expected.not_to be_empty }
    end

    context "when index is negative" do
      before { source[:index] = -1 }

      it { is_expected.not_to be_empty }
    end

    context "when index is not defined" do
      before { source.delete :index }

      it { is_expected.not_to be_empty }
    end

    context "when source is not a valid schema object" do
      let(:data) { { "type" => "foo" } }

      it { is_expected.not_to be_empty }
    end
  end
end
