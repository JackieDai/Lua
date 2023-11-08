-- Meta class
local Reactangle = {
    area = 0,
    length = 0,
    breadth = 0
}

function Reactangle: new(o, length, breadth)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.length = length or 0
    self.breadth = breadth or 0
    self.area = length * breadth
    return o
end

function Reactangle: printArea()
    print("The area of Rectangle is", self.area)
end

-- Creating an object is the process of allocating memory for the class instance. Each of the objects has its own menory and share the common class data
local r = Reactangle:new(nil,10,20)

-- We can access the properties in the class using the dot operator as shown below--
print(r.length)

-- Also can access a member function using the colon operator with the objc as shown below
r:printArea()
