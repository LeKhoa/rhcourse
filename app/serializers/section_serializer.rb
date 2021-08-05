class SectionSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :active, :priority
end
