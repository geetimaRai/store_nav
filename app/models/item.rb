class Item < ActiveRecord::Base
	belongs_to :department, {:foreign_key => :department_id}
end
