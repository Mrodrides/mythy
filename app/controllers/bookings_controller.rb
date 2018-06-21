class BookingsController < ApplicationController
  before_action :set_booking, only: [:update, :destroy]
  def index
    @incoming = []
    current_user.creatures.each do |creature|
      @incoming.push(creature.bookings)
    end
    @outgoing = current_user.bookings
  end

  def create
    # I cant book my own creature
    parse_dates
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to bookings_path
    else
      raise
      redirect_to creatures_path
    end
  end

  def update
    raise
    # I can only update if Im the recipent of the booking
    # if current_user.id ==
  end

  def destroy
    # I can only delete the bookings i have created
    raise
    if @booking.user_id == current_user.id
      @booking.destroy
    end
    redirect_to bookings_path
  end

  private

  def parse_dates
    params[:booking][:start_date] = Date.parse(params[:booking][:start_date])
    params[:booking][:end_date] = Date.parse(params[:booking][:end_date])
  end

  def booking_params
    #idk
    params.require(:booking).permit(:start_date, :end_date, :creature_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
