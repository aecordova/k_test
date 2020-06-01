json.data do
  json.array! @babies do |baby|
    json.extract! baby, :id, :name, :mother_name, :father_name, :address, :phone, :age_in_months
    json.birthday(baby.birthday).strftime('%FT%T')
  end
end
