class Project < ApplicationRecord
	belongs_to :client
	validates_presence_of :name, :client_id, :status, :start_date
end
