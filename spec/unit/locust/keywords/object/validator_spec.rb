RSpec.describe Locust::Keywords::Object::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, type: type, full_path: "foo" }
  let(:type)   { double }

  context "when type is defined" do
    it { is_expected.to eq [] }
  end

  context "when type is undefined" do
    let(:type) { nil }

    it { is_expected.not_to be_empty }
  end
end
