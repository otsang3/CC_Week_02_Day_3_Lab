class Pub

  attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)
    @name = name
    @till = till
    @drinks = drinks
  end

  def add_to_till(cash)
    @till += cash
  end

  def drink_count()
    @drinks.size
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

end
