local Functions = {}

function Functions:NewNoti(obj)
    if(not typeof(obj) == "table") then return end
    obj.Title = obj.Title
    obj.Desc = obj.Desc
    obj.Time = obj.Time

    local defualtItems = {
        Title = "New Title",
        Desc = "New Desc",
        Time = 1
    }

    for index,value in pairs(obj) do
        print(index)
        print(value)
    end
end

Functions:NewNoti({Title = "Hello", Desc = "World", Time = 2})
