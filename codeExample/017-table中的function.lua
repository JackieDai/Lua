

--function 进阶，table 中的 function


function show(a)
    print(a);
end

t1={
    t1_show=show,
    add=function(a,b)
        return a+b;
    end
};

t1.sub=function(a,b)
    return a-b;
end

t1["mult"]=function(a,b)
    return a*b;
end



--t1.t1_show("abc");
--t1["t1_show"](123);
--t1.t1_show(t1.add(11,22));

--t1.t1_show(t1.add(11,22));
--t1.t1_show(t1.sub(11,22));
--t1.t1_show(t1.mult(11,22));

--[[
calc={

    add=function(a,b)
        return a+b;
    end,
    sub=function(a,b)
        return a-b;
    end,
    mult=function(a,b)
        return a*b;
    end,
    show=function(a) print(a);  end
}

calc.show(calc.add(11,22));
calc.show(calc.sub(11,22));
calc.show(calc.mult(11,22));

]]--


calc={
    a=0,
    b=0,
    result=0,
    add=function()
        calc.result= calc.a+calc.b;
    end,
    sub=function()
        calc.result= calc.a-calc.b;
    end,
    mult=function()
        calc.result= calc.a*calc.b;
    end,
    show=function() print(calc.result);  end
}

calc.a=11;
calc.b=22;

calc.add();
calc.show();

calc.sub();
calc.show();

tmp=calc;
tmp.mult();
tmp.show();
