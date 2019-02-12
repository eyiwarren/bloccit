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

  # context "associations" do
  #   it "should be associated with SponsoredPost" do
  #     expect(topic).to respond_to(:sponsored_posts)
  #   end
   #end

   it { is_expected.to have_many(:sponsored_posts) }
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