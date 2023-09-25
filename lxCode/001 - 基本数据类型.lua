--[[
    // 八种基本数据类型
    nil, boolean, number, string, function , userdata, thread 和 table
        
    end
]]--

function testnil()
    a = nil
    print(type(a)) --nil
end
-- testnil()

function testboolean()
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
    tableTest2()
end
testTablePart()



