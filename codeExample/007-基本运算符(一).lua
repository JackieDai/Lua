

--[[

    赋值=
    lua 中变量是弱类型，就是说变量名是没有类型的，其类型取决于所赋的值，并且，同一个变量，可以随时切换成不同的数据类型
    多重赋值
    a,b=b,a  值交换   类似于swap


    算术运算符
    加+,减-,乘*,除/,取模%,指数(次方)^


    关系运算符
    等于==, 不等于~=, 大于>, 小于<, 大于或等于>=, 小于或等于<=
    关系运算符的运算结果只能是true 或 false，且只能在相同类型的数据间运算(运算时不会做隐式类型转换)

    对于对象型的数据(function,userdata,table)，比较运算是比较其引用


]]


info1={a='a',b='b'};
info2={a='a',b='b'};
info3=info1;

print(info1 == info2);--false 比较的是引用
print(info1 == info3);--true 比较的是引用

print(info1.a == info2.a);--true 比较的是值

print(info1.a);
info3.a='aaa';
print(info1.a);


--print(1==1);
--print(1 == "1");--false
--print(1 >= '1');--报错，语法错误

--print(1+'1');--做了隐式类型转换
--print(1+'a');--隐式类型转换失败

--a=1;
--b=2;
--print(a~=b);








--print(10%3);
--print(2^10);



--[[

a,b=1,2;
print(a,b);
a,b=b,a;
print(a,b);

]]--
--a,b,c,d=1,"abc",false,{12};
--a,b,c,d=1,2,3;
--print(a,b,c,d);

--[[
a=1;
b=2;
c=a;
c="string";
c=true;
print(a,b,c);
]]--
