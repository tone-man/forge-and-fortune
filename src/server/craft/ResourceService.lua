local ResourceService = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ResourcePrefabs = ReplicatedStorage:WaitForChild("ResourcePrefabs")

function ResourceService.GiveResource(player, resourceNode)
    if not player or not resourceNode then return end
    local backpack = player:FindFirstChild("Backpack")
    if not backpack then return end

    local prefab = ResourcePrefabs:FindFirstChild(resourceNode.ResourceType)
    if not prefab then
        warn("No prefab found for resource: " .. resourceNode.ResourceType)
        return
    end

    local tool = prefab:Clone()
    tool.Parent = backpack
end

return ResourceService

