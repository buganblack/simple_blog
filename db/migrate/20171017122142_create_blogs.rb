class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text   :contents, null: false
      t.attachment :eye_catch, null: false

      t.timestamps null: false
    end
  end
end
