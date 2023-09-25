function ifOperation()
    function test1()
        a , b = 1,2 
        if a == 1 then
            print("b ==", b) -- b == 2
        end

        if a > 1 then
            print(">1")
        else
            print("<=1")  -- <=1
        end

        if a > 1 then
            print(">1")
        elseif a == 1 then
            print("==1") -- ==1
        else
            print("<1")
        end
    end

    -- test1()

    -- 复合 if 判断 01
    function test2()

        c,d=900,101;

        if c > 100 then
            print("学仙"); -- 学仙
        elseif c>90 and c<=100 then
            print("学神");
        elseif c>80 and c<=90 then
            print("学霸");
        elseif c>60 and c<=80 then
            print("学长");
        elseif c>50 and c<=60 then
            print("学渣");
        else
            print("学酥");--本人
        end
    end

    -- test2()

    -- 复合 if 判断 02
    -- 注意完整的  if else elseif end 的完成流程
    function test3()
        c,d=900,101;
        if c > 100 then
            print("学仙");
        elseif c>90 and c<=100 then
            print("学神");
        else
            if c>80 and c<=90 then
                print("学霸");
            elseif c>60 and c<=80 then
                print("学长");
            elseif c>50 and c<=60 then
                print("学渣");
            else
                print("学酥");--学酥本酥
            end
        end
    end
    test3()


end
-- ifOperation()