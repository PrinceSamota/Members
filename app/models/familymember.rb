class Familymember < ApplicationRecord
    belongs_to :member
    validates :name, presence: true
    validates :permanent_address, presence: true
    validates :present_address, presence: true
    validates :polling_station, presence: true
    validates :relation, presence: true
    validates :mobile_number, length: { minimum: 10, maximum: 10 },presence: true
    validates :election_number, presence: true
    validates :house_number, presence: true

end
