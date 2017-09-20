class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    # Ensure appropriate clothing is added to backpack
    pants_shirts
    items_if_rainy_cold
    gym_shoes?

    # Bring a packed lunch on all weekdays
    packed_lunch_or_snacks
  end

  def pants_shirts
    @items << 'pants'
    @items << 'shirt'
  end

  def items_if_rainy_cold
    if weather_of_day == 'rainy'
      @items << 'umbrella'
    elsif weather_of_day == 'cold'
      @items << 'jacket'
    end
  end

  def gym_shoes?
    if day_of_week == 'monday' || day_of_week == 'thursday'
      @items << 'gym shoes'
    end
  end

  def packed_lunch_or_snacks
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else
      @items << 'snacks'
    end
  end

  def weather_of_day
    @attributes[:weather]
  end

  def day_of_week
    @attributes[:day_of_week]
  end


  def print_packing_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end

melinda = Backpack.new(day_of_week: "saturday", weather: "rainy")
puts melinda.print_packing_list
