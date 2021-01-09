class GuestsController < ApplicationController
  def add_to_db
    email = @current_user.email
    name = params[:name]
    surname = params[:surname]
    date = params[:date_of_concert]
    cached_guest = Guest.find_or_initialize_by(email: email)
    if cached_guest.new_record?
      cached_guest.name = name
      cached_guest.surname = surname
      cached_guest.date_of_concert = date
      cached_guest.save!
      redirect_to root_path
    else
      redirect_to root_path, notice: 'На данном аккаунте уже есть запись. Пожалуйста, создайте новый.'
    end
  end
end
