
--[[

    table
        array
        hash
]]--

--自定义下标 -- 不建议这样使用
--[[
t1={11,22,33};
t1["dfdsdf"]=555;
for k,v in ipairs(t1) do
    print(k,v);
end
print("");
for k,v in pairs(t1) do
    print(k,v);
end
]]--

--[[
t1={};
for i=-4,4 do
    t1[i]=i*10;
end

for k,v in ipairs(t1) do
    print(k,v);
end
print("");
for k,v in pairs(t1) do
    print(k,v);
end
]]--


--二维数组

--[[
x={11,22,33};
y={44,55,66};

t1={
    {11,22,33},
    {44,55,66}
};

for i=1,2 do
    for j=1,3 do
        print(i,j,t1[i][j]);
    end
    print("");
end
print("");print("");
for k,v in ipairs(t1) do
    for k2,v2 in ipairs(v) do
        print(k,k2,v2);
    end
    print("");
end

]]--

--[[
t1={};
for i=1,3 do
    t1[i]={};
    for j=1,2 do
        t1[i][j]=i*j*10;
    end
end



for k,v in ipairs(t1) do
    for k2,v2 in ipairs(v) do
        print(k,k2,v2);
    end
    print("");
end

]]--


--table.concat(list, sep, i, j)  将数组中的元素拼接成一个字符串
--table.remove(list, pos) 删除数组中元素，默认删除最后一个
--table.insert(list, pos, value) 向指定位置插入元素，默认插入到最后
--table.sort(list, comp) 数组排序，默认从小到大，可自定义排序规则
--table.move(a1, f, e, t, a2) 把数组a1中的元素往a2中拷贝

t1={"abc","DEF","xyz","123","456"};
print(table.concat(t1,"--"));
table.remove(t1,2);
print(table.concat(t1,"--"));

table.insert(t1,2,"123456");
print(table.concat(t1,"--"));

table.sort(t1);
print(table.concat(t1,"--"));

function func1(a,b)
    return a>b;
end
table.sort(t1,func1);
print(table.concat(t1,"--"));

print("\n");
t2={"a","b"};
table.move(t1,1,2,3,t2);--把t1 里面的元素拷贝到t2 中
print(table.concat(t1,"--"));
print(table.concat(t2,"--"));

