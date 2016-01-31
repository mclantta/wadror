class Rating < ActiveRecord::Base
	belongs_to :beer

	def to_s
		b = Beer.find self.beer_id 
		"#{b.name} #{self.score}"
	end	



end
