require 'rails_helper'

RSpec.describe SponsoredPost, type: :model do
    let(:name) { RandomData.random_sentence }
    let(:description) { RandomData.random_paragraph }
    let(:title) { RandomData.random_sentence }
    let(:body) { RandomData.random_paragraph }
    let(:price) { RandomData.random_number }
    let(:topic) { Topic.create!(name: "this name is long", description: "this description is long enough") }
    let(:sponsored_post) { topic.sponsored_posts.create!(title: "title is long", body: "body is long", price: 50) }

    describe "associations" do
      it { expect(sponsored_post).to respond_to(:topic) }
    end



    describe "attributes" do
        it "has title, body, and price attributes" do
            expect(sponsored_post).to have_attributes(title: "title is long", body: "body is long", price: 50)
        end
    end
end
