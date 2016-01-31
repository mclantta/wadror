class Beer < ActiveRecord::Base
	belongs_to :brewery
	has_many :ratings

	def average_rating
		$ave = 0;
		rs = self.ratings

		rs.each do |rate|
			$ave += 0.0
			$ave += rate.score
		end	
		$ave = "%.3g" % ($ave / rs.count)
	end

	def to_s
		b = Brewery.find self.brewery_id
		"#{self.name}, #{b.name}"
	end	
end
