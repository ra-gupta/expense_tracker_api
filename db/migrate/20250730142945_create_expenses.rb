class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.decimal :amount
      t.date :date
      t.string :category
      t.text :note

      t.timestamps
    end
  end
end
