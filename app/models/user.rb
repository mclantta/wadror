class User < ActiveRecord::Base
	include RatingAverage

	has_secure_password

	validates :username, uniqueness: true,
						length: { within: 3..15 }

	validates :password, length: { minimum: 4 },
						format: { with: /(?=.*[A-Z])(?=.*[0-9])/ }
	
	has_many :ratings, dependent: :destroy
	has_many :beers, through: :ratings
	
	def favourite_beer
		return nil if ratings.empty?
		ratings.order(score: :desc).limit(1).first.beer
	end
end
