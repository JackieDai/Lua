--[[
    参考 Swift 的闭包： https://www.yuque.com/jk-coder/rhv3ga/lh3q1h?singleDoc# 《8.2 闭包（Closure）》
    - 闭包有一个重要特性是可以延长局部变量的生命周期
    - 表现形式 是 函数嵌套函数
]]

local function func1(a,b)
    local x=0;
    local y=0;
    return function()
        x=x+1;          -- 类似于static 属性
        print(a,b,x,y);
    end
end

function testClosure()
    func1("a","b")()  -- a	b	1	0
    func1("d","d")()  -- d	d	1	0

    tmpFunc = func1("e","f")
    print(type(tmpFunc)) -- function
    tmpFunc() -- e	f	1	0
    tmpFunc() -- e	f	2	0
    tmpFunc() -- e	f	3	0
end
-- testClosure()


function testCustomIpairs()
    t1={11,22,33,nil,44,55};
    function systemFunc()
        for k,v in pairs(t1) do
            print(k,v);
        end
        --[[
            1	11
            2	22
            3	33
            5	44
            6	55
        ]]
    end
    -- systemFunc()


    function myIpairs(tab)
        local index=0;
        local count=#tab;
        -- 下面是闭包的功能实现
        return function()
            index = index+1;
    
            if index <= count then
    
                if tab[index] == nil then
                    index = index+1;
                end
                return index,tab[index];
            end
        end
    
    end

    for k,v in myIpairs(t1) do
        print(k,v);
    end

    --[[
        输出结果如下：
        1	11
        2	22
        3	33
        5	44
        6	55
    ]]
    
end
testCustomIpairs()


