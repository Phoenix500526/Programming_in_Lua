function ispali(src)
    local i, j = 1, #src
    local c_i, c_j
    repeat
        while string.sub(src,i, i) == " " or string.match(string.sub(src,i, i), "%p") do
            i = i + 1
        end

        while string.sub(src,j, j) == " " or string.match(string.sub(src,j, j), "%p") do
            j = j - 1
        end

        c_i = string.sub(src,i, i)
        c_j = string.sub(src, j, j)

        if c_i == c_j then
            i = i + 1
            j = j - 1
        else
            return false
        end
    until i >= j
    return true
end

print(ispali("step   on ,.,.,!?no,pets"))
print(ispali("banana"))
