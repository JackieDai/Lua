
--[[

        重写
]]--

userInfo={id=123,name="tom",age=99};

function userInfo:new(obj)
    obj=obj or {};
    setmetatable(obj,self);---谁调用new 方法，此处的 self 就是谁
    self.__index=self;
    return obj;
end

function userInfo:say()
    print("userinfo say");
end


u1=userInfo:new();

u2=u1:new();

--userInfo -->  u1 --> u2

function u1:hello()
    print("u1-hello");
end

--userInfo.hello();
u1.hello();
u2.hello();


--[[
userInfo.say();
u1.say();
u2.say();
print("");

function u1:say()
    print("u1 say");
end



userInfo.say();
u1.say();
u2.say();
print("");

function u2:say()
    print("u2 say");
end
userInfo.say();
u1.say();
u2.say();
print("");
]]--


--[[

print(userInfo.id,u1.id,u2.id); -- 如果子类没有赋值，则默认用父类的值，同样，如果父类的成员或方法发生了改变，默认会影响子类，前提是子类没有特化

u1.id=456;--自 u1 以下，都会改变,这种，就算重写

print(userInfo.id,u1.id,u2.id);


u1.phone=123456;

print(userInfo.phone,u1.phone,u2.phone);

u1.phone=nil;
print(userInfo.phone,u1.phone,u2.phone);
u2.phone=654321;
print(userInfo.phone,u1.phone,u2.phone);

]]--