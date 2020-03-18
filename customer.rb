class Customer

attr_reader :name, :wallet, :age

  def initialize(name, wallet, drink, age)
    @name = name
    @wallet = wallet
    @drinks = drink
    @age = age
  end

  def money_spent_from_wallet(cash)
    @wallet -= cash
  end

  def count_drinks
    @drinks.size
  end

  def check_legal_drinking_age()
    if @age >= 18
      return true
    end
    return false
  end

  def add_drink_to_customer(drink)
    @drinks.push(drink)
  end

  def customer_buys_drink(pub, drink)
    if @age >= 18
    customer_order = pub.remove_drink(drink)
    @drinks << customer_order
    money_spent_from_wallet(drink.price)
    pub.add_to_till(drink.price)
    end
  end


end
