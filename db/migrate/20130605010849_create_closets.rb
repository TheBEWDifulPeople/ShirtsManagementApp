class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.belongs_to :shirt, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
