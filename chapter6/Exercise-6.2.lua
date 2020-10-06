function func_1( ... )
    return select(2,...)
end


function func_2( ... )
    return select(-2,...)
end


print(func_1(1,2,3,4,5,6,"a",'b','c','d'))
print(func_2(1,2,3,4,5,6,"a",'b','c','d'))