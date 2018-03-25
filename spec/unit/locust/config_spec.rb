RSpec.describe Locust::Config do
  let(:config) { described_class.new }

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
    subject do
      config.format("ba") do
        generate { :BAR }
        validate { |value| ["invalid"] unless value.to_s[0] == "B" }
      end

      config.format("ba") do
        generate { :BAZ }
        validate { |value| ["invalid"] unless value.to_s[1] == "A" }
      end
    end

    before { subject }

    let(:format)     { config.formats["ba"] }
    let(:generators) { format.generators }
    let(:validators) { format.validators }

    it "sets generators" do
      subject

      expect(generators.map(&:call)).to eq %i[BAR BAZ]
    end

    it "sets validators" do
      subject

      expect(validators.map { |g| g.call("BFR") }).to eq [nil, ["invalid"]]
    end
  end
end
