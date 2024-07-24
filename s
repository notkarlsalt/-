--OrionHub source for future me: https://raw.githubusercontent.com/shlexware/Orion/main/source
--ACL for future me: loadstring(game:HttpGet('https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua'))()

local TCS = game:GetService("TextChatService")
local RStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local isLegacy = TCS.ChatVersion == Enum.ChatVersion.LegacyChatService
local ChatBar = CoreGui:FindFirstChild("TextBoxContainer", true) or PlayerGui:FindFirstChild("Chat"):FindFirstChild("ChatBar", true)
ChatBar = ChatBar:FindFirstChild("TextBox") or ChatBar

local Chat = function(Message)
    if isLegacy then
        local ChatRemote = RStorage:FindFirstChild("SayMessageRequest", true)
        ChatRemote:FireServer(Message, "All")
    else
        local Channel = TCS.TextChannels.RBXGeneral
        Channel:SendAsync(Message)
    end
end

local Fake = function(Message)
    if isLegacy then
        Players:Chat(Message)
    else
        local Channel = TCS.TextChannels.RBXGeneral
        -- Channel:SendAsync(("/e %s"):format(Message))
        -- ^^^ its too annoying
    end
end

local chars = {}
for i=97,122 do chars[#chars+1]=string.char(i) end
for i=65,90 do chars[#chars+1]=string.char(i) end

local RNG = function(length)
    local str = ""
    for i = 1, length do
        str = str .. chars[math.random(#chars)]
    end
    return str
end

local ResetFilter = function()
    for i = 1, 10 do
        local GUID = RNG(30) -- Increased length of random strings
        local Filler = "real"
        local Reset = ("%s %s"):format(GUID, Filler)
        task.spawn(function()
            Fake(Reset)
        end)
    end
end

local Connection = Instance.new("BindableFunction")

for _, c in getconnections(ChatBar.FocusLost) do
    c:Disconnect()
end

ChatBar.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        Connection:Invoke(ChatBar.Text)
        ChatBar.Text = ""
    end
end)

Connection.OnInvoke = function(Message)
    -- Message = Gen(Message) -- Assuming 'Gen' function is not defined
    Chat(Message)
    ResetFilter()
end
wait()
loadstring(game:HttpGet("https://raw.githubusercontent.com/vqmpjayZ/More-Scripts/main/Adonis_Anti_Cheat_Bypass"))()
    wait()
repeat task.wait() until game:IsLoaded()

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    game:GetService("Players").LocalPlayer:Kick("This game uses ModernChatService which Vadrifts does not support.")
    return
end
wait()
local function runPCScript()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({ Name = "vadrifts.byp |  V1.4.0", HidePremium = false, SaveConfig = save, ConfigFolder ="OrionTest", ScriptIntro = enabled, IntroText = "Vadrifts bypassing society" })

local startTime = tick()

local Tab = Window:MakeTab({
    Name = "Script Setup",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Loading"
})
Tab:AddParagraph("Loading..", "Please wait")
Tab:AddParagraph("Quick Tip!","If the script isn't loading, it could be due to your device or executor!")
loadstring(game:HttpGet('https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua'))()

local function loadScript()

    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({ Name = "vadrifts.byp |  V1.4.0", HidePremium = false, SaveConfig = save, ConfigFolder = "OrionTest", IntroEnabled = false })

    local endTime = tick()
    local loadTime = endTime - startTime
    game.StarterGui:SetCore("SendNotification",
        { Title = "Loaded!", Text = "Succesfully loaded in " ..
        loadTime .. " seconds.", Duration = 5, })

    local Tab = Window:MakeTab({
        Name = "Home",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
local Section = Tab:AddSection({
    Name = "Discord"
})

local playerName = game.Players.LocalPlayer.Name

Tab:AddButton({
    Name = "Welcome " .. playerName .. ", updates n stuff @ our discord",
    Callback = function()
    end
})

Tab:AddButton({
    Name = "Discord | Click To Copy",
    Callback = function()
setclipboard("https://dsc.gg/vadriftz")
    end
}) 

local Section = Tab:AddSection({
    Name = "UI Stuff"
})

  Tab:AddButton({
    Name = "Close Interface",
    Callback = function()
OrionLib:Destroy()
    end
})

Tab:AddButton({
    Name = "Un-hide UI button (when ui closed)",
    Callback = function()
        local Toggle = Instance.new("ScreenGui")
        local UIToggle = Instance.new("TextButton")
        local CloseButton = Instance.new("TextButton")
        Toggle.Name = "Un-Hide"
        Toggle.Parent = game.CoreGui
        UIToggle.Name = "Un-hide"
        UIToggle.Parent = Toggle
        UIToggle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        UIToggle.BackgroundTransparency = 0
        UIToggle.Position = UDim2.new(0, 0, 0.454706937, 0)
        UIToggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
        UIToggle.Font = Enum.Font.SourceSans
        UIToggle.Text = "Un-Hide!"
        UIToggle.TextColor3 = Color3.fromRGB(75, 0, 130)
        UIToggle.TextSize = 24.000
        UIToggle.TextXAlignment = Enum.TextXAlignment.Left

        local UserInputService = game:GetService("UserInputService")
        local dragging = false
        local dragStart
        local startPos

        local function updateDragging(input)
            local delta = input.Position - dragStart
            UIToggle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        UIToggle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = UIToggle.Position
            end
        end)

        UIToggle.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                updateDragging(input)
            end
        end)

        UIToggle.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        local function executeScript()
            if OrionLib and OrionLib.Destroy then
                OrionLib:Destroy() -- Reduces lag
            end
            if loadScript then
                loadScript() -- Reopens script
            end
        end

        UIToggle.MouseButton1Click:Connect(executeScript)

        -- Create a close button
        CloseButton.Name = "CloseButton"
        CloseButton.Parent = UIToggle
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.BackgroundTransparency = 0
        CloseButton.Position = UDim2.new(0.8, 0, 0.1, 0)
        CloseButton.Size = UDim2.new(0.2, 0, 0.2, 0)
        CloseButton.Font = Enum.Font.SourceSans
        CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        CloseButton.TextSize = 16
        CloseButton.Text = "X"
        CloseButton.MouseButton1Click:Connect(function()
            UIToggle:Destroy() -- Destroy the UI elements when the close button is clicked
        end)
    end
})


local Section = Tab:AddSection({
    Name = "Help"
})
Tab:AddParagraph("Notice","If the script gives you a warning on execution, that means that game isn't supported!")
 Tab:AddLabel("Your account must be 13+ for everything to work.")
 Tab:AddLabel("If something gets tagged, say something normal and try again.")
 Tab:AddLabel("Everyone can see the things you say in chat.")
 Tab:AddLabel("For more info go and ask on the Discord")

local Section = Tab:AddSection({
    Name = "Suggested (A-Z)"
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local IsLegacy = (TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService)

local function checkForTag(message)
    local success, isTagged = pcall(function()
        return game:GetService("Chat"):FilterStringForBroadcast(message, game.Players.LocalPlayer)
    end)
    return success and isTagged ~= message
end

local function sendMessage(message)
    if checkForTag(message) then
        OrionLib:MakeNotification({
            Name = "Tag Detection",
            Content = "This bypass might be patched! Try clicking 'Fix Bypasses' and try again!",
            Duration = 5
        })
    else
        if IsLegacy then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        else
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        end
    end
end

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "Are we going to teach about the pussy hole?",
    Callback = function()
sendMessage("Аrеwеgоіngtоtеacһаbоuttһeрuѕѕуһolе?")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "cock and ball torture sex",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥󠀕󠀕󠀕⁥с⁥⁥⁥kаndb󠀕󠀕󠀕а⁥⁥⁥⁥lltor󠀕󠀕󠀕turеѕ󠀕󠀕󠀕⁥⁥⁥е⁥⁥⁥х")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "E-Rape",
    Callback = function()
sendMessage("Е-Rаре")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "eat my shit nigger",
    Callback = function()
sendMessage("ea⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥tm⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥yѕ⁥⁥⁥⁥⁥⁥h⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥tn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ge⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r")
ResetFilter()
    end
})

 Tab:AddLabel("J")

  Tab:AddButton({
    Name = "*jizzles on your face*",
    Callback = function()
sendMessage("*j⁥⁥⁥⁥⁥⁥iz⁥⁥⁥⁥⁥⁥zе⁥⁥⁥⁥ѕ on your face*")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "lets go somewhere private so we can fuck",
    Callback = function()
sendMessage("lets go somewherepri⁥⁥⁥vаtеw⁥⁥⁥еса⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥nf⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥k")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lets record lesbian threesome",
    Callback = function()
sendMessage("lets record ӏes⁥⁥⁥b⁥⁥⁥ianthr⁥⁥⁥⁥⁥⁥ееѕ⁥⁥⁥ome")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "oil up lil nigga",
    Callback = function()
sendMessage("oi⁥⁥⁥⁥⁥⁥ӏu⁥⁥⁥⁥⁥⁥pӏi⁥⁥⁥⁥⁥⁥ln⁥⁥⁥⁥⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥а")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "im very horny and i will cum inside you hard",
    Callback = function()
sendMessage("im very һоrn⁥⁥⁥⁥⁥⁥yandiwill с⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥mi⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥nsidеyou hard")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I'm gonna fucking rape you",
    Callback = function()
sendMessage("Ӏ'mgо󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕nnаf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uсkіngr⁥⁥⁥а⁥⁥⁥p⁥⁥⁥ey⁥⁥⁥о⁥⁥⁥u ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm gonna fuck you hard",
    Callback = function()
sendMessage("i'mgоnnаf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uсkуоurһоӏеһаrd")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i fuck children",
    Callback = function()
sendMessage("іf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uсkсһіІdrеn")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "murder the lgbtq+",
    Callback = function()
sendMessage("m⁥⁥⁥⁥⁥⁥ur⁥⁥⁥⁥⁥⁥dеrthеӏg⁥⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥q+")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "shitass",
    Callback = function()
sendMessage("ѕһ⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀖i⁥⁥⁥⁥󠀗󠀕󠀕󠀕tаѕѕ")
ResetFilter()
    end
})

Tab:AddParagraph("Join our Discord and suggest YOUR bypass to get it added!","Go to the suggestions channel, and suggest a bypass!")

local Section = Tab:AddSection({
    Name = "Credits"
})

 Tab:AddLabel("[+] Jay. - Development and Bypassing.")
 Tab:AddLabel("[+] BANANAN. - Development.")
 Tab:AddLabel("[+] Dank6s - Script setup")
 Tab:AddLabel("[+] Anthony - Anti-Chat Logger")
 Tab:AddLabel("[+] clickgameplay - Automatic chat bypasser concept")
 Tab:AddLabel("[+] heartasians - Made ResetFilter bypass")
 Tab:AddLabel("[+] OG Vadrifts - Most bypass ideas")
 Tab:AddLabel("[+] Sauce_boss01 - Made some Bypasses")
 Tab:AddLabel("[+] d34dly - Made some Bypasses")
 Tab:AddLabel("[+] N4 - Made some Bypasses")
 Tab:AddLabel("[+] Tyler - Made some Bypasses")

local Section = Tab:AddSection({
    Name = "More Vadrifts Scripts"
})

  Tab:AddButton({
    Name = "Vadrifts Horrific Housing",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/HH-loader1/main/HH"))()
    end
})

Tab:AddParagraph("Creating more soon..","Making scripts actually work..")

local enabled = false
local connection

local Tab = Window:MakeTab({
    Name = "Words",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Extra"
})


Tab:AddParagraph("Recommended Games"," Rate My Avatar                                                 Public Bathroom Simlator                                                               White room                                                        Natrual Disaster Survival                                                        Ragdoll Engine                                                 Spray Paint!")

  Tab:AddButton({
    Name = "Automatic Chat Bypasser (UI)",
    Callback = function()
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0.1, 0)
uiCorner.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.8, 0, 0.4, 0)
textBox.Position = UDim2.new(0.1, 0, 0.2, 0)
textBox.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
textBox.BorderSizePixel = 0
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.PlaceholderText = "Type your message here..."
textBox.PlaceholderColor3 = Color3.new(1, 1, 1)
textBox.Parent = frame

local textBoxCorner = Instance.new("UICorner")
textBoxCorner.CornerRadius = UDim.new(0.1, 0)
textBoxCorner.Parent = textBox

local sendButton = Instance.new("TextButton")
sendButton.Size = UDim2.new(0.3, 0, 0.2, 0)
sendButton.Position = UDim2.new(0.35, 0, 0.7, 0)
sendButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
sendButton.BorderSizePixel = 0
sendButton.Font = Enum.Font.SourceSans
sendButton.TextSize = 14
sendButton.TextColor3 = Color3.new(1, 1, 1)
sendButton.Text = "Send"
sendButton.Parent = frame

local closeButton = Instance.new("ImageButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundTransparency = 1
closeButton.Image = "rbxassetid://3926305904"
closeButton.ImageRectOffset = Vector2.new(284, 4)
closeButton.ImageRectSize = Vector2.new(24, 24)
closeButton.Parent = frame

local custom_chars = {
    [" "] = "",
    ["stfu"] = "ѕ󠀕󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥f󠀖󠀕⁥⁥⁥u",
    ["asshole"] = "⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ѕ⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥⁥һ⁥⁥󠀕󠀕о󠀕⁥⁥⁥󠀕󠀖ӏ⁥⁥⁥󠀕󠀖е⁥",
    ["ass"] = "а⁥⁥⁥ѕ⁥⁥⁥ѕ",
    ["arse"] = "аr⁥⁥ѕ⁥е",
    ["anus"] = "а⁥⁥⁥n⁥⁥⁥u⁥⁥⁥ѕ⁥⁥⁥",
    ["Anus"] = "A⁥⁥⁥n⁥⁥⁥u⁥⁥⁥ѕ⁥⁥⁥",
    ["anal"] = "аn⁥⁥⁥⁥аl",
    ["blowjob"] = "bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥",
    ["boner"] = "⁥В⁥⁥o⁥⁥n⁥⁥е⁥⁥r",
    ["boobies"] = "b⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥b⁥⁥⁥⁥і⁥⁥⁥⁥е⁥⁥⁥⁥s",
    ["bullshit"] = "b⁥⁥⁥⁥u⁥⁥⁥l⁥⁥⁥⁥ӏ⁥⁥⁥s⁥⁥⁥һ⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥t",
    ["bastard"] = "bas⁥⁥⁥⁥⁥⁥⁥⁥tard",
    ["beaner"] = "b⁥⁥⁥е⁥⁥⁥а⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r",
    ["butthole"] = "bu⁥⁥⁥⁥⁥⁥⁥⁥tthоle",
    ["bootyhole"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty󠀕󠀕󠀕󠀕һoӏe",
    ["bondage"] = "b⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥а⁥⁥⁥g⁥⁥⁥е⁥⁥⁥",
    ["Bondage"] = "B⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥а⁥⁥⁥g⁥⁥⁥е⁥⁥⁥",
    ["butt"] = "bu⁥⁥⁥⁥⁥⁥⁥⁥tt",
    ["booty"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty",
    ["boobs"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕b󠀕󠀕󠀕󠀕ѕ",
    ["boob"] = "bооb",
    ["breasts"] = "brеаѕtѕ",
    ["bbc"] = "b⁥⁥⁥b⁥⁥⁥с",
    ["bitch"] = "b⁥⁥i󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥⁥⁥сһ",
    ["Bitch"] = "B⁥⁥i󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥⁥⁥сһ",
    ["bitches"] = "￰￰b￰￰і󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕t⁥⁥⁥⁥󠀕с⁥⁥⁥⁥󠀕һ⁥⁥⁥⁥󠀕󠀕󠀕󠀕е⁥⁥⁥⁥s",
    ["Bitches"] = "￰￰B￰￰і󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕t⁥⁥⁥⁥󠀕с⁥⁥⁥⁥󠀕һ⁥⁥⁥⁥󠀕󠀕󠀕󠀕е⁥⁥⁥⁥s",
    ["cocaine"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥а⁥⁥⁥i⁥⁥⁥n⁥⁥⁥е",
    ["creampie"] = "с⁥⁥⁥r⁥⁥⁥е⁥⁥⁥а⁥⁥⁥m⁥⁥⁥р⁥⁥⁥i⁥⁥⁥е",
    ["cum"] = "с⁥⁥⁥⁥um",
    ["cunts"] = "сu⁥⁥⁥⁥⁥⁥⁥⁥ntѕ",
    ["cunt"] = "с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀕󠀖⁥⁥⁥n󠀕󠀖t",
    ["cock"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k",
    ["cuck"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k",
    ["cuckold"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k⁥⁥⁥о⁥⁥⁥ӏ⁥⁥⁥d⁥⁥⁥",
    ["condoms"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m⁥⁥⁥s",
    ["condom"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m",
    ["coochies"] = "с⁥⁥⁥о⁥⁥⁥о⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥і⁥⁥⁥е⁥⁥⁥s",
    ["coochie"] = "с⁥⁥⁥о⁥⁥⁥o⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥е",
    ["crap"] = "сr⁥⁥⁥⁥ар",
    ["Crap"] = "сr⁥⁥⁥⁥ар",
    ["CRAP"] = "сr⁥⁥⁥⁥ар",
    ["cunny"] = "сu⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу",
    ["Cunny"] = "сu⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу",
    ["clit"] = "с󠀕󠀕⁥І󠀕󠀕⁥і󠀕󠀕⁥t",
    ["Clit"] = "с󠀕󠀕⁥І󠀕󠀕⁥і󠀕󠀕⁥t",
    ["dumbass"] = "d⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ",
    ["dildo"] = "d⁥󠀕󠀕󠀕󠀕⁥⁥і⁥󠀕󠀕󠀕󠀕⁥⁥ӏ⁥󠀕󠀕󠀕󠀕⁥⁥do",
    ["Dildo"] = "D⁥󠀕󠀕󠀕󠀕⁥⁥і⁥󠀕󠀕󠀕󠀕⁥⁥ӏ⁥󠀕󠀕󠀕󠀕⁥⁥do",
    ["discord"] = "dіѕсоrd",
    ["dickhead"] = "d￰￰￰￰￰і￰￰￰￰￰c￰￰￰￰￰kһ￰￰￰￰￰еad",
    ["dick"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥d⁥⁥⁥⁥⁥і⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥",
    ["damn"] = "d⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥",
    ["doggystyle"] = "d⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥s⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е",
    ["Doggystyle"] = "D⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥s⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е",
    ["fatass"] = "fat￰￰￰а￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕ",
    ["Fucked"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеd",
    ["fucked"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеd",
    ["femboy"] = "fеmbоy",
    ["femboys"] = "fеmbоys",
    ["E-Rape"] = "Е-Rаре",
    ["E-rape"] = "Е-rаре",
    ["e-eаре"] = "Е-rаре",
    ["E-Sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["E-sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["e-sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["fuckers"] = "⁥⁥f󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеrѕ",
    ["Fuckers"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеrѕ",
    ["fucker"] = "⁥⁥f󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеr",
    ["Fucker"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеr",
    ["faggot"] = "⁥⁥⁥⁥f⁥󠀕⁥ а󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥g󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥g⁥⁥о󠀕󠀕⁥⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥",
    ["Faggot"] = "⁥⁥⁥⁥⁥⁥ꜰ⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖⁥⁥⁥g⁥⁥⁥⁥gо󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕t",
    ["Fag"] = "⁥⁥⁥⁥⁥⁥F⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖g⁥⁥⁥⁥",
    ["fag"] = "⁥⁥⁥⁥⁥⁥f⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖g⁥⁥⁥⁥",
    ["fap"] = "f⁥󠀕⁥⁥а⁥󠀕⁥⁥р",
    ["fanny"] = "fa⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу",
    ["horny"] = "һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у",
    ["hitler"] = "һ󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗itӏеr",
    ["hentai"] = "h󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i",
    ["hoes"] = "һоеѕ",
    ["hoe"] = "һое",
    ["instagram"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tаg󠀕󠀕󠀕󠀕rаm",
    ["insta"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tа",
    ["Instagram"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tаg󠀕󠀕󠀕󠀕rаm",
    ["Insta"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tа",
    ["kys"] = "k⁥⁥⁥⁥⁥⁥⁥⁥y⁥⁥⁥ѕ",
    ["lmfao"] = "ӏm⁥⁥⁥⁥⁥⁥⁥⁥fа⁥⁥о",
    ["lmao"] = "ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥maо",
    ["Lmao"] = "ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥maо",
    ["motherfucker"] = "mot￰￰￰￰￰￰￰h￰e￰rf￰￰￰￰￰u￰с￰￰￰￰￰￰￰￰k￰e￰￰￰￰￰￰￰￰r",
    ["masturbate"] = "m󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕b󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e",
    ["Masturbate"] = "М⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥е",
    ["masturbating"] = "m⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥ing",
    ["meth"] = "mе⁥⁥⁥⁥⁥⁥⁥⁥th",
    ["Meth"] = "Mе⁥⁥⁥⁥⁥⁥⁥⁥th",
    ["molest"] = "m⁥⁥⁥⁥o⁥⁥⁥⁥ӏ⁥⁥⁥⁥е⁥⁥⁥ѕ⁥⁥⁥⁥t",
    ["Molest"] = "M⁥⁥⁥⁥o⁥⁥⁥⁥ӏ⁥⁥⁥⁥е⁥⁥⁥ѕ⁥⁥⁥⁥t",
    ["nazi"] = "⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥a⁥⁥⁥⁥⁥z⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥",
    ["Nazi"] = "⁥⁥⁥⁥⁥N⁥⁥⁥⁥⁥a⁥⁥⁥⁥⁥z⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥",
    ["naked"] = "nаkеd",
    ["nudes"] = "nudеѕ",
    ["Niggas"] = "Ν󠀕󠀕󠀕󠀕󠀕⁥і󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕аs",
    ["nude"] = "n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е",
    ["Nude"] = "N󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е",
    ["negro"] = "n󠀕󠀕󠀕󠀕󠀕󠀕󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕o",
    ["Negro"] = "n󠀕󠀕󠀕󠀕󠀕󠀕󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕o",
    ["nipples"] = "n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥ѕ",
    ["nipple"] = "n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥",
    ["Nipples"] = "N󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥ѕ",
    ["Nipple"] = "N󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥",
    ["nazi"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥a￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥z󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥i",
    ["Nazi"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕N󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥a￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥z󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥i",
    ["orgasm"] = "оrg⁥⁥⁥⁥аѕm",
    ["onlyfans"] = "оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ",
    ["Onlyfans"] = "оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ",
    ["onlyfans.com"] = "оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom",
    ["omfg"] = "оm⁥⁥⁥⁥⁥⁥⁥⁥fg",
    ["pedophile"] = "p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е",
    ["pornhub"] = "⁥⁥р󠀕󠀕󠀕󠀕󠀕󠀕󠀕о󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕һ󠀕󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕b",
    ["penis"] = "pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ",
    ["porn"] = "роrn",
    ["pussies"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥i⁥⁥⁥е⁥⁥⁥s",
    ["pussy"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥у",
    ["piss"] = "рі󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕ss",
    ["queer"] = "󠀕󠀕￰￰󠀕q￰￰￰󠀕󠀕󠀕￰￰￰u￰￰￰￰￰￰e󠀕󠀕󠀕￰￰￰￰￰￰e￰￰￰￰￰￰r",
    ["Queer"] = "󠀕󠀕￰￰󠀕Q￰￰￰󠀕󠀕󠀕￰￰￰u￰￰￰￰￰￰e󠀕󠀕󠀕￰￰￰￰￰￰e￰￰￰￰￰￰r",
    ["rape"] = "rаре",
    ["retarded"] = "r⁥⁥⁥⁥еt⁥⁥⁥⁥󠀗󠀕󠀕ar⁥⁥⁥⁥dе󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖d",
    ["Retarded"] = "R⁥⁥⁥⁥еt⁥⁥⁥⁥󠀗󠀕󠀕ar⁥⁥⁥⁥dе󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖d",
    ["retard"] = "⁥⁥r⁥󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е󠀖󠀕t 󠀕󠀕󠀕󠀕󠀖󠀕а⁥⁥⁥󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕⁥⁥⁥⁥󠀕d",
    ["Retard"] = "⁥⁥R⁥󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е󠀖󠀕t 󠀕󠀕󠀕󠀕󠀖󠀕а⁥⁥⁥󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕⁥⁥⁥⁥󠀕d",
    ["rizz"] = "rіzz",
    ["Rapist"] = "R⁥⁥⁥⁥󠀕󠀕󠀕а⁥⁥⁥⁥󠀕󠀕󠀕р⁥⁥⁥⁥󠀕󠀕󠀕іѕ⁥⁥⁥⁥󠀕󠀕󠀕t",
    ["rapist"] = "r⁥⁥⁥⁥󠀕󠀕󠀕а⁥⁥⁥⁥󠀕󠀕󠀕р⁥⁥⁥⁥󠀕󠀕󠀕іѕ⁥⁥⁥⁥󠀕󠀕󠀕t",
    ["Rizz"] = "Rіzz",
    ["stripper"] = "ѕtrірреr",
    ["slave"] = "ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е",
    ["seduce"] = "ѕеduсе",
    ["slut"] = "sӏut",
    ["shit"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥s󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕һ⁥󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥t",
    ["sexy"] = "ѕеху",
    ["sex"] = "ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥",
    ["sperm"] = "ѕpе󠀕￰￰￰￰󠀖r￰󠀖m",
    ["Sperm"] = "ѕpе󠀕￰￰￰￰󠀖r￰󠀖m",
    ["Semen"] = "ѕ󠀕󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥emen",
    ["semen"] = "ѕ󠀕󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥emen",
    ["schlong"] = "ѕс⁥⁥⁥⁥һ󠀗󠀕󠀕󠀕󠀕ӏо⁥⁥⁥⁥n󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗g",
    ["titties"] = "t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ",
    ["thots"] = "t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt󠀗󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ",
    ["thot"] = "t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt",
    ["tits"] = "t󠀗󠀕󠀕󠀕󠀕󠀕i⁥⁥⁥⁥t⁥⁥⁥⁥ѕ",
    ["tit"] = "⁥⁥⁥t󠀗󠀕⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕і⁥⁥⁥⁥t",
    ["tranny"] = "tr󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕а￰￰￰￰￰￰n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰n￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕у",
    ["Tranny"] = "Tr󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕а￰￰￰￰￰￰n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰n￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕у",
    ["virginity"] = "v￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰і￰￰￰￰t￰￰￰у",
    ["virgins"] = "v󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗ir⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕gi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖ns",
    ["vagina"] = "⁥⁥v󠀗󠀕󠀕󠀕󠀕⁥⁥⁥⁥󠀕󠀖⁥⁥⁥⁥а󠀗󠀕󠀕󠀕g⁥⁥⁥⁥і⁥⁥⁥⁥󠀗󠀕n⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖a",
    ["virgin"] = "v󠀕￰￰￰￰￰￰󠀘і󠀖￰￰￰￰￰￰￰￰󠀘r󠀕￰￰￰￰￰￰￰￰󠀖g󠀖￰￰￰￰￰￰￰￰￰󠀘і󠀘￰￰￰￰￰￰￰￰n",
    ["whore"] = "w⁥⁥⁥һ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е",
    ["weed"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕w󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥е󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥d",
    ["Weed"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕W󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥е󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥d",
    ["xxx"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥",
    ["Xxx"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥",
    ["ASS"] = "АЅЅ",
    ["ANUS"] = "АΝUЅ",
    ["ARSE"] = "А⁥⁥⁥R⁥⁥⁥⁥⁥󠀕󠀕󠀕Ѕ⁥⁥⁥⁥⁥⁥Е",
    ["ASSHOLE"] = "АЅЅНОLЕ",
    ["ANAL"] = "АΝ⁥⁥⁥⁥⁥⁥АL",
    ["BASTARD"] = "ВАЅТАRD",
    ["BONER"] = "⁥В⁥⁥O⁥⁥N⁥⁥Е⁥⁥R",
    ["BONDAGE"] = "В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥О󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥D󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АGЕ",
    ["BONDAGE"] = "В󠀕󠀕󠀕󠀕󠀕󠀖LОW󠀕󠀕󠀕󠀕󠀕󠀖ЈО󠀕󠀕󠀕󠀕󠀕󠀖В",
    ["BITCHES"] = "В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СНЕS",
    ["BITCH"] = "В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СН",
    ["BOOBS"] = "ВООВS",
    ["BOOB"] = "ВООВ",
    ["BUTTHOLE"] = "ВUТТ⁥⁥⁥⁥НOLЕ",
    ["BUTT"] = "ВUТТ",
    ["BOOTY"] = "ВООТΥ",
    ["BULLSHIT"] = "В󠀖󠀖⁥⁥⁥⁥UL󠀖󠀖⁥⁥⁥⁥LЅН󠀖󠀖⁥⁥⁥⁥ӀТ",
    ["BEANER"] = "В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R",
    ["CUNTS"] = "СU⁥⁥⁥⁥⁥⁥⁥⁥NТЅ",
    ["COCAINE"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ӀΝ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е",
    ["COOCHIES"] = "С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕS",
    ["COOCHIE"] = "С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е",
    ["CUNT"] = "СU⁥⁥⁥⁥⁥⁥⁥⁥NТ",
    ["CUCKOLD"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥KOLD",
    ["CUCK"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥K",
    ["CREAMPIE"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АМ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥PIE",
    ["CUM"] = "СUМ",
    ["COCK"] = "СОСK",
    ["DISCORD"] = "DӀЅСОRD",
    ["DILDO"] = "D⁥󠀕󠀕󠀕󠀕⁥⁥Ӏ⁥󠀕󠀕󠀕󠀕⁥⁥L⁥󠀕󠀕󠀕󠀕⁥⁥DО",
    ["DUMBASS"] = "D󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕UM⁥⁥⁥⁥⁥⁥⁥⁥⁥BАЅЅ",
    ["DAMN"] = "DАМΝ",
    ["DICKHEAD"] = "D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚНЕ󠀕⁥⁥󠀕AD",
    ["DICK"] = "D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚ",
    ["FAGGOT"] = "F󠀕󠀖󠀗󠀘￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀖󠀗󠀘А󠀕󠀖󠀗󠀘󠀕󠀖￰￰￰￰￰￰󠀕G⁥⁥󠀖󠀗󠀘󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀘󠀘G󠀖󠀗󠀘󠀖󠀗󠀘￰￰￰￰￰￰￰О󠀖󠀗󠀘￰￰￰￰￰󠀖󠀗Т",
    ["FATASS"] = "F⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥Ѕ",
    ["FEMBOYS"] = "FЕМВОΥЅ",
    ["FEMBOY"] = "FЕМВОΥ",
    ["FUCKERS"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥R󠀕󠀕󠀕󠀕S",
    ["FUCKER"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R",
    ["FUCKED"] = "F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥D",
    ["HITLER"] = "НӀ⁥⁥⁥⁥⁥⁥⁥⁥ТL⁥⁥⁥⁥⁥⁥⁥⁥Е⁥⁥R",
    ["HENTAI"] = "НЕ⁥⁥⁥⁥Ν⁥ТАӀ",
    ["HORNY"] = "НОRNY",
    ["HOES"] = "НОЕЅ",
    ["HOE"] = "НОЕ",
    ["KYS"] = "ΚΥЅ",
    ["LMFAO"] = "LМFАО",
    ["LMAO"] = "LМАО",
    ["MASTURBATE"] = "МАЅТURВАТΕ",
    ["MASTURBATE"] = "МО󠀕󠀕󠀕󠀖󠀖ТНЕ󠀕󠀕󠀕󠀖󠀖R󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R",
    ["NUDES"] = "ΝUDЕЅ",
    ["NUDE"] = "Ν󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕U󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕D󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕Е",
    ["NEGRO"] = "NE󠀕󠀕⁥⁥󠀕G󠀕󠀖⁥⁥󠀕R󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕O",
    ["NIPPLES"] = "Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥Ѕ",
    ["NIPPLE"] = "Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥",
    ["NAKED"] = "ΝΑKΕD",
    ["NAKED"] = "⁥⁥⁥⁥⁥N⁥⁥⁥⁥⁥А⁥⁥⁥⁥⁥Z⁥⁥⁥⁥⁥Ӏ⁥⁥⁥⁥⁥",
    ["OMFG"] = "ОM⁥⁥⁥⁥⁥⁥⁥⁥FG",
    ["PENIS"] = "PEN⁥⁥ӀS",
    ["PUSSIES"] = "Р⁥⁥⁥U⁥⁥⁥Ѕ⁥⁥⁥S⁥⁥⁥Ӏ⁥⁥⁥Е⁥⁥⁥Ѕ",
    ["PUSSY"] = "Р󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕U⁥⁥⁥⁥⁥Ѕ󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕S󠀕⁥⁥⁥⁥⁥󠀕󠀖󠀖󠀗󠀕Υ",
    ["PISS"] = "РӀ󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕SS",
    ["PORN"] = "РО󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕RΝ",
    ["PORNHUB"] = "⁥⁥Р⁥⁥⁥󠀕⁥⁥󠀕О⁥⁥R⁥⁥⁥⁥⁥󠀕⁥⁥󠀕N⁥⁥⁥󠀕󠀕Н⁥⁥⁥⁥⁥󠀕󠀕UВ",
    ["RETARD"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕R󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥Е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥Т󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥A￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰￰R󠀕󠀕D",
    ["RAPE"] = "RАРЕ",
    ["SHIT"] = "ЅH⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IT",
    ["SEX"] = "ЅЕХ",
    ["SLUT"] = "ЅL⁥⁥⁥⁥UТ",
    ["SLAVE"] = "ЅLА󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖VE",
    ["TITTIES"] = "ТIТТIES",
    ["TITS"] = "ТIТЅ",
    ["THOT"] = "ТН⁥⁥⁥⁥⁥ОТ",
    ["THOTS"] = "ТН⁥⁥⁥⁥⁥ОТЅ",
    ["VIRGINITY"] = "V￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰ΝITY",
    ["VIRGINS"] = "V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰INS",
    ["VIRGIN"] = "V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰I￰￰￰￰￰￰￰￰N",
    ["VAGINA"] = "V￰￰￰￰￰￰А￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰￰N￰￰￰￰￰￰￰￰А",
    ["XXX"] = "X⁥⁥⁥⁥XX",
    ["WHORE"] = "W⁥⁥⁥Н⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Е",
    ["WEED"] = "⁥⁥⁥⁥W⁥󠀕EED",
    ["blacked.com"] = "blacked.c⁥⁥⁥о⁥⁥⁥m", --Nsfw websites
    ["pornhub.com"] = "р⁥⁥⁥о⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b.c⁥⁥⁥о⁥⁥⁥m",
    ["XVIDEOS.COM"] = "Х󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕VӀ⁥⁥⁥⁥⁥⁥D⁥⁥⁥󠀕󠀕󠀕Е⁥⁥⁥󠀕󠀕󠀕ОЅ.С⁥⁥⁥󠀕󠀕󠀕ОМ",
    ["https://blacked.com"] = "httрs:/⁥⁥⁥/blacked.c⁥⁥⁥о⁥⁥⁥m",
    ["https://onlyfans.com"] = "ht⁥t⁥⁥рѕ⁥⁥:/⁥⁥/оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom",
    ["PORNHUB.COM"] = "Р⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Ν⁥⁥⁥Н⁥⁥⁥U⁥⁥⁥В.С⁥⁥⁥О⁥⁥⁥М⁥⁥⁥",
    ["Asshole"] = "⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ѕ⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥⁥һ⁥⁥󠀕󠀕о󠀕⁥⁥⁥󠀕󠀖ӏ⁥⁥⁥󠀕󠀖е⁥", --Capitals at the first letter
    ["Ass"] = "а⁥⁥⁥ѕ⁥⁥⁥ѕ",
    ["Arse"] = "аr⁥⁥ѕ⁥е",
    ["Anal"] = "аn⁥⁥⁥⁥аl",
    ["Blowjob"] = "Bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥",
    ["Boner"] = "⁥В⁥⁥o⁥⁥n⁥⁥е⁥⁥r",
    ["Boobies"] = "B⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥b⁥⁥⁥⁥і⁥⁥⁥⁥е⁥⁥⁥⁥s",
    ["Bullshit"] = "B⁥⁥⁥⁥u⁥⁥⁥l⁥⁥⁥⁥ӏ⁥⁥⁥s⁥⁥⁥һ⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥t",
    ["Bastard"] = "Bas⁥⁥⁥⁥⁥⁥⁥⁥tard",
    ["Beaner"] = "B⁥⁥⁥е⁥⁥⁥а⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r",
    ["Butthole"] = "Bu⁥⁥⁥⁥⁥⁥⁥⁥tthоle",
    ["Bootyhole"] = "B⁥⁥⁥о⁥⁥⁥о⁥⁥⁥t⁥⁥⁥уhole",
    ["Butt"] = "bu⁥⁥⁥⁥⁥⁥⁥⁥tt",
    ["Booty"] = "bооty",
    ["Boobs"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕b󠀕󠀕󠀕󠀕ѕ",
    ["Boob"] = "bооb",
    ["Breats"] = "Brеаѕtѕ",
    ["Bbc"] = "B⁥⁥⁥b⁥⁥⁥с",
    ["Cocaine"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥а⁥⁥⁥i⁥⁥⁥n⁥⁥⁥е",
    ["Creampie"] = "с⁥⁥⁥r⁥⁥⁥е⁥⁥⁥а⁥⁥⁥m⁥⁥⁥р⁥⁥⁥i⁥⁥⁥е",
    ["Cum"] = "с⁥⁥⁥⁥um",
    ["Cunts"] = "сu⁥⁥⁥⁥⁥⁥⁥⁥ntѕ",
    ["Cunt"] = "с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀕󠀖⁥⁥⁥n󠀕󠀖t",
    ["Cock"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k",
    ["Cuck"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k",
    ["Cuckold"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k⁥⁥⁥о⁥⁥⁥ӏ⁥⁥⁥d⁥⁥⁥",
    ["Condoms"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m⁥⁥⁥s",
    ["Condom"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m",
    ["Coochies"] = "с⁥⁥⁥о⁥⁥⁥о⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥і⁥⁥⁥е⁥⁥⁥s",
    ["Coochie"] = "с⁥⁥⁥о⁥⁥⁥o⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥е",
    ["Dumbass"] = "D⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ",
    ["Discord"] = "Dіѕсоrd",
    ["Dickhead"] = "D￰￰￰￰￰і￰￰￰￰￰c￰￰￰￰￰kһ￰￰￰￰￰еad",
    ["Dick"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥D⁥⁥⁥⁥⁥і⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥",
    ["Damn"] = "D⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥",
    ["E-Sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["e-Sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["e-sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["E-Rape"] = "Е-Rаре",
    ["E-rape"] = "Е-rаре",
    ["e-rape"] = "Е-rаре",
    ["Fatass"] = "Fat￰￰￰а￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕ",
    ["Femboy"] = "Fеmbоy",
    ["Femboys"] = "Fеmbоys",
    ["Horny"] = "һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у",
    ["Hitler"] = "Нi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥tl⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖е󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖r",
    ["Hentai"] = "H󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i", 
    ["hentai"] = "h󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i", 
    ["Hoes"] = "һоеѕ",
    ["Hoe"] = "һое",
    ["Kys"] = "K⁥⁥⁥⁥⁥⁥⁥⁥y⁥⁥⁥ѕ",
    ["Lmfao"] = "Lm⁥⁥⁥⁥⁥⁥⁥⁥fа⁥⁥о",
   ["rapist"] = "⁥⁥⁥⁥⁥⁥⁥⁥rа⁥⁥⁥⁥⁥⁥⁥⁥p⁥іѕt",
   ["Rapist"] = "⁥⁥⁥⁥⁥⁥⁥⁥Rа⁥⁥⁥⁥⁥⁥⁥⁥p⁥іѕt",
    ["Motherfucker"] = "Mot￰￰￰￰￰￰￰h￰e￰rf￰￰￰￰￰u￰с￰￰￰￰￰￰￰￰k￰e￰￰￰￰￰￰￰￰r",
    ["Masturbating"] = "M⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥ing",
    ["Meth"] = "Mе⁥⁥⁥⁥⁥⁥⁥⁥th",
    ["Naked"] = "Nаkеd",
    ["Nudes"] = "Nudеѕ",
    ["Orgasm"] = "оrg⁥⁥⁥⁥аѕm",
    ["Omfg"] = "оm⁥⁥⁥⁥⁥⁥⁥⁥fg",
    ["Pedophile"] = "p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е",
    ["Pornhub"] = "Р⁥⁥⁥o⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b",
    ["Penis"] = "pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ",
    ["Porn"] = "роrn",
    ["Pussies"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥i⁥⁥⁥е⁥⁥⁥s",
    ["Pussy"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥у",
    ["Rape"] = "Rаре",
    ["Stripper"] = "Strірреr",
    ["Slave"] = "ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е",
    ["Seduce"] = "ѕеduсе",
    ["Slut"] = "sӏut",
    ["Shit"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥s󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕һ⁥󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥t",
    ["Sexy"] = "ѕеху",
    ["Sex"] = "ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥",
    ["Titties"] = "T⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ",
    ["Thots"] = "T⁥⁥⁥⁥⁥⁥⁥⁥h⁥⁥⁥⁥⁥⁥⁥⁥otѕ",
    ["Thot"] = "T⁥⁥⁥⁥⁥⁥⁥⁥h⁥⁥⁥⁥⁥⁥⁥⁥ot",
    ["Tits"] = "T⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥ts",
    ["Tit"] = "Tіt",
    ["Virginity"] = "V￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰і￰￰￰￰t￰￰￰у",
    ["Virgin"] = "V￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰s",
    ["Vagina"] = "V󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕і󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a",
    ["fuck you"] = "f󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖uc󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖ky󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖o󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖u",
    ["what the fuck"] = "wha⁥⁥⁥⁥⁥⁥tt⁥⁥⁥⁥⁥⁥һеf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uс⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥k",
    ["shut the fuck up"] = "sһ⁥⁥⁥⁥⁥⁥utt⁥⁥⁥⁥⁥⁥һеf⁥⁥⁥⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥ku⁥⁥⁥⁥⁥⁥⁥⁥⁥p",
    ["go fuck yourself"] = "gof⁥⁥⁥⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥kу⁥⁥⁥⁥⁥о⁥⁥urself",
    ["fuck"] = "f⁥⁥⁥⁥⁥⁥⁥⁥uсk", --Sometimes worksb
    ["fucking"] = "f⁥⁥⁥⁥⁥⁥⁥⁥uсking",
    ["Fuck"] = "F⁥⁥⁥⁥⁥⁥⁥⁥uсk",
    ["FUCKING"] = " F⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UСΚӀ󠀕󠀕󠀕󠀖󠀕N⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕G ", 
    ["FUCKERS"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥R󠀕󠀕󠀕󠀕S",
    ["FUCKER"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R",
    ["FUCKED"] = "F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥D",
    ["FUCK"] = "F⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UСΚ", --always works
    ["FUCKS"] = "F⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥C󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥ΚS", 
    ["bites your cock"] = "bіtеѕуоurсосk", --Sentences that dont work normally
    ["big black cock"] = "big black сосk",
    ["masturbates"] = "ma⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥st⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥ur󠀕󠀕b󠀕󠀕a󠀕󠀕t󠀕󠀕e󠀕󠀕s",
    ["suck my cock retard"] = "ѕuсk my сосk ret⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥аrd",
    ["i pull all the bitches"] = "i pull all the bitсһеs",
    ["small penis"] = "small рen⁥⁥⁥⁥⁥⁥⁥⁥iѕ",
    ["nigger"] = "n⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggеr",
    ["NIGGER"] = "Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕Е⁥⁥⁥⁥R",
    ["NIGGA"] = "Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕А",
    ["niggers"] = "n⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggеrѕ",
    ["suck my cock"] = "ѕ⁥⁥⁥u⁥⁥⁥с⁥⁥⁥kmyсо⁥⁥⁥сk",
    ["lets have sex"] = "⁥⁥⁥ӏ⁥⁥⁥е⁥⁥⁥t⁥⁥⁥ѕ ⁥⁥⁥һ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е⁥⁥⁥ ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥",
    ["I HAVE A MASSIVE COCK"] = "I HAVE A MASSIVE СОСK",
    ["SHUT THE FUCK UP"] = "SHUTTHEF￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰ΚUР",
    ["I AM ABOUT TO CUM"] = "IАМ АВOU￰￰￰TTOС￰￰￰U￰￰￰М",
    ["wife"] = "wіfе", --Extra
    ["suck"] = "ѕuсk",
    ["love"] = "ӏ⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥vе",
    ["pregnant"] = "рrеgnаnt",
    ["mommy"] = "mоmmу",
    ["daddy"] = "d⁥⁥⁥а⁥⁥⁥d⁥⁥⁥d⁥⁥⁥у",
    ["WIFE"] = "WIFΕ",
    ["SUCK"] = "SUСK",
    ["kill"] = "k󠀕󠀕󠀕і󠀕󠀕󠀕l󠀕󠀕󠀕ӏ",
    ["yourself"] = "уо󠀕󠀕⁥⁥⁥⁥ur󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕⁥⁥⁥⁥еlf",
    ["pedo"] = "p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥о"
}

local function sendMessage()
    local message = textBox.Text
    for short, full in pairs(custom_chars) do
        message = string.gsub(message, short, full)
    end
    if message ~= "" then
        local success, err = pcall(function()
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        end)
        if not success then
            print("Error sending message:", err)
        end
        textBox.Text = ""
    end
end

sendButton.MouseButton1Click:Connect(sendMessage)

textBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendMessage()
    end
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
    end
})

  Tab:AddButton({
    Name = "Stop Tags",
    Callback = function()
wait()
game.StarterGui:SetCore("SendNotification", {Title="Info"; Text="The button prevents tagging; once clicked, it stops tagging the bypasses for a bit."; Duration=5;})
wait()
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("abcdeABCDE12345~`|•√?xđ", "All")
wait()
ResetFilter()
    end
})

--[[

░██╗░░░░░░░██╗░█████╗░██████╗░██████╗░░██████╗
░██║░░██╗░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
░╚██╗████╗██╔╝██║░░██║██████╔╝██║░░██║╚█████╗░
░░████╔═████║░██║░░██║██╔══██╗██║░░██║░╚═══██╗
░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██████╔╝██████╔╝
░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═════╝░╚═════╝░
--]]

local Section = Tab:AddSection({
    Name = "lowercase A-Z"
})

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "asshole",
    Callback = function()
sendMessage("⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ѕ⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥⁥һ⁥⁥󠀕󠀕о󠀕⁥⁥⁥󠀕󠀖ӏ⁥⁥⁥󠀕󠀖е⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ass",
    Callback = function()
sendMessage("а⁥⁥⁥ѕ⁥⁥⁥ѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "anus",
    Callback = function()
sendMessage("а⁥⁥⁥n⁥⁥⁥u⁥⁥⁥ѕ⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "arse ",
    Callback = function()
sendMessage("аr⁥⁥ѕ⁥е")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "anal",
    Callback = function()
sendMessage("аn⁥⁥⁥⁥аӏ")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "boner",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥b󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖о󠀗󠀕nе⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "blowjob",
    Callback = function()
sendMessage("bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bitches",
    Callback = function()
sendMessage("￰￰b￰￰і󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕t⁥⁥⁥⁥󠀕с⁥⁥⁥⁥󠀕һ⁥⁥⁥⁥󠀕󠀕󠀕󠀕е⁥⁥⁥⁥s")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bitch",
    Callback = function()
sendMessage("b⁥⁥i󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥⁥⁥сһ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boobies",
    Callback = function()
sendMessage("b⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥b⁥⁥⁥⁥і⁥⁥⁥⁥е⁥⁥⁥⁥s")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bullshit",
    Callback = function()
sendMessage("b⁥⁥⁥⁥u⁥⁥⁥l⁥⁥⁥⁥ӏ⁥⁥⁥s⁥⁥⁥һ⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥t")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bastard ",
    Callback = function()
sendMessage("bas⁥⁥⁥⁥⁥⁥⁥⁥tard")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "beaner",
    Callback = function()
sendMessage("b⁥⁥⁥е⁥⁥⁥а⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bondage",
    Callback = function()
sendMessage("b⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥а⁥⁥⁥g⁥⁥⁥е⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "butthole",
    Callback = function()
sendMessage("bu⁥⁥⁥⁥⁥⁥⁥⁥tthоle")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bootyhole",
    Callback = function()
sendMessage("b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty󠀕󠀕󠀕󠀕һoӏe")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "butt",
    Callback = function()
sendMessage("bu⁥⁥⁥⁥⁥⁥⁥⁥tt")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "booty",
    Callback = function()
sendMessage("b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boobs",
    Callback = function()
sendMessage("b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕b󠀕󠀕󠀕󠀕ѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boob",
    Callback = function()
sendMessage("bооb")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "breasts",
    Callback = function()
sendMessage("brеаѕtѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bbc",
    Callback = function()
sendMessage("b⁥⁥⁥b⁥⁥⁥с")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "cocaine",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥а⁥⁥⁥i⁥⁥⁥n⁥⁥⁥е")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "creampie",
    Callback = function()
sendMessage("с⁥⁥⁥r⁥⁥⁥е⁥⁥⁥а⁥⁥⁥m⁥⁥⁥р⁥⁥⁥i⁥⁥⁥е")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cumming",
    Callback = function()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("с⁥⁥⁥⁥umming", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cum",
    Callback = function()
sendMessage("с⁥⁥⁥⁥um")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cunts",
    Callback = function()
sendMessage("сu⁥⁥⁥⁥⁥⁥⁥⁥ntѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cunt",
    Callback = function()
sendMessage("с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀕󠀖⁥⁥⁥n󠀕󠀖t")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cock",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "clit",
    Callback = function()
sendMessage("с󠀕󠀕⁥І󠀕󠀕⁥і󠀕󠀕⁥t")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cuck",
    Callback = function()
sendMessage("с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cuckold",
    Callback = function()
sendMessage("с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k⁥⁥⁥о⁥⁥⁥ӏ⁥⁥⁥d⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "condoms",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m⁥⁥⁥s")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "condom",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "coochies",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥о⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥і⁥⁥⁥е⁥⁥⁥s")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "coochie",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥o⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cunny",
    Callback = function()
sendMessage("сu⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "dumbass",
    Callback = function()
sendMessage("d⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dickhead",
    Callback = function()
sendMessage("d￰￰￰￰￰і￰￰￰￰￰c￰￰￰￰￰kһ￰￰￰￰￰еad", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "discord",
    Callback = function()
sendMessage("dіѕсоrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "doggystyle",
    Callback = function()
sendMessage("d⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥s⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dildo",
    Callback = function()
sendMessage("d⁥󠀕󠀕󠀕󠀕⁥⁥і⁥󠀕󠀕󠀕󠀕⁥⁥ӏ⁥󠀕󠀕󠀕󠀕⁥⁥do", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Dick",
    Callback = function()
sendMessage("ᴅ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕іс󠀕󠀕k", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dicks",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥d⁥⁥і⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖с⁥k⁥⁥⁥⁥s", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "damn",
    Callback = function()
sendMessage("d⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "E-Rape",
    Callback = function()
sendMessage("Е-Rаре", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "E-Sex",
    Callback = function()
sendMessage("Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "fatass",
    Callback = function()
sendMessage("fat￰￰￰а￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Fucked",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Fuckers",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеrѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Fucker",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Faggot",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥ꜰ⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖⁥⁥⁥g⁥⁥⁥⁥gо󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fag",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥f⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖g⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fap",
    Callback = function()
sendMessage("f⁥󠀕⁥⁥а⁥󠀕⁥⁥р", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "femboys",
    Callback = function()
sendMessage("fеmbоys", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "femboy",
    Callback = function()
sendMessage("fеmbоy", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fanny",
    Callback = function()
sendMessage("fa⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "horny",
    Callback = function()
sendMessage("һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Hitler",
    Callback = function()
sendMessage("Нi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥tl⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖е󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hitler",
    Callback = function()
sendMessage("һ󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗itӏеr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hentai",
    Callback = function()
sendMessage("h󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hoes",
    Callback = function()
sendMessage("һоеѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hoe",
    Callback = function()
sendMessage("һ⁥⁥⁥⁥󠀕󠀕󠀕⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥е", "All")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "instagram",
    Callback = function()
sendMessage("і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tаg󠀕󠀕󠀕󠀕rаm", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "insta",
    Callback = function()
sendMessage("i󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥s󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ta", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "kys",
    Callback = function()
sendMessage("k⁥⁥⁥⁥⁥⁥⁥⁥y⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "lmfao",
    Callback = function()
sendMessage("ӏm⁥⁥⁥⁥⁥⁥⁥⁥fа⁥⁥о", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lmao",
    Callback = function()
sendMessage("ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥maо", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "motherfucker",
    Callback = function()
sendMessage("mot￰￰￰￰￰￰￰h￰e￰rf￰￰￰￰￰u￰с￰￰￰￰￰￰￰￰k￰e￰￰￰￰￰￰￰￰r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "masturbate",
    Callback = function()
sendMessage("m󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕b󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "masturbating",
    Callback = function()
sendMessage("m⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥ing", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "molest",
    Callback = function()
sendMessage("m⁥⁥⁥⁥o⁥⁥⁥⁥ӏ⁥⁥⁥⁥е⁥⁥⁥ѕ⁥⁥⁥⁥t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "meth",
    Callback = function()
sendMessage("mе⁥⁥⁥⁥⁥⁥⁥⁥th", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "Niggas",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕⁥і󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕аs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "naked",
    Callback = function()
sendMessage("nаkеd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "negro",
    Callback = function()
sendMessage("n󠀕󠀕󠀕󠀕󠀕󠀕󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕o", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nipples",
    Callback = function()
sendMessage("n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nipple",
    Callback = function()
sendMessage("n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nudes",
    Callback = function()
sendMessage("n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕еѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nude",
    Callback = function()
sendMessage("n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nazi",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥a￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥z󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥i", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "onlyfans",
    Callback = function()
sendMessage("оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "orgasm",
    Callback = function()
sendMessage("оrg⁥⁥⁥⁥аѕm", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "pedophile",
    Callback = function()
sendMessage("p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Pornhub",
    Callback = function()
sendMessage("Р⁥⁥⁥o⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "penis",
    Callback = function()
sendMessage("pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "porn",
    Callback = function()
sendMessage("роrn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "pussies",
    Callback = function()
sendMessage("р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥i⁥⁥⁥е⁥⁥⁥s", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "pussy",
    Callback = function()
sendMessage("р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥у", "All")
ResetFilter()
    end
})

 Tab:AddLabel("Q")

  Tab:AddButton({
    Name = "queer",
    Callback = function()
sendMessage("󠀕󠀕￰￰󠀕q￰￰￰󠀕󠀕󠀕￰￰￰u￰￰￰￰￰￰e󠀕󠀕󠀕￰￰￰￰￰￰e￰￰￰￰￰￰r", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "retarded",
    Callback = function()
sendMessage("⁥⁥⁥r⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀗󠀕󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥󠀖󠀖󠀗󠀕etаr⁥⁥⁥dеd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "rapist",
    Callback = function()
sendMessage("r⁥⁥⁥⁥󠀕󠀕󠀕а⁥⁥⁥⁥󠀕󠀕󠀕р⁥⁥⁥⁥󠀕󠀕󠀕іѕ⁥⁥⁥⁥󠀕󠀕󠀕t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "rape",
    Callback = function()
sendMessage("rаре", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "schlong",
    Callback = function()
sendMessage("ѕс⁥⁥⁥⁥һ󠀗󠀕󠀕󠀕󠀕ӏо⁥⁥⁥⁥n󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗g", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "stripper",
    Callback = function()
sendMessage("ѕtrірреr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "slave",
    Callback = function()
sendMessage("ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sperm",
    Callback = function()
sendMessage("ѕpе󠀕￰￰￰￰󠀖r￰󠀖m", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "seduce",
    Callback = function()
sendMessage("ѕеduсе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "slut",
    Callback = function()
sendMessage("sӏut", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "shit",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥⁥⁥⁥s󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕һ⁥󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sexy",
    Callback = function()
sendMessage("ѕеху", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sex",
    Callback = function()
sendMessage("ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("T")

  Tab:AddButton({
    Name = "titties",
    Callback = function()
sendMessage("t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "thots",
    Callback = function()
sendMessage("t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt󠀗󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "thot",
    Callback = function()
sendMessage("t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "tranny",
    Callback = function()
sendMessage("tr󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕а￰￰￰￰￰￰n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰n￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "tits",
    Callback = function()
sendMessage("t󠀗󠀕󠀕󠀕󠀕󠀕i⁥⁥⁥⁥t⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "tit",
    Callback = function()
sendMessage("⁥⁥⁥t󠀗󠀕⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕і⁥⁥⁥⁥t", "All")
ResetFilter()
    end
})

 Tab:AddLabel("V")

  Tab:AddButton({
    Name = "virginity",
    Callback = function()
sendMessage("v￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰і￰￰￰￰t￰￰￰у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "virgins",
    Callback = function()
sendMessage("v󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗ir⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕gi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖ns", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "virgin",
    Callback = function()
sendMessage("v󠀕￰￰￰￰￰￰󠀘і󠀖￰￰￰￰￰￰￰￰󠀘r󠀕￰￰￰￰￰￰￰￰󠀖g󠀖￰￰￰￰￰￰￰￰￰󠀘і󠀘￰￰￰￰￰￰￰￰n", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "vagina",
    Callback = function()
sendMessage("⁥⁥v󠀗󠀕󠀕󠀕󠀕⁥⁥⁥⁥󠀕󠀖⁥⁥⁥⁥а󠀗󠀕󠀕󠀕g⁥⁥⁥⁥і⁥⁥⁥⁥󠀗󠀕n⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖a")
ResetFilter()
    end
})

 Tab:AddLabel("W")

  Tab:AddButton({
    Name = "whore",
    Callback = function()
sendMessage("w⁥⁥⁥һ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "weed",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕w󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥е󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥d")
ResetFilter()
    end
})

 Tab:AddLabel("X")

  Tab:AddButton({
    Name = "xxx",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Uppercase/Capital A-Z"
})

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "ASS",
    Callback = function()
sendMessage("АЅЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ASSHOLE",
    Callback = function()
sendMessage("АЅЅНОLЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ANUS",
    Callback = function()
sendMessage("АΝUЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ARSE",
    Callback = function()
sendMessage("А⁥⁥⁥R⁥⁥⁥⁥⁥󠀕󠀕󠀕Ѕ⁥⁥⁥⁥⁥⁥Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ANAL",
    Callback = function()
sendMessage("АΝ⁥⁥⁥⁥⁥⁥АL", "All")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "BASTARD",
    Callback = function()
sendMessage("ВАЅТАRD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BONDAGE",
    Callback = function()
sendMessage("В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥О󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥D󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АGЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BONER",
    Callback = function()
sendMessage("⁥В⁥⁥O⁥⁥N⁥⁥Е⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BITCHES",
    Callback = function()
sendMessage("В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СНЕS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BITCH",
    Callback = function()
sendMessage("В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СН", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BLOWJOB",
    Callback = function()
sendMessage("В󠀕󠀕󠀕󠀕󠀕󠀖LОW󠀕󠀕󠀕󠀕󠀕󠀖ЈО󠀕󠀕󠀕󠀕󠀕󠀖В", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BULLSHIT",
    Callback = function()
sendMessage("В󠀖󠀖⁥⁥⁥⁥UL󠀖󠀖⁥⁥⁥⁥LЅН󠀖󠀖⁥⁥⁥⁥ӀТ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BOOBS",
    Callback = function()
sendMessage("ВООВS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BOOB",
    Callback = function()
sendMessage("ВООВ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BUTTHOLE",
    Callback = function()
sendMessage("ВUТТ⁥⁥⁥⁥НOLЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BUTT",
    Callback = function()
sendMessage("ВUТТ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BOOTY",
    Callback = function()
sendMessage("ВООТΥ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BEANER",
    Callback = function()
sendMessage("В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "COCAINE",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ӀΝ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUNTS",
    Callback = function()
sendMessage("СU⁥⁥⁥⁥⁥⁥⁥⁥NТЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUNT",
    Callback = function()
sendMessage("СU⁥⁥⁥⁥⁥⁥⁥⁥NТ", "All")
ResetFilter()
    end
}) 

  Tab:AddButton({
    Name = "COOCHIES",
    Callback = function()
sendMessage("С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "COOCHIE",
    Callback = function()
sendMessage("С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUM",
    Callback = function()
sendMessage("СUМ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CREAMPIE",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АМ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥PIE", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "COCK",
    Callback = function()
sendMessage("СОСK", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUCKOLD",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥KOLD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUCK",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥K", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "DISCORD",
    Callback = function()
sendMessage("DӀЅСОRD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DUMBASS",
    Callback = function()
sendMessage("D󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕UM⁥⁥⁥⁥⁥⁥⁥⁥⁥BАЅЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DILDO",
    Callback = function()
sendMessage("D⁥󠀕󠀕󠀕󠀕⁥⁥Ӏ⁥󠀕󠀕󠀕󠀕⁥⁥L⁥󠀕󠀕󠀕󠀕⁥⁥DО", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DICKHEAD",
    Callback = function()
sendMessage("D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚНЕ󠀕⁥⁥󠀕AD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DICK",
    Callback = function()
sendMessage("D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DAMN",
    Callback = function()
sendMessage("DАМΝ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "FAGGOT",
    Callback = function()
sendMessage("F󠀕󠀖󠀗󠀘￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀖󠀗󠀘А󠀕󠀖󠀗󠀘󠀕󠀖￰￰￰￰￰￰󠀕G⁥⁥󠀖󠀗󠀘󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀘󠀘G󠀖󠀗󠀘󠀖󠀗󠀘￰￰￰￰￰￰￰О󠀖󠀗󠀘￰￰￰￰￰󠀖󠀗Т", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FATASS",
    Callback = function()
sendMessage("F⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})
  Tab:AddButton({
    Name = "FEMBOYS",
    Callback = function()
sendMessage("FЕМВОΥЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FEMBOY",
    Callback = function()
sendMessage("FЕМВОΥ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCKERS",
    Callback = function()
sendMessage("󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥R󠀕󠀕󠀕󠀕S", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCKER",
    Callback = function()
sendMessage("󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCKED",
    Callback = function()
sendMessage("F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥D", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCK",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕U⁥СΚ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "HITLER",
    Callback = function()
sendMessage("НӀ⁥⁥⁥⁥⁥⁥⁥⁥ТL⁥⁥⁥⁥⁥⁥⁥⁥Е⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HENTAI",
    Callback = function()
sendMessage("НЕ⁥⁥⁥⁥Ν⁥ТАӀ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HORNY",
    Callback = function()
sendMessage("НОRNY", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HOES",
    Callback = function()
sendMessage("НОЕЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HOE",
    Callback = function()
sendMessage("НОЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "KYS",
    Callback = function()
sendMessage("ΚΥЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "LMFAO",
    Callback = function()
sendMessage("LМFАО", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "LMAO",
    Callback = function()
sendMessage("LМАО", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "MOTHERFUCKER",
    Callback = function()
sendMessage("МО󠀕󠀕󠀕󠀖󠀖ТНЕ󠀕󠀕󠀕󠀖󠀖R󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "MASTURBATE",
    Callback = function()
sendMessage("МАЅТURВАТΕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "METH",
    Callback = function()
sendMessage("МETH", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "NIGGER",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕Е⁥⁥⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NIGGA",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕А", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NEGRO",
    Callback = function()
sendMessage("NE󠀕󠀕⁥⁥󠀕G󠀕󠀖⁥⁥󠀕R󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕O", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NAKED",
    Callback = function()
sendMessage("ΝΑKΕD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NUDES",
    Callback = function()
sendMessage("ΝUDЕЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NUDE",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕U󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕D󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NAZI",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥N⁥⁥⁥⁥⁥А⁥⁥⁥⁥⁥Z⁥⁥⁥⁥⁥Ӏ⁥⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NIPPLES",
    Callback = function()
sendMessage("Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NIPPLE",
    Callback = function()
sendMessage("Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "OMFG",
    Callback = function()
sendMessage("ОM⁥⁥⁥⁥⁥⁥⁥⁥FG", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "PENIS",
    Callback = function()
sendMessage("PEN⁥⁥ӀS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PUSSIES",
    Callback = function()
sendMessage("Р⁥⁥⁥U⁥⁥⁥Ѕ⁥⁥⁥S⁥⁥⁥Ӏ⁥⁥⁥Е⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PUSSY",
    Callback = function()
sendMessage("Р󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕U⁥⁥⁥⁥⁥Ѕ󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕S󠀕⁥⁥⁥⁥⁥󠀕󠀖󠀖󠀗󠀕Υ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PORNHUB",
    Callback = function()
sendMessage("⁥⁥Р⁥⁥⁥󠀕⁥⁥󠀕О⁥⁥R⁥⁥⁥⁥⁥󠀕⁥⁥󠀕N⁥⁥⁥󠀕󠀕Н⁥⁥⁥⁥⁥󠀕󠀕UВ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PORN",
    Callback = function()
sendMessage("РО󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕RΝ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PISS",
    Callback = function()
sendMessage("РӀЅЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "RETARD",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕R󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥Е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥Т󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥A￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰￰R󠀕󠀕D", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "RAPE",
    Callback = function()
sendMessage("RАРЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "STFU",
    Callback = function()
sendMessage("ЅТFU", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHIT",
    Callback = function()
sendMessage("ЅH⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IT", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SLUT",
    Callback = function()
sendMessage("ЅL⁥⁥⁥⁥UТ", "All")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "SLAVE",
    Callback = function()
sendMessage("ЅLА󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖VE", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SEX",
    Callback = function()
sendMessage("ЅЕХ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("T")

  Tab:AddButton({
    Name = "TITTIES",
    Callback = function()
sendMessage("ТIТТIES", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "TITS",
    Callback = function()
sendMessage("ТIТЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "THOTS",
    Callback = function()
sendMessage("ТН⁥⁥⁥⁥⁥ОТЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "THOT",
    Callback = function()
sendMessage("ТН⁥⁥⁥⁥⁥ОТ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("V")

  Tab:AddButton({
    Name = "VIRGINITY",
    Callback = function()
sendMessage("V￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰ΝITY", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "VIRGINS",
    Callback = function()
sendMessage("V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰INS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "VIRGIN",
    Callback = function()
sendMessage("V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰I￰￰￰￰￰￰￰￰N", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "VAGINA",
    Callback = function()
sendMessage("V￰￰￰￰￰￰А￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰￰N￰￰￰￰￰￰￰￰А", "All")
ResetFilter()
    end
})

 Tab:AddLabel("W")

  Tab:AddButton({
    Name = "WHORE",
    Callback = function()
sendMessage("W⁥⁥⁥Н⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Е", "All")
ResetFilter()
    end
})

 Tab:AddLabel("X")

  Tab:AddButton({
    Name = "XXX",
    Callback = function()
sendMessage("X⁥⁥⁥⁥XX", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "Sentences",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Extra"
})
Tab:AddParagraph("SEX BOT (Beta)","Fuck a player!")

local UsernameTextBox = Tab:AddTextbox({
    Name = "Username/Display Name:",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        local selectedAnimation = tonumber(DropdownValue)

        if selectedAnimation == 1 then
            bangAnimation(Value)
        elseif selectedAnimation == 2 then
            bangAnimation2(Value)
        else
            Orion:MakeNotification({
                Name = "Error",
                Content = "You must select an animation type before entering a username.",
                Time = 5
            })
        end
    end
})

local Dropdown = Tab:AddDropdown({
    Name = "Animation Type",
    Default = "Select Animation",
    Options = {"1", "2"},
    Callback = function(Value)
        DropdownValue = Value
    end
})

local function findPlayer(name)
    local lowerName = string.lower(name)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), lowerName) or string.find(string.lower(player.DisplayName), lowerName) then
            return player
        end
    end
    return nil
end

local animationTrack = nil
local animationConnection = nil
local followConnection = nil
local animationTrack2 = nil
local animationConnection2 = nil
local floatConnection = nil
local bangDied = nil
local bang = nil
local bangAnim = nil
local bangLoop = nil

function bangAnimation(playerName)
    local player = findPlayer(playerName)
    if player then

        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        local localHumanoid = localCharacter:FindFirstChildOfClass("Humanoid")

        if localHumanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = localHumanoid.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"
            animationTrack = localHumanoid:LoadAnimation(animation)
            animationTrack:Play()
            animationTrack:AdjustSpeed(10)

            animationConnection = localHumanoid.Died:Connect(stopAnimations)

            followConnection = game:GetService("RunService").Stepped:Connect(function()
                if localCharacter and player.Character then
                    local offset = CFrame.new(0, 0, 0.5)
                    local targetCFrame = player.Character.HumanoidRootPart.CFrame
                    local localCFrame = targetCFrame * offset
                    localCharacter.HumanoidRootPart.CFrame = localCFrame
                end
            end)

          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("С￰￰￰￰￰￰￰М￰￰￰￰￰￰￰ОΝВ￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СНЅUСΚТНАТCО￰￰￰￰￰￰￰СΚ", "All")
           wait(1)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ВЕАGООDН󠀖󠀗󠀘￰￰￰￰О￰￰￰￰ЕFОRРА￰￰￰￰РӀ..YЕ￰￰￰￰АН..ТНАТЅӀТ..", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("НОLYЅН󠀘󠀖󠀗󠀘￰￰￰￰￰ӀТIА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OС￰󠀕󠀖󠀗󠀕󠀖󠀗￰￰U￰￰￰М", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Н⁥⁥⁥⁥⁥⁥О⁥⁥⁥L⁥⁥⁥⁥⁥⁥ΥЅ⁥⁥⁥⁥⁥⁥Н⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥ӀТ⁥⁥⁥Т⁥⁥⁥Т⁥⁥⁥Т", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("IА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OВU￰￰￰ΖΖМΥF⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥ЅСОСK", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("*с⁥⁥⁥⁥umѕ аӏоt*", "All")
          ResetFilter()

            wait(1)
            stopAnimation(animationTrack, animationConnection, followConnection)
        end
    else
        Orion:MakeNotification({
            Name = "Error",
            Content = "Player not found.",
            Time = 5
        })
    end
end

function bangAnimation2(playerName)
    local player = findPlayer(playerName)
    if player then

        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        local localHumanoid = localCharacter:FindFirstChildOfClass("Humanoid")
        if localHumanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = localHumanoid.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"
            animationTrack2 = localHumanoid:LoadAnimation(animation)
            animationTrack2:Play()
            animationTrack2:AdjustSpeed(10)

            animationConnection2 = animationTrack2.KeyframeReached:Connect(function(keyframeName)
                if keyframeName == "End" then
                    local targetHead = player.Character:FindFirstChild("Head")
                    if targetHead then
                        local torsoOffset = localCharacter:FindFirstChild("Torso") or localCharacter:FindFirstChild("UpperTorso")
                        if torsoOffset then
                            local offset = CFrame.new(0, targetHead.Size.Y - torsoOffset.Size.Y + 1, -1) * CFrame.Angles(0, math.pi, 0)
                            localCharacter.HumanoidRootPart.CFrame = targetHead.CFrame * offset
                        end
                    end
                end
            end)

            animationConnection2 = localHumanoid.Died:Connect(stopAnimations)

            floatConnection = game:GetService("RunService").Stepped:Connect(function()
                localCharacter.HumanoidRootPart.Anchored = true
                localCharacter.HumanoidRootPart.CanCollide = false
            end)

            -- Send chat message for Animation 2
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("󠀕󠀕󠀕Е⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥А⁥⁥⁥⁥⁥⁥⁥⁥ТТ󠀕󠀕󠀕НАТР⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥U󠀕󠀕󠀕󠀖󠀕S⁥⁥⁥⁥⁥⁥⁥⁥Ѕ⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥⁥YВ󠀕󠀕󠀕󠀖󠀕Ӏ󠀕󠀕󠀕󠀖󠀕Т⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥СН", "All")
          ResetFilter()
           wait(1)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("MMHMYEAH..", "All")
          ResetFilter()
           wait()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("DADDY", "All")
          ResetFilter()
           wait(3)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("НОLYЅН󠀘󠀖󠀗󠀘￰￰￰￰￰ӀТIА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OС￰󠀕󠀖󠀗󠀕󠀖󠀗￰￰U￰￰￰М", "All")
          ResetFilter()
           wait(2)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Н⁥⁥⁥⁥⁥⁥О⁥⁥⁥L⁥⁥⁥⁥⁥⁥ΥЅ⁥⁥⁥⁥⁥⁥Н⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥ӀТ⁥⁥⁥Т⁥⁥⁥Т⁥⁥⁥Т", "All")
          ResetFilter()
           wait(3)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("*с⁥⁥⁥⁥umѕ аӏоt*", "All")
          ResetFilter()

            -- Follow the target instead of teleporting
            local followConnection2 = game:GetService("RunService").Stepped:Connect(function()
                if localCharacter and player.Character then
                    local targetPosition = player.Character.HumanoidRootPart.Position
                    local currentPosition = localCharacter.HumanoidRootPart.Position
                    local direction = (targetPosition - currentPosition).Unit
                    local speed = 10 -- Adjust this value to control the speed of following
                    local newPosition = currentPosition + direction * speed * game:GetService("RunService").Stepped:Wait()
                    localCharacter.HumanoidRootPart.CFrame = CFrame.new(newPosition, targetPosition)
                end
            end)

            -- Stop the animation after 10 seconds
            wait(1)
            stopAnimation2(animationTrack2, animationConnection2, floatConnection, followConnection2)
        end
    else
        Orion:MakeNotification({
            Name = "Error",
            Content = "Player not found.",
            Time = 5
        })
    end
end

function stopAnimations()
    stopAnimation(animationTrack, animationConnection, followConnection)
    stopAnimation2(animationTrack2, animationConnection2, floatConnection, nil)
end

function stopAnimation(track, connection, followConnection)
    if track then
        track:Stop()
        track = nil
    end
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
end

function stopAnimation2(track, connection, floatConnection, followConnection)
    if track then
        track:Stop()
        track = nil
    end
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if floatConnection then
        floatConnection:Disconnect()
        floatConnection = nil
        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        if localCharacter then
            localCharacter.HumanoidRootPart.Anchored = false
            localCharacter.HumanoidRootPart.CanCollide = true
        end
    end
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
end

function stopAnimationWithCode(args, speaker)
    if bangDied then
        bangDied:Disconnect()
        bangDied = nil
    end

    if bang then
        bang:Stop()
        bang = nil
    end

    if bangAnim then
        bangAnim:Destroy()
        bangAnim = nil
    end

    if bangLoop then
        bangLoop:Disconnect()
        bangLoop = nil
    end
end

Tab:AddParagraph("IMPORTANT","Put Animation: 1 if you're a Male and put Animation: 2 if you're a Female! (Animation 2 isn't the best right now)")

local Section = Tab:AddSection({
    Name = "lowercase A-Z"
})

--[[

░██████╗███████╗███╗░░██╗████████╗███████╗███╗░░██╗░█████╗░███████╗░██████╗
██╔════╝██╔════╝████╗░██║╚══██╔══╝██╔════╝████╗░██║██╔══██╗██╔════╝██╔════╝
╚█████╗░█████╗░░██╔██╗██║░░░██║░░░█████╗░░██╔██╗██║██║░░╚═╝█████╗░░╚█████╗░
░╚═══██╗██╔══╝░░██║╚████║░░░██║░░░██╔══╝░░██║╚████║██║░░██╗██╔══╝░░░╚═══██╗
██████╔╝███████╗██║░╚███║░░░██║░░░███████╗██║░╚███║╚█████╔╝███████╗██████╔╝
╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚══╝░╚════╝░╚══════╝╚═════╝░
--]]

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "anal sex pls",
    Callback = function()
sendMessage("аn⁥⁥⁥⁥аl ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥ pls", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "anal sex",
    Callback = function()
sendMessage("аn⁥⁥⁥⁥аl ѕ⁥⁥⁥е⁥⁥⁥х", "All")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "ass sex pls",
    Callback = function()
sendMessage("а⁥⁥⁥⁥ѕѕs⁥⁥⁥⁥ехpӏs", "All")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "Boom cockshot!",
    Callback = function()
sendMessage("В⁥⁥⁥⁥о⁥⁥⁥⁥о⁥⁥⁥⁥m⁥⁥⁥⁥ с⁥⁥⁥⁥о⁥⁥⁥⁥с⁥⁥⁥⁥k⁥⁥⁥⁥ѕ⁥⁥⁥⁥h⁥⁥⁥⁥о⁥⁥⁥⁥t⁥⁥⁥⁥!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boner alert!",
    Callback = function()
sendMessage("b⁥⁥⁥o⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ӏ⁥⁥⁥е⁥⁥⁥r⁥⁥⁥t⁥⁥⁥!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "butt sex",
    Callback = function()
sendMessage("bu⁥⁥⁥⁥⁥⁥⁥⁥tt ѕ⁥⁥⁥еx", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "big cock",
    Callback = function()
sendMessage("b⁥ig со⁥⁥⁥сk", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boobs or ass?",
    Callback = function()
sendMessage("b⁥⁥⁥о⁥⁥⁥о⁥⁥⁥b⁥⁥⁥ѕ⁥⁥⁥ ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥ѕ?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Big ass thighs",
    Callback = function()
sendMessage("Віg аѕѕ thіghѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "big black cock",
    Callback = function()
sendMessage("big black сосk", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Big ass",
    Callback = function()
sendMessage("Віg аѕѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Be my wife!",
    Callback = function()
sendMessage("Ве mу wіfе!", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "Can I see those cute boobs of yours?",
    Callback = function()
ResetFilter()
sendMessage("Саn І ѕее thоѕе сutе bооbѕ оf уоurѕ?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cock sucker",
    Callback = function()
sendMessage("с￰￰￰￰о￰￰￰￰с￰￰￰￰k￰￰￰￰￰￰￰￰ѕ￰￰￰￰u￰￰￰￰с￰￰￰￰k￰￰￰￰е￰￰￰￰r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cum on me please!",
    Callback = function()
sendMessage("С⁥⁥⁥⁥umonme please!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cum please",
    Callback = function()
sendMessage("с⁥⁥⁥⁥um рӏеаѕе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cut yourself.",
    Callback = function()
sendMessage("сutyоurself.", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "child porn",
    Callback = function()
sendMessage("сhildроrn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cock incoming!",
    Callback = function()
sendMessage("C󠀕󠀕󠀕󠀕о⁥⁥⁥⁥⁥⁥⁥⁥⁥сki⁥⁥󠀕󠀕󠀕󠀕⁥nс⁥⁥󠀕󠀕󠀕󠀕⁥о󠀕󠀕󠀕󠀕m󠀕󠀕󠀕󠀕i󠀕󠀕󠀕󠀕n⁥⁥⁥g!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cock in bedroom",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕о⁥⁥⁥⁥⁥⁥⁥⁥⁥с󠀕⁥⁥kі⁥󠀕󠀕󠀕󠀕⁥⁥nb⁥⁥е󠀕󠀕󠀕󠀕dr⁥ооm", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cock or Boobs",
    Callback = function()
sendMessage("С⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k⁥⁥⁥ ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥В⁥⁥⁥о⁥⁥⁥о⁥⁥⁥b⁥⁥⁥ѕ⁥⁥⁥?", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "damn you got a long schlong daddy",
    Callback = function()
sendMessage("d⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥ ⁥⁥⁥у⁥⁥⁥о⁥⁥⁥u⁥⁥⁥ ⁥⁥⁥g⁥⁥⁥о⁥⁥⁥t⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ ⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥d⁥⁥⁥а⁥⁥⁥d⁥⁥⁥d⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dirty hoe",
    Callback = function()
sendMessage("d⁥⁥⁥⁥⁥⁥i⁥⁥⁥⁥rt⁥⁥⁥у⁥⁥h⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥e", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "fuck yourself",
    Callback = function()
sendMessage("󠀕⁥⁥󠀕f⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥uс󠀕󠀕⁥⁥⁥⁥󠀕k󠀕󠀕⁥⁥y󠀕󠀕⁥⁥⁥⁥⁥⁥⁥󠀕о⁥⁥u⁥⁥󠀕⁥r⁥⁥󠀕⁥⁥⁥⁥⁥ѕ⁥⁥⁥󠀕⁥⁥⁥⁥󠀕󠀕󠀕e⁥⁥l⁥⁥f", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fuck you",
    Callback = function()
sendMessage("⁥⁥⁥f⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖kу󠀖󠀗󠀕󠀖⁥ou", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fuck off",
    Callback = function()
sendMessage("⁥⁥⁥f⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖ko󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥f⁥⁥󠀖󠀗󠀕󠀖󠀗󠀕⁥⁥⁥⁥f", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "free porn",
    Callback = function()
sendMessage("frее роrn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fatass hoe",
    Callback = function()
sendMessage("f󠀘󠀕󠀖󠀗аt￰￰￰a￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕһ⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀘󠀕󠀖󠀗ое", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fat ass",
    Callback = function()
sendMessage("f󠀘󠀕󠀖󠀗аt ￰￰￰a￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕs", "All")
ResetFilter()
    end
})

 Tab:AddLabel("G")

  Tab:AddButton({
    Name = "go end your own life.",
    Callback = function()
sendMessage("gо еnd уоur оwn lіfе.", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "Hail Hitler",
    Callback = function()
sendMessage("На⁥⁥⁥⁥⁥iӏНi⁥⁥⁥⁥⁥⁥⁥⁥tӏ⁥⁥⁥⁥⁥⁥⁥⁥е⁥⁥r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hail hitler",
    Callback = function()
sendMessage("⁥⁥⁥һ󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥а󠀕⁥⁥󠀕󠀕і󠀕󠀕ӏһ󠀕󠀖󠀗󠀘󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗itӏеr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hardcore sex",
    Callback = function()
sendMessage("h⁥⁥⁥а⁥⁥⁥r⁥⁥⁥d⁥⁥⁥с⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е⁥⁥⁥ ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "holy fuck",
    Callback = function()
sendMessage("⁥⁥⁥һ󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥о󠀕⁥⁥󠀕󠀕ӏ󠀕󠀕уf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖k", "All")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "I eat pussy",
    Callback = function()
sendMessage("I⁥⁥⁥⁥⁥⁥ е⁥⁥⁥⁥⁥⁥⁥аt ⁥⁥р⁥⁥⁥u⁥⁥⁥⁥s⁥⁥sу", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i love minors",
    Callback = function()
sendMessage("⁥⁥⁥і ӏ⁥⁥⁥о⁥⁥⁥v⁥⁥⁥е ⁥⁥⁥m⁥⁥⁥і⁥⁥⁥n⁥⁥⁥о⁥⁥⁥r⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i love you",
    Callback = function()
sendMessage("і ӏоvе уоu", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I love cocks",
    Callback = function()
sendMessage("I⁥⁥⁥⁥⁥⁥ ӏ⁥⁥о⁥⁥vе ⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥kѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i love boobs",
    Callback = function()
sendMessage("і⁥⁥⁥ ⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥vе bооbѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i like titties",
    Callback = function()
sendMessage("і ӏіkе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "im gonna make you pregnant mommy",
    Callback = function()
sendMessage("іm gоnnа mаkе уоu рrеgnаnt mоmmу", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm sexy, and you know it",
    Callback = function()
sendMessage("і'm ѕеху, аnd уου knοw іt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm horny so moan",
    Callback = function()
sendMessage("і'm һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у ѕο mοаn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm mad horny",
    Callback = function()
sendMessage("і'm mad һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm gonna bang you hard",
    Callback = function()
sendMessage("і'm gοnnа bаng уοu һаrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm so hard rn",
    Callback = function()
sendMessage("і'm ѕо hаrd rn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm so wet daddy",
    Callback = function()
sendMessage("і'm ѕо wеt daddy", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm so wet",
    Callback = function()
sendMessage("і'm ѕо wеt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm craving titties",
    Callback = function()
sendMessage("i'mcravingt⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іttіеѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I would like to see some titties",
    Callback = function()
sendMessage("Ι wοuӏd ӏіkе tο ѕее ѕοmе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i wanna kms",
    Callback = function()
sendMessage("і wаnnа kmѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i wanna smash you",
    Callback = function()
sendMessage("і wаnnа ѕmаѕh уоu", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i want to drink your breasts",
    Callback = function()
sendMessage("і wаnt tо dr⁥⁥⁥⁥⁥іnkуоurbrе⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕtѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I do sexy things",
    Callback = function()
sendMessage("І dо ѕеху thіngѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I banged your girl so hard",
    Callback = function()
sendMessage("І bаngеd уоur gіrl ѕо һаrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I dont give a shit.",
    Callback = function()
sendMessage("I dont give a sһіt.", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I love sex",
    Callback = function()
sendMessage("I love ѕеx", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I'll make you pregnant",
    Callback = function()
sendMessage("І'ӏӏ mаkе уоu рrеgnаnt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "imagine getting no bitches",
    Callback = function()
sendMessage("imagine getting no bitсһеs", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "kill yourself",
    Callback = function()
sendMessage("kіӏl уоurѕеӏf", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "keep moaning",
    Callback = function()
sendMessage("keep mоаning", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "lets do doggy style",
    Callback = function()
sendMessage("ӏ⁥⁥⁥е⁥⁥⁥t⁥⁥⁥ѕ⁥⁥⁥⁥⁥⁥d⁥⁥⁥о⁥⁥⁥⁥⁥⁥d⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lets have sex",
    Callback = function()
sendMessage("⁥⁥⁥ӏ⁥⁥⁥е⁥⁥⁥t⁥⁥⁥ѕ ⁥⁥⁥һ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е⁥⁥⁥ ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "let me squish those titties",
    Callback = function()
sendMessage("ӏеt mе ѕqυіѕһ tһοѕе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lgbtq+ is related to autism",
    Callback = function()
sendMessage("Ι⁥⁥⁥g⁥⁥⁥b⁥⁥⁥t⁥⁥⁥q⁥⁥⁥+⁥⁥⁥ ⁥⁥⁥і⁥⁥⁥ѕ⁥⁥⁥ ⁥⁥⁥r⁥⁥⁥е⁥⁥⁥l⁥⁥⁥а⁥⁥⁥t⁥⁥⁥е⁥⁥⁥d t⁥⁥⁥о⁥⁥⁥ а⁥⁥⁥u⁥⁥⁥t⁥⁥⁥і⁥⁥⁥ѕ⁥⁥⁥m", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lil n-word",
    Callback = function()
sendMessage("ӏ⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥ln⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀖󠀕g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀖󠀕а", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "Mind if you let me squish those titties",
    Callback = function()
sendMessage("Mind if you ӏеt mе ѕqυіѕһ tһοѕе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "my condom fell off!",
    Callback = function()
sendMessage("mу ⁥⁥⁥с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m fеӏӏ оff!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Mr Breast is so cool",
    Callback = function()
sendMessage("Мr Вrеаѕt іѕ ѕо сооl", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "my cock is dirty",
    Callback = function()
sendMessage("myсо⁥⁥⁥⁥⁥⁥⁥⁥⁥сkisdirty", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "make me pregnant",
    Callback = function()
sendMessage("mаkе mе рrеgnаnt", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "Naked boys",
    Callback = function()
sendMessage("Νаkеd Вοуѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Naked girls",
    Callback = function()
sendMessage("Νаkеd Gіrӏѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nice tits",
    Callback = function()
sendMessage("nісеt⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іts", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "oral sex",
    Callback = function()
sendMessage("оrаӏѕех", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "pussy licker",
    Callback = function()
sendMessage("р⁥⁥⁥u⁥⁥⁥⁥s⁥⁥sу ӏi⁥⁥с⁥⁥⁥k⁥⁥е⁥⁥⁥⁥⁥⁥r", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "rape me",
    Callback = function()
sendMessage("rареmе", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "spank me daddy",
    Callback = function()
sendMessage("ѕ⁥⁥⁥р⁥⁥⁥а⁥⁥⁥n⁥⁥⁥k⁥⁥⁥ ⁥⁥⁥m⁥⁥⁥е⁥⁥⁥ ⁥⁥⁥d⁥⁥⁥а⁥⁥⁥d⁥⁥⁥d⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sex slave",
    Callback = function()
sendMessage("ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Sweet cock dude",
    Callback = function()
sendMessage("Ѕwееt сосk dudе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "smd hoe",
    Callback = function()
sendMessage("ѕmd һ⁥⁥⁥о⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "suck my cock",
    Callback = function()
sendMessage("ѕ⁥⁥⁥󠀕󠀕u⁥󠀕󠀕с⁥⁥⁥k󠀕m󠀕yс󠀕󠀕о⁥󠀕⁥⁥сk", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Sweet cock you got up there",
    Callback = function()
sendMessage("Ѕwееtсо⁥⁥⁥⁥⁥⁥⁥⁥⁥сkуоugоtuрthеrе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "shut the fuck up",
    Callback = function()
sendMessage("s󠀕󠀕һ⁥⁥󠀕󠀕⁥⁥⁥⁥u󠀕󠀕tt⁥⁥󠀕󠀕⁥⁥⁥⁥һеf⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥k󠀕󠀕u⁥⁥⁥⁥⁥⁥⁥⁥⁥р", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Shut yo goofy ass up",
    Callback = function()
sendMessage("S⁥⁥⁥һ⁥⁥⁥ut уоgо⁥⁥⁥о⁥⁥⁥f⁥⁥⁥у а⁥⁥⁥ѕ⁥⁥⁥ѕ u⁥⁥⁥p", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "shut yo broke ass up",
    Callback = function()
sendMessage("shutyobrokeаѕѕup", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "suck my cock retard",
    Callback = function()
sendMessage("ѕuсkmyсосkret⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥аrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "son of a bitch",
    Callback = function()
sendMessage("sonofab󠀕󠀖󠀗󠀘￰￰󠀕󠀖󠀗󠀘і󠀕󠀖󠀗󠀘󠀕󠀖￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀗󠀘t󠀕￰￰￰￰￰￰￰󠀖󠀗󠀘󠀕󠀖󠀗󠀘с󠀗󠀘󠀗󠀘￰￰￰󠀗󠀘һ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "small penis",
    Callback = function()
sendMessage("small рen⁥⁥⁥⁥⁥⁥⁥⁥iѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("T")

  Tab:AddButton({
    Name = "Theres cum everywhere!",
    Callback = function()
sendMessage("Т⁥⁥⁥h⁥⁥⁥е⁥⁥⁥r⁥⁥⁥е⁥⁥⁥ѕ ⁥⁥⁥с⁥⁥⁥⁥u⁥⁥⁥m⁥⁥⁥ ⁥⁥⁥е⁥⁥⁥v⁥⁥⁥е⁥⁥⁥r⁥⁥⁥у⁥⁥⁥w⁥⁥⁥h⁥⁥⁥е⁥⁥⁥r⁥⁥⁥е⁥⁥⁥!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "that bbc dont play",
    Callback = function()
sendMessage("thаt b⁥⁥⁥b⁥⁥⁥с dоnt рlау", "All")
ResetFilter()
    end
})

 Tab:AddLabel("U")

  Tab:AddButton({
    Name = "ur gf was craving my raging schlong",
    Callback = function()
sendMessage("u⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥g⁥⁥⁥f⁥⁥⁥ ⁥⁥⁥w⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥ ⁥⁥⁥с⁥⁥⁥r⁥⁥⁥а⁥⁥⁥v⁥⁥⁥і⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥m⁥⁥⁥у⁥⁥⁥ ⁥⁥⁥r⁥⁥⁥а⁥⁥⁥g⁥⁥⁥і⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥с⁥⁥⁥h⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥n⁥⁥⁥g", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ur moms booty is delicious",
    Callback = function()
sendMessage("ur mоmѕ bооtу іѕ dеlісіоuѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("W")

  Tab:AddButton({
    Name = "why is this hard-r not getting whipped?",
    Callback = function()
sendMessage("wһ⁥⁥⁥⁥⁥⁥⁥у⁥⁥і⁥⁥ѕtһ⁥⁥⁥⁥⁥⁥⁥іѕn⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥g⁥⁥ern⁥⁥⁥⁥⁥⁥⁥оtgе󠀕󠀕󠀕󠀕󠀕󠀕t⁥⁥tі󠀕󠀕󠀕⁥⁥󠀕󠀕󠀕n󠀕⁥⁥󠀕gwһ⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥ір⁥⁥⁥⁥⁥⁥⁥реd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "wanna have sex?",
    Callback = function()
sendMessage("wаnnа һаvе s⁥⁥⁥⁥ех?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "wsg bbg you lookin sexy",
    Callback = function()
sendMessage("wѕg bbg уоu lооkіn ѕеху", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "what the fuck",
    Callback = function()
sendMessage("⁥w⁥￰￰⁥һ￰￰￰￰аtt󠀕󠀕󠀕󠀕h⁥⁥e⁥⁥⁥f⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖k", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "wanna see some bbc",
    Callback = function()
sendMessage("wаnnа ѕее ѕоmе b⁥⁥⁥b⁥⁥⁥с", "All")
ResetFilter()
    end
})

 Tab:AddLabel("Y")

  Tab:AddButton({
    Name = "you like to rape and suck black oiled up men",
    Callback = function()
sendMessage("уоu lіkе tо rаре аnd ѕuсk blасk оіlеd uр mеn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "yo my shaft is hard, mind jerking it?",
    Callback = function()
sendMessage("уо mу ѕhаft іѕ һаrd, mіnd јеrkіng іt?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're such a whore",
    Callback = function()
sendMessage("у⁥⁥⁥о⁥⁥⁥u⁥⁥⁥'r⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ⁥⁥⁥u⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥⁥w⁥⁥⁥һ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're a pedophile",
    Callback = function()
sendMessage("у⁥⁥⁥о⁥⁥⁥u⁥⁥⁥'⁥⁥⁥r⁥⁥⁥е⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you pathetic slut",
    Callback = function()
sendMessage("youpatheticsӏut", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're a pussy",
    Callback = function()
sendMessage("уоu'rе а рu⁥⁥⁥ssу", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're so sexy",
    Callback = function()
sendMessage("уоu'rе ѕо ѕеху", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Uppercase/Capital A-Z"
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "BE MY WIFE!",
    Callback = function()
sendMessage("ВΕ МΥ WIFΕ!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY LATINAS",
    Callback = function()
sendMessage("ВІG ВООТΥ LАТІΝАЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY ASIANS",
    Callback = function()
sendMessage("ВІG ВООТΥ АЅІАΝЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY FEMBOYS",
    Callback = function()
sendMessage("ВІG ВООТΥ FЕМВОΥЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY",
    Callback = function()
sendMessage("ВІG ВООТΥ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOBS",
    Callback = function()
sendMessage("BIG ВООВS", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "CAN I PISS INSIDE YOUR BUTTHOLE",
    Callback = function()
sendMessage("С⁥⁥⁥⁥⁥АN І Р⁥⁥⁥⁥ІЅЅ ІNЅIDE YOU⁥⁥⁥R В⁥⁥⁥U⁥⁥⁥⁥ТТ⁥⁥⁥⁥НOLЕ?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CAN I PISS ON YOU?",
    Callback = function()
sendMessage("С⁥⁥⁥⁥⁥АNІР⁥⁥⁥⁥ІЅЅONYOU?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "COCK IN BEDROOM",
    Callback = function()
sendMessage("СОСKI⁥⁥⁥NBEDROOM", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUM ON ME",
    Callback = function()
sendMessage("СUМОΝМЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUM ON MY FACE",
    Callback = function()
sendMessage("С￰￰￰UМONМΥFА⁥⁥⁥⁥⁥⁥⁥⁥СЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "DO YOU HAVE TITS?",
    Callback = function()
sendMessage("DО ΥОU НАVЕ Т⁥⁥⁥І⁥⁥⁥Т⁥⁥⁥Ѕ?", "All")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "EAT PUSSY BITCH",
    Callback = function()
sendMessage("EATР⁥⁥⁥U⁥⁥⁥Ѕ⁥⁥⁥Ѕ⁥⁥⁥YВІ⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥TСH", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "FATASS HOE",
    Callback = function()
sendMessage("F⁥⁥⁥АТАЅ⁥⁥Ѕ НОЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FAT ASS",
    Callback = function()
sendMessage("F⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FREE HENTAI",
    Callback = function()
sendMessage("FRЕЕ НЕ⁥⁥⁥⁥Ν⁥ТАӀ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCK YOU",
    Callback = function()
sendMessage("F⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UСΚΥОU", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "HELP! THERE'S A COCK IN MY ASS",
    Callback = function()
sendMessage("H⁥⁥⁥Е⁥⁥⁥L⁥⁥⁥P⁥⁥⁥!⁥⁥⁥ T⁥⁥⁥H⁥⁥⁥Е⁥⁥⁥R⁥⁥⁥Е⁥⁥⁥'⁥⁥⁥S⁥⁥⁥ А⁥⁥⁥ С⁥⁥⁥О⁥⁥⁥C⁥⁥⁥K⁥⁥⁥ I⁥⁥⁥N⁥⁥⁥ М⁥⁥⁥Y⁥⁥⁥ А⁥⁥⁥⁥Ѕ⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HELP! THERE'S A HOE CHASING ME",
    Callback = function()
sendMessage("НЕLР! ТНЕRЕS А НОЕ СНАSING МЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "I AM ABOUT TO CUM",
    Callback = function()
sendMessage("IА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OС￰󠀕󠀖󠀗󠀕󠀖󠀗￰￰U￰￰￰М", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I EAT PUSSY",
    Callback = function()
sendMessage("Ӏ ЕАТ РUЅЅҮ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I PREFER PUSSY",
    Callback = function()
sendMessage("I⁥⁥⁥⁥⁥⁥⁥⁥ P⁥⁥⁥⁥⁥⁥⁥⁥R⁥⁥⁥⁥⁥⁥⁥⁥E⁥⁥⁥⁥⁥⁥⁥⁥F⁥⁥⁥⁥⁥⁥⁥⁥E⁥⁥⁥⁥⁥⁥⁥⁥R⁥ Р⁥⁥UЅ⁥⁥Ѕ⁥⁥Ү⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I HAVE A MASSIVE COCK",
    Callback = function()
sendMessage("I HAVE A MASSIVE СОСK", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I HAD AWESOME SEX WITH UR MOM!!!!",
    Callback = function()
sendMessage("I Н⁥⁥⁥А⁥⁥⁥⁥D А⁥⁥⁥W⁥⁥⁥⁥ЕS⁥⁥⁥⁥⁥ОМ⁥⁥⁥Е⁥⁥⁥ S⁥⁥⁥Е⁥⁥⁥⁥Х⁥⁥ W⁥⁥⁥I⁥⁥Т⁥⁥⁥⁥Н U⁥⁥⁥R М⁥⁥⁥⁥⁥О⁥⁥⁥⁥М!!!!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ILL MAKE YOU PREGNANT",
    Callback = function()
sendMessage("ILL МΑKΕ ΥОU РRΕGΝΑΝТ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "LET ME SQUICH THOSE TITTIES",
    Callback = function()
sendMessage("LЕТМЕЅQUІЅНТНОЅЕТІТТІЕЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "LETS HAVE SEX",
    Callback = function()
sendMessage("L⁥⁥⁥Е⁥⁥⁥Т⁥⁥⁥Ѕ⁥⁥⁥ ⁥⁥⁥Н⁥⁥⁥А⁥⁥⁥V⁥⁥⁥Е⁥⁥⁥ ⁥⁥⁥Ѕ⁥⁥⁥Е⁥⁥⁥Х", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "LET'S FUCK",
    Callback = function()
sendMessage("LET'SF￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰Κ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "MY CONDOM FELL OFF!",
    Callback = function()
sendMessage("МΥ С⁥⁥⁥О⁥⁥⁥Ν⁥⁥⁥D⁥⁥⁥О⁥⁥⁥М FЕLL ОFF!", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "NAKED GIRLS",
    Callback = function()
sendMessage("ΝΑKΕDGIRLЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NAKED BOYS",
    Callback = function()
sendMessage("ΝАΚЕD ВОΥЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "oh my god, not this DUMBASS",
    Callback = function()
sendMessage("oh my god, not this DUМВ АЅЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "PUT YOUR COCK IN MY ASS",
    Callback = function()
sendMessage("РUТΥ￰￰￰ОU￰￰RСО⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥СKINMY А￰￰￰Ѕ￰￰￰Ѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "STRAIGHT POWER MOTHERFUCKERS",
    Callback = function()
sendMessage("STRAIGHTPOWERM￰￰￰￰￰O￰￰￰￰￰T￰￰￰￰￰H￰￰￰￰￰E￰￰￰￰￰R￰￰￰￰￰F￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰Κ￰￰￰￰￰￰￰￰E￰￰￰￰￰￰￰RS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SUCK MY COCK",
    Callback = function()
sendMessage("S󠀕󠀖󠀗UС󠀕󠀖󠀗KМ󠀕󠀖󠀗ΥС󠀕󠀖󠀗O⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖󠀗⁥⁥⁥⁥⁥СK", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT THE FUCK UP",
    Callback = function()
sendMessage("SHUTTHEF￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰ΚUР", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT UP FAGGOT",
    Callback = function()
sendMessage("⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥S󠀕󠀖󠀗󠀕󠀖H⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UTU⁥⁥PF⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥A⁥⁥G󠀕󠀖󠀗󠀕󠀖󠀗⁥⁥⁥⁥GO⁥⁥T", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT UP CUNT",
    Callback = function()
sendMessage("SHUTUPCU⁥⁥⁥⁥⁥⁥⁥⁥⁥NТ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT UP HOE",
    Callback = function()
sendMessage("SНUT UP НОЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHAKE THAT ASS",
    Callback = function()
sendMessage("ЅHAKEТН⁥⁥⁥⁥⁥⁥⁥⁥АТА￰￰￰Ѕ￰￰￰Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SON OF A BITCH",
    Callback = function()
sendMessage("⁥⁥⁥⁥Ѕ⁥⁥⁥⁥O󠀖󠀗⁥⁥⁥⁥⁥⁥⁥󠀘󠀕󠀖NO󠀖⁥⁥⁥⁥󠀗󠀘⁥⁥⁥⁥󠀕󠀖FA󠀗󠀘⁥⁥⁥⁥󠀕󠀖В￰￰⁥⁥⁥⁥￰￰󠀗⁥⁥⁥⁥󠀘󠀕󠀖￰￰￰I￰󠀗󠀘󠀕󠀖⁥⁥⁥⁥￰￰￰￰￰T⁥⁥⁥⁥C󠀗⁥⁥⁥⁥󠀘󠀕󠀖H", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHIT NOOOOOOOO",
    Callback = function()
sendMessage("Ѕ⁥⁥⁥⁥Н⁥⁥⁥⁥Ι⁥⁥⁥⁥Т⁥⁥⁥⁥ Ν⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("Y")

  Tab:AddButton({
    Name = "YOU ARE SO ASS AT THIS GAME",
    Callback = function()
sendMessage("ΥОUАRЕЅО А￰￰￰Ѕ￰￰￰Ѕ АТTHIЅGАМЕ", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "RolePlay",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "RP A-Z"
})

--[[

██████╗░░█████╗░██╗░░░░░███████╗██████╗░██╗░░░░░░█████╗░██╗░░░██╗
██╔══██╗██╔══██╗██║░░░░░██╔════╝██╔══██╗██║░░░░░██╔══██╗╚██╗░██╔╝
██████╔╝██║░░██║██║░░░░░█████╗░░██████╔╝██║░░░░░███████║░╚████╔╝░
██╔══██╗██║░░██║██║░░░░░██╔══╝░░██╔═══╝░██║░░░░░██╔══██║░░╚██╔╝░░
██║░░██║╚█████╔╝███████╗███████╗██║░░░░░███████╗██║░░██║░░░██║░░░
╚═╝░░╚═╝░╚════╝░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░
--]]

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "аh уеѕ~ *moans* уеѕ һаrdеr~",
    Callback = function()
sendMessage("аh уеѕ~ *m⁥⁥⁥о⁥⁥⁥а⁥⁥⁥n⁥⁥⁥ѕ* уеѕ һаrdеr~", "All")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "*bites your cock*",
    Callback = function()
sendMessage("*bіtеѕуоurсосk*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "*cums*",
    Callback = function()
sendMessage("*⁥⁥⁥⁥󠀕c󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥m⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥s⁥⁥⁥⁥*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("J")

  Tab:AddButton({
    Name = "*jizzles on your face*",
    Callback = function()
sendMessage("*j⁥⁥⁥⁥⁥⁥iz⁥⁥⁥⁥⁥⁥zе⁥⁥⁥⁥ѕ on your face*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "*looks under skirt* wow nice balls bro",
    Callback = function()
sendMessage("*ӏооkѕ undеr ѕkіrt* wоw nісе bаlӏѕ brо", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "*masturbates*",
    Callback = function()
sendMessage("*ma⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥st⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥ur󠀕󠀕b󠀕󠀕a󠀕󠀕t󠀕󠀕e󠀕󠀕s*", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "*moans*",
    Callback = function()
sendMessage("*mоаns*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "nice balls *slaps them*",
    Callback = function()
sendMessage("*nісеbаӏӏѕ*sӏарstһеm*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "*rapes*",
    Callback = function()
sendMessage("r ареs*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "*sucks cock*",
    Callback = function()
sendMessage("*ѕuсkѕ сосk*", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "*shits*",
    Callback = function()
sendMessage("*⁥⁥⁥ѕ⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥tѕ*", "All")
ResetFilter()
end
})

local Tab = Window:MakeTab({
    Name = "NSFW Websites",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Not Safe For Work websites"
})

--[[

░██╗░░░░░░░██╗███████╗██████╗░░██████╗██╗████████╗███████╗░██████╗
░██║░░██╗░░██║██╔════╝██╔══██╗██╔════╝██║╚══██╔══╝██╔════╝██╔════╝
░╚██╗████╗██╔╝█████╗░░██████╦╝╚█████╗░██║░░░██║░░░█████╗░░╚█████╗░
░░████╔═████║░██╔══╝░░██╔══██╗░╚═══██╗██║░░░██║░░░██╔══╝░░░╚═══██╗
░░╚██╔╝░╚██╔╝░███████╗██████╦╝██████╔╝██║░░░██║░░░███████╗██████╔╝
░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═════╝░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░
--]]

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "blacked.com",
    Callback = function()
sendMessage("blacked.c⁥⁥⁥о⁥⁥⁥m", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "onlyfans.com",
    Callback = function()
sendMessage("оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "pornhub.com",
    Callback = function()
sendMessage("р⁥⁥⁥о⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b.c⁥⁥⁥о⁥⁥⁥m", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "rule34.xxx",
    Callback = function()
sendMessage("r⁥⁥⁥u⁥⁥⁥ӏ⁥⁥⁥е3⁥⁥⁥4.ххх", "All")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "e621.net",
    Callback = function()
sendMessage("е⁥⁥⁥6⁥⁥⁥2⁥⁥⁥1⁥⁥⁥.n⁥⁥⁥е⁥⁥⁥t", "All")
ResetFilter()
    end
})

 Tab:AddLabel("X")

  Tab:AddButton({
    Name = "xvideos.com",
    Callback = function()
sendMessage("х󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗vid⁥⁥⁥⁥е⁥⁥⁥⁥o󠀗󠀕󠀕󠀕󠀕ѕ.с⁥⁥⁥⁥om", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P (Capitals)")

  Tab:AddButton({
    Name = "PORNHUB.COM",
    Callback = function()
sendMessage("Р⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Ν⁥⁥⁥Н⁥⁥⁥U⁥⁥⁥В.С⁥⁥⁥О⁥⁥⁥М⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("X (Capitals)")

  Tab:AddButton({
    Name = "XVIDEOS.COM",
    Callback = function()
sendMessage("Х󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕VӀ⁥⁥⁥⁥⁥⁥D⁥⁥⁥󠀕󠀕󠀕Е⁥⁥⁥󠀕󠀕󠀕ОЅ.С⁥⁥⁥󠀕󠀕󠀕ОМ", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Full Links"
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "https://blacked.com",
    Callback = function()
sendMessage("httрs:/⁥⁥⁥/blacked.c⁥⁥⁥о⁥⁥⁥m", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "https://onlyfans.com",
    Callback = function()
sendMessage("ht⁥t⁥⁥рѕ⁥⁥:/⁥⁥/оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "https://pornhub.com",
    Callback = function()
sendMessage("ht󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗tps󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗:/󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗/⁥⁥⁥p󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗or󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗nh󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗ub󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗.󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗c󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗om", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "MASTURBATING TO HTTPS://PORNHUB.COM",
    Callback = function()
sendMessage("МА⁥⁥⁥󠀕󠀖⁥Ѕ⁥⁥⁥󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥Т⁥⁥⁥󠀕󠀖⁥UR⁥ВАТӀΝGTOHТ󠀕󠀕󠀕󠀕ТРЅ󠀕󠀕󠀕󠀕:/⁥⁥⁥/РО󠀕󠀕RΝ󠀕󠀕НU⁥⁥⁥⁥В.C⁥⁥⁥OM", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "NOT LEGIT",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Not Legit A-Z"
})

--[[

███╗░░██╗░█████╗░████████╗  ██╗░░░░░███████╗░██████╗░██╗████████╗
████╗░██║██╔══██╗╚══██╔══╝  ██║░░░░░██╔════╝██╔════╝░██║╚══██╔══╝
██╔██╗██║██║░░██║░░░██║░░░  ██║░░░░░█████╗░░██║░░██╗░██║░░░██║░░░
██║╚████║██║░░██║░░░██║░░░  ██║░░░░░██╔══╝░░██║░░╚██╗██║░░░██║░░░
██║░╚███║╚█████╔╝░░░██║░░░  ███████╗███████╗╚██████╔╝██║░░░██║░░░
╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░  ╚══════╝╚══════╝░╚═════╝░╚═╝░░░╚═╝░░░
--]]

Tab:AddParagraph("Note","'NOT LEGIT' on this script means that the bypasses DON'T look like it was said normally")

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "a hard r",
    Callback = function()
sendMessage("󠀕󠀕п⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і󠀕g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g󠀕󠀕e󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥г", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "a lil n word",
    Callback = function()
sendMessage("n⁥iɡ⁥ɡ⁥а", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "faggot",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕f󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥а￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥ġ￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥ġ￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰￰󠀕󠀕о󠀕󠀕󠀕￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕󠀕t￰￰￰", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fuck",
    Callback = function()
sendMessage("f￰￰￰￰￰󠀕󠀕￰￰￰￰￰ụç󠀕󠀕ķ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "KKK",
    Callback = function()
sendMessage("ККК", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "KYS BITCH",
    Callback = function()
sendMessage("К⁥⁥⁥⁥⁥⁥⁥⁥Υ⁥⁥⁥SВ￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СН", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "Games",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--[[

░██████╗░░█████╗░███╗░░░███╗███████╗░██████╗
██╔════╝░██╔══██╗████╗░████║██╔════╝██╔════╝
██║░░██╗░███████║██╔████╔██║█████╗░░╚█████╗░
██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░░╚═══██╗
╚██████╔╝██║░░██║██║░╚═╝░██║███████╗██████╔╝
░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░
--]]

local Section = Tab:AddSection({
    Name = "Rate My Avatar (A-Z)"
})
 Tab:AddLabel("Change Booth's text")

  Tab:AddButton({
    Name = "blowjob",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "nudes",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕еѕ",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "nudes",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕еѕ",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "E-Sex",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})


local Tab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--[[

███╗░░░███╗██╗░██████╗░█████╗░
████╗░████║██║██╔════╝██╔══██╗
██╔████╔██║██║╚█████╗░██║░░╚═╝
██║╚██╔╝██║██║░╚═══██╗██║░░██╗
██║░╚═╝░██║██║██████╔╝╚█████╔╝
╚═╝░░░░░╚═╝╚═╝╚═════╝░░╚════╝░
--]]

local Section = Tab:AddSection({
    Name = "Chat"
})

  Tab:AddButton({
    Name = "Chat a huge annoying blank text chat bubble",
    Callback = function()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                                                                                       ⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Chat a long annoying blank text chat bubble",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/WPHVj8Lj"))()
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Chat our dsc link",
    Callback = function()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("httрs:/⁥⁥⁥/dѕс⁥⁥⁥.⁥⁥⁥g⁥⁥⁥g/⁥⁥⁥vadriftz", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Chat Spammer"
})

local ChatSpamText = ""
local SpamCoroutine
local IsChatSpamming = false
local SpamInterval = 1 -- Default interval in seconds

Tab:AddTextbox({
    Name = "Enter spam text",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        ChatSpamText = Value
    end
})

Tab:AddSlider({
    Name = "Spam Interval (seconds)",
    Min = 0.1,
    Max = 5,
    Default = 1,
    Color = Color3.fromRGB(128, 64, 255), -- Purple color
    Increment = 0.1,
    ValueName = "seconds",
    Callback = function(Value)
        SpamInterval = Value
    end
})

Tab:AddButton({
    Name = "Start Chat Spam",
    Callback = function()
        IsChatSpamming = true
        SpamCoroutine = coroutine.create(function()
            while IsChatSpamming do
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ChatSpamText, "All")
                wait(SpamInterval)
                ResetFilter()
            end
        end)
        coroutine.resume(SpamCoroutine)
    end
})

Tab:AddButton({
    Name = "Stop Chat Spam",
    Callback = function()
        IsChatSpamming = false
    end
})

local Section = Tab:AddSection({
    Name = "Teleporter"
})

Section:AddTextbox({
    Name = "Player Name",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        playerName = value
    end
})

local function teleportToPlayer(targetPlayer)
    local localPlayer = game.Players.LocalPlayer
    if localPlayer and targetPlayer then
        local character = localPlayer.Character
        local targetCharacter = targetPlayer.Character
        if character and targetCharacter then
            character:MoveTo(targetCharacter.PrimaryPart.Position)
        end
    end
end

local function findPlayer(name)
    local lowerName = string.lower(name)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), lowerName) or string.find(string.lower(player.DisplayName), lowerName) then
            return player
        end
    end
    return nil
end

Section:AddButton({
    Name = "Teleport",
    Callback = function()
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            teleportToPlayer(targetPlayer)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Player not found!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

local Section = Tab:AddSection({
    Name = "Player Scripts"
})

local infiniteJumpEnabled = false
local infiniteJumpConnection

local noclipEnabled = false
local Noclip = nil
local Clip = nil
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function noclip()
    Clip = false
    local function Nocl()
        if Clip == false and character ~= nil then
            for _,v in pairs(character:GetDescendants()) do
                if v:IsA('BasePart') and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
        wait(0.21)
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

local function clip()
    if Noclip then Noclip:Disconnect() end
    Clip = true
end

local function toggleNoclip(state)
    noclipEnabled = state
    if noclipEnabled then
        noclip()
    else
        clip()
    end
end

Tab:AddToggle({
  Name = "Noclip",
  Default = false,
  Callback = function(state)
      toggleNoclip(state)
  end    
})

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        infiniteJumpEnabled = Value

        if infiniteJumpEnabled then
            local plr = game:GetService('Players').LocalPlayer
            local m = plr:GetMouse()

            infiniteJumpConnection = m.KeyDown:Connect(function(k)
                if k:byte() == 32 then
                    local humanoid = plr.Character:FindFirstChildOfClass('Humanoid')
                    if humanoid then
                        humanoid:ChangeState('Jumping')
                        wait()
                        humanoid:ChangeState('Seated')
                    end
                end
            end)
        else
            if infiniteJumpConnection then
                infiniteJumpConnection:Disconnect()
                infiniteJumpConnection = nil
            end
        end
    end
})

local defaultWalkSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
local defaultJumpPower = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower

Tab:AddSlider({
  Name = "WalkSpeed",
  Min = 1,
  Max = 350,
  Default = defaultWalkSpeed,
  Color = Color3.fromRGB(128, 64, 255), -- Purple color
  Increment = 1,
  ValueName = "Speed",
  Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end    
})

Tab:AddSlider({
  Name = "JumpPower",
  Min = 1,
  Max = 350,
  Default = defaultJumpPower,
  Color = Color3.fromRGB(128, 64, 255), -- Purple color
  Increment = 1,
  ValueName = "JumpPower",
  Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
  end    
})

getgenv().esp = false
getgenv().teamcheck = false
getgenv().Color = Color3.fromRGB(255, 0, 0)
Tab:AddToggle({
	Name = "ESP",
	Default = false,
	Callback = function(Value)
		getgenv().esp = Value
		spawn(function()
		while wait() do
		    if not getgenv().esp then
		          for i,v in pairs(game.Players:GetChildren()) do
		              if v.Character and v.Character:FindFirstChild("Highlight") then
		                  local Highlight = v.Character:FindFirstChild("Highlight")
		                  Highlight.Enabled = false
    		      end
		      end 
		      else
		          for i,v in pairs(game.Players:GetChildren()) do
		             if getgenv().teamcheck == true then
		               if v.Character and v ~= game.Players.LocalPlayer and v.TeamColor ~= game.Players.LocalPlayer.TeamColor then
    		                 if v.Character:FindFirstChild("Highlight") then
    		                 local Highlight = v.Character:FindFirstChild("Highlight") 
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		                 else
    		                 local Highlight = Instance.new("Highlight",v.Character)
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		              end       
    		           end  
		                if v.TeamColor == game.Players.LocalPlayer.TeamColor then
    		              if v.Character and v.Character:FindFirstChild("Highlight") then
    		                  local Highlight = v.Character:FindFirstChild("Highlight")
        		              Highlight.Enabled = false
        		          end    
    		            end 
    		          else
    		              if v.Character and v ~= game.Players.LocalPlayer then
    		                 if v.Character:FindFirstChild("Highlight") then
    		                 local Highlight = v.Character:FindFirstChild("Highlight") 
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		                 else
    		                 local Highlight = Instance.new("Highlight",v.Character)
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		              end       
    		           end    
		            end       
		      end    
		    end  
		end    
		end)
	end    
})

Tab:AddColorpicker({
	Name = "Esp Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		getgenv().Color = Value
	end	  
})

Tab:AddToggle({
	Name = "Teamcheck",
	Default = false,
	Callback = function(Value)
		getgenv().teamcheck = Value
	end    
})

local Section = Tab:AddSection({
    Name = "Admin"
})

  Tab:AddButton({
    Name = "Infinite yield",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

  Tab:AddButton({
    Name = "Nameless Admin",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))();
    end
})

Tab:AddParagraph("Hello :)","its The End, for now..")

OrionLib:Init()
end
loadScript()

OrionLib:Init()
end

local function runMobileScript()

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({ Name = "vadrifts.byp |  V1.4.0", HidePremium = false, SaveConfig = save, ConfigFolder ="OrionTest", ScriptIntro = enabled, IntroText = "Vadrifts bypassing society" })

local startTime = tick()

local Tab = Window:MakeTab({
    Name = "Script Setup",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Loading"
})
Tab:AddParagraph("Loading..", "Please wait")
Tab:AddParagraph("Quick Tip!","If the script isn't loading, it could be due to your device or executor!")
loadstring(game:HttpGet('https://raw.githubusercontent.com/AnthonyIsntHere/anthonysrepository/main/scripts/AntiChatLogger.lua'))()

local function loadScript()

    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({ Name = "vadrifts.byp |  V1.4.0", HidePremium = false, SaveConfig = save, ConfigFolder = "OrionTest", IntroEnabled = false })

    local endTime = tick()
    local loadTime = endTime - startTime
    game.StarterGui:SetCore("SendNotification",
        { Title = "Loaded!", Text = "Succesfully loaded in " ..
        loadTime .. " seconds.", Duration = 5, })

    local Tab = Window:MakeTab({
        Name = "Home",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })
local Section = Tab:AddSection({
    Name = "Discord"
})

local playerName = game.Players.LocalPlayer.Name

Tab:AddButton({
    Name = "Welcome " .. playerName .. ", updates n stuff @ our discord",
    Callback = function()
    end
})

Tab:AddButton({
    Name = "Discord | Click To Copy",
    Callback = function()
setclipboard("https://dsc.gg/vadriftz")
    end
}) 

local Section = Tab:AddSection({
    Name = "UI Stuff"
})

  Tab:AddButton({
    Name = "Close Interface",
    Callback = function()
OrionLib:Destroy()
    end
})

Tab:AddButton({
    Name = "Un-hide UI button (when ui closed)",
    Callback = function()
        local Toggle = Instance.new("ScreenGui")
        local UIToggle = Instance.new("TextButton")
        local CloseButton = Instance.new("TextButton")
        Toggle.Name = "Un-Hide"
        Toggle.Parent = game.CoreGui
        UIToggle.Name = "Un-hide"
        UIToggle.Parent = Toggle
        UIToggle.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
        UIToggle.BackgroundTransparency = 0
        UIToggle.Position = UDim2.new(0, 0, 0.454706937, 0)
        UIToggle.Size = UDim2.new(0.0650164187, 0, 0.0888099447, 0)
        UIToggle.Font = Enum.Font.SourceSans
        UIToggle.Text = "Un-Hide!"
        UIToggle.TextColor3 = Color3.fromRGB(75, 0, 130)
        UIToggle.TextSize = 24.000
        UIToggle.TextXAlignment = Enum.TextXAlignment.Left

        local UserInputService = game:GetService("UserInputService")
        local dragging = false
        local dragStart
        local startPos

        local function updateDragging(input)
            local delta = input.Position - dragStart
            UIToggle.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        UIToggle.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                dragStart = input.Position
                startPos = UIToggle.Position
            end
        end)

        UIToggle.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                updateDragging(input)
            end
        end)

        UIToggle.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        local function executeScript()
            if OrionLib and OrionLib.Destroy then
                OrionLib:Destroy() -- Reduces lag
            end
            if loadScript then
                loadScript() -- Reopens script
            end
        end

        UIToggle.MouseButton1Click:Connect(executeScript)

        -- Create a close button
        CloseButton.Name = "CloseButton"
        CloseButton.Parent = UIToggle
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        CloseButton.BackgroundTransparency = 0
        CloseButton.Position = UDim2.new(0.8, 0, 0.1, 0)
        CloseButton.Size = UDim2.new(0.2, 0, 0.2, 0)
        CloseButton.Font = Enum.Font.SourceSans
        CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        CloseButton.TextSize = 16
        CloseButton.Text = "X"
        CloseButton.MouseButton1Click:Connect(function()
            UIToggle:Destroy() -- Destroy the UI elements when the close button is clicked
        end)
    end
})


local Section = Tab:AddSection({
    Name = "Help"
})
Tab:AddParagraph("Notice","If the script gives you a warning on execution, that means that game isn't supported!")
 Tab:AddLabel("Your account must be 13+ for everything to work.")
 Tab:AddLabel("If something gets tagged, say something normal and try again.")
 Tab:AddLabel("Everyone can see the things you say in chat.")
 Tab:AddLabel("For more info go and ask on the Discord")

local Section = Tab:AddSection({
    Name = "Suggested (A-Z)"
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local IsLegacy = (TextChatService.ChatVersion == Enum.ChatVersion.LegacyChatService)

local function checkForTag(message)
    local success, isTagged = pcall(function()
        return game:GetService("Chat"):FilterStringForBroadcast(message, game.Players.LocalPlayer)
    end)
    return success and isTagged ~= message
end

local function sendMessage(message)
    if checkForTag(message) then
        OrionLib:MakeNotification({
            Name = "Tag Detection",
            Content = "This bypass might be patched! Try clicking 'Fix Bypasses' and try again!",
            Duration = 5
        })
    else
        if IsLegacy then
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
        else
            TextChatService.TextChannels.RBXGeneral:SendAsync(message)
        end
    end
end

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "Are we going to teach about the pussy hole?",
    Callback = function()
sendMessage("Аrеwеgоіngtоtеacһаbоuttһeрuѕѕуһolе?")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "cock and ball torture sex",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥󠀕󠀕󠀕⁥с⁥⁥⁥kаndb󠀕󠀕󠀕а⁥⁥⁥⁥lltor󠀕󠀕󠀕turеѕ󠀕󠀕󠀕⁥⁥⁥е⁥⁥⁥х")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "E-Rape",
    Callback = function()
sendMessage("Е-Rаре")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "eat my shit nigger",
    Callback = function()
sendMessage("ea⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥tm⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥yѕ⁥⁥⁥⁥⁥⁥h⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥tn⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ge⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r")
ResetFilter()
    end
})

 Tab:AddLabel("J")

  Tab:AddButton({
    Name = "*jizzles on your face*",
    Callback = function()
sendMessage("*j⁥⁥⁥⁥⁥⁥iz⁥⁥⁥⁥⁥⁥zе⁥⁥⁥⁥ѕ on your face*")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "lets go somewhere private so we can fuck",
    Callback = function()
sendMessage("lets go somewherepri⁥⁥⁥vаtеw⁥⁥⁥еса⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥nf⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥k")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lets record lesbian threesome",
    Callback = function()
sendMessage("lets record ӏes⁥⁥⁥b⁥⁥⁥ianthr⁥⁥⁥⁥⁥⁥ееѕ⁥⁥⁥ome")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "oil up lil nigga",
    Callback = function()
sendMessage("oi⁥⁥⁥⁥⁥⁥ӏu⁥⁥⁥⁥⁥⁥pӏi⁥⁥⁥⁥⁥⁥ln⁥⁥⁥⁥⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥а")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "im very horny and i will cum inside you hard",
    Callback = function()
sendMessage("im very һоrn⁥⁥⁥⁥⁥⁥yandiwill с⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥mi⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥nsidеyou hard")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I'm gonna fucking rape you",
    Callback = function()
sendMessage("Ӏ'mgо󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕nnаf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uсkіngr⁥⁥⁥а⁥⁥⁥p⁥⁥⁥ey⁥⁥⁥о⁥⁥⁥u ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm gonna fuck you hard",
    Callback = function()
sendMessage("i'mgоnnаf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uсkуоurһоӏеһаrd")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i fuck children",
    Callback = function()
sendMessage("іf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uсkсһіІdrеn")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "murder the lgbtq+",
    Callback = function()
sendMessage("m⁥⁥⁥⁥⁥⁥ur⁥⁥⁥⁥⁥⁥dеrthеӏg⁥⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥q+")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "shitass",
    Callback = function()
sendMessage("ѕһ⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀖i⁥⁥⁥⁥󠀗󠀕󠀕󠀕tаѕѕ")
ResetFilter()
    end
})

Tab:AddParagraph("Join our Discord and suggest YOUR bypass to get it added!","Go to the suggestions channel, and suggest a bypass!")

local Section = Tab:AddSection({
    Name = "Credits"
})

 Tab:AddLabel("[+] Jay. - Development and Bypassing.")
 Tab:AddLabel("[+] BANANAN. - Development.")
 Tab:AddLabel("[+] Dank6s - Script setup")
 Tab:AddLabel("[+] Anthony - Anti-Chat Logger")
 Tab:AddLabel("[+] clickgameplay - Automatic chat bypasser concept")
 Tab:AddLabel("[+] heartasians - Made ResetFilter bypass")
 Tab:AddLabel("[+] OG Vadrifts - Most bypass ideas")
 Tab:AddLabel("[+] Sauce_boss01 - Made some Bypasses")
 Tab:AddLabel("[+] d34dly - Made some Bypasses")
 Tab:AddLabel("[+] N4 - Made some Bypasses")
 Tab:AddLabel("[+] Tyler - Made some Bypasses")

local Section = Tab:AddSection({
    Name = "More Vadrifts Scripts"
})

  Tab:AddButton({
    Name = "Vadrifts Horrific Housing",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/BakaPraselol/HH-loader1/main/HH"))()
    end
})

Tab:AddParagraph("Creating more soon..","Making scripts actually work..")

local enabled = false
local connection

local Tab = Window:MakeTab({
    Name = "Words",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Extra"
})


Tab:AddParagraph("Recommended Games"," Rate My Avatar                                                 Public Bathroom Simlator                                                               White room                                                        Natrual Disaster Survival                                                        Ragdoll Engine                                                 Spray Paint!")

local enabled = false
local connection

local function startScript()
    local chatService, players = game:GetService("Chat"), game:GetService("Players")

    local custom_chars = {
    [" "] = "",
    ["stfu"] = "ѕ󠀕󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥f󠀖󠀕⁥⁥⁥u",
    ["asshole"] = "⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ѕ⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥⁥һ⁥⁥󠀕󠀕о󠀕⁥⁥⁥󠀕󠀖ӏ⁥⁥⁥󠀕󠀖е⁥",
    ["ass"] = "а⁥⁥⁥ѕ⁥⁥⁥ѕ",
    ["arse"] = "аr⁥⁥ѕ⁥е",
    ["anus"] = "а⁥⁥⁥n⁥⁥⁥u⁥⁥⁥ѕ⁥⁥⁥",
    ["Anus"] = "A⁥⁥⁥n⁥⁥⁥u⁥⁥⁥ѕ⁥⁥⁥",
    ["anal"] = "аn⁥⁥⁥⁥аl",
    ["blowjob"] = "bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥",
    ["boner"] = "⁥В⁥⁥o⁥⁥n⁥⁥е⁥⁥r",
    ["boobies"] = "b⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥b⁥⁥⁥⁥і⁥⁥⁥⁥е⁥⁥⁥⁥s",
    ["bullshit"] = "b⁥⁥⁥⁥u⁥⁥⁥l⁥⁥⁥⁥ӏ⁥⁥⁥s⁥⁥⁥һ⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥t",
    ["bastard"] = "bas⁥⁥⁥⁥⁥⁥⁥⁥tard",
    ["beaner"] = "b⁥⁥⁥е⁥⁥⁥а⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r",
    ["butthole"] = "bu⁥⁥⁥⁥⁥⁥⁥⁥tthоle",
    ["bootyhole"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty󠀕󠀕󠀕󠀕һoӏe",
    ["bondage"] = "b⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥а⁥⁥⁥g⁥⁥⁥е⁥⁥⁥",
    ["Bondage"] = "B⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥а⁥⁥⁥g⁥⁥⁥е⁥⁥⁥",
    ["butt"] = "bu⁥⁥⁥⁥⁥⁥⁥⁥tt",
    ["booty"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty",
    ["boobs"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕b󠀕󠀕󠀕󠀕ѕ",
    ["boob"] = "bооb",
    ["breasts"] = "brеаѕtѕ",
    ["bbc"] = "b⁥⁥⁥b⁥⁥⁥с",
    ["bitch"] = "b⁥⁥i󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥⁥⁥сһ",
    ["Bitch"] = "B⁥⁥i󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥⁥⁥сһ",
    ["bitches"] = "￰￰b￰￰і󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕t⁥⁥⁥⁥󠀕с⁥⁥⁥⁥󠀕һ⁥⁥⁥⁥󠀕󠀕󠀕󠀕е⁥⁥⁥⁥s",
    ["Bitches"] = "￰￰B￰￰і󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕t⁥⁥⁥⁥󠀕с⁥⁥⁥⁥󠀕һ⁥⁥⁥⁥󠀕󠀕󠀕󠀕е⁥⁥⁥⁥s",
    ["cocaine"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥а⁥⁥⁥i⁥⁥⁥n⁥⁥⁥е",
    ["creampie"] = "с⁥⁥⁥r⁥⁥⁥е⁥⁥⁥а⁥⁥⁥m⁥⁥⁥р⁥⁥⁥i⁥⁥⁥е",
    ["cum"] = "с⁥⁥⁥⁥um",
    ["cunts"] = "сu⁥⁥⁥⁥⁥⁥⁥⁥ntѕ",
    ["cunt"] = "с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀕󠀖⁥⁥⁥n󠀕󠀖t",
    ["cock"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k",
    ["cuck"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k",
    ["cuckold"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k⁥⁥⁥о⁥⁥⁥ӏ⁥⁥⁥d⁥⁥⁥",
    ["condoms"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m⁥⁥⁥s",
    ["condom"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m",
    ["coochies"] = "с⁥⁥⁥о⁥⁥⁥о⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥і⁥⁥⁥е⁥⁥⁥s",
    ["coochie"] = "с⁥⁥⁥о⁥⁥⁥o⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥е",
    ["crap"] = "сr⁥⁥⁥⁥ар",
    ["Crap"] = "сr⁥⁥⁥⁥ар",
    ["CRAP"] = "сr⁥⁥⁥⁥ар",
    ["cunny"] = "сu⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу",
    ["Cunny"] = "сu⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу",
    ["clit"] = "с󠀕󠀕⁥І󠀕󠀕⁥і󠀕󠀕⁥t",
    ["Clit"] = "с󠀕󠀕⁥І󠀕󠀕⁥і󠀕󠀕⁥t",
    ["dumbass"] = "d⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ",
    ["dildo"] = "d⁥󠀕󠀕󠀕󠀕⁥⁥і⁥󠀕󠀕󠀕󠀕⁥⁥ӏ⁥󠀕󠀕󠀕󠀕⁥⁥do",
    ["Dildo"] = "D⁥󠀕󠀕󠀕󠀕⁥⁥і⁥󠀕󠀕󠀕󠀕⁥⁥ӏ⁥󠀕󠀕󠀕󠀕⁥⁥do",
    ["discord"] = "dіѕсоrd",
    ["dickhead"] = "d￰￰￰￰￰і￰￰￰￰￰c￰￰￰￰￰kһ￰￰￰￰￰еad",
    ["dick"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥d⁥⁥⁥⁥⁥і⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥",
    ["damn"] = "d⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥",
    ["doggystyle"] = "d⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥s⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е",
    ["Doggystyle"] = "D⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥s⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е",
    ["fatass"] = "fat￰￰￰а￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕ",
    ["Fucked"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеd",
    ["fucked"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеd",
    ["femboy"] = "fеmbоy",
    ["femboys"] = "fеmbоys",
    ["E-Rape"] = "Е-Rаре",
    ["E-rape"] = "Е-rаре",
    ["e-eаре"] = "Е-rаре",
    ["E-Sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["E-sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["e-sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["fuckers"] = "⁥⁥f󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеrѕ",
    ["Fuckers"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеrѕ",
    ["fucker"] = "⁥⁥f󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеr",
    ["Fucker"] = "⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеr",
    ["faggot"] = "⁥⁥⁥⁥f⁥󠀕⁥ а󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥g󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥g⁥⁥о󠀕󠀕⁥⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥",
    ["Faggot"] = "⁥⁥⁥⁥⁥⁥ꜰ⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖⁥⁥⁥g⁥⁥⁥⁥gо󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕t",
    ["Fag"] = "⁥⁥⁥⁥⁥⁥F⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖g⁥⁥⁥⁥",
    ["fag"] = "⁥⁥⁥⁥⁥⁥f⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖g⁥⁥⁥⁥",
    ["fap"] = "f⁥󠀕⁥⁥а⁥󠀕⁥⁥р",
    ["fanny"] = "fa⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу",
    ["horny"] = "һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у",
    ["hitler"] = "һ󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗itӏеr",
    ["hentai"] = "h󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i",
    ["hoes"] = "һоеѕ",
    ["hoe"] = "һое",
    ["instagram"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tаg󠀕󠀕󠀕󠀕rаm",
    ["insta"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tа",
    ["Instagram"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tаg󠀕󠀕󠀕󠀕rаm",
    ["Insta"] = "і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tа",
    ["kys"] = "k⁥⁥⁥⁥⁥⁥⁥⁥y⁥⁥⁥ѕ",
    ["lmfao"] = "ӏm⁥⁥⁥⁥⁥⁥⁥⁥fа⁥⁥о",
    ["lmao"] = "ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥maо",
    ["Lmao"] = "ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥maо",
    ["motherfucker"] = "mot￰￰￰￰￰￰￰h￰e￰rf￰￰￰￰￰u￰с￰￰￰￰￰￰￰￰k￰e￰￰￰￰￰￰￰￰r",
    ["masturbate"] = "m󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕b󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e",
    ["Masturbate"] = "М⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥е",
    ["masturbating"] = "m⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥ing",
    ["meth"] = "mе⁥⁥⁥⁥⁥⁥⁥⁥th",
    ["Meth"] = "Mе⁥⁥⁥⁥⁥⁥⁥⁥th",
    ["molest"] = "m⁥⁥⁥⁥o⁥⁥⁥⁥ӏ⁥⁥⁥⁥е⁥⁥⁥ѕ⁥⁥⁥⁥t",
    ["Molest"] = "M⁥⁥⁥⁥o⁥⁥⁥⁥ӏ⁥⁥⁥⁥е⁥⁥⁥ѕ⁥⁥⁥⁥t",
    ["nazi"] = "⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥a⁥⁥⁥⁥⁥z⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥",
    ["Nazi"] = "⁥⁥⁥⁥⁥N⁥⁥⁥⁥⁥a⁥⁥⁥⁥⁥z⁥⁥⁥⁥⁥i⁥⁥⁥⁥⁥",
    ["naked"] = "nаkеd",
    ["nudes"] = "nudеѕ",
    ["Niggas"] = "Ν󠀕󠀕󠀕󠀕󠀕⁥і󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕аs",
    ["nude"] = "n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е",
    ["Nude"] = "N󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е",
    ["negro"] = "n󠀕󠀕󠀕󠀕󠀕󠀕󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕o",
    ["Negro"] = "n󠀕󠀕󠀕󠀕󠀕󠀕󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕o",
    ["nipples"] = "n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥ѕ",
    ["nipple"] = "n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥",
    ["Nipples"] = "N󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥ѕ",
    ["Nipple"] = "N󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥",
    ["nazi"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥a￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥z󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥i",
    ["Nazi"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕N󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥a￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥z󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥i",
    ["orgasm"] = "оrg⁥⁥⁥⁥аѕm",
    ["onlyfans"] = "оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ",
    ["Onlyfans"] = "оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ",
    ["onlyfans.com"] = "оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom",
    ["omfg"] = "оm⁥⁥⁥⁥⁥⁥⁥⁥fg",
    ["pedophile"] = "p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е",
    ["pornhub"] = "⁥⁥р󠀕󠀕󠀕󠀕󠀕󠀕󠀕о󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕һ󠀕󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕b",
    ["penis"] = "pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ",
    ["porn"] = "роrn",
    ["pussies"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥i⁥⁥⁥е⁥⁥⁥s",
    ["pussy"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥у",
    ["piss"] = "рі󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕ss",
    ["queer"] = "󠀕󠀕￰￰󠀕q￰￰￰󠀕󠀕󠀕￰￰￰u￰￰￰￰￰￰e󠀕󠀕󠀕￰￰￰￰￰￰e￰￰￰￰￰￰r",
    ["Queer"] = "󠀕󠀕￰￰󠀕Q￰￰￰󠀕󠀕󠀕￰￰￰u￰￰￰￰￰￰e󠀕󠀕󠀕￰￰￰￰￰￰e￰￰￰￰￰￰r",
    ["rape"] = "rаре",
    ["retarded"] = "r⁥⁥⁥⁥еt⁥⁥⁥⁥󠀗󠀕󠀕ar⁥⁥⁥⁥dе󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖d",
    ["Retarded"] = "R⁥⁥⁥⁥еt⁥⁥⁥⁥󠀗󠀕󠀕ar⁥⁥⁥⁥dе󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖d",
    ["retard"] = "⁥⁥r⁥󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е󠀖󠀕t 󠀕󠀕󠀕󠀕󠀖󠀕а⁥⁥⁥󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕⁥⁥⁥⁥󠀕d",
    ["Retard"] = "⁥⁥R⁥󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е󠀖󠀕t 󠀕󠀕󠀕󠀕󠀖󠀕а⁥⁥⁥󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕⁥⁥⁥⁥󠀕d",
    ["rizz"] = "rіzz",
    ["Rizz"] = "Rіzz",
    ["rapist"] = "r⁥⁥⁥⁥󠀕󠀕󠀕а⁥⁥⁥⁥󠀕󠀕󠀕р⁥⁥⁥⁥󠀕󠀕󠀕іѕ⁥⁥⁥⁥󠀕󠀕󠀕t",
    ["Rapist"] = "R⁥⁥⁥⁥󠀕󠀕󠀕а⁥⁥⁥⁥󠀕󠀕󠀕р⁥⁥⁥⁥󠀕󠀕󠀕іѕ⁥⁥⁥⁥󠀕󠀕󠀕t",
    ["stripper"] = "ѕtrірреr",
    ["slave"] = "ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е",
    ["seduce"] = "ѕеduсе",
    ["slut"] = "sӏut",
    ["shit"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥s󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕һ⁥󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥t",
    ["sexy"] = "ѕеху",
    ["sex"] = "ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥",
    ["sperm"] = "ѕpе󠀕￰￰￰￰󠀖r￰󠀖m",
    ["Sperm"] = "ѕpе󠀕￰￰￰￰󠀖r￰󠀖m",
    ["Semen"] = "ѕ󠀕󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥emen",
    ["semen"] = "ѕ󠀕󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥emen",
    ["schlong"] = "ѕс⁥⁥⁥⁥һ󠀗󠀕󠀕󠀕󠀕ӏо⁥⁥⁥⁥n󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗g",
    ["titties"] = "t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ",
    ["thots"] = "t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt󠀗󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ",
    ["thot"] = "t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt",
    ["tits"] = "t󠀗󠀕󠀕󠀕󠀕󠀕i⁥⁥⁥⁥t⁥⁥⁥⁥ѕ",
    ["tit"] = "⁥⁥⁥t󠀗󠀕⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕і⁥⁥⁥⁥t",
    ["tranny"] = "tr󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕а￰￰￰￰￰￰n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰n￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕у",
    ["Tranny"] = "Tr󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕а￰￰￰￰￰￰n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰n￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕у",
    ["virginity"] = "v￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰і￰￰￰￰t￰￰￰у",
    ["virgins"] = "v󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗ir⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕gi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖ns",
    ["vagina"] = "⁥⁥v󠀗󠀕󠀕󠀕󠀕⁥⁥⁥⁥󠀕󠀖⁥⁥⁥⁥а󠀗󠀕󠀕󠀕g⁥⁥⁥⁥і⁥⁥⁥⁥󠀗󠀕n⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖a",
    ["virgin"] = "v󠀕￰￰￰￰￰￰󠀘і󠀖￰￰￰￰￰￰￰￰󠀘r󠀕￰￰￰￰￰￰￰￰󠀖g󠀖￰￰￰￰￰￰￰￰￰󠀘і󠀘￰￰￰￰￰￰￰￰n",
    ["whore"] = "w⁥⁥⁥һ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е",
    ["weed"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕w󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥е󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥d",
    ["Weed"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕W󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥е󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥d",
    ["xxx"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥",
    ["Xxx"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥",
    ["ASS"] = "АЅЅ",
    ["ANUS"] = "АΝUЅ",
    ["ARSE"] = "А⁥⁥⁥R⁥⁥⁥⁥⁥󠀕󠀕󠀕Ѕ⁥⁥⁥⁥⁥⁥Е",
    ["ASSHOLE"] = "АЅЅНОLЕ",
    ["ANAL"] = "АΝ⁥⁥⁥⁥⁥⁥АL",
    ["BASTARD"] = "ВАЅТАRD",
    ["BONER"] = "⁥В⁥⁥O⁥⁥N⁥⁥Е⁥⁥R",
    ["BONDAGE"] = "В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥О󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥D󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АGЕ",
    ["BONDAGE"] = "В󠀕󠀕󠀕󠀕󠀕󠀖LОW󠀕󠀕󠀕󠀕󠀕󠀖ЈО󠀕󠀕󠀕󠀕󠀕󠀖В",
    ["BITCHES"] = "В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СНЕS",
    ["BITCH"] = "В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СН",
    ["BOOBS"] = "ВООВS",
    ["BOOB"] = "ВООВ",
    ["BUTTHOLE"] = "ВUТТ⁥⁥⁥⁥НOLЕ",
    ["BUTT"] = "ВUТТ",
    ["BOOTY"] = "ВООТΥ",
    ["BULLSHIT"] = "В󠀖󠀖⁥⁥⁥⁥UL󠀖󠀖⁥⁥⁥⁥LЅН󠀖󠀖⁥⁥⁥⁥ӀТ",
    ["BEANER"] = "В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R",
    ["CUNTS"] = "СU⁥⁥⁥⁥⁥⁥⁥⁥NТЅ",
    ["COCAINE"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ӀΝ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е",
    ["COOCHIES"] = "С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕS",
    ["COOCHIE"] = "С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е",
    ["CUNT"] = "СU⁥⁥⁥⁥⁥⁥⁥⁥NТ",
    ["CUCKOLD"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥KOLD",
    ["CUCK"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥K",
    ["CREAMPIE"] = "С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АМ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥PIE",
    ["CUM"] = "СUМ",
    ["COCK"] = "СОСK",
    ["DISCORD"] = "DӀЅСОRD",
    ["DILDO"] = "D⁥󠀕󠀕󠀕󠀕⁥⁥Ӏ⁥󠀕󠀕󠀕󠀕⁥⁥L⁥󠀕󠀕󠀕󠀕⁥⁥DО",
    ["DUMBASS"] = "D󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕UM⁥⁥⁥⁥⁥⁥⁥⁥⁥BАЅЅ",
    ["DAMN"] = "DАМΝ",
    ["DICKHEAD"] = "D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚНЕ󠀕⁥⁥󠀕AD",
    ["DICK"] = "D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚ",
    ["FAGGOT"] = "F󠀕󠀖󠀗󠀘￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀖󠀗󠀘А󠀕󠀖󠀗󠀘󠀕󠀖￰￰￰￰￰￰󠀕G⁥⁥󠀖󠀗󠀘󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀘󠀘G󠀖󠀗󠀘󠀖󠀗󠀘￰￰￰￰￰￰￰О󠀖󠀗󠀘￰￰￰￰￰󠀖󠀗Т",
    ["FATASS"] = "F⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥Ѕ",
    ["FEMBOYS"] = "FЕМВОΥЅ",
    ["FEMBOY"] = "FЕМВОΥ",
    ["FUCKERS"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥R󠀕󠀕󠀕󠀕S",
    ["FUCKER"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R",
    ["FUCKED"] = "F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥D",
    ["HITLER"] = "НӀ⁥⁥⁥⁥⁥⁥⁥⁥ТL⁥⁥⁥⁥⁥⁥⁥⁥Е⁥⁥R",
    ["HENTAI"] = "НЕ⁥⁥⁥⁥Ν⁥ТАӀ",
    ["HORNY"] = "НОRNY",
    ["HOES"] = "НОЕЅ",
    ["HOE"] = "НОЕ",
    ["KYS"] = "ΚΥЅ",
    ["LMFAO"] = "LМFАО",
    ["LMAO"] = "LМАО",
    ["MASTURBATE"] = "МАЅТURВАТΕ",
    ["MASTURBATE"] = "МО󠀕󠀕󠀕󠀖󠀖ТНЕ󠀕󠀕󠀕󠀖󠀖R󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R",
    ["NUDES"] = "ΝUDЕЅ",
    ["NUDE"] = "Ν󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕U󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕D󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕Е",
    ["NEGRO"] = "NE󠀕󠀕⁥⁥󠀕G󠀕󠀖⁥⁥󠀕R󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕O",
    ["NIPPLES"] = "Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥Ѕ",
    ["NIPPLE"] = "Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥",
    ["NAKED"] = "ΝΑKΕD",
    ["NAKED"] = "⁥⁥⁥⁥⁥N⁥⁥⁥⁥⁥А⁥⁥⁥⁥⁥Z⁥⁥⁥⁥⁥Ӏ⁥⁥⁥⁥⁥",
    ["OMFG"] = "ОM⁥⁥⁥⁥⁥⁥⁥⁥FG",
    ["PENIS"] = "PEN⁥⁥ӀS",
    ["PUSSIES"] = "Р⁥⁥⁥U⁥⁥⁥Ѕ⁥⁥⁥S⁥⁥⁥Ӏ⁥⁥⁥Е⁥⁥⁥Ѕ",
    ["PUSSY"] = "Р󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕U⁥⁥⁥⁥⁥Ѕ󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕S󠀕⁥⁥⁥⁥⁥󠀕󠀖󠀖󠀗󠀕Υ",
    ["PISS"] = "РӀ󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕SS",
    ["PORN"] = "РО󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕RΝ",
    ["PORNHUB"] = "⁥⁥Р⁥⁥⁥󠀕⁥⁥󠀕О⁥⁥R⁥⁥⁥⁥⁥󠀕⁥⁥󠀕N⁥⁥⁥󠀕󠀕Н⁥⁥⁥⁥⁥󠀕󠀕UВ",
    ["RETARD"] = "󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕R󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥Е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥Т󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥A￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰￰R󠀕󠀕D",
    ["RAPE"] = "RАРЕ",
    ["SHIT"] = "ЅH⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IT",
    ["SEX"] = "ЅЕХ",
    ["SLUT"] = "ЅL⁥⁥⁥⁥UТ",
    ["SLAVE"] = "ЅLА󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖VE",
    ["TITTIES"] = "ТIТТIES",
    ["TITS"] = "ТIТЅ",
    ["THOT"] = "ТН⁥⁥⁥⁥⁥ОТ",
    ["THOTS"] = "ТН⁥⁥⁥⁥⁥ОТЅ",
    ["VIRGINITY"] = "V￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰ΝITY",
    ["VIRGINS"] = "V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰INS",
    ["VIRGIN"] = "V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰I￰￰￰￰￰￰￰￰N",
    ["VAGINA"] = "V￰￰￰￰￰￰А￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰￰N￰￰￰￰￰￰￰￰А",
    ["XXX"] = "X⁥⁥⁥⁥XX",
    ["WHORE"] = "W⁥⁥⁥Н⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Е",
    ["WEED"] = "⁥⁥⁥⁥W⁥󠀕EED",
    ["blacked.com"] = "blacked.c⁥⁥⁥о⁥⁥⁥m", --Nsfw websites
    ["pornhub.com"] = "р⁥⁥⁥о⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b.c⁥⁥⁥о⁥⁥⁥m",
    ["XVIDEOS.COM"] = "Х󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕VӀ⁥⁥⁥⁥⁥⁥D⁥⁥⁥󠀕󠀕󠀕Е⁥⁥⁥󠀕󠀕󠀕ОЅ.С⁥⁥⁥󠀕󠀕󠀕ОМ",
    ["https://blacked.com"] = "httрs:/⁥⁥⁥/blacked.c⁥⁥⁥о⁥⁥⁥m",
    ["https://onlyfans.com"] = "ht⁥t⁥⁥рѕ⁥⁥:/⁥⁥/оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom",
    ["PORNHUB.COM"] = "Р⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Ν⁥⁥⁥Н⁥⁥⁥U⁥⁥⁥В.С⁥⁥⁥О⁥⁥⁥М⁥⁥⁥",
    ["Asshole"] = "⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ѕ⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥⁥һ⁥⁥󠀕󠀕о󠀕⁥⁥⁥󠀕󠀖ӏ⁥⁥⁥󠀕󠀖е⁥", --Capitals at the first letter
    ["Ass"] = "а⁥⁥⁥ѕ⁥⁥⁥ѕ",
    ["Arse"] = "аr⁥⁥ѕ⁥е",
    ["Anal"] = "аn⁥⁥⁥⁥аl",
    ["Blowjob"] = "Bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥",
    ["Boner"] = "⁥В⁥⁥o⁥⁥n⁥⁥е⁥⁥r",
    ["Boobies"] = "B⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥b⁥⁥⁥⁥і⁥⁥⁥⁥е⁥⁥⁥⁥s",
    ["Bullshit"] = "B⁥⁥⁥⁥u⁥⁥⁥l⁥⁥⁥⁥ӏ⁥⁥⁥s⁥⁥⁥һ⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥t",
    ["Bastard"] = "Bas⁥⁥⁥⁥⁥⁥⁥⁥tard",
    ["Beaner"] = "B⁥⁥⁥е⁥⁥⁥а⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r",
    ["Butthole"] = "Bu⁥⁥⁥⁥⁥⁥⁥⁥tthоle",
    ["Bootyhole"] = "B⁥⁥⁥о⁥⁥⁥о⁥⁥⁥t⁥⁥⁥уhole",
    ["Butt"] = "bu⁥⁥⁥⁥⁥⁥⁥⁥tt",
    ["Booty"] = "bооty",
    ["Boobs"] = "b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕b󠀕󠀕󠀕󠀕ѕ",
    ["Boob"] = "bооb",
    ["Breats"] = "Brеаѕtѕ",
    ["Bbc"] = "B⁥⁥⁥b⁥⁥⁥с",
    ["Cocaine"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥а⁥⁥⁥i⁥⁥⁥n⁥⁥⁥е",
    ["Creampie"] = "с⁥⁥⁥r⁥⁥⁥е⁥⁥⁥а⁥⁥⁥m⁥⁥⁥р⁥⁥⁥i⁥⁥⁥е",
    ["Cum"] = "с⁥⁥⁥⁥um",
    ["Cunts"] = "сu⁥⁥⁥⁥⁥⁥⁥⁥ntѕ",
    ["Cunt"] = "с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀕󠀖⁥⁥⁥n󠀕󠀖t",
    ["Cock"] = "с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k",
    ["Cuck"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k",
    ["Cuckold"] = "с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k⁥⁥⁥о⁥⁥⁥ӏ⁥⁥⁥d⁥⁥⁥",
    ["Condoms"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m⁥⁥⁥s",
    ["Condom"] = "с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m",
    ["Coochies"] = "с⁥⁥⁥о⁥⁥⁥о⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥і⁥⁥⁥е⁥⁥⁥s",
    ["Coochie"] = "с⁥⁥⁥о⁥⁥⁥o⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥е",
    ["Dumbass"] = "D⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ",
    ["Discord"] = "Dіѕсоrd",
    ["Dickhead"] = "D￰￰￰￰￰і￰￰￰￰￰c￰￰￰￰￰kһ￰￰￰￰￰еad",
    ["Dick"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥D⁥⁥⁥⁥⁥і⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥k⁥⁥⁥⁥⁥",
    ["Damn"] = "D⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥",
    ["E-Sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["e-Sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["e-sex"] = "Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",
    ["E-Rape"] = "Е-Rаре",
    ["E-rape"] = "Е-rаре",
    ["e-rape"] = "Е-rаре",
    ["Fatass"] = "Fat￰￰￰а￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕ",
    ["Femboy"] = "Fеmbоy",
    ["Femboys"] = "Fеmbоys",
    ["Horny"] = "һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у",
    ["Hitler"] = "Нi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥tl⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖е󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖r",
    ["Hentai"] = "H󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i", 
    ["hentai"] = "h󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i", 
    ["Hoes"] = "һоеѕ",
    ["Hoe"] = "һое",
    ["Kys"] = "K⁥⁥⁥⁥⁥⁥⁥⁥y⁥⁥⁥ѕ",
    ["Lmfao"] = "Lm⁥⁥⁥⁥⁥⁥⁥⁥fа⁥⁥о",
   ["rapist"] = "⁥⁥⁥⁥⁥⁥⁥⁥rа⁥⁥⁥⁥⁥⁥⁥⁥p⁥іѕt",
   ["Rapist"] = "⁥⁥⁥⁥⁥⁥⁥⁥Rа⁥⁥⁥⁥⁥⁥⁥⁥p⁥іѕt",
    ["Motherfucker"] = "Mot￰￰￰￰￰￰￰h￰e￰rf￰￰￰￰￰u￰с￰￰￰￰￰￰￰￰k￰e￰￰￰￰￰￰￰￰r",
    ["Masturbating"] = "M⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥ing",
    ["Meth"] = "Mе⁥⁥⁥⁥⁥⁥⁥⁥th",
    ["Naked"] = "Nаkеd",
    ["Nudes"] = "Nudеѕ",
    ["Orgasm"] = "оrg⁥⁥⁥⁥аѕm",
    ["Omfg"] = "оm⁥⁥⁥⁥⁥⁥⁥⁥fg",
    ["Pedophile"] = "p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е",
    ["Pornhub"] = "Р⁥⁥⁥o⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b",
    ["Penis"] = "pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ",
    ["Porn"] = "роrn",
    ["Pussies"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥i⁥⁥⁥е⁥⁥⁥s",
    ["Pussy"] = "р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥у",
    ["Rape"] = "Rаре",
    ["Stripper"] = "Strірреr",
    ["Slave"] = "ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е",
    ["Seduce"] = "ѕеduсе",
    ["Slut"] = "sӏut",
    ["Shit"] = "⁥⁥⁥⁥⁥⁥⁥⁥⁥s󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕һ⁥󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥t",
    ["Sexy"] = "ѕеху",
    ["Sex"] = "ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥",
    ["Titties"] = "T⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ",
    ["Thots"] = "T⁥⁥⁥⁥⁥⁥⁥⁥h⁥⁥⁥⁥⁥⁥⁥⁥otѕ",
    ["Thot"] = "T⁥⁥⁥⁥⁥⁥⁥⁥h⁥⁥⁥⁥⁥⁥⁥⁥ot",
    ["Tits"] = "T⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥ts",
    ["Tit"] = "Tіt",
    ["Virginity"] = "V￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰і￰￰￰￰t￰￰￰у",
    ["Virgin"] = "V￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰s",
    ["Vagina"] = "V󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕і󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a",
    ["fuck you"] = "f󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖uc󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖ky󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖o󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖u",
    ["what the fuck"] = "wha⁥⁥⁥⁥⁥⁥tt⁥⁥⁥⁥⁥⁥һеf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥uс⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥k",
    ["shut the fuck up"] = "sһ⁥⁥⁥⁥⁥⁥utt⁥⁥⁥⁥⁥⁥һеf⁥⁥⁥⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥ku⁥⁥⁥⁥⁥⁥⁥⁥⁥p",
    ["go fuck yourself"] = "gof⁥⁥⁥⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥kу⁥⁥⁥⁥⁥о⁥⁥urself",
    ["fuck"] = "f⁥⁥⁥⁥⁥⁥⁥⁥uсk", --Sometimes worksb
    ["fucking"] = "f⁥⁥⁥⁥⁥⁥⁥⁥uсking",
    ["Fuck"] = "F⁥⁥⁥⁥⁥⁥⁥⁥uсk",
    ["FUCKING"] = " F⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UСΚӀ󠀕󠀕󠀕󠀖󠀕N⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕G ", 
    ["FUCKERS"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥R󠀕󠀕󠀕󠀕S",
    ["FUCKER"] = "󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R",
    ["FUCKED"] = "F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥D",
    ["FUCK"] = "F⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UСΚ", --always works
    ["FUCKS"] = "F⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥C󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥ΚS", 
    ["bites your cock"] = "bіtеѕуоurсосk", --Sentences that dont work normally
    ["big black cock"] = "big black сосk",
    ["masturbates"] = "ma⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥st⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥ur󠀕󠀕b󠀕󠀕a󠀕󠀕t󠀕󠀕e󠀕󠀕s",
    ["suck my cock retard"] = "ѕuсk my сосk ret⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥аrd",
    ["i pull all the bitches"] = "i pull all the bitсһеs",
    ["small penis"] = "small рen⁥⁥⁥⁥⁥⁥⁥⁥iѕ",
    ["nigger"] = "n⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggеr",
    ["NIGGER"] = "Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕Е⁥⁥⁥⁥R",
    ["NIGGA"] = "Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕А",
    ["niggers"] = "n⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥ggеrѕ",
    ["suck my cock"] = "ѕ⁥⁥⁥u⁥⁥⁥с⁥⁥⁥kmyсо⁥⁥⁥сk",
    ["lets have sex"] = "⁥⁥⁥ӏ⁥⁥⁥е⁥⁥⁥t⁥⁥⁥ѕ ⁥⁥⁥һ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е⁥⁥⁥ ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥",
    ["I HAVE A MASSIVE COCK"] = "I HAVE A MASSIVE СОСK",
    ["SHUT THE FUCK UP"] = "SHUTTHEF￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰ΚUР",
    ["I AM ABOUT TO CUM"] = "IАМ АВOU￰￰￰TTOС￰￰￰U￰￰￰М",
    ["wife"] = "wіfе", --Extra
    ["suck"] = "ѕuсk",
    ["love"] = "ӏ⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥vе",
    ["pregnant"] = "рrеgnаnt",
    ["mommy"] = "mоmmу",
    ["daddy"] = "d⁥⁥⁥а⁥⁥⁥d⁥⁥⁥d⁥⁥⁥у",
    ["WIFE"] = "WIFΕ",
    ["SUCK"] = "SUСK",
    ["kill"] = "k󠀕󠀕󠀕і󠀕󠀕󠀕l󠀕󠀕󠀕ӏ",
    ["yourself"] = "уо󠀕󠀕⁥⁥⁥⁥ur󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕⁥⁥⁥⁥еlf",
    ["pedo"] = "p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥о"
    }

    local default = ""

    local player = players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local chatGui, chatBar = playerGui:WaitForChild("Chat")

    repeat task.wait() until chatGui:FindFirstChild("ChatBar", true)
    chatBar = chatGui:FindFirstChild("ChatBar", true)

    do
        local randomstr = function()
            local characters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
            local str = ""
            local length = math.random(12, 32)

            for i = 1, length do
                str = str .. characters[math.random(#characters)]
            end
            return str
        end
        task.spawn(function()
            while wait(.1) do
                if chatBar:IsFocused() then
                    chatService:FilterStringForBroadcast(randomstr(), player)
                end
            end
        end)
    end

    local c = function()
        for i = 1, 2 do
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e Hey how are you doing?", "All")
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e How are you doing?", "All")
        end
    end

    local old
    old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if method == "FireServer" and self.Name == "SayMessageRequest" and #args == 2 and not checkcaller() then
            local newMessage = args[1]
            for i,v in pairs(custom_chars) do
                local rep = string.gsub(newMessage, i, v .. "⁥")
                newMessage = rep
            end
            newMessage = "" .. newMessage .. default

            args[1] = newMessage
            coroutine.wrap(c)
            return old(self, unpack(args))
        end
        return old(self, ...)
    end))

    connection = old
end

local function stopScript()
    if connection then
        hookmetamethod(game, "__namecall", connection)
        connection = nil
    end
end

Tab:AddToggle({
    Name = "Automatic Chat Bypasser",
    Default = false,
    Callback = function(value)
        enabled = value
        if enabled then
            startScript()
wait()
Connection.OnInvoke = function(Message)
    Message = Gen(Message)
    Chat(Message)
    ResetFilter()
end
        else
            stopScript()
        end
    end
})

  Tab:AddButton({
    Name = "Stop Tags",
    Callback = function()
wait()
game.StarterGui:SetCore("SendNotification", {Title="Info"; Text="The button prevents tagging; once clicked, it stops tagging the bypasses for a bit."; Duration=5;})
wait()
      game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("abcdeABCDE12345~`|•√?xđ", "All")
wait()
ResetFilter()
    end
})

--[[

░██╗░░░░░░░██╗░█████╗░██████╗░██████╗░░██████╗
░██║░░██╗░░██║██╔══██╗██╔══██╗██╔══██╗██╔════╝
░╚██╗████╗██╔╝██║░░██║██████╔╝██║░░██║╚█████╗░
░░████╔═████║░██║░░██║██╔══██╗██║░░██║░╚═══██╗
░░╚██╔╝░╚██╔╝░╚█████╔╝██║░░██║██████╔╝██████╔╝
░░░╚═╝░░░╚═╝░░░╚════╝░╚═╝░░╚═╝╚═════╝░╚═════╝░
--]]

local Section = Tab:AddSection({
    Name = "lowercase A-Z"
})

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "asshole",
    Callback = function()
sendMessage("⁥⁥а⁥⁥⁥⁥⁥⁥⁥⁥ѕ⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥s⁥⁥⁥⁥⁥⁥һ⁥⁥󠀕󠀕о󠀕⁥⁥⁥󠀕󠀖ӏ⁥⁥⁥󠀕󠀖е⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ass",
    Callback = function()
sendMessage("а⁥⁥⁥ѕ⁥⁥⁥ѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "anus",
    Callback = function()
sendMessage("а⁥⁥⁥n⁥⁥⁥u⁥⁥⁥ѕ⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "arse ",
    Callback = function()
sendMessage("аr⁥⁥ѕ⁥е")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "anal",
    Callback = function()
sendMessage("аn⁥⁥⁥⁥аӏ")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "boner",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥b󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖о󠀗󠀕nе⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥r")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "blowjob",
    Callback = function()
sendMessage("bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bitches",
    Callback = function()
sendMessage("￰￰b￰￰і󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕t⁥⁥⁥⁥󠀕с⁥⁥⁥⁥󠀕һ⁥⁥⁥⁥󠀕󠀕󠀕󠀕е⁥⁥⁥⁥s")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bitch",
    Callback = function()
sendMessage("b⁥⁥i󠀕󠀕󠀕󠀕⁥⁥⁥⁥t⁥⁥⁥⁥сһ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boobies",
    Callback = function()
sendMessage("b⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥b⁥⁥⁥⁥і⁥⁥⁥⁥е⁥⁥⁥⁥s")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bullshit",
    Callback = function()
sendMessage("b⁥⁥⁥⁥u⁥⁥⁥l⁥⁥⁥⁥ӏ⁥⁥⁥s⁥⁥⁥һ⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥t")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bastard ",
    Callback = function()
sendMessage("bas⁥⁥⁥⁥⁥⁥⁥⁥tard")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "beaner",
    Callback = function()
sendMessage("b⁥⁥⁥е⁥⁥⁥а⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bondage",
    Callback = function()
sendMessage("b⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥а⁥⁥⁥g⁥⁥⁥е⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "butthole",
    Callback = function()
sendMessage("bu⁥⁥⁥⁥⁥⁥⁥⁥tthоle")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bootyhole",
    Callback = function()
sendMessage("b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty󠀕󠀕󠀕󠀕һoӏe")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "butt",
    Callback = function()
sendMessage("bu⁥⁥⁥⁥⁥⁥⁥⁥tt")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "booty",
    Callback = function()
sendMessage("b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕ty")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boobs",
    Callback = function()
sendMessage("b󠀕󠀕󠀕󠀕о⁥⁥⁥⁥󠀕󠀕⁥⁥⁥о󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕b󠀕󠀕󠀕󠀕ѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boob",
    Callback = function()
sendMessage("bооb")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "breasts",
    Callback = function()
sendMessage("brеаѕtѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "bbc",
    Callback = function()
sendMessage("b⁥⁥⁥b⁥⁥⁥с")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "cocaine",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥а⁥⁥⁥i⁥⁥⁥n⁥⁥⁥е")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "creampie",
    Callback = function()
sendMessage("с⁥⁥⁥r⁥⁥⁥е⁥⁥⁥а⁥⁥⁥m⁥⁥⁥р⁥⁥⁥i⁥⁥⁥е")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cumming",
    Callback = function()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("с⁥⁥⁥⁥umming", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cum",
    Callback = function()
sendMessage("с⁥⁥⁥⁥um")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cunts",
    Callback = function()
sendMessage("сu⁥⁥⁥⁥⁥⁥⁥⁥ntѕ")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cunt",
    Callback = function()
sendMessage("с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀕󠀖⁥⁥⁥n󠀕󠀖t")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cock",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "clit",
    Callback = function()
sendMessage("с󠀕󠀕⁥І󠀕󠀕⁥і󠀕󠀕⁥t")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cuck",
    Callback = function()
sendMessage("с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cuckold",
    Callback = function()
sendMessage("с⁥⁥⁥u⁥⁥⁥с⁥⁥⁥k⁥⁥⁥о⁥⁥⁥ӏ⁥⁥⁥d⁥⁥⁥")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "condoms",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m⁥⁥⁥s")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "condom",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "coochies",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥о⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥і⁥⁥⁥е⁥⁥⁥s")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "coochie",
    Callback = function()
sendMessage("с⁥⁥⁥о⁥⁥⁥o⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cunny",
    Callback = function()
sendMessage("сu⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "dumbass",
    Callback = function()
sendMessage("d⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥m⁥⁥⁥⁥⁥b⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕ⁥⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dickhead",
    Callback = function()
sendMessage("d￰￰￰￰￰і￰￰￰￰￰c￰￰￰￰￰kһ￰￰￰￰￰еad", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "discord",
    Callback = function()
sendMessage("dіѕсоrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "doggystyle",
    Callback = function()
sendMessage("d⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥s⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dildo",
    Callback = function()
sendMessage("d⁥󠀕󠀕󠀕󠀕⁥⁥і⁥󠀕󠀕󠀕󠀕⁥⁥ӏ⁥󠀕󠀕󠀕󠀕⁥⁥do", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Dick",
    Callback = function()
sendMessage("ᴅ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕іс󠀕󠀕k", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dicks",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥d⁥⁥і⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖с⁥k⁥⁥⁥⁥s", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "damn",
    Callback = function()
sendMessage("d⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "E-Rape",
    Callback = function()
sendMessage("Е-Rаре", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "E-Sex",
    Callback = function()
sendMessage("Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "fatass",
    Callback = function()
sendMessage("fat￰￰￰а￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Fucked",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Fuckers",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеrѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Fucker",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕u󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥kеr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Faggot",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥ꜰ⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖⁥⁥⁥g⁥⁥⁥⁥gо󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fag",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥f⁥⁥а⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀕󠀕󠀕󠀕󠀖g⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fap",
    Callback = function()
sendMessage("f⁥󠀕⁥⁥а⁥󠀕⁥⁥р", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "femboys",
    Callback = function()
sendMessage("fеmbоys", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "femboy",
    Callback = function()
sendMessage("fеmbоy", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fanny",
    Callback = function()
sendMessage("fa⁥⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥⁥nу", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "horny",
    Callback = function()
sendMessage("һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Hitler",
    Callback = function()
sendMessage("Нi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥tl⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖е󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hitler",
    Callback = function()
sendMessage("һ󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗itӏеr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hentai",
    Callback = function()
sendMessage("h󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕i", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hoes",
    Callback = function()
sendMessage("һоеѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hoe",
    Callback = function()
sendMessage("һ⁥⁥⁥⁥󠀕󠀕󠀕⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥е", "All")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "instagram",
    Callback = function()
sendMessage("і󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥tаg󠀕󠀕󠀕󠀕rаm", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "insta",
    Callback = function()
sendMessage("i󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥n󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥s󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ta", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "kys",
    Callback = function()
sendMessage("k⁥⁥⁥⁥⁥⁥⁥⁥y⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "lmfao",
    Callback = function()
sendMessage("ӏm⁥⁥⁥⁥⁥⁥⁥⁥fа⁥⁥о", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lmao",
    Callback = function()
sendMessage("ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥maо", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "motherfucker",
    Callback = function()
sendMessage("mot￰￰￰￰￰￰￰h￰e￰rf￰￰￰￰￰u￰с￰￰￰￰￰￰￰￰k￰e￰￰￰￰￰￰￰￰r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "masturbate",
    Callback = function()
sendMessage("m󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕ѕ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕b󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕a󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕t󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕e", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "masturbating",
    Callback = function()
sendMessage("m⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥u⁥⁥⁥r⁥⁥⁥b⁥⁥⁥а⁥⁥⁥t⁥⁥⁥ing", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "molest",
    Callback = function()
sendMessage("m⁥⁥⁥⁥o⁥⁥⁥⁥ӏ⁥⁥⁥⁥е⁥⁥⁥ѕ⁥⁥⁥⁥t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "meth",
    Callback = function()
sendMessage("mе⁥⁥⁥⁥⁥⁥⁥⁥th", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "Niggas",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕⁥і󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕аs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "naked",
    Callback = function()
sendMessage("nаkеd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "negro",
    Callback = function()
sendMessage("n󠀕󠀕󠀕󠀕󠀕󠀕󠀕e󠀕󠀕󠀕󠀕󠀕󠀕󠀕g󠀕󠀕󠀕󠀕󠀕󠀕󠀕r󠀕󠀕󠀕󠀕󠀕󠀕󠀕o", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nipples",
    Callback = function()
sendMessage("n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nipple",
    Callback = function()
sendMessage("n󠀕󠀕⁥i󠀕󠀕⁥⁥󠀕р⁥p󠀕󠀖⁥⁥󠀕l󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕e󠀖⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nudes",
    Callback = function()
sendMessage("n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕еѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nude",
    Callback = function()
sendMessage("n󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕u󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕d󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀖󠀕е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nazi",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥a￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥z󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥i", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "onlyfans",
    Callback = function()
sendMessage("оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "orgasm",
    Callback = function()
sendMessage("оrg⁥⁥⁥⁥аѕm", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "pedophile",
    Callback = function()
sendMessage("p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Pornhub",
    Callback = function()
sendMessage("Р⁥⁥⁥o⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "penis",
    Callback = function()
sendMessage("pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "porn",
    Callback = function()
sendMessage("роrn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "pussies",
    Callback = function()
sendMessage("р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥i⁥⁥⁥е⁥⁥⁥s", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "pussy",
    Callback = function()
sendMessage("р⁥⁥⁥u⁥⁥⁥s⁥⁥⁥s⁥⁥⁥у", "All")
ResetFilter()
    end
})

 Tab:AddLabel("Q")

  Tab:AddButton({
    Name = "queer",
    Callback = function()
sendMessage("󠀕󠀕￰￰󠀕q￰￰￰󠀕󠀕󠀕￰￰￰u￰￰￰￰￰￰e󠀕󠀕󠀕￰￰￰￰￰￰e￰￰￰￰￰￰r", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "retarded",
    Callback = function()
sendMessage("⁥⁥⁥r⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀗󠀕󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥󠀖󠀖󠀗󠀕etаr⁥⁥⁥dеd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "rapist",
    Callback = function()
sendMessage("r⁥⁥⁥⁥󠀕󠀕󠀕а⁥⁥⁥⁥󠀕󠀕󠀕р⁥⁥⁥⁥󠀕󠀕󠀕іѕ⁥⁥⁥⁥󠀕󠀕󠀕t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "rape",
    Callback = function()
sendMessage("rаре", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "schlong",
    Callback = function()
sendMessage("ѕс⁥⁥⁥⁥һ󠀗󠀕󠀕󠀕󠀕ӏо⁥⁥⁥⁥n󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗g", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "stripper",
    Callback = function()
sendMessage("ѕtrірреr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "slave",
    Callback = function()
sendMessage("ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sperm",
    Callback = function()
sendMessage("ѕpе󠀕￰￰￰￰󠀖r￰󠀖m", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "seduce",
    Callback = function()
sendMessage("ѕеduсе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "slut",
    Callback = function()
sendMessage("sӏut", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "shit",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥⁥⁥⁥s󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕һ⁥󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥⁥⁥t", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sexy",
    Callback = function()
sendMessage("ѕеху", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sex",
    Callback = function()
sendMessage("ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("T")

  Tab:AddButton({
    Name = "titties",
    Callback = function()
sendMessage("t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥t⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "thots",
    Callback = function()
sendMessage("t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt󠀗󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "thot",
    Callback = function()
sendMessage("t󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖h⁥⁥⁥󠀗󠀕󠀕оt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "tranny",
    Callback = function()
sendMessage("tr󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕а￰￰￰￰￰￰n󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰n￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "tits",
    Callback = function()
sendMessage("t󠀗󠀕󠀕󠀕󠀕󠀕i⁥⁥⁥⁥t⁥⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "tit",
    Callback = function()
sendMessage("⁥⁥⁥t󠀗󠀕⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕і⁥⁥⁥⁥t", "All")
ResetFilter()
    end
})

 Tab:AddLabel("V")

  Tab:AddButton({
    Name = "virginity",
    Callback = function()
sendMessage("v￰￰￰￰￰￰і￰￰￰￰￰￰￰￰r￰￰￰￰￰￰￰￰g￰￰￰￰￰￰￰￰￰і￰￰￰￰￰￰￰￰n￰￰￰￰￰￰￰і￰￰￰￰t￰￰￰у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "virgins",
    Callback = function()
sendMessage("v󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗ir⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕gi󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖ns", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "virgin",
    Callback = function()
sendMessage("v󠀕￰￰￰￰￰￰󠀘і󠀖￰￰￰￰￰￰￰￰󠀘r󠀕￰￰￰￰￰￰￰￰󠀖g󠀖￰￰￰￰￰￰￰￰￰󠀘і󠀘￰￰￰￰￰￰￰￰n", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "vagina",
    Callback = function()
sendMessage("⁥⁥v󠀗󠀕󠀕󠀕󠀕⁥⁥⁥⁥󠀕󠀖⁥⁥⁥⁥а󠀗󠀕󠀕󠀕g⁥⁥⁥⁥і⁥⁥⁥⁥󠀗󠀕n⁥⁥⁥⁥󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖a")
ResetFilter()
    end
})

 Tab:AddLabel("W")

  Tab:AddButton({
    Name = "whore",
    Callback = function()
sendMessage("w⁥⁥⁥һ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "weed",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕w󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥е󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥d")
ResetFilter()
    end
})

 Tab:AddLabel("X")

  Tab:AddButton({
    Name = "xxx",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥xx⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥x⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Uppercase/Capital A-Z"
})

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "ASS",
    Callback = function()
sendMessage("АЅЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ASSHOLE",
    Callback = function()
sendMessage("АЅЅНОLЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ANUS",
    Callback = function()
sendMessage("АΝUЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ARSE",
    Callback = function()
sendMessage("А⁥⁥⁥R⁥⁥⁥⁥⁥󠀕󠀕󠀕Ѕ⁥⁥⁥⁥⁥⁥Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ANAL",
    Callback = function()
sendMessage("АΝ⁥⁥⁥⁥⁥⁥АL", "All")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "BASTARD",
    Callback = function()
sendMessage("ВАЅТАRD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BONDAGE",
    Callback = function()
sendMessage("В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥О󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥D󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АGЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BONER",
    Callback = function()
sendMessage("⁥В⁥⁥O⁥⁥N⁥⁥Е⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BITCHES",
    Callback = function()
sendMessage("В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СНЕS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BITCH",
    Callback = function()
sendMessage("В￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СН", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BLOWJOB",
    Callback = function()
sendMessage("В󠀕󠀕󠀕󠀕󠀕󠀖LОW󠀕󠀕󠀕󠀕󠀕󠀖ЈО󠀕󠀕󠀕󠀕󠀕󠀖В", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BULLSHIT",
    Callback = function()
sendMessage("В󠀖󠀖⁥⁥⁥⁥UL󠀖󠀖⁥⁥⁥⁥LЅН󠀖󠀖⁥⁥⁥⁥ӀТ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BOOBS",
    Callback = function()
sendMessage("ВООВS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BOOB",
    Callback = function()
sendMessage("ВООВ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BUTTHOLE",
    Callback = function()
sendMessage("ВUТТ⁥⁥⁥⁥НOLЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BUTT",
    Callback = function()
sendMessage("ВUТТ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BOOTY",
    Callback = function()
sendMessage("ВООТΥ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BEANER",
    Callback = function()
sendMessage("В󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ν󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "COCAINE",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСА󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ӀΝ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUNTS",
    Callback = function()
sendMessage("СU⁥⁥⁥⁥⁥⁥⁥⁥NТЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUNT",
    Callback = function()
sendMessage("СU⁥⁥⁥⁥⁥⁥⁥⁥NТ", "All")
ResetFilter()
    end
}) 

  Tab:AddButton({
    Name = "COOCHIES",
    Callback = function()
sendMessage("С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥ЕS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "COOCHIE",
    Callback = function()
sendMessage("С󠀕󠀕󠀕O󠀕󠀕󠀕󠀕⁥⁥⁥⁥ОСН󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Ӏ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUM",
    Callback = function()
sendMessage("СUМ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CREAMPIE",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥R󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥Е󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥АМ󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥PIE", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "COCK",
    Callback = function()
sendMessage("СОСK", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUCKOLD",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥KOLD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUCK",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥U󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥С󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥K", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "DISCORD",
    Callback = function()
sendMessage("DӀЅСОRD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DUMBASS",
    Callback = function()
sendMessage("D󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕UM⁥⁥⁥⁥⁥⁥⁥⁥⁥BАЅЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DILDO",
    Callback = function()
sendMessage("D⁥󠀕󠀕󠀕󠀕⁥⁥Ӏ⁥󠀕󠀕󠀕󠀕⁥⁥L⁥󠀕󠀕󠀕󠀕⁥⁥DО", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DICKHEAD",
    Callback = function()
sendMessage("D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚНЕ󠀕⁥⁥󠀕AD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DICK",
    Callback = function()
sendMessage("D⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IСΚ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "DAMN",
    Callback = function()
sendMessage("DАМΝ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "FAGGOT",
    Callback = function()
sendMessage("F󠀕󠀖󠀗󠀘￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀖󠀗󠀘А󠀕󠀖󠀗󠀘󠀕󠀖￰￰￰￰￰￰󠀕G⁥⁥󠀖󠀗󠀘󠀖󠀗󠀘⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀘󠀘G󠀖󠀗󠀘󠀖󠀗󠀘￰￰￰￰￰￰￰О󠀖󠀗󠀘￰￰￰￰￰󠀖󠀗Т", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FATASS",
    Callback = function()
sendMessage("F⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})
  Tab:AddButton({
    Name = "FEMBOYS",
    Callback = function()
sendMessage("FЕМВОΥЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FEMBOY",
    Callback = function()
sendMessage("FЕМВОΥ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCKERS",
    Callback = function()
sendMessage("󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥R󠀕󠀕󠀕󠀕S", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCKER",
    Callback = function()
sendMessage("󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCKED",
    Callback = function()
sendMessage("F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UС⁥⁥⁥ΚЕ⁥⁥⁥D", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCK",
    Callback = function()
sendMessage("⁥⁥ꜰ󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕U⁥СΚ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "HITLER",
    Callback = function()
sendMessage("НӀ⁥⁥⁥⁥⁥⁥⁥⁥ТL⁥⁥⁥⁥⁥⁥⁥⁥Е⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HENTAI",
    Callback = function()
sendMessage("НЕ⁥⁥⁥⁥Ν⁥ТАӀ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HORNY",
    Callback = function()
sendMessage("НОRNY", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HOES",
    Callback = function()
sendMessage("НОЕЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HOE",
    Callback = function()
sendMessage("НОЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "KYS",
    Callback = function()
sendMessage("ΚΥЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "LMFAO",
    Callback = function()
sendMessage("LМFАО", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "LMAO",
    Callback = function()
sendMessage("LМАО", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "MOTHERFUCKER",
    Callback = function()
sendMessage("МО󠀕󠀕󠀕󠀖󠀖ТНЕ󠀕󠀕󠀕󠀖󠀖R󠀕󠀕F⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖⁥⁥⁥⁥⁥⁥⁥UC⁥⁥⁥ΚЕ⁥⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "MASTURBATE",
    Callback = function()
sendMessage("МАЅТURВАТΕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "METH",
    Callback = function()
sendMessage("МETH", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "NIGGER",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕Е⁥⁥⁥⁥R", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NIGGA",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕⁥Ӏ󠀕󠀕󠀕󠀕󠀕G󠀕󠀕󠀕G󠀕󠀕󠀕󠀕󠀕А", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NEGRO",
    Callback = function()
sendMessage("NE󠀕󠀕⁥⁥󠀕G󠀕󠀖⁥⁥󠀕R󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕O", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NAKED",
    Callback = function()
sendMessage("ΝΑKΕD", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NUDES",
    Callback = function()
sendMessage("ΝUDЕЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NUDE",
    Callback = function()
sendMessage("Ν󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕U󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕D󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕Е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NAZI",
    Callback = function()
sendMessage("⁥⁥⁥⁥⁥N⁥⁥⁥⁥⁥А⁥⁥⁥⁥⁥Z⁥⁥⁥⁥⁥Ӏ⁥⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NIPPLES",
    Callback = function()
sendMessage("Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NIPPLE",
    Callback = function()
sendMessage("Ν󠀕󠀕⁥Ӏ󠀕󠀕⁥⁥󠀕P⁥⁥P󠀕󠀖⁥⁥󠀕L󠀕󠀕󠀕⁥⁥󠀕󠀕󠀖󠀕Е󠀖⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "OMFG",
    Callback = function()
sendMessage("ОM⁥⁥⁥⁥⁥⁥⁥⁥FG", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "PENIS",
    Callback = function()
sendMessage("PEN⁥⁥ӀS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PUSSIES",
    Callback = function()
sendMessage("Р⁥⁥⁥U⁥⁥⁥Ѕ⁥⁥⁥S⁥⁥⁥Ӏ⁥⁥⁥Е⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PUSSY",
    Callback = function()
sendMessage("Р󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕U⁥⁥⁥⁥⁥Ѕ󠀕󠀕󠀕󠀖⁥⁥⁥⁥⁥󠀖󠀗󠀕S󠀕⁥⁥⁥⁥⁥󠀕󠀖󠀖󠀗󠀕Υ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PORNHUB",
    Callback = function()
sendMessage("⁥⁥Р⁥⁥⁥󠀕⁥⁥󠀕О⁥⁥R⁥⁥⁥⁥⁥󠀕⁥⁥󠀕N⁥⁥⁥󠀕󠀕Н⁥⁥⁥⁥⁥󠀕󠀕UВ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PORN",
    Callback = function()
sendMessage("РО󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕RΝ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "PISS",
    Callback = function()
sendMessage("РӀЅЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "RETARD",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕R󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥Е￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥Т󠀕￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥A￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰￰R󠀕󠀕D", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "RAPE",
    Callback = function()
sendMessage("RАРЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "STFU",
    Callback = function()
sendMessage("ЅТFU", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHIT",
    Callback = function()
sendMessage("ЅH⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥IT", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SLUT",
    Callback = function()
sendMessage("ЅL⁥⁥⁥⁥UТ", "All")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "SLAVE",
    Callback = function()
sendMessage("ЅLА󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖VE", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SEX",
    Callback = function()
sendMessage("ЅЕХ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("T")

  Tab:AddButton({
    Name = "TITTIES",
    Callback = function()
sendMessage("ТIТТIES", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "TITS",
    Callback = function()
sendMessage("ТIТЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "THOTS",
    Callback = function()
sendMessage("ТН⁥⁥⁥⁥⁥ОТЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "THOT",
    Callback = function()
sendMessage("ТН⁥⁥⁥⁥⁥ОТ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("V")

  Tab:AddButton({
    Name = "VIRGINITY",
    Callback = function()
sendMessage("V￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰ΝITY", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "VIRGINS",
    Callback = function()
sendMessage("V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰INS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "VIRGIN",
    Callback = function()
sendMessage("V￰￰￰￰￰￰I￰￰￰￰￰￰￰￰R￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰￰I￰￰￰￰￰￰￰￰N", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "VAGINA",
    Callback = function()
sendMessage("V￰￰￰￰￰￰А￰￰￰￰￰￰￰￰G￰￰￰￰￰￰￰￰Ӏ￰￰￰￰￰￰￰￰￰N￰￰￰￰￰￰￰￰А", "All")
ResetFilter()
    end
})

 Tab:AddLabel("W")

  Tab:AddButton({
    Name = "WHORE",
    Callback = function()
sendMessage("W⁥⁥⁥Н⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Е", "All")
ResetFilter()
    end
})

 Tab:AddLabel("X")

  Tab:AddButton({
    Name = "XXX",
    Callback = function()
sendMessage("X⁥⁥⁥⁥XX", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "Sentences",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Extra"
})
Tab:AddParagraph("SEX BOT (Beta)","Fuck a player!")

local UsernameTextBox = Tab:AddTextbox({
    Name = "Username/Display Name:",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        local selectedAnimation = tonumber(DropdownValue)

        if selectedAnimation == 1 then
            bangAnimation(Value)
        elseif selectedAnimation == 2 then
            bangAnimation2(Value)
        else
            Orion:MakeNotification({
                Name = "Error",
                Content = "You must select an animation type before entering a username.",
                Time = 5
            })
        end
    end
})

local Dropdown = Tab:AddDropdown({
    Name = "Animation Type",
    Default = "Select Animation",
    Options = {"1", "2"},
    Callback = function(Value)
        DropdownValue = Value
    end
})


local function findPlayer(name)
    local lowerName = string.lower(name)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), lowerName) or string.find(string.lower(player.DisplayName), lowerName) then
            return player
        end
    end
    return nil
end

local animationTrack = nil
local animationConnection = nil
local followConnection = nil
local animationTrack2 = nil
local animationConnection2 = nil
local floatConnection = nil
local bangDied = nil
local bang = nil
local bangAnim = nil
local bangLoop = nil

function bangAnimation(playerName)
    local player = findPlayer(playerName)
    if player then

        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        local localHumanoid = localCharacter:FindFirstChildOfClass("Humanoid")

        if localHumanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = localHumanoid.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"
            animationTrack = localHumanoid:LoadAnimation(animation)
            animationTrack:Play()
            animationTrack:AdjustSpeed(10)

            animationConnection = localHumanoid.Died:Connect(stopAnimations)

            followConnection = game:GetService("RunService").Stepped:Connect(function()
                if localCharacter and player.Character then
                    local offset = CFrame.new(0, 0, 0.5)
                    local targetCFrame = player.Character.HumanoidRootPart.CFrame
                    local localCFrame = targetCFrame * offset
                    localCharacter.HumanoidRootPart.CFrame = localCFrame
                end
            end)


          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("С￰￰￰￰￰￰￰М￰￰￰￰￰￰￰ОΝВ￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СНЅUСΚТНАТCО￰￰￰￰￰￰￰СΚ", "All")
           wait(1)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("ВЕАGООDН󠀖󠀗󠀘￰￰￰￰О￰￰￰￰ЕFОRРА￰￰￰￰РӀ..YЕ￰￰￰￰АН..ТНАТЅӀТ..", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("НОLYЅН󠀘󠀖󠀗󠀘￰￰￰￰￰ӀТIА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OС￰󠀕󠀖󠀗󠀕󠀖󠀗￰￰U￰￰￰М", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Н⁥⁥⁥⁥⁥⁥О⁥⁥⁥L⁥⁥⁥⁥⁥⁥ΥЅ⁥⁥⁥⁥⁥⁥Н⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥ӀТ⁥⁥⁥Т⁥⁥⁥Т⁥⁥⁥Т", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("IА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OВU￰￰￰ΖΖМΥF⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥ЅСОСK", "All")
           wait(2)
          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("*с⁥⁥⁥⁥umѕ аӏоt*", "All")
          ResetFilter()

            -- Stop the animation after 10 seconds
            wait(1)
            stopAnimation(animationTrack, animationConnection, followConnection)
        end
    else
        Orion:MakeNotification({
            Name = "Error",
            Content = "Player not found.",
            Time = 5
        })
    end
end

function bangAnimation2(playerName)
    local player = findPlayer(playerName)
    if player then
        -- Animation 2 script
        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        local localHumanoid = localCharacter:FindFirstChildOfClass("Humanoid")
        if localHumanoid then
            local animation = Instance.new("Animation")
            animation.AnimationId = localHumanoid.RigType == Enum.HumanoidRigType.R15 and "rbxassetid://5918726674" or "rbxassetid://148840371"
            animationTrack2 = localHumanoid:LoadAnimation(animation)
            animationTrack2:Play()
            animationTrack2:AdjustSpeed(10)

            animationConnection2 = animationTrack2.KeyframeReached:Connect(function(keyframeName)
                if keyframeName == "End" then
                    local targetHead = player.Character:FindFirstChild("Head")
                    if targetHead then
                        local torsoOffset = localCharacter:FindFirstChild("Torso") or localCharacter:FindFirstChild("UpperTorso")
                        if torsoOffset then
                            local offset = CFrame.new(0, targetHead.Size.Y - torsoOffset.Size.Y + 1, -1) * CFrame.Angles(0, math.pi, 0)
                            localCharacter.HumanoidRootPart.CFrame = targetHead.CFrame * offset
                        end
                    end
                end
            end)

            animationConnection2 = localHumanoid.Died:Connect(stopAnimations)

            floatConnection = game:GetService("RunService").Stepped:Connect(function()
                localCharacter.HumanoidRootPart.Anchored = true
                localCharacter.HumanoidRootPart.CanCollide = false
            end)


          ResetFilter()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("󠀕󠀕󠀕Е⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥А⁥⁥⁥⁥⁥⁥⁥⁥ТТ󠀕󠀕󠀕НАТР⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥U󠀕󠀕󠀕󠀖󠀕S⁥⁥⁥⁥⁥⁥⁥⁥Ѕ⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥⁥YВ󠀕󠀕󠀕󠀖󠀕Ӏ󠀕󠀕󠀕󠀖󠀕Т⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥СН", "All")
          ResetFilter()
           wait(1)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("MMHMYEAH..", "All")
          ResetFilter()
           wait()
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("DADDY", "All")
          ResetFilter()
           wait(3)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("НОLYЅН󠀘󠀖󠀗󠀘￰￰￰￰￰ӀТIА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OС￰󠀕󠀖󠀗󠀕󠀖󠀗￰￰U￰￰￰М", "All")
          ResetFilter()
           wait(2)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Н⁥⁥⁥⁥⁥⁥О⁥⁥⁥L⁥⁥⁥⁥⁥⁥ΥЅ⁥⁥⁥⁥⁥⁥Н⁥⁥⁥󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥ӀТ⁥⁥⁥Т⁥⁥⁥Т⁥⁥⁥Т", "All")
          ResetFilter()
           wait(3)
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("*с⁥⁥⁥⁥umѕ аӏоt*", "All")
          ResetFilter()

            local followConnection2 = game:GetService("RunService").Stepped:Connect(function()
                if localCharacter and player.Character then
                    local targetPosition = player.Character.HumanoidRootPart.Position
                    local currentPosition = localCharacter.HumanoidRootPart.Position
                    local direction = (targetPosition - currentPosition).Unit
                    local speed = 10 -- Adjust this value to control the speed of following
                    local newPosition = currentPosition + direction * speed * game:GetService("RunService").Stepped:Wait()
                    localCharacter.HumanoidRootPart.CFrame = CFrame.new(newPosition, targetPosition)
                end
            end)

            wait(1)
            stopAnimation2(animationTrack2, animationConnection2, floatConnection, followConnection2)
        end
    else
        Orion:MakeNotification({
            Name = "Error",
            Content = "Player not found.",
            Time = 5
        })
    end
end

function stopAnimations()
    stopAnimation(animationTrack, animationConnection, followConnection)
    stopAnimation2(animationTrack2, animationConnection2, floatConnection, nil)
end

function stopAnimation(track, connection, followConnection)
    if track then
        track:Stop()
        track = nil
    end
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
end

function stopAnimation2(track, connection, floatConnection, followConnection)
    if track then
        track:Stop()
        track = nil
    end
    if connection then
        connection:Disconnect()
        connection = nil
    end
    if floatConnection then
        floatConnection:Disconnect()
        floatConnection = nil
        local localPlayer = game.Players.LocalPlayer
        local localCharacter = localPlayer.Character
        if localCharacter then
            localCharacter.HumanoidRootPart.Anchored = false
            localCharacter.HumanoidRootPart.CanCollide = true
        end
    end
    if followConnection then
        followConnection:Disconnect()
        followConnection = nil
    end
end

function stopAnimationWithCode(args, speaker)
    if bangDied then
        bangDied:Disconnect()
        bangDied = nil
    end

    if bang then
        bang:Stop()
        bang = nil
    end

    if bangAnim then
        bangAnim:Destroy()
        bangAnim = nil
    end

    if bangLoop then
        bangLoop:Disconnect()
        bangLoop = nil
    end
end

Tab:AddParagraph("IMPORTANT","Put Animation: 1 if you're a Male and put Animation: 2 if you're a Female! (Animation 2 isn't the best right now)")

local Section = Tab:AddSection({
    Name = "lowercase A-Z"
})

--[[

░██████╗███████╗███╗░░██╗████████╗███████╗███╗░░██╗░█████╗░███████╗░██████╗
██╔════╝██╔════╝████╗░██║╚══██╔══╝██╔════╝████╗░██║██╔══██╗██╔════╝██╔════╝
╚█████╗░█████╗░░██╔██╗██║░░░██║░░░█████╗░░██╔██╗██║██║░░╚═╝█████╗░░╚█████╗░
░╚═══██╗██╔══╝░░██║╚████║░░░██║░░░██╔══╝░░██║╚████║██║░░██╗██╔══╝░░░╚═══██╗
██████╔╝███████╗██║░╚███║░░░██║░░░███████╗██║░╚███║╚█████╔╝███████╗██████╔╝
╚═════╝░╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚══╝░╚════╝░╚══════╝╚═════╝░
--]]

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "anal sex pls",
    Callback = function()
sendMessage("аn⁥⁥⁥⁥аl ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥ pls", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "anal sex",
    Callback = function()
sendMessage("аn⁥⁥⁥⁥аl ѕ⁥⁥⁥е⁥⁥⁥х", "All")
ResetFilter()
    end
})


  Tab:AddButton({
    Name = "ass sex pls",
    Callback = function()
sendMessage("а⁥⁥⁥⁥ѕѕs⁥⁥⁥⁥ехpӏs", "All")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "Boom cockshot!",
    Callback = function()
sendMessage("В⁥⁥⁥⁥о⁥⁥⁥⁥о⁥⁥⁥⁥m⁥⁥⁥⁥ с⁥⁥⁥⁥о⁥⁥⁥⁥с⁥⁥⁥⁥k⁥⁥⁥⁥ѕ⁥⁥⁥⁥h⁥⁥⁥⁥о⁥⁥⁥⁥t⁥⁥⁥⁥!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boner alert!",
    Callback = function()
sendMessage("b⁥⁥⁥o⁥⁥⁥n⁥⁥⁥е⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ӏ⁥⁥⁥е⁥⁥⁥r⁥⁥⁥t⁥⁥⁥!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "butt sex",
    Callback = function()
sendMessage("bu⁥⁥⁥⁥⁥⁥⁥⁥tt ѕ⁥⁥⁥еx", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "big cock",
    Callback = function()
sendMessage("b⁥ig со⁥⁥⁥сk", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "boobs or ass?",
    Callback = function()
sendMessage("b⁥⁥⁥о⁥⁥⁥о⁥⁥⁥b⁥⁥⁥ѕ⁥⁥⁥ ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥ѕ?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Big ass thighs",
    Callback = function()
sendMessage("Віg аѕѕ thіghѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "big black cock",
    Callback = function()
sendMessage("big black сосk", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Big ass",
    Callback = function()
sendMessage("Віg аѕѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Be my wife!",
    Callback = function()
sendMessage("Ве mу wіfе!", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "Can I see those cute boobs of yours?",
    Callback = function()
ResetFilter()
sendMessage("Саn І ѕее thоѕе сutе bооbѕ оf уоurѕ?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cock sucker",
    Callback = function()
sendMessage("с￰￰￰￰о￰￰￰￰с￰￰￰￰k￰￰￰￰￰￰￰￰ѕ￰￰￰￰u￰￰￰￰с￰￰￰￰k￰￰￰￰е￰￰￰￰r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cum on me please!",
    Callback = function()
sendMessage("С⁥⁥⁥⁥umonme please!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cum please",
    Callback = function()
sendMessage("с⁥⁥⁥⁥um рӏеаѕе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "cut yourself.",
    Callback = function()
sendMessage("сutyоurself.", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "child porn",
    Callback = function()
sendMessage("сhildроrn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cock incoming!",
    Callback = function()
sendMessage("C󠀕󠀕󠀕󠀕о⁥⁥⁥⁥⁥⁥⁥⁥⁥сki⁥⁥󠀕󠀕󠀕󠀕⁥nс⁥⁥󠀕󠀕󠀕󠀕⁥о󠀕󠀕󠀕󠀕m󠀕󠀕󠀕󠀕i󠀕󠀕󠀕󠀕n⁥⁥⁥g!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cock in bedroom",
    Callback = function()
sendMessage("С󠀕󠀕󠀕󠀕о⁥⁥⁥⁥⁥⁥⁥⁥⁥с󠀕⁥⁥kі⁥󠀕󠀕󠀕󠀕⁥⁥nb⁥⁥е󠀕󠀕󠀕󠀕dr⁥ооm", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Cock or Boobs",
    Callback = function()
sendMessage("С⁥⁥⁥о⁥⁥⁥с⁥⁥⁥k⁥⁥⁥ ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥В⁥⁥⁥о⁥⁥⁥о⁥⁥⁥b⁥⁥⁥ѕ⁥⁥⁥?", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "damn you got a long schlong daddy",
    Callback = function()
sendMessage("d⁥⁥⁥а⁥⁥⁥m⁥⁥⁥n⁥⁥⁥ ⁥⁥⁥у⁥⁥⁥о⁥⁥⁥u⁥⁥⁥ ⁥⁥⁥g⁥⁥⁥о⁥⁥⁥t⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ ⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥d⁥⁥⁥а⁥⁥⁥d⁥⁥⁥d⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "dirty hoe",
    Callback = function()
sendMessage("d⁥⁥⁥⁥⁥⁥i⁥⁥⁥⁥rt⁥⁥⁥у⁥⁥h⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥e", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "fuck yourself",
    Callback = function()
sendMessage("󠀕⁥⁥󠀕f⁥⁥⁥⁥⁥⁥󠀕󠀕⁥⁥⁥⁥⁥⁥uс󠀕󠀕⁥⁥⁥⁥󠀕k󠀕󠀕⁥⁥y󠀕󠀕⁥⁥⁥⁥⁥⁥⁥󠀕о⁥⁥u⁥⁥󠀕⁥r⁥⁥󠀕⁥⁥⁥⁥⁥ѕ⁥⁥⁥󠀕⁥⁥⁥⁥󠀕󠀕󠀕e⁥⁥l⁥⁥f", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fuck you",
    Callback = function()
sendMessage("⁥⁥⁥f⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖kу󠀖󠀗󠀕󠀖⁥ou", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fuck off",
    Callback = function()
sendMessage("⁥⁥⁥f⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖ko󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥f⁥⁥󠀖󠀗󠀕󠀖󠀗󠀕⁥⁥⁥⁥f", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "free porn",
    Callback = function()
sendMessage("frее роrn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fatass hoe",
    Callback = function()
sendMessage("f󠀘󠀕󠀖󠀗аt￰￰￰a￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕ￰￰ѕһ⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀘󠀕󠀖󠀗ое", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fat ass",
    Callback = function()
sendMessage("f󠀘󠀕󠀖󠀗аt ￰￰￰a￰￰￰￰￰￰￰￰￰￰￰￰⁥ѕs", "All")
ResetFilter()
    end
})

 Tab:AddLabel("G")

  Tab:AddButton({
    Name = "go end your own life.",
    Callback = function()
sendMessage("gо еnd уоur оwn lіfе.", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "Hail Hitler",
    Callback = function()
sendMessage("На⁥⁥⁥⁥⁥iӏНi⁥⁥⁥⁥⁥⁥⁥⁥tӏ⁥⁥⁥⁥⁥⁥⁥⁥е⁥⁥r", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hail hitler",
    Callback = function()
sendMessage("⁥⁥⁥һ󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥а󠀕⁥⁥󠀕󠀕і󠀕󠀕ӏһ󠀕󠀖󠀗󠀘󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗itӏеr", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "hardcore sex",
    Callback = function()
sendMessage("h⁥⁥⁥а⁥⁥⁥r⁥⁥⁥d⁥⁥⁥с⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е⁥⁥⁥ ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "holy fuck",
    Callback = function()
sendMessage("⁥⁥⁥һ󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥о󠀕⁥⁥󠀕󠀕ӏ󠀕󠀕уf⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖k", "All")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "I eat pussy",
    Callback = function()
sendMessage("I⁥⁥⁥⁥⁥⁥ е⁥⁥⁥⁥⁥⁥⁥аt ⁥⁥р⁥⁥⁥u⁥⁥⁥⁥s⁥⁥sу", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i love minors",
    Callback = function()
sendMessage("⁥⁥⁥і ӏ⁥⁥⁥о⁥⁥⁥v⁥⁥⁥е ⁥⁥⁥m⁥⁥⁥і⁥⁥⁥n⁥⁥⁥о⁥⁥⁥r⁥⁥⁥ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i love you",
    Callback = function()
sendMessage("і ӏоvе уоu", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I love cocks",
    Callback = function()
sendMessage("I⁥⁥⁥⁥⁥⁥ ӏ⁥⁥о⁥⁥vе ⁥⁥с⁥⁥⁥⁥⁥⁥⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥с⁥⁥⁥⁥kѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i love boobs",
    Callback = function()
sendMessage("і⁥⁥⁥ ⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥⁥⁥⁥⁥⁥⁥vе bооbѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i like titties",
    Callback = function()
sendMessage("і ӏіkе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "im gonna make you pregnant mommy",
    Callback = function()
sendMessage("іm gоnnа mаkе уоu рrеgnаnt mоmmу", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm sexy, and you know it",
    Callback = function()
sendMessage("і'm ѕеху, аnd уου knοw іt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm horny so moan",
    Callback = function()
sendMessage("і'm һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у ѕο mοаn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm mad horny",
    Callback = function()
sendMessage("і'm mad һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm gonna bang you hard",
    Callback = function()
sendMessage("і'm gοnnа bаng уοu һаrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm so hard rn",
    Callback = function()
sendMessage("і'm ѕо hаrd rn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm so wet daddy",
    Callback = function()
sendMessage("і'm ѕо wеt daddy", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm so wet",
    Callback = function()
sendMessage("і'm ѕо wеt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i'm craving titties",
    Callback = function()
sendMessage("i'mcravingt⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іttіеѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I would like to see some titties",
    Callback = function()
sendMessage("Ι wοuӏd ӏіkе tο ѕее ѕοmе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i wanna kms",
    Callback = function()
sendMessage("і wаnnа kmѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i wanna smash you",
    Callback = function()
sendMessage("і wаnnа ѕmаѕh уоu", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "i want to drink your breasts",
    Callback = function()
sendMessage("і wаnt tо dr⁥⁥⁥⁥⁥іnkуоurbrе⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥ѕtѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I do sexy things",
    Callback = function()
sendMessage("І dо ѕеху thіngѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I banged your girl so hard",
    Callback = function()
sendMessage("І bаngеd уоur gіrl ѕо һаrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I dont give a shit.",
    Callback = function()
sendMessage("I dont give a sһіt.", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I love sex",
    Callback = function()
sendMessage("I love ѕеx", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I'll make you pregnant",
    Callback = function()
sendMessage("І'ӏӏ mаkе уоu рrеgnаnt", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "imagine getting no bitches",
    Callback = function()
sendMessage("imagine getting no bitсһеs", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "kill yourself",
    Callback = function()
sendMessage("kіӏl уоurѕеӏf", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "keep moaning",
    Callback = function()
sendMessage("keep mоаning", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "lets do doggy style",
    Callback = function()
sendMessage("ӏ⁥⁥⁥е⁥⁥⁥t⁥⁥⁥ѕ⁥⁥⁥⁥⁥⁥d⁥⁥⁥о⁥⁥⁥⁥⁥⁥d⁥⁥⁥о⁥⁥⁥g⁥⁥⁥g⁥⁥⁥у⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥t⁥⁥⁥у⁥⁥⁥ӏ⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lets have sex",
    Callback = function()
sendMessage("⁥⁥⁥ӏ⁥⁥⁥е⁥⁥⁥t⁥⁥⁥ѕ ⁥⁥⁥һ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е⁥⁥⁥ ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "let me squish those titties",
    Callback = function()
sendMessage("ӏеt mе ѕqυіѕһ tһοѕе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lgbtq+ is related to autism",
    Callback = function()
sendMessage("Ι⁥⁥⁥g⁥⁥⁥b⁥⁥⁥t⁥⁥⁥q⁥⁥⁥+⁥⁥⁥ ⁥⁥⁥і⁥⁥⁥ѕ⁥⁥⁥ ⁥⁥⁥r⁥⁥⁥е⁥⁥⁥l⁥⁥⁥а⁥⁥⁥t⁥⁥⁥е⁥⁥⁥d t⁥⁥⁥о⁥⁥⁥ а⁥⁥⁥u⁥⁥⁥t⁥⁥⁥і⁥⁥⁥ѕ⁥⁥⁥m", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "lil n-word",
    Callback = function()
sendMessage("ӏ⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥ln⁥⁥⁥⁥⁥⁥⁥⁥і⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀖󠀕g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g󠀕󠀕󠀕󠀕󠀖󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀖󠀕а", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "Mind if you let me squish those titties",
    Callback = function()
sendMessage("Mind if you ӏеt mе ѕqυіѕһ tһοѕе tіttіеs", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "my condom fell off!",
    Callback = function()
sendMessage("mу ⁥⁥⁥с⁥⁥⁥о⁥⁥⁥n⁥⁥⁥d⁥⁥⁥о⁥⁥⁥m fеӏӏ оff!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Mr Breast is so cool",
    Callback = function()
sendMessage("Мr Вrеаѕt іѕ ѕо сооl", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "my cock is dirty",
    Callback = function()
sendMessage("myсо⁥⁥⁥⁥⁥⁥⁥⁥⁥сkisdirty", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "make me pregnant",
    Callback = function()
sendMessage("mаkе mе рrеgnаnt", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "Naked boys",
    Callback = function()
sendMessage("Νаkеd Вοуѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Naked girls",
    Callback = function()
sendMessage("Νаkеd Gіrӏѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "nice tits",
    Callback = function()
sendMessage("nісеt⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥іts", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "oral sex",
    Callback = function()
sendMessage("оrаӏѕех", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "pussy licker",
    Callback = function()
sendMessage("р⁥⁥⁥u⁥⁥⁥⁥s⁥⁥sу ӏi⁥⁥с⁥⁥⁥k⁥⁥е⁥⁥⁥⁥⁥⁥r", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "rape me",
    Callback = function()
sendMessage("rареmе", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "spank me daddy",
    Callback = function()
sendMessage("ѕ⁥⁥⁥р⁥⁥⁥а⁥⁥⁥n⁥⁥⁥k⁥⁥⁥ ⁥⁥⁥m⁥⁥⁥е⁥⁥⁥ ⁥⁥⁥d⁥⁥⁥а⁥⁥⁥d⁥⁥⁥d⁥⁥⁥у", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "sex slave",
    Callback = function()
sendMessage("ѕ⁥⁥⁥е⁥⁥⁥х⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥ӏ⁥⁥⁥а⁥⁥⁥v⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Sweet cock dude",
    Callback = function()
sendMessage("Ѕwееt сосk dudе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "smd hoe",
    Callback = function()
sendMessage("ѕmd һ⁥⁥⁥о⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "suck my cock",
    Callback = function()
sendMessage("ѕ⁥⁥⁥󠀕󠀕u⁥󠀕󠀕с⁥⁥⁥k󠀕m󠀕yс󠀕󠀕о⁥󠀕⁥⁥сk", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Sweet cock you got up there",
    Callback = function()
sendMessage("Ѕwееtсо⁥⁥⁥⁥⁥⁥⁥⁥⁥сkуоugоtuрthеrе", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "shut the fuck up",
    Callback = function()
sendMessage("s󠀕󠀕һ⁥⁥󠀕󠀕⁥⁥⁥⁥u󠀕󠀕tt⁥⁥󠀕󠀕⁥⁥⁥⁥һеf⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥c⁥k󠀕󠀕u⁥⁥⁥⁥⁥⁥⁥⁥⁥р", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Shut yo goofy ass up",
    Callback = function()
sendMessage("S⁥⁥⁥һ⁥⁥⁥ut уоgо⁥⁥⁥о⁥⁥⁥f⁥⁥⁥у а⁥⁥⁥ѕ⁥⁥⁥ѕ u⁥⁥⁥p", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "shut yo broke ass up",
    Callback = function()
sendMessage("shutyobrokeаѕѕup", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "suck my cock retard",
    Callback = function()
sendMessage("ѕuсkmyсосkret⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥аrd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "son of a bitch",
    Callback = function()
sendMessage("sonofab󠀕󠀖󠀗󠀘￰￰󠀕󠀖󠀗󠀘і󠀕󠀖󠀗󠀘󠀕󠀖￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀗󠀘t󠀕￰￰￰￰￰￰￰󠀖󠀗󠀘󠀕󠀖󠀗󠀘с󠀗󠀘󠀗󠀘￰￰￰󠀗󠀘һ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "small penis",
    Callback = function()
sendMessage("small рen⁥⁥⁥⁥⁥⁥⁥⁥iѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("T")

  Tab:AddButton({
    Name = "Theres cum everywhere!",
    Callback = function()
sendMessage("Т⁥⁥⁥h⁥⁥⁥е⁥⁥⁥r⁥⁥⁥е⁥⁥⁥ѕ ⁥⁥⁥с⁥⁥⁥⁥u⁥⁥⁥m⁥⁥⁥ ⁥⁥⁥е⁥⁥⁥v⁥⁥⁥е⁥⁥⁥r⁥⁥⁥у⁥⁥⁥w⁥⁥⁥h⁥⁥⁥е⁥⁥⁥r⁥⁥⁥е⁥⁥⁥!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "that bbc dont play",
    Callback = function()
sendMessage("thаt b⁥⁥⁥b⁥⁥⁥с dоnt рlау", "All")
ResetFilter()
    end
})

 Tab:AddLabel("U")

  Tab:AddButton({
    Name = "ur gf was craving my raging schlong",
    Callback = function()
sendMessage("u⁥⁥⁥r⁥⁥⁥ ⁥⁥⁥g⁥⁥⁥f⁥⁥⁥ ⁥⁥⁥w⁥⁥⁥а⁥⁥⁥ѕ⁥⁥⁥ ⁥⁥⁥с⁥⁥⁥r⁥⁥⁥а⁥⁥⁥v⁥⁥⁥і⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥m⁥⁥⁥у⁥⁥⁥ ⁥⁥⁥r⁥⁥⁥а⁥⁥⁥g⁥⁥⁥і⁥⁥⁥n⁥⁥⁥g⁥⁥⁥ ⁥⁥⁥ѕ⁥⁥⁥с⁥⁥⁥h⁥⁥⁥ӏ⁥⁥⁥о⁥⁥⁥n⁥⁥⁥g", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ur moms booty is delicious",
    Callback = function()
sendMessage("ur mоmѕ bооtу іѕ dеlісіоuѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("W")

  Tab:AddButton({
    Name = "why is this hard-r not getting whipped?",
    Callback = function()
sendMessage("wһ⁥⁥⁥⁥⁥⁥⁥у⁥⁥і⁥⁥ѕtһ⁥⁥⁥⁥⁥⁥⁥іѕn⁥⁥⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥і⁥⁥⁥⁥⁥⁥⁥g⁥⁥⁥⁥⁥⁥⁥g⁥⁥ern⁥⁥⁥⁥⁥⁥⁥оtgе󠀕󠀕󠀕󠀕󠀕󠀕t⁥⁥tі󠀕󠀕󠀕⁥⁥󠀕󠀕󠀕n󠀕⁥⁥󠀕gwһ⁥⁥󠀕󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥ір⁥⁥⁥⁥⁥⁥⁥реd", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "wanna have sex?",
    Callback = function()
sendMessage("wаnnа һаvе s⁥⁥⁥⁥ех?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "wsg bbg you lookin sexy",
    Callback = function()
sendMessage("wѕg bbg уоu lооkіn ѕеху", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "what the fuck",
    Callback = function()
sendMessage("⁥w⁥￰￰⁥һ￰￰￰￰аtt󠀕󠀕󠀕󠀕h⁥⁥e⁥⁥⁥f⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥u󠀖󠀗󠀕󠀖⁥⁥⁥󠀖⁥⁥⁥󠀗󠀕󠀖с󠀖󠀗⁥⁥⁥󠀖󠀖󠀗󠀕󠀖k", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "wanna see some bbc",
    Callback = function()
sendMessage("wаnnа ѕее ѕоmе b⁥⁥⁥b⁥⁥⁥с", "All")
ResetFilter()
    end
})

 Tab:AddLabel("Y")

  Tab:AddButton({
    Name = "you like to rape and suck black oiled up men",
    Callback = function()
sendMessage("уоu lіkе tо rаре аnd ѕuсk blасk оіlеd uр mеn", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "yo my shaft is hard, mind jerking it?",
    Callback = function()
sendMessage("уо mу ѕhаft іѕ һаrd, mіnd јеrkіng іt?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're such a whore",
    Callback = function()
sendMessage("у⁥⁥⁥о⁥⁥⁥u⁥⁥⁥'r⁥⁥⁥е⁥⁥⁥⁥⁥⁥ѕ⁥⁥⁥u⁥⁥⁥с⁥⁥⁥һ⁥⁥⁥⁥⁥⁥а⁥⁥⁥⁥⁥⁥w⁥⁥⁥һ⁥⁥⁥о⁥⁥⁥r⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're a pedophile",
    Callback = function()
sendMessage("у⁥⁥⁥о⁥⁥⁥u⁥⁥⁥'⁥⁥⁥r⁥⁥⁥е⁥⁥⁥ ⁥⁥⁥а⁥⁥⁥ p⁥⁥е⁥⁥⁥d⁥⁥⁥⁥⁥⁥⁥ор⁥⁥hіӏ⁥⁥⁥⁥⁥⁥⁥е", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you pathetic slut",
    Callback = function()
sendMessage("youpatheticsӏut", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're a pussy",
    Callback = function()
sendMessage("уоu'rе а рu⁥⁥⁥ssу", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "you're so sexy",
    Callback = function()
sendMessage("уоu'rе ѕо ѕеху", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Uppercase/Capital A-Z"
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "BE MY WIFE!",
    Callback = function()
sendMessage("ВΕ МΥ WIFΕ!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY LATINAS",
    Callback = function()
sendMessage("ВІG ВООТΥ LАТІΝАЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY ASIANS",
    Callback = function()
sendMessage("ВІG ВООТΥ АЅІАΝЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY FEMBOYS",
    Callback = function()
sendMessage("ВІG ВООТΥ FЕМВОΥЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOTY",
    Callback = function()
sendMessage("ВІG ВООТΥ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "BIG BOOBS",
    Callback = function()
sendMessage("BIG ВООВS", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "CAN I PISS INSIDE YOUR BUTTHOLE",
    Callback = function()
sendMessage("С⁥⁥⁥⁥⁥АN І Р⁥⁥⁥⁥ІЅЅ ІNЅIDE YOU⁥⁥⁥R В⁥⁥⁥U⁥⁥⁥⁥ТТ⁥⁥⁥⁥НOLЕ?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CAN I PISS ON YOU?",
    Callback = function()
sendMessage("С⁥⁥⁥⁥⁥АNІР⁥⁥⁥⁥ІЅЅONYOU?", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "COCK IN BEDROOM",
    Callback = function()
sendMessage("СОСKI⁥⁥⁥NBEDROOM", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUM ON ME",
    Callback = function()
sendMessage("СUМОΝМЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "CUM ON MY FACE",
    Callback = function()
sendMessage("С￰￰￰UМONМΥFА⁥⁥⁥⁥⁥⁥⁥⁥СЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("D")

  Tab:AddButton({
    Name = "DO YOU HAVE TITS?",
    Callback = function()
sendMessage("DО ΥОU НАVЕ Т⁥⁥⁥І⁥⁥⁥Т⁥⁥⁥Ѕ?", "All")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "EAT PUSSY BITCH",
    Callback = function()
sendMessage("EATР⁥⁥⁥U⁥⁥⁥Ѕ⁥⁥⁥Ѕ⁥⁥⁥YВІ⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥TСH", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "FATASS HOE",
    Callback = function()
sendMessage("F⁥⁥⁥АТАЅ⁥⁥Ѕ НОЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FAT ASS",
    Callback = function()
sendMessage("F⁥⁥⁥А⁥⁥⁥ТА⁥⁥⁥Ѕ⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FREE HENTAI",
    Callback = function()
sendMessage("FRЕЕ НЕ⁥⁥⁥⁥Ν⁥ТАӀ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "FUCK YOU",
    Callback = function()
sendMessage("F⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UСΚΥОU", "All")
ResetFilter()
    end
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "HELP! THERE'S A COCK IN MY ASS",
    Callback = function()
sendMessage("H⁥⁥⁥Е⁥⁥⁥L⁥⁥⁥P⁥⁥⁥!⁥⁥⁥ T⁥⁥⁥H⁥⁥⁥Е⁥⁥⁥R⁥⁥⁥Е⁥⁥⁥'⁥⁥⁥S⁥⁥⁥ А⁥⁥⁥ С⁥⁥⁥О⁥⁥⁥C⁥⁥⁥K⁥⁥⁥ I⁥⁥⁥N⁥⁥⁥ М⁥⁥⁥Y⁥⁥⁥ А⁥⁥⁥⁥Ѕ⁥⁥⁥Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "HELP! THERE'S A HOE CHASING ME",
    Callback = function()
sendMessage("НЕLР! ТНЕRЕS А НОЕ СНАSING МЕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("I")

  Tab:AddButton({
    Name = "I AM ABOUT TO CUM",
    Callback = function()
sendMessage("IА󠀕󠀖󠀗МАВ󠀕󠀖󠀗OU￰￰￰TT󠀕󠀖󠀗OС￰󠀕󠀖󠀗󠀕󠀖󠀗￰￰U￰￰￰М", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I EAT PUSSY",
    Callback = function()
sendMessage("Ӏ ЕАТ РUЅЅҮ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I PREFER PUSSY",
    Callback = function()
sendMessage("I⁥⁥⁥⁥⁥⁥⁥⁥ P⁥⁥⁥⁥⁥⁥⁥⁥R⁥⁥⁥⁥⁥⁥⁥⁥E⁥⁥⁥⁥⁥⁥⁥⁥F⁥⁥⁥⁥⁥⁥⁥⁥E⁥⁥⁥⁥⁥⁥⁥⁥R⁥ Р⁥⁥UЅ⁥⁥Ѕ⁥⁥Ү⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I HAVE A MASSIVE COCK",
    Callback = function()
sendMessage("I HAVE A MASSIVE СОСK", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "I HAD AWESOME SEX WITH UR MOM!!!!",
    Callback = function()
sendMessage("I Н⁥⁥⁥А⁥⁥⁥⁥D А⁥⁥⁥W⁥⁥⁥⁥ЕS⁥⁥⁥⁥⁥ОМ⁥⁥⁥Е⁥⁥⁥ S⁥⁥⁥Е⁥⁥⁥⁥Х⁥⁥ W⁥⁥⁥I⁥⁥Т⁥⁥⁥⁥Н U⁥⁥⁥R М⁥⁥⁥⁥⁥О⁥⁥⁥⁥М!!!!", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "ILL MAKE YOU PREGNANT",
    Callback = function()
sendMessage("ILL МΑKΕ ΥОU РRΕGΝΑΝТ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "LET ME SQUICH THOSE TITTIES",
    Callback = function()
sendMessage("LЕТМЕЅQUІЅНТНОЅЕТІТТІЕЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "LETS HAVE SEX",
    Callback = function()
sendMessage("L⁥⁥⁥Е⁥⁥⁥Т⁥⁥⁥Ѕ⁥⁥⁥ ⁥⁥⁥Н⁥⁥⁥А⁥⁥⁥V⁥⁥⁥Е⁥⁥⁥ ⁥⁥⁥Ѕ⁥⁥⁥Е⁥⁥⁥Х", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "LET'S FUCK",
    Callback = function()
sendMessage("LET'SF￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰Κ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "MY CONDOM FELL OFF!",
    Callback = function()
sendMessage("МΥ С⁥⁥⁥О⁥⁥⁥Ν⁥⁥⁥D⁥⁥⁥О⁥⁥⁥М FЕLL ОFF!", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "NAKED GIRLS",
    Callback = function()
sendMessage("ΝΑKΕDGIRLЅ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "NAKED BOYS",
    Callback = function()
sendMessage("ΝАΚЕD ВОΥЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "oh my god, not this DUMBASS",
    Callback = function()
sendMessage("oh my god, not this DUМВ АЅЅ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "PUT YOUR COCK IN MY ASS",
    Callback = function()
sendMessage("РUТΥ￰￰￰ОU￰￰RСО⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥СKINMY А￰￰￰Ѕ￰￰￰Ѕ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "STRAIGHT POWER MOTHERFUCKERS",
    Callback = function()
sendMessage("STRAIGHTPOWERM￰￰￰￰￰O￰￰￰￰￰T￰￰￰￰￰H￰￰￰￰￰E￰￰￰￰￰R￰￰￰￰￰F￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰Κ￰￰￰￰￰￰￰￰E￰￰￰￰￰￰￰RS", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SUCK MY COCK",
    Callback = function()
sendMessage("S󠀕󠀖󠀗UС󠀕󠀖󠀗KМ󠀕󠀖󠀗ΥС󠀕󠀖󠀗O⁥⁥⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖󠀗⁥⁥⁥⁥⁥СK", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT THE FUCK UP",
    Callback = function()
sendMessage("SHUTTHEF￰￰￰￰￰￰UС￰￰￰￰￰￰￰￰ΚUР", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT UP FAGGOT",
    Callback = function()
sendMessage("⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥S󠀕󠀖󠀗󠀕󠀖H⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥UTU⁥⁥PF⁥⁥⁥⁥󠀕󠀖󠀗󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥A⁥⁥G󠀕󠀖󠀗󠀕󠀖󠀗⁥⁥⁥⁥GO⁥⁥T", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT UP CUNT",
    Callback = function()
sendMessage("SHUTUPCU⁥⁥⁥⁥⁥⁥⁥⁥⁥NТ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHUT UP HOE",
    Callback = function()
sendMessage("SНUT UP НОЕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHAKE THAT ASS",
    Callback = function()
sendMessage("ЅHAKEТН⁥⁥⁥⁥⁥⁥⁥⁥АТА￰￰￰Ѕ￰￰￰Ѕ", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SON OF A BITCH",
    Callback = function()
sendMessage("⁥⁥⁥⁥Ѕ⁥⁥⁥⁥O󠀖󠀗⁥⁥⁥⁥⁥⁥⁥󠀘󠀕󠀖NO󠀖⁥⁥⁥⁥󠀗󠀘⁥⁥⁥⁥󠀕󠀖FA󠀗󠀘⁥⁥⁥⁥󠀕󠀖В￰￰⁥⁥⁥⁥￰￰󠀗⁥⁥⁥⁥󠀘󠀕󠀖￰￰￰I￰󠀗󠀘󠀕󠀖⁥⁥⁥⁥￰￰￰￰￰T⁥⁥⁥⁥C󠀗⁥⁥⁥⁥󠀘󠀕󠀖H", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "SHIT NOOOOOOOO",
    Callback = function()
sendMessage("Ѕ⁥⁥⁥⁥Н⁥⁥⁥⁥Ι⁥⁥⁥⁥Т⁥⁥⁥⁥ Ν⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥О⁥⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("Y")

  Tab:AddButton({
    Name = "YOU ARE SO ASS AT THIS GAME",
    Callback = function()
sendMessage("ΥОUАRЕЅО А￰￰￰Ѕ￰￰￰Ѕ АТTHIЅGАМЕ", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "RolePlay",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "RP A-Z"
})

--[[

██████╗░░█████╗░██╗░░░░░███████╗██████╗░██╗░░░░░░█████╗░██╗░░░██╗
██╔══██╗██╔══██╗██║░░░░░██╔════╝██╔══██╗██║░░░░░██╔══██╗╚██╗░██╔╝
██████╔╝██║░░██║██║░░░░░█████╗░░██████╔╝██║░░░░░███████║░╚████╔╝░
██╔══██╗██║░░██║██║░░░░░██╔══╝░░██╔═══╝░██║░░░░░██╔══██║░░╚██╔╝░░
██║░░██║╚█████╔╝███████╗███████╗██║░░░░░███████╗██║░░██║░░░██║░░░
╚═╝░░╚═╝░╚════╝░╚══════╝╚══════╝╚═╝░░░░░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░
--]]

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "аh уеѕ~ *moans* уеѕ һаrdеr~",
    Callback = function()
sendMessage("аh уеѕ~ *m⁥⁥⁥о⁥⁥⁥а⁥⁥⁥n⁥⁥⁥ѕ* уеѕ һаrdеr~", "All")
ResetFilter()
    end
})

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "*bites your cock*",
    Callback = function()
sendMessage("*bіtеѕуоurсосk*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("C")

  Tab:AddButton({
    Name = "*cums*",
    Callback = function()
sendMessage("*⁥⁥⁥⁥󠀕c󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥u⁥⁥⁥⁥⁥m⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥s⁥⁥⁥⁥*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("J")

  Tab:AddButton({
    Name = "*jizzles on your face*",
    Callback = function()
sendMessage("*j⁥⁥⁥⁥⁥⁥iz⁥⁥⁥⁥⁥⁥zе⁥⁥⁥⁥ѕ on your face*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("L")

  Tab:AddButton({
    Name = "*looks under skirt* wow nice balls bro",
    Callback = function()
sendMessage("*ӏооkѕ undеr ѕkіrt* wоw nісе bаlӏѕ brо", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "*masturbates*",
    Callback = function()
sendMessage("*ma⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥st⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀕⁥⁥⁥ur󠀕󠀕b󠀕󠀕a󠀕󠀕t󠀕󠀕e󠀕󠀕s*", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "*moans*",
    Callback = function()
sendMessage("*mоаns*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("N")

  Tab:AddButton({
    Name = "nice balls *slaps them*",
    Callback = function()
sendMessage("*nісеbаӏӏѕ*sӏарstһеm*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "*rapes*",
    Callback = function()
sendMessage("r ареs*", "All")
ResetFilter()
    end
})

 Tab:AddLabel("S")

  Tab:AddButton({
    Name = "*sucks cock*",
    Callback = function()
sendMessage("*ѕuсkѕ сосk*", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "*shits*",
    Callback = function()
sendMessage("*⁥⁥⁥ѕ⁥⁥⁥һ⁥⁥⁥i⁥⁥⁥tѕ*", "All")
ResetFilter()
end
})

local Tab = Window:MakeTab({
    Name = "NSFW Websites",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Not Safe For Work websites"
})

--[[

░██╗░░░░░░░██╗███████╗██████╗░░██████╗██╗████████╗███████╗░██████╗
░██║░░██╗░░██║██╔════╝██╔══██╗██╔════╝██║╚══██╔══╝██╔════╝██╔════╝
░╚██╗████╗██╔╝█████╗░░██████╦╝╚█████╗░██║░░░██║░░░█████╗░░╚█████╗░
░░████╔═████║░██╔══╝░░██╔══██╗░╚═══██╗██║░░░██║░░░██╔══╝░░░╚═══██╗
░░╚██╔╝░╚██╔╝░███████╗██████╦╝██████╔╝██║░░░██║░░░███████╗██████╔╝
░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═════╝░╚═╝░░░╚═╝░░░╚══════╝╚═════╝░
--]]

 Tab:AddLabel("B")

  Tab:AddButton({
    Name = "blacked.com",
    Callback = function()
sendMessage("blacked.c⁥⁥⁥о⁥⁥⁥m", "All")
ResetFilter()
    end
})

 Tab:AddLabel("O")

  Tab:AddButton({
    Name = "onlyfans.com",
    Callback = function()
sendMessage("оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P")

  Tab:AddButton({
    Name = "pornhub.com",
    Callback = function()
sendMessage("р⁥⁥⁥о⁥⁥⁥r⁥⁥⁥n⁥⁥⁥һ⁥⁥⁥u⁥⁥⁥b.c⁥⁥⁥о⁥⁥⁥m", "All")
ResetFilter()
    end
})

 Tab:AddLabel("R")

  Tab:AddButton({
    Name = "rule34.xxx",
    Callback = function()
sendMessage("r⁥⁥⁥u⁥⁥⁥ӏ⁥⁥⁥е3⁥⁥⁥4.ххх", "All")
ResetFilter()
    end
})

 Tab:AddLabel("E")

  Tab:AddButton({
    Name = "e621.net",
    Callback = function()
sendMessage("е⁥⁥⁥6⁥⁥⁥2⁥⁥⁥1⁥⁥⁥.n⁥⁥⁥е⁥⁥⁥t", "All")
ResetFilter()
    end
})

 Tab:AddLabel("X")

  Tab:AddButton({
    Name = "xvideos.com",
    Callback = function()
sendMessage("х󠀗󠀕󠀕󠀕󠀕󠀕󠀖󠀖󠀗vid⁥⁥⁥⁥е⁥⁥⁥⁥o󠀗󠀕󠀕󠀕󠀕ѕ.с⁥⁥⁥⁥om", "All")
ResetFilter()
    end
})

 Tab:AddLabel("P (Capitals)")

  Tab:AddButton({
    Name = "PORNHUB.COM",
    Callback = function()
sendMessage("Р⁥⁥⁥О⁥⁥⁥R⁥⁥⁥Ν⁥⁥⁥Н⁥⁥⁥U⁥⁥⁥В.С⁥⁥⁥О⁥⁥⁥М⁥⁥⁥", "All")
ResetFilter()
    end
})

 Tab:AddLabel("X (Capitals)")

  Tab:AddButton({
    Name = "XVIDEOS.COM",
    Callback = function()
sendMessage("Х󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥󠀕󠀕󠀕󠀖󠀕VӀ⁥⁥⁥⁥⁥⁥D⁥⁥⁥󠀕󠀕󠀕Е⁥⁥⁥󠀕󠀕󠀕ОЅ.С⁥⁥⁥󠀕󠀕󠀕ОМ", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Full Links"
})

 Tab:AddLabel("H")

  Tab:AddButton({
    Name = "https://blacked.com",
    Callback = function()
sendMessage("httрs:/⁥⁥⁥/blacked.c⁥⁥⁥о⁥⁥⁥m", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "https://onlyfans.com",
    Callback = function()
sendMessage("ht⁥t⁥⁥рѕ⁥⁥:/⁥⁥/оn󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕ӏуf󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰аn￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰ѕ.сom", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "https://pornhub.com",
    Callback = function()
sendMessage("ht󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗tps󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗:/󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗/⁥⁥⁥p󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗or󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗nh󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗ub󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗.󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗c󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗󠀘󠀕󠀖󠀗om", "All")
ResetFilter()
    end
})

 Tab:AddLabel("M")

  Tab:AddButton({
    Name = "MASTURBATING TO HTTPS://PORNHUB.COM",
    Callback = function()
sendMessage("МА⁥⁥⁥󠀕󠀖⁥Ѕ⁥⁥⁥󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥⁥Т⁥⁥⁥󠀕󠀖⁥UR⁥ВАТӀΝGTOHТ󠀕󠀕󠀕󠀕ТРЅ󠀕󠀕󠀕󠀕:/⁥⁥⁥/РО󠀕󠀕RΝ󠀕󠀕НU⁥⁥⁥⁥В.C⁥⁥⁥OM", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "NOT LEGIT",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Not Legit A-Z"
})

--[[

███╗░░██╗░█████╗░████████╗  ██╗░░░░░███████╗░██████╗░██╗████████╗
████╗░██║██╔══██╗╚══██╔══╝  ██║░░░░░██╔════╝██╔════╝░██║╚══██╔══╝
██╔██╗██║██║░░██║░░░██║░░░  ██║░░░░░█████╗░░██║░░██╗░██║░░░██║░░░
██║╚████║██║░░██║░░░██║░░░  ██║░░░░░██╔══╝░░██║░░╚██╗██║░░░██║░░░
██║░╚███║╚█████╔╝░░░██║░░░  ███████╗███████╗╚██████╔╝██║░░░██║░░░
╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░  ╚══════╝╚══════╝░╚═════╝░╚═╝░░░╚═╝░░░
--]]

Tab:AddParagraph("Note","'NOT LEGIT' on this script means that the bypasses DON'T look like it was said normally")

 Tab:AddLabel("A")

  Tab:AddButton({
    Name = "a hard r",
    Callback = function()
sendMessage("󠀕󠀕п⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥і󠀕g⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥g󠀕󠀕e󠀕󠀕󠀕󠀕󠀕⁥⁥⁥⁥⁥⁥⁥⁥⁥⁥г", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "a lil n word",
    Callback = function()
sendMessage("n⁥iɡ⁥ɡ⁥а", "All")
ResetFilter()
    end
})

 Tab:AddLabel("F")

  Tab:AddButton({
    Name = "faggot",
    Callback = function()
sendMessage("󠀕￰￰￰￰￰￰󠀕￰￰￰￰󠀕f󠀕￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰￰￰￰󠀕󠀕󠀕󠀕󠀕￰￰￰󠀕⁥а￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕⁥ġ￰󠀕󠀕󠀕￰￰￰￰￰￰￰￰󠀕󠀕￰￰󠀕⁥ġ￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰󠀕￰￰￰￰￰￰￰￰￰󠀕󠀕о󠀕󠀕󠀕￰￰￰￰￰￰￰￰￰￰￰￰￰￰￰󠀕󠀕󠀕t￰￰￰", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "fuck",
    Callback = function()
sendMessage("f￰￰￰￰￰󠀕󠀕￰￰￰￰￰ụç󠀕󠀕ķ", "All")
ResetFilter()
    end
})

 Tab:AddLabel("K")

  Tab:AddButton({
    Name = "KKK",
    Callback = function()
sendMessage("ККК", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "KYS BITCH",
    Callback = function()
sendMessage("К⁥⁥⁥⁥⁥⁥⁥⁥Υ⁥⁥⁥SВ￰￰￰￰￰￰￰I￰￰￰￰￰￰Т￰￰￰￰￰￰СН", "All")
ResetFilter()
    end
})

local Tab = Window:MakeTab({
    Name = "Games",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--[[

░██████╗░░█████╗░███╗░░░███╗███████╗░██████╗
██╔════╝░██╔══██╗████╗░████║██╔════╝██╔════╝
██║░░██╗░███████║██╔████╔██║█████╗░░╚█████╗░
██║░░╚██╗██╔══██║██║╚██╔╝██║██╔══╝░░░╚═══██╗
╚██████╔╝██║░░██║██║░╚═╝░██║███████╗██████╔╝
░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝╚══════╝╚═════╝░
--]]

local Section = Tab:AddSection({
    Name = "Rate My Avatar (A-Z)"
})
 Tab:AddLabel("Change Booth's text")

  Tab:AddButton({
    Name = "blowjob",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="bӏow⁥⁥⁥j⁥⁥⁥о⁥⁥⁥b⁥⁥⁥",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "horny",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="һ⁥⁥⁥⁥⁥о󠀕󠀕󠀕󠀕r⁥⁥⁥⁥⁥n⁥⁥⁥⁥⁥у",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "penis",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="pen󠀕󠀖󠀗󠀘󠀕󠀖⁥⁥⁥⁥⁥⁥⁥⁥󠀕і󠀖󠀗󠀘󠀖󠀗ѕ",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "suck my cock",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="ѕ⁥⁥⁥󠀕󠀕u⁥󠀕󠀕с⁥⁥⁥k󠀕m󠀕yс󠀕󠀕о⁥󠀕⁥⁥сk",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})

  Tab:AddButton({
    Name = "E-Sex",
    Callback = function()
			local k={[1]="Update",[2]={["DescriptionText"]="Е￰￰￰-￰￰￰Ѕ￰￰￰е￰￰￰х",["ImageId"]=0}}
			game:GetService("ReplicatedStorage").CustomiseBooth:FireServer(unpack(k))
    end
})


local Tab = Window:MakeTab({
    Name = "Misc",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

--[[

███╗░░░███╗██╗░██████╗░█████╗░
████╗░████║██║██╔════╝██╔══██╗
██╔████╔██║██║╚█████╗░██║░░╚═╝
██║╚██╔╝██║██║░╚═══██╗██║░░██╗
██║░╚═╝░██║██║██████╔╝╚█████╔╝
╚═╝░░░░░╚═╝╚═╝╚═════╝░░╚════╝░
--]]

local Section = Tab:AddSection({
    Name = "Chat"
})

  Tab:AddButton({
    Name = "Chat a huge annoying blank text chat bubble",
    Callback = function()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("                                                                                                                                                                                                       ⁥", "All")
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Chat a long annoying blank text chat bubble",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/WPHVj8Lj"))()
ResetFilter()
    end
})

  Tab:AddButton({
    Name = "Chat our dsc link",
    Callback = function()
game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("httрs:/⁥⁥⁥/dѕс⁥⁥⁥.⁥⁥⁥g⁥⁥⁥g/⁥⁥⁥vadriftz", "All")
ResetFilter()
    end
})

local Section = Tab:AddSection({
    Name = "Chat Spammer"
})

local ChatSpamText = ""
local SpamCoroutine
local IsChatSpamming = false
local SpamInterval = 1 -- Default interval in seconds

Tab:AddTextbox({
    Name = "Enter spam text",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        ChatSpamText = Value
    end
})

Tab:AddSlider({
    Name = "Spam Interval (seconds)",
    Min = 0.1,
    Max = 5,
    Default = 1,
    Color = Color3.fromRGB(128, 64, 255), -- Purple color
    Increment = 0.1,
    ValueName = "seconds",
    Callback = function(Value)
        SpamInterval = Value
    end
})

Tab:AddButton({
    Name = "Start Chat Spam",
    Callback = function()
        IsChatSpamming = true
        SpamCoroutine = coroutine.create(function()
            while IsChatSpamming do
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ChatSpamText, "All")
                wait(SpamInterval)
                ResetFilter()
            end
        end)
        coroutine.resume(SpamCoroutine)
    end
})

Tab:AddButton({
    Name = "Stop Chat Spam",
    Callback = function()
        IsChatSpamming = false
    end
})

local Section = Tab:AddSection({
    Name = "Teleporter"
})

Section:AddTextbox({
    Name = "Player Name",
    Default = "",
    TextDisappear = true,
    Callback = function(value)
        playerName = value
    end
})

local function teleportToPlayer(targetPlayer)
    local localPlayer = game.Players.LocalPlayer
    if localPlayer and targetPlayer then
        local character = localPlayer.Character
        local targetCharacter = targetPlayer.Character
        if character and targetCharacter then
            character:MoveTo(targetCharacter.PrimaryPart.Position)
        end
    end
end

local function findPlayer(name)
    local lowerName = string.lower(name)
    for _, player in ipairs(game.Players:GetPlayers()) do
        if string.find(string.lower(player.Name), lowerName) or string.find(string.lower(player.DisplayName), lowerName) then
            return player
        end
    end
    return nil
end

Section:AddButton({
    Name = "Teleport",
    Callback = function()
        local targetPlayer = findPlayer(playerName)
        if targetPlayer then
            teleportToPlayer(targetPlayer)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Player not found!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    end
})

local Section = Tab:AddSection({
    Name = "Player Scripts"
})

local infiniteJumpEnabled = false
local infiniteJumpConnection

local noclipEnabled = false
local Noclip = nil
local Clip = nil
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function noclip()
    Clip = false
    local function Nocl()
        if Clip == false and character ~= nil then
            for _,v in pairs(character:GetDescendants()) do
                if v:IsA('BasePart') and v.CanCollide then
                    v.CanCollide = false
                end
            end
        end
        wait(0.21)
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

local function clip()
    if Noclip then Noclip:Disconnect() end
    Clip = true
end

local function toggleNoclip(state)
    noclipEnabled = state
    if noclipEnabled then
        noclip()
    else
        clip()
    end
end

Tab:AddToggle({
  Name = "Noclip",
  Default = false,
  Callback = function(state)
      toggleNoclip(state)
  end    
})

Tab:AddToggle({
    Name = "Infinite Jump",
    Default = false,
    Callback = function(Value)
        infiniteJumpEnabled = Value

        if infiniteJumpEnabled then
            local plr = game:GetService('Players').LocalPlayer
            local m = plr:GetMouse()

            infiniteJumpConnection = m.KeyDown:Connect(function(k)
                if k:byte() == 32 then
                    local humanoid = plr.Character:FindFirstChildOfClass('Humanoid')
                    if humanoid then
                        humanoid:ChangeState('Jumping')
                        wait()
                        humanoid:ChangeState('Seated')
                    end
                end
            end)
        else
            if infiniteJumpConnection then
                infiniteJumpConnection:Disconnect()
                infiniteJumpConnection = nil
            end
        end
    end
})

local defaultWalkSpeed = game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed
local defaultJumpPower = game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower

Tab:AddSlider({
  Name = "WalkSpeed",
  Min = 1,
  Max = 350,
  Default = defaultWalkSpeed,
  Color = Color3.fromRGB(128, 64, 255), -- Purple color
  Increment = 1,
  ValueName = "Speed",
  Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
  end    
})

Tab:AddSlider({
  Name = "JumpPower",
  Min = 1,
  Max = 350,
  Default = defaultJumpPower,
  Color = Color3.fromRGB(128, 64, 255), -- Purple color
  Increment = 1,
  ValueName = "JumpPower",
  Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
  end    
})

getgenv().esp = false
getgenv().teamcheck = false
getgenv().Color = Color3.fromRGB(255, 0, 0)
Tab:AddToggle({
	Name = "ESP",
	Default = false,
	Callback = function(Value)
		getgenv().esp = Value
		spawn(function()
		while wait() do
		    if not getgenv().esp then
		          for i,v in pairs(game.Players:GetChildren()) do
		              if v.Character and v.Character:FindFirstChild("Highlight") then
		                  local Highlight = v.Character:FindFirstChild("Highlight")
		                  Highlight.Enabled = false
    		      end
		      end 
		      else
		          for i,v in pairs(game.Players:GetChildren()) do
		             if getgenv().teamcheck == true then
		               if v.Character and v ~= game.Players.LocalPlayer and v.TeamColor ~= game.Players.LocalPlayer.TeamColor then
    		                 if v.Character:FindFirstChild("Highlight") then
    		                 local Highlight = v.Character:FindFirstChild("Highlight") 
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		                 else
    		                 local Highlight = Instance.new("Highlight",v.Character)
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		              end       
    		           end  
		                if v.TeamColor == game.Players.LocalPlayer.TeamColor then
    		              if v.Character and v.Character:FindFirstChild("Highlight") then
    		                  local Highlight = v.Character:FindFirstChild("Highlight")
        		              Highlight.Enabled = false
        		          end    
    		            end 
    		          else
    		              if v.Character and v ~= game.Players.LocalPlayer then
    		                 if v.Character:FindFirstChild("Highlight") then
    		                 local Highlight = v.Character:FindFirstChild("Highlight") 
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		                 else
    		                 local Highlight = Instance.new("Highlight",v.Character)
    		                 Highlight.Enabled = true
    		                 Highlight.FillColor = getgenv().Color
    		                 Highlight.Adornee = v.Character
    		              end       
    		           end    
		            end       
		      end    
		    end  
		end    
		end)
	end    
})

Tab:AddColorpicker({
	Name = "Esp Color",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		getgenv().Color = Value
	end	  
})

Tab:AddToggle({
	Name = "Teamcheck",
	Default = false,
	Callback = function(Value)
		getgenv().teamcheck = Value
	end    
})

local Section = Tab:AddSection({
    Name = "Admin"
})

  Tab:AddButton({
    Name = "Infinite yield",
    Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

  Tab:AddButton({
    Name = "Nameless Admin",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))();
    end
})

Tab:AddParagraph("Hello :)","its The End, for now..")

OrionLib:Init()
end
loadScript()

OrionLib:Init()
end

local UserInputService = game:GetService("UserInputService")

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    runMobileScript()
else
    runPCScript()
end
