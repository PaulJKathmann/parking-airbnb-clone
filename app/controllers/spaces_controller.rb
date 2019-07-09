class SpacesController < ApplicationController
  #for more info about this go to application_controller or sources from yesterday!
  #if a method is written here you DO NOT NEED TO LOG IN to call it!
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spaces = policy_scope(Space).order(created_at: :desc)
  end

  def show
    @space = Space.find(params[:id])
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
      redirect_to spaces_path
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def space_params
    params.require(:space).permit(:address, :start_date, :end_date, :price, :size, :photo, :photo_cache)
  end
end
