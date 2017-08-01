class Instructor::LessonsController < ApplicationController
  before_action :authenticate_user!

  def new
    @section = current_section
    if @section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
    @lesson = Lesson.new
  end

  def create
    @section = current_section
    if @section.course.user != current_user
      return render plain: 'Unauthorized', status: :unauthorized
    end
    @lesson = @section.lessons.create(lesson_params)
    redirect_to instructor_course_path(@section.course)
  end

  private

  helper_method :current_section

  def current_section
    @current_section ||= Section.find(params[:section_id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :subtitle)
  end



end