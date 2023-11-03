local function main()
    -- print("xxx")

    Student = {
        age = 1,
        growUp = function ()
            -- print(age) --这种写法跟Student表，没有任何关系，打印的age 是全局变量
            print(Student.age) -- 输出值 为  1
        end
    }

    -- 声明表之后，仍可以在表外 声明变量 和 方法
    Student.name = "jackie"

    -- 函数声明方法一
    Student.speck1 = function ()
        print(Student.name.."第一次说话")
    end

    -- 函数声明方法二
    function Student.speck2()
        print(Student.name.."第二次说话")
    end

    -- 使用冒号 : 来添加并访问类的成员函数，同时成员函数内部，可以使用 self 来访问当前对象
    function Student:speck3()
        print(self.name.."第三次说话")
    end

    print(Student.age)
    Student.speck1()
    Student.speck2()
    Student:speck3()
    --[[
        log 如下：
            1
            jackie第一次说话
            jackie第二次说话
            jackie第三次说话
    ]]

end
main()