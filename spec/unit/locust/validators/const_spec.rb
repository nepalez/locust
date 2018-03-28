RSpec.describe Locust::Validators::Const, ".call" do
  subject { described_class.call(schema) }

  let(:schema) { double :schema, source: source, full_path: "const" }
end
