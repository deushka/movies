namespace :parse do
	desc "Parse movies"
	task :cities => :environment do
		require "nokogiri"
		require "open-uri"

		html = Nokogiri::HTML(open("http://kino.kz/new/schedule"))
		html.css("#city-select option").each do |city|
			City.create(name: city.text)
		end
	end

	task :movies => :environment do
		require "nokogiri"
		require "open-uri"
		
	end

	task sessions: :environment do
		require "nokogiri"
		require "open-uri"
		
	end
end
