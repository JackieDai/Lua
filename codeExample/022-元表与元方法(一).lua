
--[[

    元表 metatable

        元表并不是一个普通的表，而是一套自定义的计算规则，用这些规则，可以实现表与表之间的运算
        而这些规则，都以函数的方式，写在元表中，所以又称为元方法(就是写在元表里面的方法)

        起到一个类似于其它语言中的运算符重载的作用


        setmetatable(table, metatable) -- 将 metatable 设为 table 的元表，其返回值为table

]]--

t1={11,22,nil,nil,nil,33};
t2={111,222,333,444,555};
metatT3={};

setmetatable(t1,metatT3);
setmetatable(t2,metatT3);

metatT3.__add=function(t1,t2)
    local rs={};

    local len1=#t1;
    local len2=#t2;

    if len1 > len2 then
        len2=len1;
    end

    for i=1,len2 do
        local a=t1[i] or 0;
        local b=t2[i] or 0;
        rs[i]=a+b;
    end
    return rs;
end

metatT3["__eq"]=function(t1,t2)

    if #t1 ~= #t2 then
        return false;
    end

    for i=1,#t1 do
        if t1[i] ~= t2[i] then
            return false;
        end
    end

    return true;


end


t3=t1+t2;
--print(t3);

for k,v in ipairs(t3) do
    print(k,v);
end

t11={1,2,3};
t22={1,2,3};


--在lua 中，我们认为nil 是无效的，所以如果nil 在 表的最后，就直接扔掉，
--如果nil 后面有其它非nil 的元素，不得己必须得带着
--print(#t22);

setmetatable(t11,metatT3);
setmetatable(t22,metatT3);


print(t11 == t22);


--[[
metatT4={
    __add=function(t1,t2)
        local rs={};

        local len1=#t1;
        local len2=#t2;

        if len1 > len2 then
            len2=len1;
        end

        for i=1,len2 do
            local a=t1[i] or "";
            local b=t2[i] or "";
            --print(a,b);
            rs[i]=a..b;
        end
        return rs;
    end
}

t4={"abc","def","xyz"};
t5={11,22,33,"ABC"};
setmetatable(t4,metatT4);
setmetatable(t5,metatT4);
t6=t4+t5;
print("")
for k,v in ipairs(t6) do
    print(k,v);
end
]]--


