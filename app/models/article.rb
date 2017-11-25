class Article < ApplicationRecord

	validates :title,
				presence: true,
				length: {minimum: 3},
				uniqueness: true

	validates :text,			
				presence: true,
				length: {minimum: 5}

end
