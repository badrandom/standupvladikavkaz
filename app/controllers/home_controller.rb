class HomeController < ApplicationController


  def index
  end

  def change
    date = params[:date_of_conc]
    place = params[:place_of_conc]
    $date_of_concert = date
    $place_of_concert = place
    redirect_to root_path
  end
end
