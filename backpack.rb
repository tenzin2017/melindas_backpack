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
    weather_of_day = @attributes[:weather]
    if weather_of_day == 'rainy'
      @items << 'umbrella'
    elsif weather_of_day == 'cold'
      @items << 'jacket'
    end
  end

  def gym_shoes?
    day_of_week = @attributes[:day_of_week]
    # Ensure gym shoes are added to backpack if it's a gym day
    # Gotta get to the gym on Monday and Thursdays.
    if day_of_week == 'monday' || day_of_week == 'thursday'
      #add gym shoes to items
      @items << 'gym shoes'
    end
  end

  def packed_lunch_or_snacks
    day_of_week = @attributes[:day_of_week]
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else
      # Used to bring snacks on weekend trips, but now I just buy 'em
      @items << 'snacks'
    end
  end

  # Prints a summary packing list for Melinda's backpack
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
