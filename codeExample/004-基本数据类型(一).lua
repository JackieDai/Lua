--[[

基本数据类型
    Lua 中有八种基本类型： nil、boolean、number、 string、function、userdata、 thread和table

    number 包括整型和浮点型

    string 单引号，双引号都表示string，不管是单引号，双引号，单个字符多个字符
    转义 用反斜杠 \n 换行    \t 制表符
    原始输出用 [[  \] \]

    userdata 自定义数据格式
    thread   协程
    table   表

    在lua 中，只有false 和 nil 才表示假
    0和空串表示真


    库函数type返回一个描述给定值类型的字符串
    type (v)返回其唯一参数的类型，编码为字符串

]]--

a=0;
if a then
    print("真");
else
    print("假");
end

b='';
if b then
    print("真");
else
    print("假");
end

c=nil;
if c then
    print("真");
else
    print("假");
end

d=false;
if d then
    print("真");
else
    print("假");
end

--print(type(print));
--print(type(type));
--print(type({}));


--a="a\nb\nc\td\t\tef";
--print(a);
--b=[=[a\nb\nc\td\t\tef[[aaaaa]]]=];
---print(b);


--[[
--不管是单引号，双引号，单个字符多个字符
a="abc"
b='abc'
c='a'
d="a"
print(type(a));
print(type(b));
print(type(c));
print(type(d));
]]--

--[[
a=nil;
print(type(a));

print(type(true));
print(type(false));

print(type(123));
print(type(1.23));
print(type(1234567890));
]]--