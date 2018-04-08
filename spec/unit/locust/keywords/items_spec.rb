RSpec.describe Locust::Keywords::Items do
  let(:keyword) { described_class.call source, parent }
  let(:parent)  { Locust::Keywords::Object.call({ type: "array" }, nil) }
  let(:source)  { { "type" => "integer" } }

  describe ".call" do
    subject { keyword }

    its(:keyword) { is_expected.to eq "items" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#schema" do
    subject { keyword.schema }

    context "with a single hash" do
      let(:source) { { "type" => "integer" } }

      it { is_expected.to be_kind_of Locust::Keywords::Object }
      its(:source) { is_expected.to eq source }
      its(:parent) { is_expected.to eq keyword }
    end

    context "with an array of hashes" do
      let(:source) { [{ "type" => "integer" }] }

      it { is_expected.to be_nil }
    end

    context "with neither hash nor an array" do
      let(:source) { 3 }

      it { is_expected.to be_nil }
    end
  end

  describe "#schemas" do
    subject { keyword.schemas }

    context "with a single hash" do
      let(:source) { { "type" => "integer" } }

      it { is_expected.to eq [] }
    end

    context "with an array of hashes" do
      let(:source) { [{ "type" => "integer" }] }

      it { is_expected.not_to be_empty }
      its(:count) { is_expected.to eq 1 }
    end

    context "with neither hash nor an array" do
      let(:source) { 3 }

      it { is_expected.to be_empty }
    end
  end

  describe "#[]" do
    subject { keyword[0] }

    context "with a single hash" do
      let(:source) { { "type" => "integer" } }

      it { is_expected.to be_nil }
    end

    context "with an array of hashes" do
      let(:source) { [{ "type" => "integer" }] }

      it { is_expected.to be_a Locust::Keywords::Item }
      its(:source) { is_expected.to eq "type" => "integer" }
      its(:parent) { is_expected.to eq parent }
    end

    context "with neither hash nor an array" do
      let(:source) { 3 }

      it { is_expected.to be_nil }
    end
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

    context "when source is not a valid schema" do
      let(:source) { { "type" => "foo" } }

      it { is_expected.not_to be_empty }
    end

    context "when source contains invalid schema" do
      let(:source) { [{ "type" => "foo" }] }

      it { is_expected.not_to be_empty }
    end
  end
end
