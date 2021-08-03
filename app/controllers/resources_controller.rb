class ResourcesController < ApplicationController

  def index
    course = Course.find_by_id(params[:course_id])
    resources = course.resources
    render json: ResourceSerializer.new(resources).serializable_hash.to_json, status: :ok
  end
end
