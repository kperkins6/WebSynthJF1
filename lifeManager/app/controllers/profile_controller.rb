class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @schedules = Schedule.all
    @checklists = Checklist.all
    @users = User.all
    @articles = Article.all
    @tags = Tag.all
    @tasks = Task.all
    @events = Event.all
  end
end
