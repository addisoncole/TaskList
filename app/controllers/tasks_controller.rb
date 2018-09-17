class TasksController < ApplicationController
  TASKS = ['Wedge luv Biggs', 'Play sum Blitzball', 'Yuffie waz here']
  def index
    @tasks = TASKS
  end
end
