RSpec.describe Locust::Schema::Enum do
  let(:enum) { described_class.call source }

  describe ".call" do
    subject { enum }

    context "with a non-array" do
      let(:source) { "foo" }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with an empty array" do
      let(:source) { [] }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "with an array containing duplications" do
      let(:source) { ["bar", "foo", "bar"] }

      it "raises ArgumentError" do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end
end
