function test01()
    t1={11,22,nil,nil,nil,33};
    t2={111,222,333,444,555};
    metaT3={};

    -- 给t1 添加元表
    setmetatable(t1, metaT3)

    -- 给t2 添加元表
    setmetatable(t2, metaT3)

    -- 给元表 metaT3 添加 元方法
    metaT3.__add = function (table1, table2)
        local result = {}

        -- 获取 参数 table 的元素个数
        local len1 = #table1
        local len2 = #table2

        -- 取出 长度 最大的 table 进行运算，确保所有的元素都会参与运算
        if len1 > len2 then
            len2 = len1
        end

        for i = 1, len2, 1 do
            local a = table1[i] or 0;
            local b = table2[i] or 0;
            result[i] = a + b
        end

        return result
    end


    t3 = t1 + t2
    for k,v in pairs(t3) do
        print(k,v);
    end
    --[[
        1	122
        2	244
        3	333
        4	444
        5	555
        6	33
    ]]
end
-- test01()

function testIndexKey()
    t1 = {
        id = 123,
        name = "jackie"
    }
    print(t1.age) -- nil

    function indexIsTableType()
        t1.age = 20
        meta = {
            __index = {
                age = 18
            }
        }
        print(t1.age) -- 20
        setmetatable(t1,meta)
        t1.age = nil
        print(t1.age) -- 18
    end
    indexIsTableType()

    function indexIsFunctionType()

        -- 设置 table 的key
        t1.phone = "t1_phone"

        meta = {
            __index = function (table, key)
                print(table, key)
                table[key] = "new-phone"
                return "index-phone"
            end
        }
        -- 如果table自己有key 就会直接返回 value ,不会关meta
        print(t1.phone) -- t1_phone
        setmetatable(t1, meta)
        print(t1.phone) -- t1_phone

        -- 如果table 没有对应的key,就会从__index 里去找
        t1.phone = nil
        print(t1.phone) -- index-phone

        -- 之所以这里会变成 new-phone 是因为 在__index函数里已经 给 t1 设置 key 了
        print(t1.phone) -- new-phone
    end
    indexIsFunctionType()
    

    
    
end
-- testIndexKey()

function testNewIndex()

    function helpUnderstandNewIndex()
        --[[
            __newindex 元方法用来对表更新，__index则用来对表访问 。
        ]]

        -- 当你给表的一个缺少的索引赋值，解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作。

        mymetatable = {}
        mytable = setmetatable({key1 = "value1"}, { __newindex = mymetatable })
        
        -- mytable 本身就有 key1 的元素，所以可以直接访问
        print(mytable.key1) -- value1
        
        -- newkey 不是 mytable 里的 key 索引,解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作
        mytable.newkey = "新值2"
        print(mytable.newkey, mymetatable.newkey) -- 输出为 ： nil	新值2
        
        mytable.key1 = "新值1"
        print(mytable.key1,mymetatable.key1) -- 新值1	nil

    end

    mytable = setmetatable({key1 = "value1"}, {
        __newindex = function (mytable, key, value)
            print("key == ",key, "value", value)
            -- 在不触发任何元方法的情况下 将 table[index] 设为 value。 table 必须是一张表， index 可以是 nil 与 NaN 之外的任何值。 value 可以是任何 Lua 值。 这个函数返回 table。
            rawset(mytable, key, "\""..value.."\"")
        end
    })

    mytable.key1 = "new value"
    mytable.key2 = 4 -- key == 	key2	value	4
        
    print(mytable.key1,mytable.key2)
    
end

-- testNewIndex()

function testNewIndex2()
    t1 = {name = "rose", age = 18}
    t2 = {}
    meta = {}
    setmetatable(t1,meta)

    function test1()
         -- 假设 meta 元表中没有 __newindex,在给 t1设置新的索引时，可以正常读取
         t1.phone = 12345
         print(t1.phone) -- 输出12345
    end
    -- test1()

    function test2()
        -- 给 meta 设置 __newindex的时候，会把新值 存储到 __newindex 索引中
        meta.__newindex = t2
        t1.phone = 12345
        print(t1.phone) -- 此时输出 为 nil
        -- 在看看 t2，由此可以证明 在给t1 设置新的index 的时候，其value 是存储在 __newindex 中的
        print(t2.phone) -- 12345 
    end
    test2()
   

    
end
-- testNewIndex2()

local function tableTest_a()
    local myTable = {}
    print("myTable的类型是：", type(myTable))

    myTable[1] = "Lua"

    myTable["wow"] = "修改前"

    -- print("index == .1 的值", myTable.1)
    print("myTable index == [1] 的值", myTable[1])

    print("myTable index == .wow 的值", myTable.wow)
    print("myTable index == [wow] 的值", myTable["wow"])


    local myTableb = myTable

    print("myTableb index == [1] 的值", myTableb[1])
    print("myTableb index == .wow 的值", myTableb.wow)
    print("myTableb index == [wow] 的值", myTableb["wow"])

    myTableb.wow = "修改后"

    myTable = nil

    -- print("myTable index == .wow 的值", myTable.wow)
    print("myTableb index == .wow 的值", myTableb.wow)

end
-- tableTest_a()


local function testTableConcat()
    local fruits = {"apple","banana","peach"}
    print(table.concat(fruits))
    print(table.concat(fruits,","))
end
-- testTableConcat()


-----------metaTable

