require 'test_helper'

class SalleTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should insert values" do
    salle = Salle.new
    salle.purchaser = "Anderson Ferreira"
    salle.description = "Tv 59\""
    salle.unit_price = 2000.0
    salle.quantity = 2
    salle.address = "Rua das casas"
    salle.provider = "Casas Maranhão"
    salle.total_price = 2000.0 * 2

    assert salle.save
  end
  
  test "should not insert values" do
    salle = Salle.new
    salle.purchaser = "Anderson Ferreira"
    salle.description = "Tv 59\""
    salle.quantity = 2
    salle.address = "Rua das casas"
    salle.provider = "Casas Maranhão"
    
    assert_not salle.save
  end
end
