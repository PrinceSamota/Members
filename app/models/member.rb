class Member < ApplicationRecord
    validates :username, presence: true
    validates :family_members_name, presence: true
    validates :permanent_address, presence: true
    validates :present_address, presence: true
    validates :polling_station, presence: true
    validates :amount, presence: true
    validates :leader, presence: true
    validates :mobile_number, presence: true
    validates :election_number, presence: true
    validates :house_number, presence: true
end
