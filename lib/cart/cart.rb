require "singleton"
module ShoppingCart

    # Cart class.
    class Cart
        include Singleton
        
      
        @@cart_content = [] 
        def initialize(session)
            @session = session
        end
        def add_to_cart(product)
            
            # Create a new item
            cart_item = CartItem.new(food.id,food.price)

            @@cart_content.push(cart_item)

            session[:cart] = @@cart_content
        end

        

        def remove_from_cart
        end

        def cart_content_count
        end

        def get_cart_content 
            @@cart_content
        end

        def update_cart

        end
    end


    # Cart Item class
    class CartItem
        attr_accessor :food_id, :food_name,  :quantity, :price
        
        def initialize(food_id, food_name, price, quantity = 1)
            @food_id = produc_id
            @food_name = food_name
            @price = price
            @quantity = quantity
        end
    end
end