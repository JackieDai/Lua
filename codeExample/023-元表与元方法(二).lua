
--[[

    元表 metatable

        __index
            当在一个表中，去取某个key
                如果该表中有对应的key，就直接返回
                如果没有
                    看有没有元表
                        没有元表，返回nil
                        有元表
                            看元表中有没有__index
                                没有，返回nil
                                有
                                    如果__index 是个表,
                                        并且有key, 返回值
                                            没有key, 返回nil

                                     如果 __index 是个function
                                        则直接调用该function ，且表和key 都会作为该function 的参数


        __newindex
            如果是表，则在本表里面设一个没有的key的时候，会写到__newindex 对应的表中,而不会写本表
                     如果本表中有key,则更新本表，不会管元表

            如果是function,则直接调用，且本表，key,value 都可作参数
]]--


t1={id=123,name="tom"};

t2={};
meta={
    --__newindex=t2;

    __newindex=function(t,k,v)
        --print(tostring(t).." 被写入 "..k.." : "..v);
        --t[k]=v; --stack overflow 死递归，爆栈了
        rawset(t,k,v);--调用原生方法，不调用重载的方法
    end

};

setmetatable(t1,meta);

--print(t1.phone);
t1["phone"]="t1-phone";--当有__newindex 的时候，就写到对应的__newindex 的表中去了
print(t1.phone);

print(t2.phone);

--meta.__index=t2;
--print(t1.phone);


--[[
t1={id=123,name="tom"};
meta={

    --__index={phone="index_phone"};
    __index=function(t,k)
        --print(t,k);
        t[k]="new-phone";
        return "index-phone";
    end
};

setmetatable(t1,meta);



print(t1.phone);--index-hone
print(t1.phone);--new-hone

]]--

--[[
print(t1.phone);--没有key,没有元表 nil

t1.phone="t1_phone";--有key,不管元表，直接返回
print(t1.phone);


setmetatable(t1,meta);--设置元表,但没有__index;

print(t1.phone);--还是取自己的key

meta.__index={phone="index_phone";};  --元表设置__index;

print(t1.phone);--还是自己的key

t1.phone=nil;--把自己的key 去掉，则会去拿元表

print(t1.phone);--

]]--