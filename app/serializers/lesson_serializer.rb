class LessonSerializer
  include JSONAPI::Serializer
  attributes :video, :title, :length

  attribute :watched do |lesson, params|
    lesson.watched_by?(params[:current_user])
  end
end
