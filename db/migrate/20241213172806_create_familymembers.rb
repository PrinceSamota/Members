class CreateFamilymembers < ActiveRecord::Migration[8.0]
  def change
    create_table :familymembers do |t|
      t.string :name
      t.string :permanent_address
      t.string :present_address
      t.string :polling_station
      t.string :relation
      t.string :mobile_number
      t.string :election_number
      t.string :house_number
      t.references :member, foreign_key: true
      t.timestamps
    end
  end
end
