ans = {}
b = {}

function comb(a, a_idx, b_idx, len)
    if b_idx == len + 1 then
        printResult(b)
    end
    if #a - a_idx + 1  >= len - b_idx then
        for i = a_idx, #a do
            b[b_idx] = a[a_idx]
            comb(a, a_idx + 1, b_idx + 1, len)
            b[b_idx] = nil
        end
    end
end

function printResult(a)
    for i = 1, #a do
        io.write(a[i], " ")
    end
    io.write("\n")
end

comb({1,2,3},1, 1, 3)
