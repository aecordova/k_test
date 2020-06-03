json.data do
  json.array! @assistants, :id, :name, :address, :phone, :group
end
