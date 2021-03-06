class GuestsController < ApplicationController
  def add_to_db
    email = @current_user.email
    name = params[:name]
    surname = params[:surname]
    date = $date_of_concert
    cached_guest = Guest.find_or_initialize_by(email: email, date_of_concert: date, name: name, surname: surname)
    if cached_guest.new_record?
      cached_guest.name = name
      cached_guest.surname = surname
      cached_guest.date_of_concert = date
      cached_guest.save!
      redirect_to root_path
    else
      redirect_to root_path, notice: 'Вы уже записались на это выступление'
    end
  end
end
