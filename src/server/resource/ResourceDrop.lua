local ResourceDrop = {}
ResourceDrop.__index = ResourceDrop

function ResourceDrop.new(resourceData, model)
    local self = setmetatable({}, ResourceDrop)

    self.Data = resourceData
    self.Model = model
    self.TimeAlive = 0
    self.IsPickedUp = false

    return self
end

function ResourceDrop:Destroy()
    if self.Model then
        self.Model:Destroy()
        self.Model = nil
    end
end

return ResourceDrop
