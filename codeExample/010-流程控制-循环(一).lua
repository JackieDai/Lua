
--[[
    流程控制语句

    while 条件 do
        ...
    end


    repeat
        ...
    until 条件;

    while 和 repeat 的区别
        while 循环中，当条件不成立时，结束循环
        repeat 循环中，当条件成立时，结束循环



    没有 continue

    break 只能跳出一重循环
    goto FLAG  语句 跳转到指定标记处，也可用于跳出循环，FLAG是一个标记位，相当于一个锚点

    两者区别是
        break 只能跳出当前循环，而goto 可以跳转到指定位置，这样可以忽略一些代码

    在lua 中，没有这些运算符 i++, i--, ++i, --i, +=, -=

    a=b=1 这种写法会出错，不能连续赋值

]]--



--求和 1+2+3+...100    5050

i,sum=0,0;

while i<100 do

    if i>49 then
        goto FLAG;
        --break;
    end

    i=i+1;
    sum=sum+i;

end



print(i,sum);

print("111111");

::FLAG::
print("222");


i,sum=0,0;
repeat
    i=i+1;
    sum=sum+i;
until i>=100;

print(i,sum);