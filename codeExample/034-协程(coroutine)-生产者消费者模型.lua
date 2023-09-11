

--[[

    协程

    生产者消费者模型

    你去吃串，
        生产者  烤串的小哥
        消费者  你

    小哥烤一串，你吃一串
    小哥烤一串，你吃一串
    小哥烤一串，你吃一串
    ....

    这就是生产者消费者模型

]]--

function sleep(n)
    local now = os.clock();
    while now+n >= os.clock() do

    end
end


--生产者
function prod()
    local i=0;
    while true do
        i=i+1;
        coroutine.yield(i);--生产者生产出后，返回给消费者，并挂起，
    end
end


--消费者
function consumer()
    while true do
        local flag,i=coroutine.resume(prodHandle);--用协程去找生产者要
        print(flag,i);
        sleep(2);
    end
end

prodHandle=coroutine.create(prod);
consumerHandle = coroutine.create(consumer);

coroutine.resume(consumerHandle);--从消费者开始


