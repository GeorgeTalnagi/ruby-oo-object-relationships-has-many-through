class Customer
   
    attr_accessor :name, :age
  
    @@all = []
  
    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end
  
    def self.all
        @@all
    end
  
    def new_meal(waiter, total, tip=0)
        Meal.new(waiter, self, total, tip)
    end 

    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end 

    #Each meal is also associated with a waiter, so to get every waiter from 
    #every meal Rachel has had, we need to take the array of all of Rachel's meals,
    #map over it, getting the waiter from each of those meals.
    def waiters
        meals.map do |meal|
          meal.waiter
        end
    end 

end 