class ProfileController < ApplicationController
  def index
    @schedules = Schedule.all
    @checklists = Checklist.all
    @users = User.all
    @articles = Article.all
    @tags = Tag.all
    @tasks = Tasks.all
    @events = Event.all
  end
end
