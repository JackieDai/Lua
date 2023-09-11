
--[[

        多重继承

]]--

--[[
grandfather={id=123,name="grandfather"};
grandfather.__index=grandfather;

father={name="father"};
father.__index=father;
setmetatable(father,grandfather);

son={name="son"};
setmetatable(son,father);


print(grandfather.id);--找自己有没有 id 这个索引，有，直接发返回123
print(father.id);--先找自己，没有 id 这个索引，所以看有没有元表，元表是 grandfather，然后去找 grandfather的 __index，找到，所以返回123

print(son.id);--先找自己，没有 id 这个索引，所以看有没有元表，元表是 father,然后去找 father的 __index，
                -- father.__index 里面也没有 id 这个索引，但是 father.__index 有元表，是 grandfather
                -- 所以去找 grandfather.__index 里面有没有 id 这个索引，有，所以返回123

print(grandfather.name,father.name,son.name);
]]--



userInfo={id=123,name="tom",age=99};


function userInfo:new(obj)
    obj=obj or {};
    setmetatable(obj,self);---谁调用new 方法，此处的 self 就是谁
    self.__index=self;
    return obj;
end


u3=userInfo:new({id=456});

print(userInfo.id,u3.id);
print(userInfo.name,u3.name);


u4=u3:new({id=789,name="u4u4u4"});
print(u4.id,u4.name);--这里出不来的原因是，u3 没有 __index

u5=u4:new();
print(u5.id,u5.name,u5.age);






