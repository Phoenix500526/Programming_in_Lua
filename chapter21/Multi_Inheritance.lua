local function search(k, plist)
    -- body
    for i=1, #plist do
        local v = plist[i][k]
        if v then return v end
    end
end 


function createClass(...)
    -- body
    local c = {}
    local parents = {...}
    --在父类列表中查找类缺失的方法
    setmetatable(c, {__index = function (t, k)
        -- body
        return search(k, parents)
    end})
    --将 c 作为其实例的元表
    c.__index = c
    --为新类定义一个新的构造函数
    function c:new(o)
        -- body
        o = o or {}
        setmetatable(o, c)
        return o
    end
    return c
end

Account = {
    balance = 0,
    withdraw = function (self, v) self.balance = self.balance - v end,
    deposit =function (self, v) self.balance = self.balance + v end,
    new = function (self, v) 
        v = v or {}
        setmetatable(v, self)
        self.__index = self
        return v
    end,
}

Named = {
    name = "",
    getname = function (self) return self.name end,
    setname = function (self, n) self.name = n end,
}


NamedAccount = createClass(Account, Named)
account = NamedAccount:new{name = 'Paul'}
print(account:getname())