local ServerScriptService = game:GetService("ServerScriptService")
local Cart = require(ServerScriptService.Server.cart.Cart)
local CartController = require(ServerScriptService.Server.cart.CartController)
local CartModel = game.workspace:FindFirstChild("Cart")
local RunService = game:GetService("RunService")

CartController:RegisterCart(CartModel)

RunService.Heartbeat:Connect(function(dt)
    CartController:Update(dt)
end)

