require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'Amaka Konwea', email: 'amakakonwea@gmail.com', password: '11111111')
  end
  before { subject.save }

  it 'email should not be empty' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name should be implemented' do
    expect(subject.name).to eql 'Amaka Konwea'
  end

  it 'email should be implemented' do
    expect(subject.email).to eql 'amakakonwea@gmail.com'
  end
end
