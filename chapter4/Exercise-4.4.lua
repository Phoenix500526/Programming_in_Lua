
function insert(src, idx, dest)
    local res
    if idx == 1 then
        res = dest .. src
    elseif idx == #src then
        res = src .. dest
    else 
        res = string.sub(src, 1, idx - 1) .. dest .. string.sub(src, idx, -1)
    end
    return res
end

print(insert("hello world", 1, "start:"))
print(insert("hello world", 7, "small "))
s = "你好呀"
print(insert(s, utf8.offset(s, 4), "!"))