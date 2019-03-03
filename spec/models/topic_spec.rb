require 'rails_helper'

RSpec.describe Topic, type: :model do

   let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:public) { true }
   let(:topic) { Topic.create!(name: name, description: description) }

   #it { is_expected.to have_many(:posts) }

   context "associations" do
     it "should be associated with Post" do
       expect(topic).to respond_to(:posts)
     end
   end

   it "passes validation with name" do
     expect(topic).to respond_to(:name)
   end

   #it { is_expected.to validate_presence_of(:name) }
   it "passes validation with description" do
     expect(topic).to respond_to(:description)
   end

   #it { is_expected.to validate_presence_of(:description) }
   it "passes validation with length of name at least 5 characters" do
     expect(topic).to be_valid

     t = Topic.new(description: "This is a description")
     expect(t.valid?).to be_falsey
     t.name = "Eyi Warren"
     expect(t.valid?).to be_truthy
   end

   #it { is_expected.to validate_length_of(:name).is_at_least(5) }
   it "passes validation with length of descriptiom at least 15 characters" do
     expect(topic).to be_valid

     t = Topic.new(name: "Isla Fisher")
     expect(t.valid?).to be_falsey
     t.description = "Testing out this description"
     expect(t.valid?).to be_truthy
   end
  # it { is_expected.to validate_length_of(:description).is_at_least(15) }

  # #1
   describe "attributes" do
     it "has name, description, and public attributes" do
       expect(topic).to have_attributes(name: name, description: description, public: public)
     end

 # #2
     it "is public by default" do
       expect(topic.public).to be(true)
     end
   end
end
