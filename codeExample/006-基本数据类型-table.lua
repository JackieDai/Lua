--[[

基本数据类型
    Lua 中有八种基本类型： nil、boolean、number、 string、function、userdata、 thread和table

    table 表，不是指数据库中的表，而是一种数据类型，类似于map，用k-v的方式来表现，理论上来讲，除了nil，其它字符都可以作为k 值(索引值)

    格式

    类似于hash
    tableName={
        k=v,
    }

    类似于数组 -- 下标是从1开始
    tableName={v,v,v}

    可以用hash 格式和 array 格式混搭


    for 循环遍历
    for k,v in pairs(tableName) do
       print(k,v);
    end


    c++ 中  pairs 是对组


    循环嵌套
    for k,v in pairs(info3) do
        print(k,"===",v);
        if type(v)=="table" then
            for k2,v2 in pairs(v) do
                print("\t",k2,"===",v2);
            end
        end

    end


]]--


--[[
info={
    id=123,
    name="tom",
    sex=false
};

for k,v in pairs(info) do
   print(k,"===",v);
end
print("\n");

--print(info.id);
--print(info["id"]);


--增加字段
info.age=123;
info["coutry"]="china";

--删除字段
--info.sex=nil;
info["sex"]=nil;

--修改
info["name"]="jerry";
info.id=789;

for k,v in pairs(info) do
    print(k,"===",v);
end
]]--


--[[
info2={"abc",123,true};

for k,v in pairs(info2) do
    print(k,"===",v);
end
print("\n");

--增加
info2[33]=33;

--修改
info2[2]="222";

--删除
info2[1]=nil;
for k,v in pairs(info2) do
    print(k,"===",v);
end

]]--


info3={
    name="tom",
    age=123,
    sex=false,
    111,
    "222",
    {"abc","def",789,son_k_1="son-key-1"},
    son2={son2_k_1="son2-key-1",name="son2",false,"abc-son2",123456},
    country="china",
    3333
};

for k,v in pairs(info3) do
    print(k,"===",v);
    if type(v)=="table" then
        for k2,v2 in pairs(v) do
            print("\t",k2,"===",v2);
        end
    end
end
print("\n");

--修改
info3[3][2]="DEF";
info3[3]["son_k_1"]="SON-KEY-1";

info3["son2"][1]=true;
info3["son2"]["name"]="SON2";

--删除
info3.sex=nil;
info3[1]=nil;
info3[2]=nil;

info3[3][1]=nil;
info3[3]["son_k_1"]=nil;

info3["son2"][2]=nil;

---info3["son2"]=nil;

--增加
info3[3][33]="3333---";
info3[3]["33"]="3333++++";

--print(info3[3]["33"]);

for k,v in pairs(info3) do
    print(k,"===",v);
    if type(v)=="table" then
        for k2,v2 in pairs(v) do
            print("\t",k2,"===",v2);
        end
    end
end