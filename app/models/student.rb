class Student < ApplicationRecord
has_many :registrations
has_many :courses, through: :registrations
belongs_to :city
validates_presence_of :name, :email, :major
end
