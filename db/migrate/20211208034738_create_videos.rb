class CreateVideos < ActiveRecord::Migration[6.1]
  def change
    create_table :videos do |t|
      t.string :video
      t.string :title
      t.string :description
      t.references :category
      t.boolean :is_active, default: true
      t.timestamps
    end
  end
end
