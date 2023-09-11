
--[[
    流程控制语句

    goto FLAG  语句 跳转到指定标记处，也可用于跳出循环，FLAG是一个标记位，相当于一个锚点

    代码块(作用域)  do ... end

    flag 不可见原则
    1 不能从外面 goto 到代码块里面，因为代码块里面的flag，对于外面的 goto来说，是不可见的
    2 不能跳出或跳入一个函数，因为函数也是一个block(块)
    3 不能跳入本地变量(local)作用域


]]--


do

    a=123;
    ::FLAG1::;
    print(a);
    ::FLAG2::;
    goto FLAG1;--此处goto 是在 local b 的作用域外面，所以报错

    local b=456;

    ::FLAG3::;
    print(b);
    --goto FLAG1;--此处goto 是在 local b 的作用域里面

end

--print(a);
--print(b);



--[[
function func1()

    ::FLAG1::;
    print("func1--11");
    print("func1--22");
    goto FLAG3;
    ::FLAG2::;

    print("func1--33");
    ::FLAG3::;

end

::FLAG4::;
print("aaaa");
func1();

::FLAG5::;

print("bbb");

]]--



--[[
print("1234");
goto FLAG1;

do
    print("a");
    print("b");

    ::FLAG1::;

    print("c");
    print("d");

    ::FLAG2::;

end

::FLAG3::;

print("aa");
print("bb");

::FLAG4::;

print("cc");
print("dd");

]]--

--死循环
--[[
i=0;
::FLAG1::;

    print(i);
    i=i+1;

goto FLAG1;
]]--


