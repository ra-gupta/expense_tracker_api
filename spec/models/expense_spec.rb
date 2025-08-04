require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: "Test User", email: "user@example.com", password: "password") }

  subject do
    described_class.new(
      user: user,
      title: "Groceries",
      amount: 100.5,
      date: Date.today,
      category: "Food",
      note: "Weekly grocery shopping"
    )
  end

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without amount" do
    subject.amount = nil
    expect(subject).not_to be_valid
  end

  it "is not valid with non-positive amount" do
    subject.amount = 0
    expect(subject).not_to be_valid
  end

  it "is not valid without a date" do
    subject.date = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a category" do
    subject.category = nil
    expect(subject).not_to be_valid
  end

  it "is not valid without a user" do
    subject.user = nil
    expect(subject).not_to be_valid
  end
end
