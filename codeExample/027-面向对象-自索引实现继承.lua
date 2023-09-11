

--[[

    自索引  自己索引自己

    用自索引实现继承

    典型的面向对象的写法，子类继承父类，并调用父类方法

]]--


father={a=1,b=2};
function father:faSay()
    print("father say",self.a,self.b);
end

father:faSay();

father.__index=father;--加自索引


son={c=1,d=2};

function son:sonSay()
    print("son say");
end

son:sonSay();

setmetatable(son,father);--加元表

--son:sonSay();


son:faSay();--典型的面向对象的写法，子类继承父类，并调用父类方法
