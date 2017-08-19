class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create

  end




  

  private

  def current_course
    @current_course ||= Course.find(params[:course_id])
  end

end
