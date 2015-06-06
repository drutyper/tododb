class CreateLists < ActiveRecord::Migration
  def change
    create_table "lists" do |t|
      t.string "title"
      t.datetime "created_at"
    end
    
    create_table "todo_items" do |t|
      t.belongs_to :list
      t.string "content"
    end
  end
end
