class User < ActiveRecord::Base
	include RatingAverage

	has_secure_password

	validates :username, uniqueness: true,
						length: { within: 3..15 }

	validates :password, length: { minimum: 4 },
						format: { with: /(?=.*[A-Z])(?=.*[0-9])/ }
	
	has_many :ratings
	has_many :beers, through: :ratings
end
