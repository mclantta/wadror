require 'rails_helper'

describe "User's own page" do 
	let!(:user1) { FactoryGirl.create :user }
	let!(:user2) { FactoryGirl.create :user, username:"Minni" }
	let!(:beer1) { FactoryGirl.create :beer, name:"Iso 3"}
	let!(:beer2) { FactoryGirl.create :beer, name:"Karhu" }
	let!(:rating) { FactoryGirl.create :rating, beer:beer1, user:user1 }
	let!(:rating2) { FactoryGirl.create :rating2, beer:beer2, user:user2 }

	it "should show user's own ratings" do
		visit user_path(user1)

		expect(page).to have_content 'Iso 3 10'
	end

	it "should not show another user's ratings" do
		visit user_path(user1)

		expect(page).not_to have_content 'Karhu 20'
	end	
end