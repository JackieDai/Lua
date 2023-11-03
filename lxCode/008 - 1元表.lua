local function testMetaTable01()
    -- 普通表
    local mytable = {}

    print("mytable: == ",mytable)

    -- 元表
    local metaTable = {}

    print("metaTable: == ",metaTable)


    -- 把 metaTable 设为 mytable 的元表
    setmetatable(mytable, metaTable)


    local result =  getmetatable(mytable)

    print("result: == ",result)

    ----------

    -- 上面的写法也可以 简化成
    local mytable1 = setmetatable({},{})




end

-- testMetaTable01()

-- __index 元方法

local function testMetaTable02()
    -- testMetaTable01() ye

    local other = { foo = 3 }
    --[[
        如果__index包含一个表格，Lua会在表格中查找相应的键。
    ]]
    local t = setmetatable({},{ __index = other} )
    print(t.foo)

    print(t.bar)
    
end

-- testMetaTable02()

--[[
    如果__index包含一个函数的话，Lua就会调用那个函数，table和键会作为参数传递给函数。

    __index 元方法查看表中元素是否存在，如果不存在，返回结果为 nil；如果存在则由 __index 返回结果。
]]

local function testMetaTable03 ()
    local mytable = setmetatable({key1 = "value1"},{
        --[[
            note:
            __index 表示 对 table 的访问，类似于 OC/swift 中的 getter 方法
        ]]
        __index = function (t, k)
            if k == "key2" then
                return "metableValue"
            else
                return nil
            end
        end
    })

    print(mytable.key1,mytable.key4)

end
-- testMetaTable03()


local function testMetaTable04()
    --[[
        __newindex 元方法用来对表更新，__index则用来对表访问 。

        当你给表的一个缺少的索引赋值，解释器就会查找__newindex 元方法：如果存在则调用这个函数而不进行赋值操作。
    ]]

    local metaTable = {}
    local mytable = setmetatable({key1 = "value1"},{__newindex = metaTable})

    print(mytable.key1) -- value1

    mytable.newkey = "新值2"
    print(mytable.newkey, metaTable.newkey) -- nil	新值2

    mytable.key1 = "新值1"
    print(mytable.key1, metaTable.key1) -- 新值1	nil


end

-- testMetaTable04()

local function testMetaTableNewIndex()

    local myMetaTable = {}

    local myTable = setmetatable(
        {key1 = "value1"},
        {__newindex = myMetaTable}
    )

    print(myTable.key1, myMetaTable.key1) -- value1	nil

    --[[
        - 给table = {key1 = "value1"} 设置了元表，并给元表中设置了元方法 __newindex

        - 在给新索引·newKey·赋值时，会调用元方法，而不进行赋值操作。

        - 而 如果对已经存在的索引键进行赋值操作，则不会调用元方法__newindex

    ]]
    myTable.newKey = "value2"
    print(myTable.newKey, myMetaTable.newKey) -- nil	value2

    myTable.key1 = "value3"
    print(myTable.key1, myMetaTable.key1) -- value3	nil
    
end
-- testMetaTableNewIndex()


local function testMetaTableNewIndexRawset()

    local originTable = {key1 = "value1"}

    local metaTable = {
        __newindex = function (table,key,value)
            print("__newindex trigger")
            -- print(table.key1,key,value)
            print("__ newindex arg: table address == ",table)

            --[[
                在不触发任何元方法的情况下 将 table[index] 设为 value。 table 必须是一张表， index 可以是 nil 与 NaN 之外的任何值。 value 可以是任何 Lua 值。 这个函数返回 table。
            ]]
            rawset(table,key,value)
        end
    }

    local myTable = setmetatable(originTable,metaTable)

    print("myTable.key1 == ",myTable.key1)

    myTable.key1 = "new value1"
    print("myTable.key1 == ",myTable.key1)

    myTable.key2 = "value2"
    print("myTable address == ",myTable)
    print("originTable address == ",originTable)

    print("myTable.key2 == ",myTable.key2)

end

testMetaTableNewIndexRawset()