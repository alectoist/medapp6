json.array!(@relationships) do |relationship|
  json.extract! relationship, :id, :drug_id, :ingredient_id
  json.url relationship_url(relationship, format: :json)
end
