class SpacesController < ApplicationController
  #for more info about this go to application_controller or sources from yesterday!
  #if a method is written here you DO NOT NEED TO LOG IN to call it!
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
  end

  def show
  end

  def create
  end

  def new
  end

  def destroy
  end

  def edit
  end

  def update
  end
end
