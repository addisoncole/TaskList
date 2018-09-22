
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
    task_id = params[:id].to_i
    @tasks = Task.all
    @task = @tasks[task_id]
    if @task.nil?
      head :not_found
    end
  end

  private

  def task_params
  return params.require(:task).permit(
    :action,
    :description,
    :completion_date,
    :assignee
  )
end

end
