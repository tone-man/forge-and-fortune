--[[
    Data object for resource.
--]]
local Resource = {}
Resource.__index = Resource

function Resource.new(resourceType)
    local self = setmetatable({}, Resource)

    self.Type = resourceType

    return self
end

return Resource