

function functionTest()
    -- 匿名函数
    sum = function (a, b)
        return a + b
    end

    print(sum(1,2)) -- 3

    -- 匿名函数作为返回值
    function func1()
        return function (a, b)
            return a * b
        end
    end

    print(func1()(2,3)) -- 6

    -- 多返回值
    function func2()
        function func2_add(a,b) 
            return a + b
        end

        function func2_substract(a,b) 
            return a - b
        end

        function func2_mulity(a,b) 
            return a * b
        end

        function func2_divide(a,b) 
            return a / b
        end

        return func2_add, func2_substract, func2_mulity, func2_divide
        
    end

    -- 调用，并接受 返回的函数
    a,b,c,d = func2()

    print(a(1,2)) -- 3
    print(b(1,3)) -- -2
    print(c(2,3)) -- 6
    print(d(4,2)) -- 2

end

function functionInTable()

    function show(a)
        print(a);
    end

    t1 = {
        t1_show = show,
        add = function (a,b)
            return a + b
        end
    }

    t1.sub = function (a,b) 
        return a - b
    end

    t1["mult"] = function (a,b)
        return a * b
    end

    t1.t1_show("hello lua") -- hello lua

    result = t1["add"](1,2)
    -- 3
    t1["t1_show"](result)

    result2 = t1.mult(2,3)
    -- 6
    t1.t1_show(result2)
    
end


functionInTable()