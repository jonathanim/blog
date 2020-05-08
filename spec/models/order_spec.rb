require 'rails_helper'

RSpec.describe Order, type: :model do
subject { Order.new( product_name: "gears", product_count: 7, customer: FactoryBot.create(:customer))}

it "is valid with valid attributes" do
  expect(subject).to be_valid
end
it "is not vaid without choosing a customer" do
  subject.customer = nil
  expect(subject).to_not be_valid
end
it "is valid with a product_name" do
  expect(subject).to be_valid

it "is not valid without a product_name" do
  subject.product_name=nil
  expect(subject).to_not be_valid
end
it "is not valid without a product_count" do
  subject.product_count=nil
  expect(subject).to_not be_valid
end

it "is not valid if Product_count are not all numbers" do
  subject.product_count = "five"
  expect(subject).to_not be_valid
end

end
