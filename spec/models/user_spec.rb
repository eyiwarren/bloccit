require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "password") }

  context "associations" do
    it "should be associated with Post" do
      expect(user).to respond_to(:posts)
    end
  end
    #it { is_expected.to have_many(:posts) }

    #it { is_expected.to have_many(:comments) }
    context "associations" do
      it "should be associated with Comment" do
        expect(user).to respond_to(:comments)
      end
    end

    #it { is_expected.to have_many(:votes) }
    context "associations" do
      it "should be associated with Votes" do
        expect(user).to respond_to(:votes)
      end
    end
    #describe "associations" do
    #  it { expect(user).to respond_to(:votes) }
    #end

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


   # #1
     it "responds to role" do
       expect(user).to respond_to(:role)
     end

 # #2
     it "responds to admin?" do
       expect(user).to respond_to(:admin?)
     end

 # #3
     it "responds to member?" do
       expect(user).to respond_to(:member?)
     end
   end

   describe "roles" do
 # #4
     it "is member by default" do
       expect(user.role).to eql("member")
     end

 # #5
     context "member user" do
       it "returns true for #member?" do
         expect(user.member?).to be_truthy
       end

       it "returns false for #admin?" do
         expect(user.admin?).to be_falsey
       end
     end

 # #6
     context "admin user" do
       before do
         user.admin!
       end

       it "returns false for #member?" do
         expect(user.member?).to be_falsey
       end

       it "returns true for #admin?" do
         expect(user.admin?).to be_truthy
       end
     end
   end


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
