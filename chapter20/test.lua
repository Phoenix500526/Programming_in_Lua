function track(t)
    local proxy = {}    --代理对象
    --为代理对象创建元表
    local mt = {
        __index = function (_, k)
            print("*access to element " .. tostring(k))
            return t[k]  --访问原来的表
        end,
        __newindex = function(_, k, v)
            print("*update of element " .. tostring(k) .. " to " .. tostring(v))
            t[k] = v  --更新原来的表
        end,
        __pairs = function () 
            return function (_, k)    --迭代函数
                local nextkey, nextvalue = next(t, k)
                if nextkey ~= nil then   --避免最后一个值
                    print("*traversing element " .. tostring(nextkey))
                end
                return nextkey, nextvalue
             end
        end, 
        __len = function () return #t end
    }
    setmetatable(proxy, mt)
    return proxy
end

--使用方法
t = track({1,2,3,4,5})
a = track({6,7,8,9,10})
print(#t)
print(#a)
for k,v in pairs(t) do
    print(k,v)
end
for k,v in pairs(a) do
    print(k,v)
end