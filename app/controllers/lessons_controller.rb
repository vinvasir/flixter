class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson
  
  def show
  end

  private
  
  def require_authorized_for_current_lesson
    if !current_user.enrolled_in?(current_course)
      redirect_to course_path(current_course), alert: 'Enroll to view lessons for this course'
    end
  end
  
  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
  
  helper_method :current_course
  def current_course
    @current_course ||= current_lesson.section.course
  end
end
