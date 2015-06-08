class Item < ActiveRecord::Base
  self.table_name = "todo_items"
  belongs_to :list
end