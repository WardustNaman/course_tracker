class Client < ApplicationRecord
	validates_presence_of :name, :email, :company
	validates_uniqueness_of :email
	has_many :projects
end
