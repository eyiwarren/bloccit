require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
   let(:vote) { Vote.create!(value: 1, post: post, user: user) }

 # #1
   #it { is_expected.to belong_to(:post) }
   describe "associations" do
     it { expect(vote).to respond_to(:post) }
   end

   #it { is_expected.to belong_to(:user) }
   describe "associations" do
     it { expect(vote).to respond_to(:user) }
   end
 # #2
   #it { is_expected.to validate_presence_of(:value) }
   it "passes validation with value" do
     expect(vote).to respond_to(:value)
   end
 # #3
   #it { is_expected.to validate_inclusion_of(:value).in_array([-1, 1]) }
   it "passes validation with the inclusion of value in array -1(down vote), 1(up vote)" do
     expect(vote).to be_valid

     v = Vote.new(post: post, user: user)
     expect(v.valid?).to be_falsey
     v.value = 1
     expect(v.valid?).to be_truthy
   end

   describe "update_post callback" do
        it "triggers update_post on save" do
            expect(vote).to receive(:update_post).at_least(:once)
            vote.save!
        end

        it "#update_post should call update_rank on post" do
            expect(post).to receive(:update_rank).at_least(:once)
            vote.save!
        end
    end
end
