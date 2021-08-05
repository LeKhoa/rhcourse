class CoursesController < ApplicationController
  def index
    course = current_user.courses.active.order(:priority)
    render json: CourseSerializer.new(course).serializable_hash.to_json, status: :ok
  end

  def my_first_course
    course = current_user.courses.active.includes(:sections).order(:priority).first
    render json: CourseSerializer.new(course).serializable_hash.to_json, status: :ok
  end
end
