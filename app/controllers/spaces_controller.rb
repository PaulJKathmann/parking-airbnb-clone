class SpacesController < ApplicationController
  #for more info about this go to application_controller or sources from yesterday!
  #if a method is written here you DO NOT NEED TO LOG IN to call it!
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @spaces = policy_scope(Space).order(created_at: :desc)
  end

  def show
    @spaces = policy_scope(Space).order(created_at: :desc)
    authorize @spaces
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user
    authorize @space
  end

  def new
    @space = Space.new
    authorize @space
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def space_params
    require(:space).permit(:price, :end_date, :start_date, :adress, :size)
  end

end
