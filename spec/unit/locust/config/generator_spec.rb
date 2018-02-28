RSpec.describe Locust::Config::Generator do
  let(:generator) { described_class.new(block, **options) }

  let(:options) { {} }
  let(:block)   { -> { "foobar" } }

  describe ".new" do
    subject { generator }

    context "without options" do
      it { is_expected.not_to be_immutable }
    end

    context "with the 'immutable: true' option" do
      before { options[:immutable] = true }
      it { is_expected.to be_immutable }
    end

    context "when block is absent" do
      let(:block) { nil }

      it "raises TypeError" do
        expect { subject }.to raise_error(TypeError)
      end
    end

    context "when block has arguments" do
      let(:block) { ->(v) { v } }

      it "raises TypeError" do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end

  describe "#call" do
    subject { generator.call }

    it "returns the result of yielding the block" do
      expect(subject).to eq "foobar"
    end
  end
end
