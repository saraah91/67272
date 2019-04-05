require 'test_helper'

class StoreTest < ActiveSupport::TestCase
  should validate_presence_of(:name)

  context "Creating a context for stores" do
    # create the objects I want with factories
    setup do 
    #  create_stores
            @CMU = FactoryBot.create(:store, name:"CMU", type:"Indian", opening_time:"1am", closing_time:"5pm", latitude:"34.50097", longitude:"-84.97533", exclusive: true)
            @VCU = FactoryBot.create(:store, name:"VCU", type:"Arabic", opening_time:"11am", closing_time:"5pm", latitude:"34.50097", longitude:"-84.97533", exclusive: true)
            @Texas = FactoryBot.create(:store, name:"Texas", type:"International", opening_time:"5pm", closing_time:"11pm", latitude:"34.50097", longitude:"-84.97533", exclusive: false)
            @Breakfast_club = FactoryBot.create(:store, name:"CMU", type:"Chinese", opening_time:"8am", closing_time:"1pm", latitude:"34.50097", longitude:"-84.97533", exclusive: false)
    end
    
    # and provide a teardown method as well
    teardown do
    end
  

  should "assert that the proper retaurants open for breakfast" do
    assert @Breakfast_club.breakfast?
    assert @CMU.breakfast?
  end
  
  should "assert that the proper retaurants open for lunch" do
    assert @VCU.lunch?
    assert @CMU.lunch?
  end

  should "assert that the proper retaurants open for dinner" do
    assert @Texas.dinner?
  end

  end
end
