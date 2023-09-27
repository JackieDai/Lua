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
    end
    -- indexIsFunctionType()
    

    
    
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

testNewIndex()