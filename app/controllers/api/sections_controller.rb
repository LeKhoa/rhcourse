class Api::SectionsController < ApplicationController

  def index
    course = Course.find_by_id(params[:course_id])
    sections = course.sections.active.order(:priority)
    render json: SectionSerializer.new(sections).serializable_hash.to_json, status: :ok
  end
end
