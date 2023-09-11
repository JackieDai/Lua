
--[[
    流程控制语句

    for 循环分为数值循环和泛型循环(类似于foreach)

    数值循环
    for 变量名=初始值,结束值,步长(默认值为1,可省略) do
        ...
    end


    泛型循环
    for k,v in 迭代函数(table) do   -- 此处 v 可以省略，k 不能少
        ...
    end


    迭代函数 ipairs，pairs

    ipairs 顺序遍历，中间的序号不会断开，遇到k=>v 直接跳过，遇到第一个nil 就会直接终止，一般情况下，用于数组类型的集合遍历
    pairs 遇到nil 会跳过，同时适用数组类型和k=>v 类型的集合，混搭也是没问题的，如果是混搭的时候，会优选获取数组类型数据

    pairs 的适用范围大于 ipars
    如果使用时不确定用哪个，就无脑pairs


]]--


--[[
t1={11,nil,"abc",22,"xyz",33,44,55,66,77};
for k,v in pairs(t1) do
    --print(k,v);
end

t2={id=123,name="tom",age=456,coutry="china",123,nil,"abc","xyz"};
for k,v in pairs(t2) do
    print(k,v);
end
]]--


--九九乘法表
for i=1,9 do

    for j=1,i do
        io.write(j,"*",i,"=",i*j,"\t");
    end

    io.write("\n");

end




--[[
t1={11,22,"xxx",33,"nil",44,55,66,key="vvv",77};
--for k,v in ipairs(t1) do
    --t1[k]=v*10;
--end


for k,v in ipairs(t1) do
    print(k,v);
end

]]--

--[[
for i=1,10 do
    io.write(i," ");
end
io.write("\n");
for i=1,10,2 do
    io.write(i," ");
end
io.write("\n");
for i=10,-10,-1 do
    io.write(i," ");
end
io.write("\n");
for i=10,1,-2 do
    io.write(i," ");
end

io.write("\n");
t1={11,22,33,44,55,66};
for i=1,6 do
    --io.write(t1[i]," ");
    t1[i]=t1[i]*10;
end

io.write("\n");
for i=6,1,-2 do
    io.write(t1[i]," ");
    --print(t1[i]);

end
]]--