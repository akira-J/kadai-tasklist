class ApplicationController < ActionController::Base
  def index
    @tasks = Task.all
  end
  def show 
    @task = Task.find(params[:id])
  end
  def new
    @task = Task.new(message_params)
  end
  def edit
    @task = Task.find(params[:id])
  end
end
