json.data do
  json.array! @activities, :id, :name, :description
end
