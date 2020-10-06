function remove(src, idx, len)
    local res
    if len == 0 then
        res =  src
    elseif idx + len >= #src then
        res = string.sub(src, 1 , idx)
    end
        res = string.sub(src, 1, idx - 1) .. string.sub(src, idx + len, -1)
    return res
end


s = "hello world"
print(remove(s, 7, 4))
print(remove(s, 1, 4))
print(remove(s, #s + 1, 4))
x = "你好吗？"
print(remove(x, utf8.offset(x, 2), utf8.offset(x, 2) - utf8.offset(x, 1)))