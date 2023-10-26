--[[
    // 八种基本数据类型
    nil, boolean, number, string, function , userdata, thread 和 table
        
    end
]]--

function testnil()
    a = nil
    print(type(a)) --nil

    -- nil 做比较的时候，应该加上 双引号"

    print(type(X))
    print(type(X) == nil) -- false
    print(type(X) == "nil") -- true

end
-- testnil()

function testboolean()

    -- lua 中 只有 false 和 nil 为假，其他均为真

    a = true
    b = 0
    c = 1
    d = false
    print("a == ", type(a)) -- a == 	boolean
    print("b == ", type(b)) -- b == 	number
    print("c == ", type(c)) -- c == 	number
    print("d == ", type(d)) -- d == 	boolean
end
-- testboolean()

function testString()

    a = "abc"
    b = 'abc'
    c = 'a'
    d = "a"
    print("a == ", type(a)) -- a == 	string
    print("b == ", type(b)) -- b == 	string
    print("c == ", type(c)) -- c == 	string
    print("d == ", type(d)) -- d == 	string
    
end
-- testString()

function opString()

    -- 在对一个数字字符串上进行算术操作时，Lua 会尝试将这个数字字符串转成一个数字:

    print("2" + 8) -- 10.0

    print("2" + "6") -- 8.0
end
-- opString()

--[[
    函数传参
]]
function func1(a,b,c)
    print(a,b,c)
    
end

function func1Test()
    func1(1,2,3) -- 1	2	3
    func1("a","b","c") -- a	b	c
    func1(true,false,"acv") -- true	false	acv
end
-- func1Test()

function func2(a,b,c)
    print(a,b,c,"asf","asdasdf")
    
end

-- func2("d",e, "g") -- d	nil	g	asf	asdasdf

function func3(...)
    -- TODO: @lingxiao the variable params for the function, must be fillup in future
    
end

--[[
    匿名函数
]]

function anonymousFunction ()
    sum = function (a,b)
        return a + b
    end

    function executeSum()
        print(sum(10,20)) -- 30

        print(type(sum)) -- function
    
        sum1 = sum
        print(type(sum1)) -- function
        print(sum1(20,20)) -- 40
    end

    executeSum()
    
end

-- anonymousFunction()


function makeFuncAsParams() 
    function testMuilty(a, b)
        return a * b
        
    end
    function func1(funcName, param1, param2) 
        print(funcName(param1,param2))
    end
    
    func1(testMuilty,10,20) --200
end
-- makeFuncAsParams()

--[[
    table
        - table不是指 数据库中的表，而是一种数据类型，类似map
]]

function testTablePart()

    -- 在 Lua 里，table 的创建是通过"构造表达式"来完成，最简单构造表达式是{}，用来创建一个空表。也可以在表里添加一些数据，直接初始化表:
    function constructorTable()
        -- create an empty table
        local table1 = {}

        print("table1 == ", table1) -- table: 0x7fcbe9f0e400

        -- create an empty with initial values
        local table2 = {"apple", "pear", "orange", "grape"}

        print("table2 == ", table2) -- table: 0x7fcbe9f05d20
    end
    -- constructorTable()

    -- lua 中的 table 其实是一个 “关联数组(associative array)”,数组的索引可以是 数字，或者字符串

    function test1()
        local a = {}

        a["key"] = "value"

        local key = 10

        a[key] = 22
        a[key] = a[key] + 11

        for key, value in pairs(a) do
            print(key..":"..value)
        end
        --[[
            10:33
            key:value
        ]]
    end
    test1()



    function tableTest1()
        info = {
            id = 123,
            name = "jackie",
            sex = false
        }  
        

        function testLoopUsingFor()
            for key, value in pairs(info) do
                print(key,"===", value)
            end
            --[[
                输出如下：
                    id	===	123
                    name	===	jackie
                    sex	===	false
    
            ]]
        end
        -- testLoopUsingFor()

        function fetchValueUsingKey()
            print(info.id)
            print(info.name)
            print(info.sec)
        end
        -- fetchValueUsingKey()
        --[[
            输出如下：
            123
            jackie
            false
        ]]

        function addDeleteModifyQueryFieldToInfoTable()
            -- add field
            info.age = 18
            info.country = "China"
            -- testLoopUsingFor()
            --[[
                country	===	China
                id	===	123
                age	===	18
                sex	===	false
                name	===	jackie
            ]]

            -- delete field
            info.sex = nil
            info["name"] = nil
            -- testLoopUsingFor()
            --[[
                age	===	18
                sex	===	false
                id	===	123
                country	===	China
            ]]

            -- modify field
            info.country = "USA"
            testLoopUsingFor()
            --[[
                country	===	USA
                age	===	18
                id	===	123
            ]]
            
        end
        
        addDeleteModifyQueryFieldToInfoTable()

        

    end
    -- tableTest1()

    -- Embed type of table 
    function tableTest2()
        info={
            name="tom",
            age=123,
            sex=false,
            111,
            "222",
            {"abc","def",789,son_k_1="son-key-1"},
            son2={son2_k_1="son2-key-1",name="son2",false,"abc-son2",123456},
            country="china",
            3333
        };

        function testLoopUsingFor1()
            for key, value in pairs(info) do
                print(key,"===", value)
            end
        end
        -- testLoopUsingFor1()
        --[[
        注意 
            - 非 kye-value 格式 会自动补充 index ， 从 1 开始
            - 如果  是  table类型的数据，会输出其 table 的 地址值

            1	===	111
            2	===	222
            3	===	table: 0x7faf34f0b930
            4	===	3333
            name	===	tom
            son2	===	table: 0x7faf34f0b9c0
            age	===	123
            country	===	china
            sex	===	false
        ]]

        function testLoopUsingFor2()
            for key, value in pairs(info) do
                print(key,"===", value)
                if type(value) == "table" then
                    for k, v in pairs(value) do
                        print("\t",k,"===",v);
                    end
                end
            end
        end
        -- testLoopUsingFor2()
        --[[
            输出结果如下：
            1	===	111
            2	===	222
            3	===	table: 0x7fa754109cd0
                    1	===	abc
                    2	===	def
                    3	===	789
                    son_k_1	===	son-key-1
            4	===	3333
            sex	===	false
            country	===	china
            name	===	tom
            son2	===	table: 0x7fa754109d40
                    1	===	false
                    2	===	abc-son2
                    3	===	123456
                    son2_k_1	===	son2-key-1
                    name	===	son2
            age	===	123
        ]]

    end
    -- tableTest2()
end
-- testTablePart()





function testLogicExp()
    function test1()
        if type(a) == "nil" then
            print("a == nil") -- a == nil
        end
    end
    -- test1()

    function test2()
        local a = 90
        if a<90  then
            print("just so so")
        else
            print("pretty cool")
        end
    end
    -- test2()

    function test3()
        local a = 90
        if a < 90 then
            print("just so so")
        elseif a > 90 then
            print("pretty cool")
        else
            print("钢达标")
        end
    end

    test3()

end

testLogicExp()