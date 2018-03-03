RSpec.describe Locust::Schema::Pattern do
  let(:pattern) { described_class.call source }
  let(:source)  { '^\w+$' }

  describe "#accept?" do
    subject { pattern.accept? string }

    context "when a string satisfies the pattern" do
      let(:string) { "foobar" }
      it { is_expected.to eq true }
    end

    context "when a string doesn't satsifies the pattern" do
      let(:string) { "foo-bar" }
      it { is_expected.to eq false }
    end
  end

  describe "#reject?" do
    subject { pattern.reject? string }

    context "when a string satisfies the pattern" do
      let(:string) { "foobar" }
      it { is_expected.to eq false }
    end

    context "when a string doesn't satsifies the pattern" do
      let(:string) { "foo-bar" }
      it { is_expected.to eq true }
    end
  end
end
