local function testWhildLoop()
    local count = 20
    while count > 0 do
        print(count)
        count = count - 1
    end
    
end

-- testWhildLoop()

local function testForLoop()
    local count = 3

    for i = 1, 10, 1 do
        print(i)
    end

    for i = 10, 1, -1 do
        print(i)
    end
end
-- testForLoop()


local function testDesicionMakingStatsments()

    local score = 90

    if score >= 90 then
        print('you are outstanding')
    end

    local age = 19
    if age > 20 then
        print("xx")
    elseif age == 20 then
        print("xx")
    else
        print(age)
    end
end

testDesicionMakingStatsments()