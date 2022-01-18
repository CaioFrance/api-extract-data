class CreateNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :numbers do |t|
      t.string :data
      t.integer :page
      t.integer :status

    end
  end
end
