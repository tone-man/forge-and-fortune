local ResourceNode = {}
ResourceNode.__index = ResourceNode

function ResourceNode.new(resourceType)
    local self = setmetatable({}, ResourceNode)
    self.ResourceType = resourceType
    return self
end

return ResourceNode
