local Cart = {}
Cart.__index = Cart

local ResourceController = require(game.ServerScriptService.Server.resource.ResourceController)

function Cart.new(model, config)
    local self = setmetatable({}, Cart)

    self.Model = model

    config = config or {}
    self.DropCooldown = config.DropCooldown or 5
    self.Timer = 0

    return self
end

function Cart:Update(dt)
    self.Timer = math.max(self.Timer - dt, 0)

    if self.Timer <= 0  then
        self.Timer = self.DropCooldown
        local drop = ResourceController:SpawnDrop(self.Model.PrimaryPart.Position, "Iron")
    end

end

return Cart
