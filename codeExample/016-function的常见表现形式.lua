

--function 进阶，常见的表现形式

function show(a,b)
    print(a,b);
end

--直接调用
show("abc",123);

--当右值，赋值给一个变量
func1=show;
func1("abc",123);

--匿名函数当右值
func2=function (a,b)
    print(a,b);
end

func1("abc",123);


---当参数
function func3(func,a,b)
    func(a,b);
end

func3(show,"abc",123);
func3(function (a,b) print(a,b); end,"abc",123);--匿名临时对象当参数

print("");

--当返回值
function func4()
    return func1;
end

rs1=func4();
rs1("abc",123);
func4()("abc",123);


--匿名函数当返回值
function func5()
    return function(a,b)
        print(a,b);
    end
end

rs2=func5();
rs2("abc",123);
func5()("abc",123);

print("");


--多返回值
function func6()
    function func6_son1(a,b)
        print("son1",a,b);
    end

    function func6_son2(a,b)
        print("son2",a,b);
    end

    return
        func6_son1,
        func6_son2,
        func1,
        function (a,b)
            print("son-last",a,b);
        end
        ;
end

rs3,rs4,rs5,rs6=func6();
rs3("abc",123);
rs4("abc",123);
rs5("abc",123);
rs6("abc",123);



















