--[[

基本数据类型
    Lua 中有八种基本类型： nil、boolean、number、 string、function、userdata、 thread和table

    function 在lua 中一个基本的数据类型，是第一类值

    格式
    function funcName()
        ...
        ...
    end

    传参或返回值，都很自由

    function 可以作为参数被传递，也可以作为值被赋值给另一个变量

]]--

--c++
--void func1(int a,int b){}
--int func2(int a,int b){return a+b; }

--lua

function func1()
    print("这里是func1");
end

func1();


--传参
function func2(a,b,c)
    print(a,b,c);

end
func2(123,"abc",true);


function func3(a,b,c)
    return a,b,c,"dddd","eeee"
end

print(func3("abc",false,123));

--可变参
function func4(...)

end


--函数当右值
--把匿名函数赋值给变量
sum1 = function(a,b)
    return a+b;
end
print(sum1(1,2));

sum2=sum1;
print(sum2(11,22));


--当其它函数的参数
function func4(functionName,a,b)
    return functionName(a,b);
end

function func5(a,b)
    print(a,b);
end

print(func4(sum1,111,222));

func4(func5,111,222);
