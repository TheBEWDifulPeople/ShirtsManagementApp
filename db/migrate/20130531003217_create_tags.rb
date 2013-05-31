class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :category, index: true
      t.references :shirt, index: true

      t.timestamps
    end
  end
end
