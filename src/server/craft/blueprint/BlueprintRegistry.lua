local Blueprint = require(game.ServerScriptService.craft.blueprint.Blueprint)

local BlueprintRegistry = {}

BlueprintRegistry.Blueprints = {
    Sword = Blueprint.new("Sword", {iron_ore = 3}),
}

function BlueprintRegistry:GetBlueprint(name)
    return self.Blueprints[name]
end

function BlueprintRegistry:GetAllBlueprints()
    local list = {}
    for name, blueprint in pairs(self.Blueprints) do
        table.insert(list, blueprint)
    end
    return list
end

return BlueprintRegistry
