class Store < ActiveRecord::Base
	#attr_accessor :name ,:location, :map
	has_and_belongs_to_many :departments
end
