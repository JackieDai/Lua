function test1()
    function foo()
        print("协同程序 foo 开始执行")
        local value = coroutine.yield("暂停 foo 的执行")
        print("协同程序 foo 恢复执行，传入的值为: " .. tostring(value))
        print("协同程序 foo 结束执行") 
    end
        
    -- 创建协同程序
    --[[
        function coroutine.create(f: fun(...any):...unknown)-> thread
        创建一个主体函数为 f 的新协程。 f 必须是一个 Lua 的函数。 返回这个新协程，它是一个类型为 "thread" 的对象。
    ]]
    local co = coroutine.create(foo)
    
    -- 启动协同程序
    --[[
    function coroutine.resume(co: thread, val1?: any, ...any)   -> success: boolean
    开始或继续协程 co 的运行。

    ]]
    local status, result = coroutine.resume(co)
    print(status) -- true
    print(result) -- 输出: 暂停 foo 的执行
    
    -- 恢复协同程序的执行，并传入一个值
    status, result = coroutine.resume(co, 42)
    print(status) 
    print(result) 

    --[[
        上述程序的输出结果：
        协同程序 foo 开始执行
        true
        暂停 foo 的执行
        协同程序 foo 恢复执行，传入的值为: 42
        协同程序 foo 结束执行
        true
        nil
    ]]
end
-- test1()

function test2()

    function co1()
        -- 创建了一个新的协同程序对象 co，其中协同程序函数打印传入的参数 i
        co = coroutine.create(
            function (i)
                print(i)
            end
        )
        -- 使用 coroutine.resume 启动协同程序 co 的执行，并传入参数 1。协同程序开始执行，打印输出为 1
        coroutine.resume(co, 1) -- 1
        
        -- 通过 coroutine.status 检查协同程序 co 的状态，输出为 dead，表示协同程序已经执行完毕
        print(coroutine.status(co))  -- dead
    end

    -- co1()

    function co1()
        -- 使用 coroutine.wrap 创建了一个协同程序包装器，将协同程序函数转换为一个可直接调用的函数对象
        co = coroutine.wrap(
            function (i)
                print(i)
            end
        )
        co(1) --1
        -- co(2) --1
    end
    
    -- co1()
    function co2()
        -- 创建了另一个协同程序对象 co2，其中的协同程序函数通过循环打印数字 1 到 10，在循环到 3 的时候输出当前协同程序的状态和正在运行的线程

        co2 = coroutine.create(
            function()
                for i=1,10 do
                    print(i)
                    if i == 3 then
                        print(coroutine.status(co2))  --running
                        print(coroutine.running()) --thread:XXXXXX
                    end
                    coroutine.yield()
                end
            end
        )

        -- 连续调用 coroutine.resume 启动协同程序 co2 的执行
        coroutine.resume(co2) --1
        coroutine.resume(co2) --2
        coroutine.resume(co2) --3
        coroutine.resume(co2) --4
        coroutine.resume(co2) --5
        coroutine.resume(co2) --6
        coroutine.resume(co2) --7
        coroutine.resume(co2) --8
        coroutine.resume(co2) --9
        print(coroutine.status(co2))   -- suspended
        coroutine.resume(co2) --10
        print("----co2co2------")
        print(coroutine.status(co2))   -- suspended
        coroutine.resume(co2) --不执行
        print("-----co2co2-----")
        print(coroutine.status(co2))   -- dead
        coroutine.resume(co2) --不会执行


        -- 通过 coroutine.status 检查协同程序 co2 的状态，输出为 suspended，表示协同程序暂停执行
        print(coroutine.status(co2))   -- dead
        print(coroutine.running())
        
        print("----------")
        
    end
    co2()

end
-- test2()

function test3()
    function foo (a)
        print("foo 函数输出", a)
        return coroutine.yield(2 * a) -- 返回  2*a 的值
    end

    co = coroutine.create(function (a , b)
        print("第一次协同程序执行输出", a, b) 
        local r = foo(a + 1)
         
        print("第二次协同程序执行输出", r)
        local r, s = coroutine.yield(a + b, a - b)
         
        print("第三次协同程序执行输出", r, s)
        return b, "结束协同程序"     
    end)

    print("--分割线--0--")

    --[[
        调用resume，将协同程序唤醒,resume操作成功返回true，否则返回false；
        协同程序运行；
        运行到yield语句；
        yield挂起协同程序，第一次resume返回；（注意：此处yield返回，参数是resume的参数）
    ]]
    print("main", coroutine.resume(co, 1, 10)) -- main	true	4
    --[[
        上述代码的执行结果，如下：
        第一次协同程序执行输出	1	10
        foo 函数输出	2
        main	true	4
    ]]

    print("--分割线--1--")

    print("main", coroutine.resume(co, "r")) -- true 11 -9
    --[[
        上述代码输出结果如下：
        第二次协同程序执行输出	r
        main	true	11	-9
    ]]


    print("---分割线--2--")

    print("main", coroutine.resume(co, "x", "y"))
    --[[
        第三次协同程序执行输出	x	y
        main	true	10	结束协同程序
    ]]

    print("---分割线--3-")
    print("main", coroutine.resume(co, "x", "y"))
    --[[
        main	false	cannot resume dead coroutine
    ]]


    --[[
        resume和yield的配合强大之处在于，resume处于主程中，它将外部状态（数据）传入到协同程序内部；而yield则将内部的状态（数据）返回到主程中。
    ]]
    
end
-- test3()

-- 生产者和消费者的关系
function test4()

    local newProductor

    function productor()
        local i = 0
        while true do
        i = i + 1
        send(i) -- 将生产的物品发送给消费者
        end
    end

    function consumer()
        while true do
        local i = receive() -- 从生产者那里得到物品
        print(i)
        end
    end

    function receive()
        local status, value = coroutine.resume(newProductor)
        return value
    end

    function send(x)
        coroutine.yield(x) -- x表示需要发送的值，值返回以后，就挂起该协同程序
    end

    -- 启动程序
    newProductor = coroutine.create(productor)
    consumer()
    
end

test4()

