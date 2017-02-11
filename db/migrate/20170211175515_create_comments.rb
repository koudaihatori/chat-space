class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.body :text
      t.image :string
      t.group_id :integer
      t.user_id :integer

      t.timestamps null: false
    end
  end
end
