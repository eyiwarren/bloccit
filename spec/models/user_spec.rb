require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

   #it { is_expected.to validate_presence_of(:name) }
   it "passes validation with name" do
     expect(user).to be_valid
   end

   #it { is_expected.to validate_length_of(:name).is_at_least(1) }
   it "passes validation with length of name at least 1 letter" do
     expect(user).to be_valid
   end

   # Shoulda tests for email
   #it { is_expected.to validate_presence_of(:email) }
   it "passes validation with email" do
     expect(user).to be_valid
   end

   it "passes validation with unique email" do
     expect(user).to be_valid
   end

   #it { is_expected.to validate_uniqueness_of(:email) }
   #it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it "passes validation with length of email at least 3 characters" do
    expect(user).to be_valid
   end

   #it { is_expected.to allow_value("user@bloccit.com").for(:email) }
   it "passes validation with value of email as user@bloccit.com" do
     
     expect(user).to be_valid
   end

   #it { is_expected.to validate_presence_of(:password) }
   it "passes validation with password" do
     expect(user).to be_valid
   end

   it "passes validation with secure password" do
     expect(user).to be_valid
   end

   #it { is_expected.to have_secure_password }
   #it { is_expected.to validate_length_of(:password).is_at_least(6) }
   it "passes validation with length of password at least 6 characters" do
     expect(user).to be_valid
   end

   describe "attributes" do
     it "should have name and email attributes" do
       expect(user).to have_attributes(name: "Bloccit User", email: "user@bloccit.com")
     end
   end

   # #1
   describe "invalid user" do
     let(:user_with_invalid_name) { User.new(name: "", email: "user@bloccit.com") }
     let(:user_with_invalid_email) { User.new(name: "Bloccit User", email: "") }

     it "should be an invalid user due to blank name" do
       expect(user_with_invalid_name).to_not be_valid
     end

     it "should be an invalid user due to blank email" do
       expect(user_with_invalid_email).to_not be_valid
     end
    end
end
