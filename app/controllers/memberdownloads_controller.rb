# app/controllers/memberdownloads_controller.rb
class MemberdownloadsController < ApplicationController
    require 'csv'
  
    def download_csv
      @members = Member.all  # Or the specific set of records you want
  
      csv_data = CSV.generate(headers: true) do |csv|
        csv << ["SI No","Name of Beneficiary", "Name of family members", "Present address","Permanent address", "Polling station","Type of assistance provided (Amount)", "Provided through whom (Leader)", "Mobile number", "Election Epic No.", "House No."]  # Adjust headers based on your model
  
        @members.each_with_index do |member , index|
          csv << [index + 1, member.username, member.family_members_name, member.present_address, member.permanent_address, member.polling_station, member.amount, member.leader, member.mobile_number, member.election_number, member.house_number ]  # Adjust based on your model
        end
      end
  
      send_data csv_data, filename: "members-#{Date.today}.csv", type: 'text/csv'
    end
  end
  