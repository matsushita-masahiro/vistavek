class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :last_name
      t.string :first_name
      t.string :last_name_kanji
      t.string :first_name_kanji
      t.string :title
      t.string :comment
      t.string :zodiac
      t.string :constellation
      t.string :qualification
      t.string :hobby
      t.string :icon

      t.timestamps
    end
  end
end
