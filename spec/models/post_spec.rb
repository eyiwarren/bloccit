require 'rails_helper'

RSpec.describe Post, type: :model do
  # #1
  let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }

   let(:topic) { create(:topic) }
     let(:user) { create(:user) }
     let(:post) { create(:post) }


   #it { is_expected.to belong_to(:topic) }
   #it { is_expected.to have_many(:comments) }

   describe "associations" do
     it { expect(post).to respond_to(:comments) }
   end

   #it { is_expected.to have_many(:votes) }
   describe "associations" do
     it { expect(post).to respond_to(:votes) }
   end

   #it { is_expected.to have_many(:favorites) }
   context "associations" do
     it "should be associated with Favorites" do
       expect(post).to respond_to(:favorites)
     end
   end

   describe "associations" do
     it { expect(post).to respond_to(:topic) }
   end

   describe "associations" do
     it { expect(post).to respond_to(:user) }
   end
   #it { is_expected.to belong_to(:user) }

   it "passes validation with title" do
     expect(post).to respond_to(:title)
   end
   #it { is_expected.to validate_presence_of(:title) }
   it "passes validation with body" do
     expect(post).to respond_to(:body)
   end

   #it { is_expected.to validate_presence_of(:body) }
   it "passes validation with topic" do
     expect(post).to respond_to(:topic)
   end
   #it { is_expected.to validate_presence_of(:topic) }

   it "passes validation with user" do
     expect(post).to respond_to(:user)
   end
   #it { is_expected.to validate_presence_of(:user) }

   it "passes validation with length of title at least 5 characters" do
    expect(post).to be_valid

     p = Post.new(body: "This is the body for you", user: user)
     expect(p.valid?).to be_falsey
     p.title = "Here is a title for you"
     p.topic = topic
     expect(p.valid?).to be_truthy
     #p.valid? returns true if ALL validations pass, otherswise returns false
   end

   #it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it "passes validation with length of body at least 20 characters" do
     expect(post).to be_valid

     p = Post.new(title: "This is the body", user: user )
     expect(p.valid?).to be_falsey
     p.body = "This would be the contents for the body of the title"
     p.topic = topic
     expect(p.valid?).to be_truthy
   end
   #it { is_expected.to validate_length_of(:body).is_at_least(20) }


  describe "attributes" do
    it "has a title, body, and user attribute" do
       expect(post).to have_attributes(title: post.title, body: post.body)
    end
  end

  describe "voting" do
 # #5
     before do
       3.times { post.votes.create!(value: 1, user: user) }
       2.times { post.votes.create!(value: -1, user: user) }
       @up_votes = post.votes.where(value: 1).count
       @down_votes = post.votes.where(value: -1).count
     end

 # #6
     describe "#up_votes" do
       it "counts the number of votes with value = 1" do
         expect( post.up_votes ).to eq(@up_votes)
       end
     end

 # #7
     describe "#down_votes" do
       it "counts the number of votes with value = -1" do
         expect( post.down_votes ).to eq(@down_votes)
       end
     end

 # #8
     describe "#points" do
       it "returns the sum of all down and up votes" do
         expect( post.points ).to eq(@up_votes - @down_votes)
       end
     end

     describe "#update_rank" do
 # #28
       it "calculates the correct rank" do
         post.update_rank
         expect(post.rank).to eq (post.points + (post.created_at - Time.new(1970,1,1)) / 1.day.seconds)
       end

       it "updates the rank when an up vote is created" do
         old_rank = post.rank
         post.votes.create!(value: 1, user: user)
         expect(post.rank).to eq (old_rank + 1)
       end

       it "updates the rank when a down vote is created" do
         old_rank = post.rank
         post.votes.create!(value: -1, user: user)
         expect(post.rank).to eq (old_rank - 1)
       end
     end
   end
end
