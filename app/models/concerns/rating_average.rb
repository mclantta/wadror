module RatingAverage
	extend ActiveSupport::Concern
	
	def average_rating
		$ave = 0;
		rs = self.ratings

		rs.each do |rate|
			$ave += 0.0
			$ave += rate.score
		end	
		$ave = "%.3g" % ($ave / rs.count)
	end
end	