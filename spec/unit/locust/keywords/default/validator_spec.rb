RSpec.describe Locust::Keywords::Default::Validator, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "default" }
end
