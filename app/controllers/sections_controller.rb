class SectionsController < ApplicationController

  def index
    course = Course.find_by_id(params[:course_id])
    sections = course.sections
    render json: SectionSerializer.new(sections).serializable_hash.to_json, status: :ok
  end
end
