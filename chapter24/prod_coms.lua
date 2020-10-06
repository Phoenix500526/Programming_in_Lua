function send(cons, x)
    coroutine.resume(cons, x)
end

function receive()
    return coroutine.yield()
end

function consumer()
    return coroutine.create(function (x)
        while true do
            io.write(x, "\n")
            x = receive()
        end
    end)
end

function producer(cons)
    while true do
        local x = io.read()
        send(cons, x)
    end
end


producer(consumer())