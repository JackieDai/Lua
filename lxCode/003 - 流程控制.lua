function ifOperation()
    function test1()
        a , b = 1,2 
        if a == 1 then
            print("b ==", b) -- b == 2
        end

        if a > 1 then
            print(">1")
        else
            print("<=1")  -- <=1
        end

        if a > 1 then
            print(">1")
        elseif a == 1 then
            print("==1") -- ==1
        else
            print("<1")
        end
    end

    -- test1()

    -- 复合 if 判断 01
    function test2()

        c,d=900,101;

        if c > 100 then
            print("学仙"); -- 学仙
        elseif c>90 and c<=100 then
            print("学神");
        elseif c>80 and c<=90 then
            print("学霸");
        elseif c>60 and c<=80 then
            print("学长");
        elseif c>50 and c<=60 then
            print("学渣");
        else
            print("学酥");--本人
        end
    end

    -- test2()

    -- 复合 if 判断 02
    -- 注意完整的  if else elseif end 的完成流程
    function test3()
        c,d=900,101;
        if c > 100 then
            print("学仙");
        elseif c>90 and c<=100 then
            print("学神");
        else
            if c>80 and c<=90 then
                print("学霸");
            elseif c>60 and c<=80 then
                print("学长");
            elseif c>50 and c<=60 then
                print("学渣");
            else
                print("学酥");--学酥本酥
            end
        end
    end
    test3()


end
-- ifOperation()

--[[
    while condition do
        ...code here...
    end

    repeat
        ...code here...
    until condition

    while he repeat 的区别
        while： 循环中，当条件不成立时，结束循环
        repeat: 循环中，当条件成立时，结束循环
]]

function whildOperation()
    i, sum = 0,0
    while i < 100 do -- 条件不成立时，结束循环
        i = i + 1
        sum = sum + i
    end
    print(sum) -- 5050
end
-- whildOperation()

function repeatOperation()
    i, sum = 0,0
    repeat
        i = i + 1
        sum = sum + i
    until i>99  -- 当条件成立时，结束循环
    print(sum)  -- 5050
    
end
-- repeatOperation()

--[[
    注意：
    lua 中没有 continue 概念
    
    break，只能跳出一层循环，跟其他语言类似
    goto FLAG 语句 跳转到指定标记处，也可用于跳出循环，FLAG是一个标记位，相当于一个锚点
    两者区别是:
        break 只能跳出当前循环，而goto 可以跳转到指定位置，这样可以忽略一些代码

    flag不可见原则 【只能在某一个函数作用域里起作用】
    - 不能从外面 goto 到 代码块里面
    - 不能跳出或跳入一个函数
    - 不能跳入本地变量的作用与
]]

function testGOTO()
    i,sum=0,0;
    while i<100 do
        if i>49 then
            goto FLAG;
        end
        i=i+1;
        sum=sum+i;

    end

    print(i,sum);

    print("111111");

    ::FLAG::
    print("222"); -- 只会 将 222 输出
end
-- testGOTO()


--[[
    for 循环
        - 数值循环
        - 泛型循环(类似 for- each, for - in)
    
    - 数值循环
    for i = 初始值, 结束值, 步长(可以省略) do
        ... code here ...
    end

    - 泛型循环,也成迭代循环
        -pairs/ipairs 也成 迭代函数
    for k, v in pairs(t) do
        ... code here ...
    end

    for i, v in ipairs(t) do
        ... code here ...
    end
    

    ipairs 顺序遍历，中间的序号不会断开，遇到k=>v 直接跳过，遇到第一个nil 就会直接终止，一般情况下，用于数组类型的集合遍历
    pairs 遇到nil 会跳过，同时适用数组类型和k=>v 类型的集合，混搭也是没问题的，如果是混搭的时候，会优选获取数组类型数据

    pairs 的适用范围大于 ipars
    如果使用时不确定用哪个，就无脑pairs
]]

function forOperation()

    function numberFor1()
        for i = 1, 10, 1 do
            io.write(i," ")
        end
        -- 输出结果 1 2 3 4 5 6 7 8 9 10 
    end
    -- numberFor1()

    function numberFor2()
        for i = 1, 10, 2 do
            io.write(i," ")
        end
        -- 输出结果 1 3 5 7 9 
    end
    -- numberFor2()

    function numberFor3()
        for i = 10, 1, -2 do
            io.write(i," ")
        end
        -- 输出结果 10 8 6 4 2 
    end
    -- numberFor3()

    function numberFor4()
        t1={11,22,33,44,55,66};
        for i=1,6 do
            io.write(t1[i]," ");
        end
        -- 输出结果  11 22 33 44 55 66 

        io.write("\n");
        for i=6,1,-2 do
            io.write(t1[i]," ");
        end
        -- 输出结果 66 44 22 
    end
    -- numberFor4()


    function pairsFor()
        t1={11,22,"xxx",33,nil,44,55,66,key="vvv",77};
        for key, value in pairs(t1) do
            print(key, value)
        end
        --[[ 输出结果如下: note 注意 在 index == 5 出的 nil 值 会自动忽略，
            1	11
            2	22
            3	xxx
            4	33
            6	44
            7	55
            8	66
            9	77
            key	vvv
        ]]
    end
    pairsFor()


    function ipairsFor()
        t1={11,22,"xxx",33,nil,44,55,66,key="vvv",77};
        for key, value in ipairs(t1) do
            print(key, value)
        end
        --[[输出结果如下: note 注意 在 index == 5 出的 nil 值 会停止
            1	11
            2	22
            3	xxx
            4	33
        ]]
        
    end
    -- ipairsFor()
    
end

forOperation()