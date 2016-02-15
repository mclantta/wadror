require 'rails_helper'

include Helpers

describe "Rating" do
  let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
  let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
  let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user, username:"Minni"}
  let!(:rating) { FactoryGirl.create :rating, beer:beer2, user:user2 }

  #before :each do
   # sign_in(username:"Pekka", password:"Foobar1")
    
  end

  it "when given, is registered to the beer and user who is signed in" do
    sign_in(username:"Pekka", password:"Foobar1")

    visit new_rating_path
    select('iso 3', from:'rating[beer_id]')
    fill_in('rating[score]', with:'15')

    expect{
      click_button "Create Rating"
    }.to change{Rating.count}.from(0).to(1)

    expect(user.ratings.count).to eq(1)
    expect(beer1.ratings.count).to eq(1)
    expect(beer1.average_rating).to eq("15")
  end

  it "when deleted, is removed also from all ratings" do
    sign_in(username:"Minni", password:"Foobar1")

    visit user_path(user2)

    if(page.find(""))
    click_link "Delete"
  end 

end