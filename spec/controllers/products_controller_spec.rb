require 'rails_helper'

describe ProductsController, type: :controller do

	before do
		@admin = FactoryGirl.create(:admin)
		@product = FactoryGirl.create(:product)
	end

	describe "GET #edit as non-admin" do

		it "unauthorised to view page to edit" do
			get :edit, id: @product.id
			expect(response).to redirect_to(root_path)
		end

		it "should allow to editing of product page" do
			sign_in @admin
			get :edit, id: @product.id
			expect(response).to have_http_status(200)
		end

	end

end