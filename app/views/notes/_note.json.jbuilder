json.extract! note, :id, :date, :content, :manager_id, :created_at, :updated_at
json.url note_url(note, format: :json)
