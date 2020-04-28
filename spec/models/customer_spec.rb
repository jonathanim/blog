require 'rails_helper'
RSpec.describe Customer, type: :model do
  subject { Customer.new(first_name: "Jack", last_name: "Smith", phone: "8889995678", email: "jsmith@sample.com" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a first_name" do
    subject.first_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a last_name" do
    subject.last_name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a phone number" do
    subject.phone = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid if the phone number is not 10 chars" do
    if expect(subject.phone.length).to be(10)
          expect(subject).to be_valid
    else
      expect(subject).to_not be_valid
    end
  end


  it "is not valid if the phone number is not all digits" do

    regex = (/^(\d)+$/)
    if subject.phone.match(regex)
    expect(subject).to be_valid
    else
    expect(subject).to_not be_valid
    end
  end

  it "is not valid if the email address doesn't have a @" do

    if expect(subject.email).to include('@')
    expect(subject).to be_valid
    else
    expect(subject).to_not be_valid
    end
  end

  it "returns the correct full_name" do
    expect(subject.full_name).to eq("Jack Smith")
  end
end
