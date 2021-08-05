class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  attribute :sections do |obj|
    SectionSerializer.new(obj.sections.active.order(:priority))
  end

  # attribute :lessons do |obj, params|
  #   LessonSerializer.new(obj.lessons, { params: params })
  # end
end
