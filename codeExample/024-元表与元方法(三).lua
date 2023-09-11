
--[[

    元表 metatable

        __tostring  用函数接管本表的返回值 返回一个string
        __call      把表当类处理，此处类似于类中的构造函数，可传值，本表是第一个参数

        rawget(table, index)  取本表中的index 索引对应的值，不受元表干扰，没有就返回nil;
        rawset(table, index, value)  给本表添加元素，不受元表干扰

]]--


t1={id=123,name="tom"};
meta={};
setmetatable(t1,meta);

--print(t1,t1.phone);


meta.__tostringXX=function(t)

    str="";
    for k,v in pairs(t) do
        str = str..k..":"..v.."; ";
    end

    --t["phone"]=123456;
    --print("这里是 tostring");
    return str;
end

--print(t1);
--print(t1.phone);--在上一句执行完之后，才有phone 字段


--类似于构造函数
meta.__call=function(t,...)
    --print(t);
    --print(...);
    --local t2={...};
    --for k,v in pairs(t2) do
    --    print(k,v);
    --end

end

--print("");
--t1(1,"a",2,"b");




t2={id=123,name="tom"};
t3={};

--print(t2.id);
--print(t2.phone);
--print("");
meta2={
    --__index={phone=123456;}
    --__index=function(t,k)
    --    print(t,k);
    --    return "index func";
    --end,
    __newindex=t3

};
setmetatable(t2,meta2);
--print(t2.id);
--print(t2.phone);
--print("");
--print(rawget(t2,"id"));
--print(rawget(t2,"phone"));--取本表值

print(t2.country);
t2.country="china";
--rawset(t2,"country","china");

print(t2.country,t3.country);

