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

 it "should redirect to index with a notice on successful save" do
    @store.stubs(:valid?).returns(true)
    post 'create'
    assigns[:menu_item].should_not be_new_record
    flash[:notice].should_not be_nil
    response.should redirect_to(menu_items_path)
  end

  it "should re-render new template on failed save" do
    Store.any_instance.stubs(:valid?).returns(false)
    post 'create'
    assigns[:menu_item].should be_new_record
    flash[:notice].should be_nil
    response.should render_template('new')
  end
  
  it "should pass parameters params to store name and location" do
    post 'create', @store => { :name => 'Costco', :location => 'San Jose'}
    assigns[@store].name.should == 'Costco'
    assigns[@store].location.should == 'San Jose'
  end

  

  xit 'can add whole entries with keyword and definition' do
    @store.add('fish' => 'aquatic animal')
    @store.entries.should == {'fish' => 'aquatic animal'}
    @store.keywords.should == ['fish']
  end

  xit 'add keywords (without definition)' do
    @store.add('fish')
    @store.entries.should == {'fish' => nil}
    @store.keywords.should == ['fish']
  end

  xit 'can check whether a given keyword exists' do
    @store.include?('fish').should be_false
  end

  xit "doesn't cheat when checking whether a given keyword exists" do
    @store.include?('fish').should be_false # if the method is empty, this test passes with nil returned
    @store.add('fish')
    @store.include?('fish').should be_true # confirms that xit actually checks
    @store.include?('bird').should be_false # confirms not always returning true after add
  end

  xit "doesn't include a prefix that wasn't added as a word in and of itself" do
    @store.add('fish')
    @store.include?('fi').should be_false
  end

  xit "doesn't find a word in empty store" do
    @store.find('fi').should be_empty # {}
  end

  xit 'finds nothing if the prefix matches nothing' do
    @store.add('fiend')
    @store.add('great')
    @store.find('nothing').should be_empty
  end

  xit "finds an entry" do
    @store.add('fish' => 'aquatic animal')
    @store.find('fish').should == {'fish' => 'aquatic animal'}
  end

  xit 'finds multiple matches from a prefix and returns the entire entry (keyword + definition)' do
    @store.add('fish' => 'aquatic animal')
    @store.add('fiend' => 'wicked person')
    @store.add('great' => 'remarkable')
    @store.find('fi').should == {'fish' => 'aquatic animal', 'fiend' => 'wicked person'}
  end

  xit 'lists keywords alphabetically' do
    @store.add('zebra' => 'African land animal with stripes')
    @store.add('fish' => 'aquatic animal')
    @store.add('apple' => 'fruit')
    @store.keywords.should == %w(apple fish zebra)
  end

end
