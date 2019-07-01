class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.text  :text
      t.integer  :folder_id
      t.timestamps  null: true
    end
  end
end
