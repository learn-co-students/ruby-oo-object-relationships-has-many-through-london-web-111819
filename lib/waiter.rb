class Waiter

    attr_reader :name 
    attr_accessor :years_of_experience

    @@all = []

    def initialize (name, years_of_experience)
        @name = name 
        @years_of_experience = years_of_experience
        @@all << self
    end 

    def self.all
        @@all
    end

    def new_meal(costumer, total, tip)
        Meal.new(self, costumer, total, tip)
    end 

    def meals 
        Meal.all.select {|meal| meal.waiter == self}
    end 

    def best_tipper
        best_tip = meals.max_by {|meal| meal.tip}
        best_tip.customer
    end 
end