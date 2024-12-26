class Member < ApplicationRecord
    has_many :familymember, dependent: :destroy
    validates :username, presence: true
    validates :permanent_address, presence: true
    validates :present_address, presence: true
    validates :polling_station, presence: true
    validates :amount, presence: true
    validates :mobile_number, length: { minimum: 10, maximum: 10 },presence: true
    validates :election_number, presence: true
    validates :house_number, presence: true
  

    def self.ransackable_attributes(auth_object = nil)
        # Include the custom search field in the list of allowed attributes
        ["amount", "created_at", "election_number", "family_members_name", "house_number", "id", "leader", "mobile_number", "permanent_address", "polling_station", "present_address", "updated_at", "username", "search"]
      end
    ransacker :search do
        Arel.sql("CONCAT(username, amount, election_number, family_members_name, house_number, leader, mobile_number, permanent_address, polling_station, present_address)")
      end
end
