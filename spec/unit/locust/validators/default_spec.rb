RSpec.describe Locust::Validators::Default, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "default" }
end
