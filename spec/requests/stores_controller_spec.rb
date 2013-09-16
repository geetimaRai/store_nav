require './app/controllers/stores_controller.rb'
require './app/controllers/application_controller.rb'
require 'spec_helper'
#fixtures :menu_items


describe Store do
  before do
    @store = Store.new
  end


  it 'is empty when created' do
     @store.name.should == null
     @store.location.should == null
  end



end
