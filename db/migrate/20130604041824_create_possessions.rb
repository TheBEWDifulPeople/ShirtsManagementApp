class CreatePossessions < ActiveRecord::Migration
  def change
    create_table :possessions do |t|
      t.references :user, index: true
      t.references :shirt, index: true

      t.timestamps
    end
  end
end
