class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.assign_reservation

    if @reservation.save
      flash[:notice] = "Reservation sucessfully created"
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def reservation_params
      params.require(:reservation).permit(:name, :guests, :table_id, :time)
    end
    
end