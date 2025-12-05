local Cart = require(game.ServerScriptService.Server.cart.Cart)

local CartController = {}
CartController.Carts = {}

function CartController:RegisterCart(model, config)
    local cart = Cart.new(model, config)
    table.insert(self.Carts, cart)
end

function CartController:Update(dt)
    for _, cart in ipairs(self.Carts) do
        cart:Update(dt)
    end
end

return CartController
