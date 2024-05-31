class PlacesController < ApplicationController

  def index
    @places = Place.all
  end
  
  def home

    redirect_to "/places"
  end

  def show
    @user = User.find_by({ "id" => session["user_id"] })
    @place = Place.find_by({ "id" => params["id"] })
    if @user != nil
      @entries = Entry.where({ "place_id" => @place["id"], "user_id" => @user["id"]})
    else
      flash["notice"] = "Please login."
      redirect_to "/login"
    end
  end

  def new
    @user = User.find_by({ "id" => session["user_id"] })
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
