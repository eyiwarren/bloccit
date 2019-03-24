require 'rails_helper'

RSpec.describe Favorite, type: :model do
  let(:topic) { create(:topic) }
   let(:user) { create(:user) }
   let(:post) { create(:post) }
   let(:favorite) { Favorite.create!(post: post, user: user) }

   #it { is_expected.to belong_to(:post) }
   describe "associations" do
     it { expect(favorite).to respond_to(:post) }
   end

   #it { is_expected.to belong_to(:user) }
   describe "associations" do
     it { expect(favorite).to respond_to(:user) }
   end
end
