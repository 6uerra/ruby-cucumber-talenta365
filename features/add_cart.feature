Feature: Cart
        @login
        Scenario: Add to cart
            Given  I want to buy a product from anywhere in the store
              And I select the product of my choice
             Then I add it to the shopping cart
              And it is valid that if the product is added to the cart
             
  
