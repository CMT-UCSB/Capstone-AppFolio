class Survey < ApplicationRecord
  belongs_to :employee_email
  belongs_to :user_id
end
