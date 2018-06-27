namespace :parse do
	desc "Parse movies"
	task cities: :environment do
		require "nokogiri"
		require "open-uri"

		html = Nokogiri::HTML(open("http://kino.kz/new/schedule"))
		html.css("#city-select option").each do |city|
			City.create(name: city.text)
		end
	end

	task cinemas: :environment do
		require "nokogiri"
		require "open-uri"
		id = 1
		html = Nokogiri::HTML(open("http://kino.kz/?ver=old"))
		html.css(".menu_items").each do |part|
			part.css(".menu_item a").each do |cinema|
				cite_ind = cinema['href'][21..-1]
				cinema = cinema.text
				Cinema.create(name: cinema, cite_index: cite_ind, city_id: id)
			end
			id = id + 1
		end
	end

	task movies: :environment do
		require "nokogiri"
		require "open-uri"
		html = Nokogiri::HTML(open("http://kino.kz/thisweek.asp?city=4&day=1"))
		html.css(".mov_week_detail").each do |part|
			title = part.css(".title_red").text
			path = part.css(".movie_poster img").attr('src')
			image_url = "http://kino.kz" + path
			description = part.css("td[colspan=3] //div[2]").text
			Movie.create(title: title, description: description, image_url: image_url)
		end

	end

	task sessions: :environment do
		require "nokogiri"
		require "open-uri"

		

	end
end