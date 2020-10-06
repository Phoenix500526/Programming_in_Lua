Stack = {}

function Stack:new(stck)
    stck_ = stck or {}
    self.__index = self
    setmetatable(stck, self)
    return stck
end

function Stack:size()
    return #self
end

function Stack:isempty()
    return self:size() == 0
end

function Stack:push(element)
    self[self:size() + 1] = element
end

function Stack:pop()
    self[self:size()] = nil
end

function Stack:top()
    return self[self:size()]
end

StackQueue = Stack:new{}

function StackQueue:new(stck)
    stck = stck or {}
    self.__index = self
    setmetatable(stck, self)
    return stck
end

function StackQueue:insertbottom(element)
    local res = {}
    local len = self:size()
    for i = 1, len do
        res[i] = self:top()
        self:pop()
    end
    self:push(element)
    for i = len, 1, -1 do
        self:push(res[i])
    end
end

stack = StackQueue:new({10,12,14,15})
print(stack:isempty())
print(stack:top())
print(stack:size())
stack:insertbottom(100)
for i = 1, stack:size() do
    print(stack:top())
    stack:pop()
end