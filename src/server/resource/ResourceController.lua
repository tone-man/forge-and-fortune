--[[
    Centralizes resource control
--]]
local Resource = require(game.ServerScriptService.Server.resource.Resource)
local ResourceDrop = require(game.ServerScriptService.Server.resource.ResourceDrop)

local ResourceController = {
    Drops = {},
    DespawnTime = 20, -- seconds
}

function ResourceController:SpawnDrop(position, resourceType, amount)
    -- Create data
    local data = Resource.new(resourceType, amount)

    -- Clone world model
    local model = game.ServerStorage.Iron:Clone()
    model:SetAttribute("ResourceType", resourceType)
    model:SetPrimaryPartCFrame(CFrame.new(position))
    model.Parent = workspace

    -- Create drop controller
    local drop = ResourceDrop.new(data, model)
    self.Drops[drop] = drop

    -- Connect pickup prompt
    local prompt = model.PrimaryPart:FindFirstChild("ProximityPrompt")
    prompt.Triggered:Connect(function(player)
        drop:Destroy()
        self.Drops[drop] = nil
    end)

    return drop
end

function ResourceController:Update(dt)
    for drop, obj in pairs(self.Drops) do
        obj.TimeAlive += dt

        if obj.TimeAlive >= self.DespawnTime then
            obj:Destroy()
            self.Drops[drop] = nil
        end
    end
end

return ResourceController
