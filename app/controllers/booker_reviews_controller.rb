class BookerReviewsController < ApplicationController
  def new
    #@booker_review = Booking.find(params[:booking_id]).bookerreview.new
    @booking = Booking.find(params[:booking_id])
    respond_to do |format|
      format.js
    end
  end
  def create
    raise
  end
end
