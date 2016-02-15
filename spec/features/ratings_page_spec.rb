require 'rails_helper'

describe "Ratings page" do
	let!(:beer1) { FactoryGirl.create :beer, name:"Iso 3"}
	let!(:beer2) { FactoryGirl.create :beer, name:"Karhu" }
	let!(:user) { FactoryGirl.create :user }
	let!(:rating) { FactoryGirl.create :rating, beer:beer1, user:user }
	let!(:rating2) { FactoryGirl.create :rating2, beer:beer2, user:user }


	it "should show all ratings" do
		visit ratings_path

		expect(page).to have_content 'Iso 3 10 Pekka'
		expect(page).to have_content 'Karhu 20 Pekka'

	end	

	it "should show ratings count" do
		visit ratings_path

		expect(page).to have_content 'Number of ratings: 2'
	end
end

