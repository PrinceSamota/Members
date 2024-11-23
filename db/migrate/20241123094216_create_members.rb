class CreateMembers < ActiveRecord::Migration[8.0]
  def change
    create_table :members do |t|
      t.string :username
      t.string :family_members_name
      t.string :permanent_address
      t.string :present_address
      t.string :polling_station
      t.string :amount
      t.string :leader
      t.string :mobile_number
      t.string :election_number
      t.string :house_number

      t.timestamps
    end
  end
end
