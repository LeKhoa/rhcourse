class LessonsController < ApplicationController

  def watched
    lesson = Lesson.find_by_id(params[:id])

    current_user.watch!(lesson)
    render json: { message: "Lesson is watched" }, status: :ok
  end
end
