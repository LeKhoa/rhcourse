class Api::CoursesController < ApplicationController

  def index
    courses = current_user.courses.active.order(:priority)
    render json: CourseSerializer.new(courses).serializable_hash.to_json, status: :ok
  end

  def show
    course = current_user.courses.find_by_id(params[:id])
    render json: CourseSerializer.new(course).serializable_hash.to_json, status: :ok
  end

  def classmates
    course = Course.find_by_id(params[:id])
    render json: ClassmatesSerializer.new(course&.users || User.none).serializable_hash.to_json, status: :ok
  end
end
