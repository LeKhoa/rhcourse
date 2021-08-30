class Api::LessonsController < ApplicationController

  def index
    section = Section.find_by_id(params[:section_id])
    lessons = section.lessons
    render json: LessonSerializer.new(lessons, { params: { current_user: current_user } }).serializable_hash.to_json, status: :ok
  end

  def watched
    lesson = Lesson.find_by_id(params[:id])

    current_user.watch!(lesson)
    render json: { message: 'Lesson is watched' }, status: :ok
  end
end
