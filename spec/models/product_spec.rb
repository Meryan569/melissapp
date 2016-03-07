require 'rails_helper'

describe Product do
  context "when a product has comments" do
    before do
      @product = Product.create!(name: "red bike", description: "pretty", color: "red", price: "35", image_url: "rosalynn.jpg")
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "Awful Bike")
      @product.comments.create!(rating: 3, user: @user, body: "OK Bike")
      @product.comments.create!(rating: 5, user: @user, body: "Nice Bike")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

      it "validates the products" do
        expect(Product.new(description: "Nice bike")).not_to be_valid
  end

end