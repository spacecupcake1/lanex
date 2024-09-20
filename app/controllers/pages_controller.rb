class PagesController < ApplicationController
  def home
    @lessons = Lesson.all
      .filter_by_teaching_language(params[:teaching_language])
      .filter_by_known_language(params[:known_language])
      .filter_by_level(params[:level])
  end
end