--[[
    lua 中变量是弱类型，其类型取决于赋值的类型
    同一个变量，可以随时切换成不同的数据类型
    多重赋值

    ‘’=‘’ 赋值运算符 

    算数运算符
    +，-，*，/，%，指数^  

    关系运算符：关系运算符的结果只能是 true, false,且只能在相同类型的数据之间进行运算(##运算时不会做隐士类型转换##)
    ==
    ~= [不等于,这里不同于其他语言]
    >
    <
    >=
    <=

    对象类型的数据(function， userdata, table) 的比较的是其 引用(地址 )

    **逻辑运算符**
        逻辑与 and  [类似其他语言&&]
        逻辑或 or   [类似其他语言||]
        逻辑非 not  [类似其他语言！]

    在lua 中，逻辑运算与其它语言的逻辑运算不同，其运算结果返回值是参与运算的变量之一(not 除外，not 只返回true 或 false)
        其它语言的逻辑运算，返回值是0 或 1(false 或 ture)，意思就是返回一个bool 值

        在lua 中，只有 nil(null,NULL) 和 false 为假，其它都为真(包括空串或0值)

        对于and 和 or，实行短路运算(又称短路规则，短路求值，也就是，当前面的表达式可以返回时，就直接返回，不管后面的表达式)
]]

-- 

function andOperation()
    a, b = 1, 2

    -- 类似其他语言的 &&

    -- 如果 a 为 真，返回 逻辑表达式 返回 b 的值
    print(a and b) -- 2

    a = nil
    -- 如果 a 为 假，返回 a 的值，不再继续计算，不管b是啥


    --[[

        A && B

        假设 A 为 false, 该(A && B)表达式 一定为 false ,所以返回 A 就可，

        假设 A 为 真， 该(A && B)表达式 的值 也就 是 B 的值，

    ]]

    print(a and b) --nil
end
-- andOperation()

function orOperation()
    c,d = 1,false
    -- 如果c 为真，则返回 c,不管后面是啥，都不会参与逻辑运算
    print(c or d) -- 1

    c = nil
    -- 如果 c 不为真，则返回 d 
    print(c or d) -- false

    --[[

        A || B

        假设 A 为 ture, 该(A || B)表达式 一定为 true ,所以返回 A 就可，

        假设 A 为 false， 该(A || B)表达式 的值 也就 是 B 的值，

    ]]
end
-- orOperation()

function notOperation()
    e,f = 1,2
    -- print(e not f); 这是 错误的语法： expression cannot be used as a statement

    -- 如果 e 为 真， not e 返回 false
    print(not e) -- false

    -- 如果 f 为假， not f 返回 ture
    f = false
    print(not f) -- true

    f = nil
    print(not f) -- true
    
end
-- notOperation()


function usageOfLoginOperation()
    -- 用 or 设置 默认值
    function func1(a, b)
        a = a or 10
        b = b or 100
        return a, b
    end    

    print(func1(false, nil)) -- 10	100

    print(func1(1, 2)) -- 1	2

    print(func1("a", "b")) -- a	b

    
end
-- usageOfLoginOperation()

--[[
    lua中没有 三目运算
]]

function tenaryOperation()
    a,b,c = 1,2,3

    d = (a and b) or c
    print(d) --2

    a = false
    d = (a and b) or c
    print(d) --3


    A,B,C = 1,2,3
    B = false
    D = (A and B) or C
    print(D) -- 3

    -- 正确的 三目运算表达  ???? 不是很清楚  为什么  结果为  false 是正确的 三目？
    E = ((A and {B}) or {C})[1] --- false
    print(E)
end
tenaryOperation()