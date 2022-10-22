class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :s_name
      t.string :s_email
      t.string :s_address

      t.timestamps
    end
  end
end
