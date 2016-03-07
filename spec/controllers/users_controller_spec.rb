require "rails_helper"

describe UsersController, :type => :controller do
	
	before do
		@user = FactoryGirl.create(:user)
		@usertwo = FactoryGirl.create(:user)
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
		end

		context "No user is logged in" do
		 	it "redirects to user#index" do
		 		get :show, id: @user.id
		 		expect(response).to redirect_to(users_path)
		 	end
		end

		context 'User cannot access another users page' do 
			before do 
				sign_in @user 
			end
			it 'redirects to user#index' do 
				get :show, id: @usertwo.id 
				expect(response).to redirect_to(users_path)
			end
			it 'responds with HTTP 302 redirect code' do
				get :show, id: @usertwo.id
				expect(response).to have_http_status(302)
			end
		end
	end
end