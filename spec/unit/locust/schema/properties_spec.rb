RSpec.describe Locust::Schema::Properties do
  let(:schema) { described_class.call source, parent }
  let(:parent) { double :parent }
  let(:source) { { "foo" => data } }
  let(:data)   { { "type" => "null" }  }

  describe ".call" do
    subject { schema }

    its(:keyword) { is_expected.to eq "properties" }
    its(:parent)  { is_expected.to eq parent }
    its(:source)  { is_expected.to eq source }
  end

  describe "#data" do
    subject { schema.data } 

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
    subject { schema[:foo] }

    it { is_expected.to be_a Locust::Schema::Property }

    its(:schema) { is_expected.to be_a Locust::Schema::Object }
    its(:source) { is_expected.to eq data }
    its(:parent) { is_expected.to eq parent }
  end
end
