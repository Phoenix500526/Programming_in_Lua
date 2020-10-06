--Stack 成员变量是一个 stack_ 表，同时提供 push top pop isempty 等外部接口。

function newStack(stc)
    local stack_ = stc or {}
    local size = function () return #stack_ end
    local isempty = function () return size() == 0  end
    local push = function (element) stack_[#stack_ + 1] = element end
    local pop = function () stack_[#stack_] = nil  end
    local top = function () return stack_[#stack_] end
    return {
        size = size,
        isempty = isempty,
        push = push,
        pop = pop,
        top = top,
    }
end


stack = newStack{1,2,3,4,5}
print(stack.isempty())
stack.push(10)
print(stack.isempty())
for i = 1, stack.size() do
    print(stack.top())
    stack.pop()
    print("size = " .. stack.size())
end

print(stack.isempty())
