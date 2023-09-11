print("Hello Lua 123")

-- 数据类型
print(type("Hello world")) --      --> string
print(type(10.4*3)) --             --> number
print(type(print)) --              --> function
print(type(type)) --               --> function
print(type(true)) --               --> boolean
print(type(nil)) --                --> nil
print(type(type('X'))) --            --> string


--[[ 函数返回两个值的最大值 --]]

-- 调用函数

function max( argument1, argument2)

    if argument1 > argument2 then
        result = argument1
        else
            result = argument2
    end

end

print("两值比较最大值为 ",max(10,4))
print("两值比较最大值为 ",max(5,6))