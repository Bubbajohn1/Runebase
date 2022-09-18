local ui = {}

local GUIParent = Instance.new("CoreGui")

function ui:create(class, properties)
	local inst = Instance.new(class)
	for property, value in pairs(properties) do
		inst[property] = value
	end
	return inst
end

function ui:NNotification(obj)
    if(not typeof(obj) == "table") then return end
    obj.Title = obj.Title
    obj.Desc = obj.Desc
    obj.Time = obj.Time

    local NNoti = ui:create("Frame", {
        Name = "NNoti",
        Parent = game:GetService("ScreenGui"),
        BackgroundColor3 = Color3.fromRGB(35, 35, 35),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BorderSizePixel = 2,
        Position = UDim2.new(0.237219989, 0, 0.248991936, 0),
        Size = UDim2.new(0, 209, 0, 57)
    })

    local UIPadding = ui:create("UIPadding", {
        Parent = NNoti,
        PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 4),
        PaddingRight = UDim.new(0, 4),
        PaddingTop = UDim.new(0, 4)
    })

    local Title = ui:create("TextLabel", {
        Name = "Title",
        Parent = NNoti,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Size = UDim2.new(1, 0, 0, 21),
        Font = Enum.Font.Ubuntu,
        Text = obj.Time,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14.000,
        TextStrokeTransparency = 0.750,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local Exit = ui:create("TextButton", {
        Name = "Exit",
        Parent = Title,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0.910447776, 0, 0, 0),
        Size = UDim2.new(0, 17, 0, 21),
        Font = Enum.Font.SourceSans,
        Text = "X",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 16.000
    })

    local Dev = ui:create("Frame", {
        Name = "Dev",
        Parent = NNoti,
        BackgroundColor3 = Color3.fromRGB(36, 36, 36),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0, 0, 0.46938777, 0),
        Size = UDim2.new(1, 0, 0, 2)
    })

    local Desc = ui:create("TextLabel", {
        Name = "Desc",
        Parent = NNoti,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1.000,
        Position = UDim2.new(0, 0, 0.510204077, 0),
        Size = UDim2.new(1, 0, 0.142857149, 21),
        Font = Enum.Font.Ubuntu,
        Text = obj.Desc,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14.000,
        TextStrokeTransparency = 0.750,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Left
    })

    local function timeTick() -- Frame.LocalScript 
        local script = Instance.new('LocalScript', NNoti)
    
        if(obj.Time) then
            wait(obj.Time)
            NNoti:Destroy()
        end
    end
    coroutine.wrap(timeTick)()
end

function ui:INotification(obj)
    if(not typeof(obj) == "table") then return end
    obj.Text = obj.Text
    obj.Time = obj.Time
end
