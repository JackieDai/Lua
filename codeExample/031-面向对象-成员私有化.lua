
--[[

        成员私有化
]]--

function newUserInfo()

    local member={
        id=123,
        name="tom",
        city="beijing"
    }


    local function getId()
        return member.id;
    end

    local function setId(val)
       member.id=val;
    end

    --只暴露了这几个方法
    return {
        getId=getId,
        setId=setId,

        getName=function()
            return member.name;
        end
    };


end


users = newUserInfo();


print(users.getId());

users.setId(456);
print(users.getId(),users.getName());