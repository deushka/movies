# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Movie < ApplicationRecord
	has_many :sessions
	has_many :cinemas, through: :sessions

	def film_ids(city_id)
		cinemas.where(city_id: city_id).select(:id).uniq
	end
end
