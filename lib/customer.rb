class Customer

    attr_accessor :name, :age
    attr_reader :waiter, :customer, :total, :tip
    @@all = []

    def initialize (name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end

    def meals
        Meal.all.filter {|meal| meal.customer== self}
    end

    def waiters
        meals.map {|meal| meal.waiter }
    end

  
end