class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @bookings = Booking.where(user_id: current_user.id)
    @spaces = Space.where(user_id: current_user.id)
    @my_spaces = []
    @spaces.each do |space|
      @my_spaces << space.bookings unless space.bookings.empty?
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    authorize @booking
  end

  def create
  end

  def update
  end

  def edit
  end
end
