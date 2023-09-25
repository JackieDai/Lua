

-- 处理函数的可变参数


-- 方式一 ，使用 select 处理函数的可变参数

--[[
    用select 处理函数可变参数
    --select(n, ...) 表示获取可变参数的一部分数据，行第n个位置开始
    --select("#",...) 表示获取可变参数的元素个数

    --
    ---如果 `index` 是个数字， 那么返回参数中第 `index` 个之后的部分； 负的数字会从后向前索引（`-1` 指最后一个参数）。 否则，`index` 必须是字符串 `"#"`， 此时 `select` 返回参数的个数。
    ---
    ---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-select"])
    ---
    ---@param index integer|"#"
    ---@param ...   any
    ---@return any
    ---@nodiscard
    function select(index, ...) end
]]

-- 求和
function func1(...)
    sum = 0
    count = select("#",...)
    print("count", count)
    for i = 1, count, 1 do
        result = select(i,...)
        print(type(result)) -- number 类型
        print("result ==" ,result) -- 参考多参数返回，指的只接受 一个
        print("select(i,...) ==" ,select(i,...))
        sum = sum + result
    end

    print("sum == ",sum)

    
end

-- func1(1,2,3,4)

function verifySelectFromIndex()

    --[[
select(n,...) --> 返回的是多个参数，而不是一个table
arg = select(n,...) --> 只是接收了第一个参数，参考<多返回值>部分
    ]]
    arg = select(1, 1, 6, 8, 8, 9) --> 相当于arg = 1, 6, 8, 8, 9
    print(arg)  --> 输出为：6
    print(type(arg)) --> 输出为：number（验证了是多返回值的第一个number，而不是打印arg第一个参数的类型table）
    print(select(1, 1, 6, 8, 8, 9))  --> 输出为：1  6    8    8    9
end

-- verifySelectFromIndex()


-- 方式二 用 pack 处理可变参数
--[[
---用pack 处理函数可变参
---table.pack(...) 将可变参打包成一个table，**且会在最后多出一个n键，其对应的值是可变参的参数个数**
---table.unpack(list, i, j) 解包，将table 解成可变参

]]

function func2()
    t2 = table.pack(11,22,33,44,55)
    for key, value in pairs(t2) do
        io.write("key == ",key, "\t")
        io.write("value == ",value, "\n")
    end

    --[[
        上述for 循环输出的结果

        key == 1	value == 11
        key == 2	value == 22
        key == 3	value == 33
        key == 4	value == 44
        key == 5	value == 55
        key == n	value == 5
    ]]

    return t2
end
-- func2()

function testFunc2()
    result = func2()
    print(type(result)) -- table 类型
    print(table.unpack(result)) -- 输出结果 11	22	33	44	55

    a,b,c,d,e = table.unpack(result)
    print(a,b,c,d,e) -- 11	22	33	44	55

end
-- testFunc2()


function func3(...)
    print(table.pack(...).n) -- 4
    t1 = table.pack(...)
    sum = 0;

    for key, value in pairs(t1) do
        --[[
            这样计算有问题，因为 pack 会在最后多出一个n键，其对应的值是可变参的参数个数
        print("key == ",key)
        print("value == ",value)
        sum = sum + value
        ]]


        if key ~= "n"  then
            print("value == ",value)
            sum = sum + value
        end
    end
    --[[
        上面的for 循环 会输出
        value == 	1
        value == 	2
        value == 	3
        value == 	4
    ]]

    print(sum) -- 10

end

-- func3(1,2,3,4)


--- 可变参转成table
function func4(...)
    t1 = {...}
    count = #t1
    print(count) -- 4
    
    for key,value in pairs(t1) do
        io.write("key == ",key, "\t")
        io.write("value == ",value, "\n")
    end

    --[[ 输出结果如下
        key == 1	value == 1
        key == 2	value == 2
        key == 3	value == 3
        key == 4	value == 4
    ]]
end

func4(1,2,3,4)



