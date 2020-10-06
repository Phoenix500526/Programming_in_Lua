local stack_ = {}
setmetatable(stack_, {__mode = "k"})

StackQueue = {}

function StackQueue:new()
    local stck = {}
    self.__index = self
    setmetatable(stck, self)
    return stck
end


function StackQueue:size()
    return #(stack_[self])
end

function StackQueue:isempty()
    return self:size() == 0
end

function StackQueue:pop()
    stack_[self][self:size()] = nil
end

function StackQueue:top()
    return stack_[self][self:size()]
end

function StackQueue:push(element)
    stack_[self][self:size() + 1] = element
end

function StackQueue:insertbottom(element)
    local len = self:size()
    local tmp = {}
    for i = 1, len do
        tmp[i] = self:top()
        self:pop()
    end
    self:push(element)
    for i = len, 1, -1 do
        self:push(tmp[i])
    end
end

function CreateStackQueue(stck)
    local stack_key = StackQueue:new()
    stck = stck or {}
    stack_[stack_key] = stck
    return stack_key
end


stack = CreateStackQueue({10,20,30,40,50})
print(stack:isempty())
print(stack:size())
stack:insertbottom(100)
for i = 1, stack:size() do
    print(stack:top())
    stack:pop()
end
print(stack:isempty())
print(stack:size())
stack:push(1000)
print(stack:top())
print(stack:isempty())
print(stack:size())