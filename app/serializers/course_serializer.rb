class CourseSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  # attribute :lessons do |obj, params|
  #   LessonSerializer.new(obj.lessons, { params: params })
  # end
end
