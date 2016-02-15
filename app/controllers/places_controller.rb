class PlacesController < ApplicationController
  def index
  end

 def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
    	redirect_to places_path, notice: "No locations in #{params[:city]}" and return
    end
    render :index
 end
end
