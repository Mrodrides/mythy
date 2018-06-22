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
    if !overlaps? && @booking.save
      redirect_to bookings_path
    else
      redirect_back(fallback_location: root_path, alert: "#{@booking.creature.name} is not available for those dates")
    end
  end

  def update
    @booking.status = params[:status]
    if !overlaps?
      @booking.save
      redirect_to bookings_path
    else
      redirect_back(fallback_location: root_path, alert: "#{@booking.creature.name} is already booked for those dates")
    end
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

  def overlaps?
    @booking.creature.bookings.where(status: "accepted").each do |booking|
      if params[:status] == "accepted" && @booking.start_date <= booking.end_date && booking.start_date <= @booking.end_date
        return true
      else
        return false
      end
    end
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :creature_id, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
