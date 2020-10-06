local Set = {}
local mt = {}

function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _,v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.intersection(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.differ(a, b)
    local res = Set.new{}
    for k in pairs(a) do
        if not b[k] then
            res[k] = a[k]
        end
    end
    return res
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

function Set.len(set)
    local cnt = 0
    for _ in pairs(set) do
        cnt = cnt + 1
    end
    return cnt
end

mt.__add = Set.union
mt.__mul = Set.intersection
mt.__sub = Set.differ
mt.__len = Set.len

--子集关系
mt.__le = function (a, b)
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

--真子集关系
mt.__lt = function(a, b)
    return a <= b and not (b <= a)
end

--等价关系
mt.__eq = function(a, b)
    return a <= b and b <= a
end

mt.__tostring = Set.tostring

s1 = Set.new{30, 50}
s2 = Set.new{10,20,30,50}


print("s1 = " .. Set.tostring(s1) .. ", len = " .. #s1)
print("s2 = " .. Set.tostring(s2) .. ", len = " .. #s2)

print(s2 - s1)
print(s1 - s2)
print((s1+s2)*s1)
print(s1 <= s2)
print(s1 < s2)
print(s1 >= s1)
print(s1 > s1)
print(s1 == s2 * s1)
