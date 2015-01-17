class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.string :postcode
      t.string :parliamentary
      t.string :party
      t.boolean :vote

      t.timestamps null: false
    end
  end
end
