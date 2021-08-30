class Api::NotesController < ApplicationController

  def index
    section_id = params[:section_id].to_i
    return render json: { message: 'section is not selected' }, status: :unprocessable_entity if section_id.zero?
    
    section = Section.find_by_id(section_id)
    notes = section.notes.where(user_id: current_user.id).order('created_at DESC')
    render json: { notes: notes }, status: :ok
  end

  def create
    section_id = params[:section_id].to_i
    return render json: { message: 'section is not selected' }, status: :unprocessable_entity if section_id.zero?

    section = Section.find_by_id(section_id)
    note = section.notes.create(note_params.merge({user_id: current_user.id }))
    render json: { note: note }, status: :ok
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
