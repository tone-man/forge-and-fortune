local Blueprint = {}
Blueprint.__index = Blueprint

function Blueprint.new(name, recipe)
    local self = setmetatable({}, Blueprint)
    self.Name = name
    self.Recipe = recipe
    return self
end

return Blueprint