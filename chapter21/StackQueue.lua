function newStack (stc)
    -- body
    local self = stc or {}
    local size = function () return #self end
    local isempty = function () return size() == 0 end
    local push = function (element) self[size() + 1] = element end
    local pop = function () self[size()] = nil end
    local top = function () return self[size()] end
    return {
        size = size,
        isempty = isempty,
        push = push,
        pop = pop,
        top = top
    }
end

function newStackQueue(stc)
    local self = newStack(stc)
    local insertbottom = function ( element )
        local len = self.size()
        if len == 0 then
            self.push(element)
        else
            local tmp = newStack()
            for i = 1, len do
                tmp.push(self.top())
                self.pop()
            end
            self.push(element)
            for i = 1, len do
                self.push(tmp.top())
                tmp.pop()
            end
        end
    end
    return {
        size = self.size,
        isempty = self.isempty,
        push = self.push,
        pop = self.pop,
        top = self.top,
        insertbottom = insertbottom,
    }
end

StackQueue = newStackQueue{1,2,3,4,5}

print(StackQueue.size())
print(StackQueue.isempty())
StackQueue.insertbottom(10)

if not StackQueue.isempty() then
    for i = 1, StackQueue.size() do
        print(StackQueue.top())
        StackQueue.pop()
    end
end

