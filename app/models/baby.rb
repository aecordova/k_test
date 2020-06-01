class Baby < ApplicationRecord
  has_many :activity_logs

  def age_in_months
    (Date.today.year * 12 + Date.today.month) - (birthday.year * 12 + birthday.month)
  end
end
