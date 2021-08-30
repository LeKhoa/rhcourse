class Api::ResourcesController < ApplicationController

  def index
    section = Section.find_by_id(params[:section_id])
    resources = section.resources
    render json: ResourceSerializer.new(resources).serializable_hash.to_json, status: :ok
  end
end
