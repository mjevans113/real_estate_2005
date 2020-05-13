class House
  attr_reader :price,
              :address,
              :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price.gsub(/\D/,'').to_i > 500000
      true
    else
      false
    end
  end

  def rooms_from_category(room_category)
    rooms_same_category = []
    @rooms.each do |room|
      if room.category == room_category
        rooms_same_category << room
      end
    end
    rooms_same_category
  end

  def area
    house_area = 0
    @rooms.each do |room|
      house_area += room.area
    end
    house_area
  end

  def details
    house_details = {"price" => @price.gsub(/\D/,'').to_i,
                     "address" => @address}
  end

  def price_per_square_foot
    ppsf = @price.gsub(/\D/,'').to_i / area.to_f
    ppsf.round(2)
  end
end
