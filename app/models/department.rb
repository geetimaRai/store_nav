class Department < ActiveRecord::Base
	#attr_accessor :name
	has_and_belongs_to_many :stores
	has_many :items
end
