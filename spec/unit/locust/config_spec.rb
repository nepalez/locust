RSpec.describe Locust::Config do
  let(:config)     { described_class.new }
  let(:format)     { config.formats["ba"] }
  let(:generators) { format.generators }
  let(:validators) { format.validators }

  describe "#formats" do
    subject { config.formats }

    it { is_expected.to be_a Hash }

    let(:format) { subject["foo"] }

    it "contains empty format by default" do
      expect(format).to be_a Locust::Config::Format
      expect(format.generators.count).to be_zero
    end
  end

  describe "#format" do
    before do
      config.format("ba") do
        generate { :BAR }
        validate { |value| value.to_s[0] == "B" }
      end

      config.format("ba") do
        generate { :BAZ }
        validate { |value| value.to_s[1] == "A" }
      end
    end

    it "sets generators" do
      expect(generators.map(&:call)).to eq %i[BAR BAZ]
    end

    it "sets validators" do
      expect(validators.map { |g| g.call("BFR") }).to eq [true, false]
    end
  end

  describe "#valid?" do
    subject { format.check object }

    before do
      config.format("ba") do
        generate { :BAR }
        validate { |value| value.to_s[0] == "B" }
      end

      config.format("ba") do
        generate { :BAZ }
        validate { |value| value.to_s[1] == "A" }
      end
    end

    context "when object satisfy all the conditions" do
      let(:object) { :BAR }
      it { is_expected.to eq true }
    end

    context "when object breaks some condition" do
      let(:object) { :BOR }
      it { is_expected.to eq false }
    end
  end
end
