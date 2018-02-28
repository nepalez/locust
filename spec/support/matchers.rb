RSpec::Matchers.define :be_applicable do
  match do |result|
    expect(result).not_to eq(Locust::NotApplicableError)
  end

  match_when_negated do |result|
    expect(result).to eq(Locust::NotApplicableError)
  end
end
