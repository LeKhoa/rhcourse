class LessonsController < ApplicationController

  def index
    course = Course.find_by_id(params[:course_id])
    lessons = course.lessons
    render json: LessonSerializer.new(lessons, { params: { current_user: current_user } }).serializable_hash.to_json, status: :ok
  end

  def watched
    lesson = Lesson.find_by_id(params[:id])

    current_user.watch!(lesson)
    render json: { message: 'Lesson is watched' }, status: :ok
  end
end
