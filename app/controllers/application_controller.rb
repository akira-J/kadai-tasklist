class ApplicationController < ActionController::Base
  def index
    @tasks = Tasks.all
  end
  def show 
    @tasks = Tasks.find(params[:id])
  end
  def new
    @tasks = Tasks.new(message_params)
  end
  def edit
    @tasks = Tasks.find(params[:id])
  end
end
