require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }
  let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

  #it { is_expected.to belong_to(:post) }
  describe "associations" do
    it { expect(comment).to respond_to(:post) }
  end

  #it { is_expected.to belong_to(:user) }
  describe "associations" do
    it { expect(comment).to respond_to(:user) }
  end

  #it { is_expected.to validate_presence_of(:body) }
  it "passes validation with body" do
    expect(comment).to respond_to(:body)
  end

  #it { is_expected.to validate_length_of(:body).is_at_least(5) }
  it "passes validation with length of body at least 5 characters" do
  expect(comment).to be_valid

    c = Comment.new(post: post, user: user )
    expect(c.valid?).to be_falsey
    c.body = "This would be the body"
    expect(c.valid?).to be_truthy
    end

   describe "attributes" do
     it "has a body attribute" do
       expect(comment).to have_attributes(body: "Comment Body")
     end
   end
end
