
--[[

    类 class
    对象   new class(实例化)
    继承，构造，析构


    table {}
    metatable {}

    self

]]--


t1={
    id=123,
    name="tom"
};

t1.getId=function(obj)
    return obj.id;
end


--this,self
--t1.getName=function(obj)
function t1:getName()
    return self.name;
end

print(t1.id,t1.name,t1.getId(t1),t1:getName());

t2=t1;
--print(t1,t2);
t1=nil;

print(t2.id,t2.name,t2.getId(t2),t2:getName());







