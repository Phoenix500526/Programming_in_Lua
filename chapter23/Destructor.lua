o = {x = "hi"}
mt = {}
mt.__gc = function (o) print(o.x) end
setmetatable(o, mt)
o = nil
collectgarbage()