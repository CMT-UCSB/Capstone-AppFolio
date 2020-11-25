class CreateEmployeeSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_surveys do |t|
      t.belongs_to :employee, index: true, type: :uuid
      t.belongs_to :survey, index: true, type: :uuid
      t.timestamps
    end
  end
end
