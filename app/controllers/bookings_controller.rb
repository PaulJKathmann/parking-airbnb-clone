class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
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
