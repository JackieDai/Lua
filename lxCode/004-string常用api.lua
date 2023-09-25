
-- 查找
function findString()
    --[[
    ---
    ---查找第一个字符串中匹配到的 `pattern`（参见 [§6.4.1](command:extension.lua.doc?["en-us/54/manual.html/6.4.1"])）。
    ---
    ---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.find"])
    ---
    ---@param s       string|number
    ---@param pattern string|number
    ---@param init?   integer
    ---@param plain?  boolean
    ---@return integer|nil start
    ---@return integer|nil end
    ---@return any|nil ... captured
    ---@nodiscard
    function string.find(s, pattern, init, plain) end

    ]]

    str = "abcd1234"

    -- 查找第一个字符串中匹配到的 的 开始 和结束的 索引 值，
    print(string.find(str,"cd")) -- 3	4

    -- 从指定位置查找
    print(string.find(str,"cd",3)) -- 3  4
    -- 如果 找不到  返回 nil
    print(string.find(str,"cd",4)) -- nil
    -- 如果是负数，则是从字符串长度+该负数的位置开始找
    print(string.find(str,"cd",-6));

    -- 这部分 不是很清楚？？？？
    print(string.find(str,"%d",6));--最后一个参数，默认就是false，开启正则匹配模式

    print(string.find(str,"(%d%d%d%d)"));

    print(string.find(str,"%d",6,true))
end



function replaceString()
    str2="abcdcd1234cdcd";
    --[[
        ---
        ---将字符串 s 中，所有的（或是在 n 给出时的前 n 个） pattern （参见 [§6.4.1](command:extension.lua.doc?["en-us/54/manual.html/6.4.1"])）都替换成 repl ，并返回其副本。
        ---
        ---[查看文档](command:extension.lua.doc?["en-us/54/manual.html/pdf-string.gsub"])
        ---
        ---@param s       string|number
        ---@param pattern string|number
        ---@param repl    string|number|table|function
        ---@param n?      integer
        ---@return string
        ---@return integer count
        ---@nodiscard
        function string.gsub(s, pattern, repl, n) end
    ]]
    --全部替换
    print(string.gsub(str2,"cd","CD")); --abCDCD1234CDCD	4
    --最多替换两次
    print(string.gsub(str2,"cd","CD",2));--abCDCD1234cdcd	2
end

-- replaceString()

function transformTOASSCII()
    --asscii 码转字符,数字只能是0-255
    print(string.char(65)); -- A
    print(string.char(65,66,67)); -- ABC

    print(string.byte("a")); -- 97
    print(string.byte("abc",1,3)); -- 97	98	99
    
end
-- transformTOASSCII()

function lowerAndUpper()
    str1="abcd";
    --转大写
    str2=string.upper(str1);
    print(str2); -- ABCD
    --转小写
    print(string.lower(str2)); -- abcd
    
end
-- lowerAndUpper()

function getStringLength()
    str1="abcd";
    --字符串长度 
    print(string.len(str1));  -- 4
    print(string.len("你好 lua"));-- 10
end
-- getStringLength()


function reverseString()
    str1="abcd";
    print(string.reverse(str1)) -- dcba
    
end
-- reverseString()

function connectionFlag()
    str1 = "abc"
    str2 = 124
    str3=789;
    ---note 连接符，number 如果在连接符左边，后面要空格
    print("abc".."xyz"..str1..str2..123 ..456.56 ..str3..000);
    -- abcxyzabc124123456.567890
end
-- connectionFlag()

function trimString()
    str4="abcd1234";
    --截取，后面参数是开始位置和结束位置，结束位置可省略不写
    print(string.sub(str4,3,5)); -- cd1
    --负数是从右往左数
    print(string.sub(str4,-4,-2)); -- 123
end
trimString()