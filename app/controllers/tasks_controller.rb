
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    filtered_task_params = task_params()
    @task = Task.new(filtered_task_params)

    is_successful_save = @task.save

    if is_successful_save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show
    @task = Task.find_by(id: params[:id])
    if @task.nil?
      head :not_found
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    filtered_task_params = task_params()
    @task = Task.find(params[:id])
    is_successful_update = @task.update(filtered_task_params)

    if is_successful_update
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    @task.destroy
    redirect_to tasks_path
  end

  def toggle_complete
    @task = Task.find_by(id: params[:id])
    if @task.completed == false
      @task.completed = true
      @task.save
    else
      @task.completed = false
      @task.save
    end
    redirect_to tasks_path
  end

  private

  def task_params
    return params.require(:task).permit(
      :action,
      :description,
      :completed,
      :assignee
    )
  end

end
