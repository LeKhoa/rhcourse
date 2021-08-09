class CoursesController < ApplicationController
  def index
    course = current_user.courses.active.order(:priority)
    render json: CourseSerializer.new(course).serializable_hash.to_json, status: :ok
  end
end
