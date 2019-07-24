require 'pry'

class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def self.all
        @@all
    end

    def initialize(name, yrs_experience)
        self.name = name
        self.yrs_experience = yrs_experience 
        @@all << self 
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
      end

      def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        
        biggest_tip = Meal.all.map{|meal| meal.tip}.max 
        biggest_tip_meal = Meal.all.find{|meal| meal.tip == biggest_tip}
       
        biggest_tip_meal.customer 
    end

end