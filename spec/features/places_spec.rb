require 'rails_helper'

describe "Places" do
  it "if one is returned by the API, it is shown at the page" do
    allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      [ Place.new( name:"Oljenkorsi", id: 1 ) ]
    )
      fill_form

      expect(page).to have_content "Oljenkorsi"
  end

    it "if many are returned by the API, they are shown at the page" do
      allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
        [ Place.new( name:"Oljenkorsi", id: 1 ),
        Place.new( name:"Kumpulan panimo", id: 2 ),
        Place.new( name: "Iltakoulu", id: 3 ) ]
      )

      fill_form

      expect(page).to have_content "Oljenkorsi"
      expect(page).to have_content "Kumpulan panimo"
      expect(page).to have_content "Iltakoulu"
    end

    it "if nothing is returned, error message is shown" do
      allow(BeermappingApi).to receive(:places_in).with("kumpula").and_return(
      []
    )
      fill_form

      expect(page).to have_content "No locations in kumpula"
    end  

    def fill_form
      visit places_path
      fill_in('city', with: 'kumpula')
      click_button "Search"
    end


end