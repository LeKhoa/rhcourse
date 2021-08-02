class CoursesController < ApplicationController
  def index

  end

  def my_course
    course = current_user.courses.first
    render json: CourseSerializer.new(course).serializable_hash.to_json, status: :ok
  end
end
