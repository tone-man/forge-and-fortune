local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ResourceService = require(ReplicatedStorage.Domain.Services.ResourceService)

local ResourceController = {}
ResourceController.VatMap = {}

function ResourceController:RegisterNode(vatPart, resourceNode)
    if vatPart and resourceNode then
        self.VatMap[vatPart] = resourceNode

        -- Connect ClickDetector
        local clickDetector = vatPart:FindFirstChild("ClickDetector")
        if clickDetector then
            clickDetector.MouseClick:Connect(function(player)
                ResourceService.GiveResource(player, resourceNode)
            end)
        end
    end
end

return ResourceController
