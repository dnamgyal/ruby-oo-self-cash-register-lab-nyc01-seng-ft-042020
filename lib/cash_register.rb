require 'pry'
class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction

    def initialize(discount=0)
        @discount = discount
        @items = []
        @total = 0
        @last_transaction = 0
    end

    def total
        @total
    end

    def add_item(title, price, quantity=1)
        #cart = []
        if quantity == 1
            self.total += price
        else
            self.total += price * quantity
        end
        quantity.times do 
            items << title 
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        if discount != 0
            #binding.pry
            discount_amnt = (100.0 - discount.to_f)/100
            self.total = (total * discount_amnt).to_i
            p "After the discount, the total comes to $#{self.total}."
           # binding.pry
        else
            p "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = total - last_transaction
    end





end
