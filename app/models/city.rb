class City < ApplicationRecord
	has_many :cinemas
	validates :name, presence: true, uniqueness: true
end
