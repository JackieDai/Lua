

function sleep(n)
    local now = os.clock();
    while now+n >= os.clock() do

    end
end


--[[
function func1()
    while true do
        print("func1---111");
        sleep(1);
    end
end

function func2()
    while true do
        print("func2---222");
        sleep(1);
    end
end
--func1();
--func2();

]]--


--[[
function func1(flag)
    while true do
        print("func1---111");
        sleep(1);
        if flag %2 == 0 then
            break;
        end
    end
end

function func2(flag)
    while true do
        print("func2---222");
        sleep(1);
        if flag %2 ~= 0 then
            break;
        end
    end
end


flag = 0;
while true do
    if flag % 2 == 0 then
        func1(flag);
    else
        func2(flag);
    end
    flag = flag+1;
end
]]--


function func1()
    while true do
        rs = coroutine.resume(handle2);
        print(rs," func1---111");
        sleep(1);
    end
end

function func2()
    while true do
        print("xxxxxxxxxxxxx");
        coroutine.yield();
        print("func2---222");
        sleep(1);

    end
end

handle1=coroutine.create(func1);
handle2 = coroutine.create(func2);

coroutine.resume(handle1);