class CreateAcronyms < ActiveRecord::Migration[5.1]
  def change
    create_table :acronyms do |t|
      t.string :name
      t.text :definition
      t.text :description

      t.timestamps
    end
  end
end
