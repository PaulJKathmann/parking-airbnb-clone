class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @spaces = current_user.bookings_as_owner
    @user = current_user
  end

  def show
    @booking = Booking.find(params[:id])
    @markers =
      [{
        lat: @booking.space.latitude,
        lng: @booking.space.longitude,
      }]
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
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = params[:status]
    @booking.save
    redirect_to bookings_path
  end

  def edit
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :cost, :status, :space, :user)
  end
end
