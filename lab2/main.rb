require_relative 'values'
require_relative 'helpers'

def calc_commercial_apart_value(footage, material, floor, district, style, category)
  self_cost_value = self_cost(footage, material)

  if self_cost_value
    puts "Self-cost value: #{self_cost_value}"

    placement_value = placement(floor, district, self_cost_value)

    if placement_value
      puts "Placement value: #{placement_value}"
    
      price_of_dev_value = price_of_dev(placement_value, style)
      puts "Price of development value: #{price_of_dev_value}" if price_of_dev_value

      price_of_apart_with_tax_value = price_of_apart_with_tax(price_of_dev_value, category)
      puts "\nPrice of apartaments with taxes included: #{price_of_apart_with_tax_value}" if price_of_apart_with_tax_value
    end
  end
end

# test
calc_commercial_apart_value(85, "COMPOSITE", 5, "CENTER", "standard", "budget")
