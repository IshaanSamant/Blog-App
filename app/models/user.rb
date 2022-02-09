class User < ApplicationRecord
	has_many :blogs

	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
end
