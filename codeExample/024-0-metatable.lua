--[[
    Lua 元表
    Metatable 允许改变table的行为。每个行为关联了对应的 元方法
]]

function test01()
    t = {}

    print(getmetatable(t)) --> nil

    --[[
        lua 在创建表的时候,默认的元素是 nil, 没有元表
        我们可以使用下面的方式来给一个表添加元表
    ]]

    mt = {}
    setmetatable(t, mt)
    print(getmetatable(t)) -- table: 0x7fdcde70a810
    print(mt)   -- table: 0x7f8e67f0a470

end

-- test01()

--[[
    使用 元表来定义 两个表的相加操作
]]

function test02()
    t1 = {10, 20}
    t2 = {30, 40}
    mt = {
        __add = function (a, b)
            local res = {}
            local k = 1
            for _, value in ipairs(a) do
                res[k] = value
                k = k + 1
                print(k ,":", value)
            end

            for _, value in ipairs(b) do
                res[k] = value
                k = k + 1
                print(k ,":", value)
            end

            return res
        end,
        __tostring = function (t)
            local res = ""
            for index, value in ipairs(t) do
                print("index == ",index, "value == ",value)
                res = res .. index .. ':' .. value .. '\n';
            end
            return res
            
        end
    }

    setmetatable(t1, mt)
    setmetatable(t2, mt)
    t3 = t1 + t2
    print(t3)

    setmetatable(t3,mt) 
    print(t3)

    
end

-- test02()

function indexFunc()
    --[[
        当所访问的表中 key 不存在的时候，会触发__index元方法，if 不存在， return nil，
    ]]

    table1 = {foo = 3}
    metaTable = {}
    -- metaTable.__index = function ()
    --     return "__index, when key is not exist. return nil"
    -- end

    metaTable.__index = {dds = 333}
    setmetatable(table1, metaTable)
    print(table1.foo)
    print(table1.dds)

    
end
-- indexFunc()
-- __nweIndex指向 table
function newIndexFunc()
    local table1 = {bb=2}
    local table2 = {}
    setmetatable(table1, table2)
    -- 注意此处 将 __newindex指向table 
    table2.__newindex = table2
    table1.bb = 12
    table2.aa = 10
    print('table1.bb=', table1.bb)
    print('table1.aa=', table1.aa)
    print('table2.aa=', table2.aa)

    --[[
        当对表中不存在的key进行赋值时，如果这个表有__newIndex元方法，则分为两种情况
        - __newindex指向table
            - 对查询表赋值的时候 key 存在的 则对查询表 key进行赋值
            - 查询表不存在 key, 则赋值给 __newindex 指向的key进行赋值
    ]]
    
end
-- newIndexFunc()

-- newIndex指向函数
function newIndexToFunc()
    local table1 = { bb = 2 }
    local table2 = {}
    setmetatable(table1, table2)
    table2.__newindex = function(table1, key, value)
        -- print(table1, key, value)
        rawset(table1,key,value)
    end
    table1.bb = 11
    table1.aa = 11
    print('table1.aa=', table1.aa)
    print('table1.bb=', table1.bb)
end
newIndexToFunc()