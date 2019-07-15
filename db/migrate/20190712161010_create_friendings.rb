class CreateFriendings < ActiveRecord::Migration[5.2]
  def change
    create_table :friendings do |t|
      t.boolean :status
      t.references :inviting_user, foreign_key: { to_table: :users }
      t.references :invited_user, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
