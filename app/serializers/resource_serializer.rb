class ResourceSerializer
  include JSONAPI::Serializer
  attributes :title, :description

  attribute :attachments do |obj|
    AttachmentSerializer.new(obj.attachments)
  end
end
