class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html
  respond_to :js

  def index
    @user = current_user
    @tasks = @user.tasks.all
    respond_with(@tasks)
  end

  def complete
    @task = Task.find(params[:id])
    if @task.complete
      redirect_to action: 'incomplete'
    else
      @task.mark_complete!
    end
  end

  def incomplete
    @task = Task.find(params[:id])
    @task.mark_incomplete!
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @user = current_user
    @task = Task.new(task_params)
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :complete, :user_id)
    end
end
