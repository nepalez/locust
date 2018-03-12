RSpec.describe Locust::Validators::Const do
  let(:format) { described_class.call "FOO" }
  let(:source) { :foo }

  describe ".errors" do
    subject { format.errors object, "foo/bar" }

    context "when object equals the source" do
      let(:object) { "FOO" }
      it { is_expected.to be_empty }
    end

    context "when object differs from the source" do
      let(:object) { :FOO }
      it { is_expected.not_to be_empty }
    end
  end
end