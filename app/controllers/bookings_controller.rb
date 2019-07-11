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
    @space = Space.find(params[:space_id])
    @booking = Booking.new(space: @space)
    authorize @booking
    respond_to do |format|
      format.js { render layout: false, content_type: 'text/javascript' }
      format.html
    end
  end

  def create
    @space = Space.find(params[:space_id])
    @booking = Booking.new(booking_params)
    @booking.space = @space
    @booking.user = current_user
    authorize @booking
    @total_cost = @space.price * (@booking.end_date - @booking.start_date)
    @booking.cost = @total_cost
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cost, :status, :space, :user)
  end
end
