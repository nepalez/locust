RSpec.describe Locust::Keywords::Items do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:data)   { { "type" => "null" } }

  describe ".call" do
    subject { schema }

    let(:source) { data }

    its(:keyword) { is_expected.to eq "items" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#schema" do
    subject { schema.schema }

    context "with a single hash" do
      let(:source) { data }

      it { is_expected.to be_kind_of Locust::Keywords::Object }
      its(:source) { is_expected.to eq data }
      its(:parent) { is_expected.to eq schema }
    end

    context "with an array of hashes" do
      let(:source) { [data] }

      it { is_expected.to be_nil }
    end

    context "with neither hash nor an array" do
      let(:source) { 3 }

      it { is_expected.to be_nil }
    end
  end

  describe "#data" do
    subject { schema.data }

    context "with a single hash" do
      let(:source) { data }

      it { is_expected.to eq [] }
    end

    context "with an array of hashes" do
      let(:source) { [data] }

      it { is_expected.not_to be_empty }
      its(:count) { is_expected.to eq 1 }
    end

    context "with neither hash nor an array" do
      let(:source) { 3 }

      it { is_expected.to be_empty }
    end
  end

  describe "#[]" do
    subject { schema[0] }

    context "with a single hash" do
      let(:source) { data }

      it { is_expected.to be_nil }
    end

    context "with an array of hashes" do
      let(:source) { [data] }

      it { is_expected.to be_a Locust::Keywords::Item }
      its(:source) { data }
      its(:parent) { parent }
    end

    context "with neither hash nor an array" do
      let(:source) { 3 }

      it { is_expected.to be_nil }
    end
  end
end
