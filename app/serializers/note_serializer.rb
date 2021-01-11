class NoteSerializer
  include JSONAPI::Serializer
  attributes :date, :content
end
