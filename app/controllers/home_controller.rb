class HomeController < ApplicationController


  def index
    unless Concert.last.nil?
      $date_of_concert = Concert.last.date_of_concert
      $place_of_concert = Concert.last.place_of_concert
    end
  end


end
