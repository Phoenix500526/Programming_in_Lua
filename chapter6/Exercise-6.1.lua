function printArr(t)
    for i = 1, #t do
        io.write(t[i] .. " ")
    end
    io.write("\n")
end


t = {1,2,3,4,5,6,6,7,8,8,6}
printArr(t)