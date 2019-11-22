class Waiter

    attr_accessor :name, :yoe
    @@all = []

    def initialize (name, yoe)
        @name = name
        @yoe = yoe
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.filter {|meal| meal.waiter == self}
    end

    def best_tipper


        best_tip = meals.max {|meal_a, meal_b| meal_a.tip <=> meal_b.tip}

        best_tip.customer
    end

end