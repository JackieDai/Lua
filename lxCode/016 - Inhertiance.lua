local function main()

    local Shape = {
        area = 0
    }

    function Shape: new(o, side)
        o = o or {}
        side = side or 0
        setmetatable(o,self)
        self.__index = self
        self.area = side * side
        return o
    end

    function Shape: printArea()
        print("the area is ",self.area)
    end

    -- We can extend the shape to a squre class as shown below

    local Square = Shape: new()

    -- Derived(派生的) class method new
    function Square: new(o,side)
        o = o or Shape: new(o,side)
        setmetatable(o,self)
        self.__index = self
        return o
    end

    -- Over-riding Base Functions
    -- We can override the base class functions that is instead of using the function in the base class,derived class can have its own implementation as show below:

    -- Derived Class method printArea
    function Square: printArea()
        print("The area of square is ", self.area)
    end

    local shape = Shape:new(nil, 20)
    shape:printArea()

    local square = Square:new(nil,30)
    square:printArea()
    
end
main()