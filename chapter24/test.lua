function producer()
    return coroutine.create(function ()
        while true do
            local x = io.read()
            send(x)
        end
    end)
end

function consumer(prod)
    while true do
        local x = receive(prod)
        io.write(x, "\n")
    end
end

function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end

function send(x)
    coroutine.yield(x)
end
--利用过滤器 filter 将 consumer 和 producer 连接起来
--单消费者单生产者只需要一个协程即可
consumer(producer())