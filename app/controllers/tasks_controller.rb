TASKS = ['Wedge luv Biggs', 'Play sum Blitzball', 'Yuffie waz here']
class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
