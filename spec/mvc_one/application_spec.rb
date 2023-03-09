# frozen_string_literal: true

RSpec.describe MvcOne::Application do
  it 'launch application' do
    expect(described_class.launch).to be_respond_to(:call)
  end
end
