require 'rails_helper'

RSpec.describe Post, type: :model do
  # #1
  let(:name) { RandomData.random_sentence }
   let(:description) { RandomData.random_paragraph }
   let(:title) { RandomData.random_sentence }
   let(:body) { RandomData.random_paragraph }
 # #3
   let(:topic) { Topic.create!(name: name, description: description) }
 # #4
 # #1
let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
# #2
let(:post) { topic.posts.create!(title: title, body: body, user: user) }

   #it { is_expected.to belong_to(:topic) }
   #it { is_expected.to have_many(:comments) }

   describe "associations" do
     it { expect(post).to respond_to(:comments) }
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
       expect(post).to have_attributes(title: title, body: body, user: user)
    end
  end
end
