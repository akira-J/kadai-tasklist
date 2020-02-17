class CreateTaskLists < ActiveRecord::Migration[5.2]
  def change
    create_table :task_lists do |t|
      t.string :task
      t.string :content
      t.references :user

      t.timestamps
    end
  end
end
