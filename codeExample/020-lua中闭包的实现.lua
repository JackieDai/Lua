
--[[

    闭包

    百度百科 https://baike.baidu.com/item/闭包/10908873

    闭包就是能够读取其他函数内部变量的函数。
    例如在javascript中，只有函数内部的子函数才能读取局部变量，所以闭包可以理解成“定义在一个函数内部的函数“。
    在本质上，闭包是将函数内部和函数外部连接起来的桥梁。

    lua
    当一个函数内部嵌套另一个函数定义时，内部的函数体可以访问外部的函数的局部变量，
    这种特征在lua中我们称作词法定界。
    虽然这看起来很清楚，事实并非如此，
    词法定界加上第一类函数在编程语言里是一个功能强大的概念，很少语言提供这种支持。

    个人理解
    闭包就是指一种编码方式，一种思想，而不是指某种具体的技术或函数或库

    lambda 表达式，经典的闭包表现方式之一

]]--

local function func1(a,b)
    local x=0;
    local y=0;
    return function()
        x=x+1;          -- 类似于static 属性
        print(a,b,x,y);
    end

end


--func1("abc",123)();

---如果学过面向对象，这里很好理解
---

tmpFunc = func1("abc",123);
tmpFunc();
tmpFunc();
tmpFunc();

tmpFunc3=tmpFunc;
tmpFunc3();

print("");

tmpFunc2 = func1("abc",123);
tmpFunc2();
