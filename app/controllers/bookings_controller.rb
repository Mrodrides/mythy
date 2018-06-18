class BookingsController < ApplicationController
  def index
    @incoming = []
    current_user.creatures.each do |creature|
      @incoming.push(creature.bookings)
    end
    @outgoing = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      redirect_to bookings_path
    else
      raise
      redirect_to creatures_path
    end
  end

  private

  def booking_params
  end
end
