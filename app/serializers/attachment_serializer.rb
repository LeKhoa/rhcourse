class AttachmentSerializer
  include JSONAPI::Serializer
  attributes :name, :link
end
