class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.text :sypnosis
      t.date :publication_date
      t.string :country
      t.integer :total_chapters

      t.timestamps
    end
  end
end
