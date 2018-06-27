class Cinema < ApplicationRecord
	belongs_to :city
	has_many :sessions
	has_many :movies, through: :sessions
end
