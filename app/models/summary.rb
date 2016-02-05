class Summary < ActiveRecord::Base
	belongs_to	:user, class_name: "User",
				foreign_key: "id", primary_key: "summary_id"
	has_and_belongs_to_many	:sites

end
