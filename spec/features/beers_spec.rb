require 'rails_helper'

describe "Beer" do 
	it "is added to the system, when valid name is given" do
	
		visit new_beer_path
		fill_in('beer_name', with:'Olut1')

		expect{
		click_button('Create Beer')
		}.to change{Beer.count}.by(1)
		end

	it "is not added but gives error, when no name is given" do

		visit new_beer_path
		click_button('Create Beer')

		expect(page).to have_content "Name can't be blank"

	end
end