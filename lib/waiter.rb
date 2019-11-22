class Waiter
    attr_accessor :name, :years_of_experience

    @@all = []

    def initialize(name,years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal (customer,total,tip)
        Meal.new(self,customer,total,tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        best_tipper_object = meals.max {|meal_a,meal_b|
        meal_a.tip <=> meal_b.tip
        }
        best_tipper_object.customer
    end
end