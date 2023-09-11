
--[[

        协程

        协程不是进程或线程，其执行过程更类似于子例程，或者说不带返回值的函数调用。
        一个程序可以包含多个协程，可以对比与一个进程包含多个线程，因而下面我们来比较协程和线程。
        我们知道多个线程相对独立，有自己的上下文，切换受系统控制；
        而协程也相对独立，有自己的上下文，但是其切换由自己控制，由当前协程切换到其他协程由当前协程来控制。

        【可以把协程看成是一个可自行决定调度切换的线程】

        编程语言Lua从5.0版开始支持协程的概念，极大的扩展了Lua的能力。Lua的协程通过扩展库coroutine来实现

        百度百科  https://baike.baidu.com/item/协程/8652240


        API  https://www.lua.org/manual/5.4/manual.html#6.2

        coroutine.close (co) -------------------- 关闭协程，返回bool
        coroutine.create (f) -------------------- 创建协程，传入一个function，返回一个协程句柄
        coroutine.isyieldable ([co]) ------------ 判断协程是否是 yield 状态
        coroutine.resume (co [, val1, ···]) ----- 将挂起态的协程重新激活
        coroutine.running () -------------------- 获取正在运行的协程
        coroutine.status (co) ------------------- 获取co句柄对应的协程的状态 [suspended(挂起)，running(执行中),dead(结束)]
        coroutine.wrap (f) ---------------------- 用function 创建一个新的协程
        coroutine.yield (···) ------------------- 挂起当前协程

]]--


--业务，取钱，取一百万
function func1(a,b)

    ---print(coroutine.status(handle));--这里能看出是执行中
    aa=a*2;
    bb=b*3;
    x,y,z=coroutine.yield(a,b,"100w");--挂起协程，一百万给你了，然后问你，还有什么要帮你的

    print(x,y,z);
    --第二笔业业，查询你有没有IQ
    ---xx,yy,zz= coroutine.yield();


end


handle = coroutine.create(func1);--- 去银行办业务， 然后告诉大堂经理，要取现金(要执行func1)，大堂经理会帮你叫号，给你一个小票(handle)

print(coroutine.status(handle));--- 挂起状态，等待执行或结束，(你拿到小票了，就去等着叫号，下一步，也可能这个号作废，也可能叫你去办业务)

--coroutine.resume(handle);--------------- 叫到你的号了，你拿着小票去窗口办业务(执行 func1)
print(coroutine.resume(handle,11,22));---- resume是阻塞的，要等到调用结束，然后返回调用成功或失败状态(bool)以及其它值
                                            ---- 并且把你的身份证，银行卡还给你，再把你取的一百万给你

print(coroutine.status(handle));---------------- 挂起状态，等待继续服务或结束服务

--coroutine.close(handle);------------------------ 业务办完了，好评结束
--print(coroutine.status(handle));---------------- dead 结束状态


print(coroutine.resume(handle,"aa","bb","cc"));--再办一个业务，查查我其它的卡上的余额，IC卡，IQ都给你(aa,bb,cc)

print(coroutine.status(handle));



