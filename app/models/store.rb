class Store < ActiveRecord::Base
	#attr_accessor :name ,:location, :map
	has_many :departments
end
