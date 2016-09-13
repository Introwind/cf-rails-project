require 'rails_helper'

describe UsersController, :type => :controller do

	before do
		@user = User.create!(first_name: "sim", last_name: "qad", email: "sim@sim.com", password: "abcdef")
		@user2 = User.create!(first_name: "yes", last_name: "surname", email: "test@specs.com", password: "ilovetest")
	end

	describe "GET #show" do

		context "User is logged in" do
			before do
				sign_in @user
			end

			it "loads correct user details" do
				get :show, id: @user.id
				expect(response).to have_http_status(200)
				expect(assigns(:user)).to eq @user
			end

			it "attempting to access another user show page root redirect" do
				get :show, id: @user2.id
				expect(response).to have_http_status(302)
				expect(response).to redirect_to(root_path)
			end
		end

		context "No user logged in" do
			it "redirects to login" do
				get :show, id: @user.id
				expect(response).to redirect_to('/users/sign_in')
			end
		end

	end



end