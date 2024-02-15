require_relative 'values'
require_relative 'parser'

def self_cost(footage, material)
  parsed_material = parseStringToLowerCase(material)

  case parsed_material
  when 'beton'
    return footage * MATERIAL_BETON
  when 'brick'
    return footage * MATERIAL_BRICK
  when 'composite'
    return footage * MATERIAL_COMPOSITE
  else
    puts "Wrong parameters provided. Usage: <footage (number)> <material>"
    exit(1)
  end
end

def calculate_floor_coef(floor)
  floor = parseInteger(floor)

  case floor
  when 0..2, 8..9
    return FLOORS_TOP_BOTTOM
  else
    return FLOOR_MIDDLE
  end
end

def placement(floor, district, self_cost_val)
  floor_coef = calculate_floor_coef(floor)
  district = parseStringToLowerCase(district)

  if floor < 0 || floor > 9
    puts "Wrong param <floor> provided. Range (0 < floor < 9)"
    exit(1)
  end

  case district
  when 'center'
    return self_cost_val * floor_coef * DISTRICT_CENTER
  when 'sleeping'
    return self_cost_val * floor_coef * DISTRICT_SLEEPING
  when 'suburb'
    return self_cost_val * floor_coef * DISTRICT_SUBURB
  else
    puts "Wrong param <district> provided. Choices (center, sleeping, suburb)"
    exit(1)
  end
end

# Reusability should be here
def price_of_dev(placement_val, style)
  style = parseStringToLowerCase(style)

  case style
  when 'high-tech' || 'hightech'
    return placement_val * STYLE_HIGHTECH
  when 'exclusive'
    return placement_val * STYLE_EXCLUSIVE
  when 'individual'
    return placement_val * STYLE_INDIVIDUAL
  when 'standard'
    return placement_val * STYLE_STANDARD
  else
    puts "Wrong param <style> provided. Choices (hightech, exclusive, individual, standard)"
    exit(1)
  end
end

def price_of_apart_with_tax(price_of_dev_val, category)
  category = parseStringToLowerCase(category)

  case category
  when 'elite'
    return price_of_dev_val * CATEGORY_ELITE
  when 'budget'
    return price_of_dev_val * CATEGORY_BUDGET
  when 'preferential'
    return price_of_dev_val * CATEGORY_PREFERENTIAL
  else
    puts "Wrong param <category> provided. Choices (elite, budget, preferential)"
    exit(1)
  end
end