class PlacesController < ApplicationController
  def index
  end

  def show
    @place_id = params[:id]
    @places = BeermappingApi.places_in(session[:last_city])
  end

 def search
    @places = BeermappingApi.places_in(params[:city])
    if @places.empty?
    	redirect_to places_path, notice: "No locations in #{params[:city]}" and return
    end
    session[:last_city] = "#{params[:city]}"
    #session[:last_id] = "#{@places.id}"
    render :index
 end
end
