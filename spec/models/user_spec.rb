# spec/models/user_spec.rb

require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(
      name: "Test User",
      email: "test@example.com",
      password_digest: "password"
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without an email" do
    subject.email = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).not_to be_valid
  end

  it { should have_many(:expenses) }
  it { should validate_uniqueness_of(:email) }
end
