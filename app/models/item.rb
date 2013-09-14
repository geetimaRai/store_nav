class Item < ActiveRecord::Base
	#attr_accessor :name, :isle, :quantity
	belongs_to :department, {:foreign_key => :department_id}

	#validates :isle, :presence => true, :length => {:minimum => 0}
	#validates :quantity, :presence => true, :length => {:minimum => 0}
end
