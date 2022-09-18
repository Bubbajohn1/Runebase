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
        print("INDEX" .. index)
        print("VALUE" .. value)

        if(not value and not index) then
            for j,k in pairs(defualtItems) do
                value = k
                index = j
            end
        end

        print("INDEX" .. index)
        print("VALUE" .. value)
    end
end

Functions:NewNoti({})