class Summary < ActiveRecord::Base
	has_and_belongs_to_many	:sites
	has_and_belongs_to_many	:users
	validates(:name, presence: true, length: {maximum: 45})
end