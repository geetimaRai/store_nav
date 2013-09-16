class DepartmentsStore < ActiveRecord::Base

	validates :store_id, presence: true
	validates :department_id, presence: true
end
