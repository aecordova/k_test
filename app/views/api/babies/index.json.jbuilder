json.data do
  json.array! @babies, :id, :name, :birthday, :mother_name, :father_name, :address, :phone, :age_in_months
end
