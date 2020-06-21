class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :recipient, null: false, unique: true
      t.references :sender, null: false, unique: true
      t.text :body, null: false

      t.timestamps
    end
  end
end
