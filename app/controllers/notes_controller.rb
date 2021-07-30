class NotesController < ApplicationController

  def index
    lesson_id = params[:lesson_id].to_i
    return render json: { message: 'Lesson is not selected' }, status: :unprocessable_entity if lesson_id.zero?
    
    lesson = Lesson.find_by_id(lesson_id)
    notes = lesson.notes.where(user_id: current_user.id)
    render json: { notes: notes }, status: :ok
  end

  def create
    lesson_id = params[:lesson_id].to_i
    return render json: { message: 'Lesson is not selected' }, status: :unprocessable_entity if lesson_id.zero?

    lesson = Lesson.find_by_id(lesson_id)
    note = lesson.notes.create(note_params.merge({user_id: current_user.id }))
    render json: { note: note }, status: :ok
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
