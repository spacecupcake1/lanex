class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  before_action :authorize_teacher, only: [:new, :create, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit, :update, :destroy]

  def index
    @lessons = Lesson.all
  end

  def show
  end

  def new
    @lesson = current_user.lessons.build
  end

  def create
    @lesson = current_user.lessons.build(lesson_params)
    if @lesson.save
      redirect_to @lesson, notice: 'Lesson was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to @lesson, notice: 'Lesson was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    begin
      ActiveRecord::Base.transaction do
        @lesson.destroy!
      end
      redirect_to root_path, notice: 'Lesson was successfully deleted.'
    rescue ActiveRecord::RecordNotDestroyed => e
      redirect_to @lesson, alert: "Failed to delete the lesson: #{e.record.errors.full_messages.join(", ")}"
    rescue => e
      redirect_to @lesson, alert: "An error occurred while deleting the lesson: #{e.message}"
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :teaching_language, :known_language, :level, :available_days, :meeting_platform)
  end

  def require_login
    unless current_user
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end

  def authorize_teacher
    unless current_user.role == 'teacher'
      flash[:error] = "Only teachers can perform this action"
      redirect_to root_path
    end
  end

  def ensure_owner
    unless current_user == @lesson.user
      flash[:error] = "You can only edit or delete your own lessons"
      redirect_to lessons_path
    end
  end
end