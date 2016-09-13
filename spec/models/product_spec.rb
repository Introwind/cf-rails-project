require 'rails_helper'

describe Product do

  context 'when the product has comments' do

    # Checks if the average_rating method for product comments works
    before do
      @product = Product.create!(name: "test-bike", image_url: "http://www.testurl.com", price: "4550")
      @user = User.create!(email: "test2@test.com", password: "password", first_name: "test2", last_name: "test2")
      @product.comments.create!(rating: 1, user: @user, body: "I would not buy it again")
      @product.comments.create!(rating: 3, user: @user, body: "Good but the condition was not impresive as advertised")
      @product.comments.create!(rating: 5, user: @user, body: "Excelent bike, excelent service!")
    end

    it "returns the average rating of all comments" do
      expect(@product.comments.average(:rating).to_f).to eq 3.0
    end

    it "is not valid" do
    	expect(Product.new(description: "Nice bike")).not_to be_valid
    end


  end

end

