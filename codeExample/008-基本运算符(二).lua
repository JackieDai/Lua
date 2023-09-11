

--[[

    逻辑运算符
        逻辑与 and, 逻辑或 or, 逻辑非 not
        &&, ||, !

        在lua 中，逻辑运算与其它语言的逻辑运算不是同一个意思，其运算结果返回值是参与运算的变量之一(not 除外，not 只返回true 或 false)
        其它语言的逻辑运算，返回值是0 或 1(false 或 ture)，意思就是返回一个bool 值

        在lua 中，只有 nil(null,NULL) 和 false 为假，其它都为真(包括空串或0值)

        对于and 和 or，实行短路运算(又称短路规则，短路求值，就是说，当前面的表达式可以返回时，就直接返回，不管后面的表达式)

]]--

--[[
a,b=1,2;
print(a and b);--如果a 为真，则返回b

a=nil;
print(a and b);--如果a 不为真，则返回a，不再往后运算(不管b是啥)
print("\n");

c,d=1,false;
print(c or d);--如果 c 为真，则返回c，不再往后运算(不管d 是啥)

c=nil;
print(c or d);--如果 c 不为真，则返回d

print("\n");
e,f=1,2;
--print(e not f); --错误写法
print(not e);--如果e为真，则返回假

f=false;
print(not f);--如果f 为假，则返回真
]]--


--用or 设置默认值
function func1(a,b)
    a= a or 10;
    b = b or 100;
    print(a,b);
end

--func1();
--func1(1,2);




--实现三目运算 d=a?b:c      如果 a 为真，则取b,否则取c

a,b,c=1,2,3;
d=(a and b) or c;
print(d);

a=false;
d=(a and b) or c;
print(d);

print("\n");
A,B,C=1,2,3;
B=false;
D=(A and B) or C;
print(D);

E=((A and {B}) or {C})[1];--这里才是一个合格的三目运算
print(E);