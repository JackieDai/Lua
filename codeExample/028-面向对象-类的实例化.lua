
--[[

    类 class
    对象   new class()
    继承，构造，析构

    table {}
    metatable {}

]]--

userInfo={id=123,name="tom",age=99};

userInfo.__index=userInfo;

u1=userInfo;
u2=u1;

function userInfo:new(obj)
    obj=obj or {};
    setmetatable(obj,self);
    return obj;
end

function userInfo:setAge(val)
    self.age=self.age+val;  --取 userInfo 的age + val,再写给u3
end

u3=userInfo:new({id=456});

print(u2.age,u3.age);
u3:setAge(100);
print(u2.age,u3.age);--99 199


--[[
print(u2,u3);
print(u2.id,u3.id);
u2.id=789;
print(u2.id,u3.id);
]]--


--[[
print(u2.name,u3.name);
userInfo.name="jerry";
print(u2.name,u3.name);

u3.name="tom";  ---__newindex
print(u2.name,u3.name);

userInfo.name="lucy";
print(u2.name,u3.name);

]]--