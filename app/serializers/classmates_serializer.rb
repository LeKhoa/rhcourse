class ClassmatesSerializer
  include JSONAPI::Serializer
  attributes :id, :name

  attribute :image_url do |obj|
    obj.image_url
  end
end
