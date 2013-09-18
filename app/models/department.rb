class Department < ActiveRecord::Base
	#attr_accessor :name
	belongs_to :store, {:foreign_key => :store_id}
	has_many :items
end
