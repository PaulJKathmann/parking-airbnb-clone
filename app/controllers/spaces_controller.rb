class SpacesController < ApplicationController
  #for more info about this go to application_controller or sources from yesterday!
  #if a method is written here you DO NOT NEED TO LOG IN to call it!
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      @spaces = policy_scope(Space).where.not(latitude: nil, longitude: nil, user: current_user).where("address ILIKE ?", "%#{params[:query]}%")
      @markers = @spaces.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
      }
      end
    else
      @spaces = policy_scope(Space).where.not(latitude: nil, longitude: nil, user: current_user)
      @markers = @spaces.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
      }
      end
    end
  end

  def show
    @space = Space.find(params[:id])
    @markers =
      [{
        lat: @space.latitude,
        lng: @space.longitude,
      }]
    authorize @space
  end


  def new
    @space = Space.new
    authorize @space
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
    if @space.save
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  def destroy
    @space = Space.find(params[:id])
    @space.user = current_user
    authorize @space
    @space.destroy
    redirect_to bookings_path
  end

  def edit
    @space = Space.find(params[:id])
    @space.user = current_user
    authorize @space
  end

  def update
    @space = Space.find(params[:id])
    @space.user = current_user
    authorize @space
    if @space.update(space_params)
      redirect_to space_path(@space)
    else
      render :new
    end
  end

  private

  def space_params
    params.require(:space).permit(:address, :start_date, :end_date, :price, :size, :photo, :photo_cache)
  end
end
