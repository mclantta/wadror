class User < ActiveRecord::Base
	include RatingAverage

	validates :username, uniqueness: true,
						length: { within: 3..15 }
					    
	
	has_many :ratings
end
