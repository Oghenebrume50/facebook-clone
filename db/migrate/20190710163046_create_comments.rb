class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.body :string
      t.post :reference

      t.timestamps
    end
  end
end
