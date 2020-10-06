local stack_ = {}
Stack = {}

function Stack:size()
    return #(stack_[self] or {})
end

function Stack:isempty()
    return self.size() == 0
end

function Stack:push(element)
    stack_[self][size() + 1] = element
end

function Stack:top()
    return stack_[self][size()] 
end

function Stack:pop()
    stack_[self][size()] = nil
end

function Stack:new(stc)
    stc = stc or {}
    self.__index = self
    setmetatable(stc, self)
    stack_[stc] = stc
    return stc
end

my_stack = Stack:new{1,2,3,4,5}
print(my_stack:size())
print(my_stack:isempty())