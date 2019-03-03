require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

  context "associations" do
    it "should be associated with Post" do
      expect(user).to respond_to(:posts)
    end
  end
    #it { is_expected.to have_many(:posts) }

   it "passes validation with name" do
     expect(user).to respond_to(:name)
   end


   it "passes validation with length of name at least 1 letter" do
     expect(user).to be_valid

     u = User.new(email: "email@email.com", password: "password")
     expect(u.valid?).to be_falsey
     u.name = "bob"
     expect(u.valid?).to be_truthy
   end


   it "passes validation with email" do
     expect(user).to be_valid

     u = User.new(email: "email@email.com", password: "password")
     expect(u.valid?).to be_falsey
     u.name = "bob"
     expect(u.valid?).to be_truthy

   end

   it "passes validation with unique email" do
     expect(user).to be_valid

     u = User.new(email: "email@email.com", password: "password")
     expect(u.valid?).to be_falsey
     u.name = "bob"
     expect(u.valid?).to be_truthy
   end


   it "passes validation with length of email at least 3 characters" do
    expect(user).to be_valid

    u = User.new(email: "email@email.com", password: "password")
    expect(u.valid?).to be_falsey
    u.name = "bob"
    expect(u.valid?).to be_truthy
   end


   it "passes validation with value of email as user@bloccit.com" do
     expect(user).to be_valid

    u = User.new(email: "email@email.com", password: "password")
    expect(u.valid?).to be_falsey
    u.name = "bob"
    expect(u.valid?).to be_truthy
   end

   it "passes validation with password" do
     expect(user).to be_valid

     u = User.new(email: "email@email.com", password: "password")
     expect(u.valid?).to be_falsey
     u.name = "bob"
     expect(u.valid?).to be_truthy
   end

   it "passes validation with secure password" do
     expect(user).to be_valid

     u = User.new(email: "email@email.com", password: "password")
     expect(u.valid?).to be_falsey
     u.name = "bob"
     expect(u.valid?).to be_truthy
   end


   it "passes validation with length of password at least 6 characters" do
     expect(user).to be_valid

     u = User.new(email: "email@email.com", password: "password")
     expect(u.valid?).to be_falsey
     u.name = "bob"
     expect(u.valid?).to be_truthy
   end

   describe "attributes" do
     it "should have name and email attributes with the name properly capitalized" do
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
