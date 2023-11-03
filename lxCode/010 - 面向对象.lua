-- Account = {balance = 0}
-- function Account.withdraw (v)
--     Account.balance = Account.balance - v
-- end

-- Account.withdraw(100.00)

function test1()

    Account = { balance = 0 }
    function Account.withdraw(v)
        Account.balance = Account.balance - v
    end

    Account.withdraw(100)

    print(Account.balance) -- -100
    
end
-- test1()

function test2()

    --[[
        使用 “:“ 来访问成员函数
    ]]

    -- 元类
    Rectangle = {area = 0, length = 0, breadth = 0}
    function Rectangle:new(o,length,breadth)
        o = o or {}
        setmetatable(o, self)
        self.__index = self
        self.length = length or 0
        self.breadth = breadth or 0
        self.area = length*breadth;
        return o
    end

    -- 派生类的方法 printArea
    function Rectangle:printArea ()
        print("矩形面积为 ",self.area)
    end

    r = Rectangle:new(nil,10,20)
    print(r.length) -- 10
    r:printArea() -- 矩形面积为 	200

end
-- test2()