--[[
    // 八种基本数据类型
    nil, boolean, number, string, function , userdata, thread 和 table
        
    end
]]--

function testnil()
    a = nil
    print(type(a)) --nil
end
-- testnil()

function testboolean()
    a = true
    b = 0
    c = 1
    d = false
    print("a == ", type(a)) -- a == 	boolean
    print("b == ", type(b)) -- b == 	number
    print("c == ", type(c)) -- c == 	number
    print("d == ", type(d)) -- d == 	boolean
end
-- testboolean()

function testString()

    a = "abc"
    b = 'abc'
    c = 'a'
    d = "a"
    print("a == ", type(a)) -- a == 	string
    print("b == ", type(b)) -- b == 	string
    print("c == ", type(c)) -- c == 	string
    print("d == ", type(d)) -- d == 	string
    
end

-- testString()

function func1(a,b,c)
    print(a,b,c)
    
end

function func1Test()
    func1(1,2,3) -- 1	2	3
    func1("a","b","c") -- a	b	c
    func1(true,false,"acv") -- true	false	acv
end
func1Test()

