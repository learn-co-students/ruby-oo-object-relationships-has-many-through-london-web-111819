class Waiter
    attr_accessor :name, :experience

    @@all = []

    def initialize(name, experience)
        @name = name
        @experience = experience
        @@all.push(self)
    end
    
    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        tips = []
        meals.each do |meal|
            tips.push(meal.tip)
        end
        meals.each do |meal|
            if meal.tip == tips.max
                return meal.customer
            end
        end
    end
end