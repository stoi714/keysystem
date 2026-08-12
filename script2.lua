--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script
    Author: OYB
    YouTube: https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ
    
    [ TERMS AND CONDITIONS ]
    - You ARE allowed to use and modify this script for your own games.
    - You ARE NOT allowed to re-upload, redistribute, or claim 
      ownership of this script.
    - Removing or altering these credits is strictly prohibited.
    
    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]
local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 29606, -- Your PlatoBoost Service ID
    PlatoSecret     = "835def0d-9000-4e10-acd1-068d853a19e3", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "PopRock", -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://loot-link.com/s?U5YtD0Uu", -- The raw URL of your main script
    
    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = false,
    DiscordURL      = "https://discord.gg/kT55J724BK",
    
    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com/oyb0i/",
    
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ",

    -- [5] File System
    KeyFileName     = "Mykey.txt", -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = "anything", -- Name of the old GUI to destroy if it's already open
    MainGuiName     = "anything", -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = "Aqua Wave", -- The main title shown at the top of the GUI
    HubDescription  = "Get key first" -- The text shown below the title
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true -- Hidden from Config to avoid user confusion, but active for security

-- Safe request function for universal executor support
local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request )
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and response then return response else return nil, "Connection Error" end
end

local fSetClipboard = setclipboard or toclipboard or function() end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"

-- Check server connectivity
local function checkConnectivity( )
    local response = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
    end
end
checkConnectivity( )

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

-- Get player's key link
local function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

-- Verify key on input
local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    if writefile then writefile(Config.KeyFileName, key) end
                    return true, "Success" 
                end
                return false, "Integrity Check Failed"
            end
            if writefile then writefile(Config.KeyFileName, key) end
            return true, "Success"
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    -- Destroy old GUI if it exists
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    -- Set secret global variable to bypass main script protection
    _G[Config.Secret] = true 
    
    -- Execute main script
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

local function CreateGUI()
    local player = game:GetService("Players").LocalPlayer
    local coreGui = game:GetService("CoreGui")
    local targetParent = pcall(function() return coreGui end) and coreGui or player:WaitForChild("PlayerGui")
    
    if targetParent:FindFirstChild("OYB_KeySystem") then targetParent.OYB_KeySystem:Destroy() end

    local ScreenGui = Instance.new("ScreenGui", targetParent)
    ScreenGui.Name = "OYB_KeySystem"
    ScreenGui.ResetOnSpawn = false

    local MainFrame = Instance.new("Frame", ScreenGui)
    MainFrame.Size = UDim2.new(0, 340, 0, 420)
    MainFrame.Position = UDim2.new(0.5, -170, 0.5, -210)
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.Active = true;
    MainFrame.Draggable = true
    Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 15)
    
    local mainStroke = Instance.new("UIStroke", MainFrame)
    mainStroke.Thickness = 2;
    mainStroke.Color = Color3.fromRGB(40, 40, 40)

    -- Close Button
    local CloseBtn = Instance.new("TextButton", MainFrame)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -35, 0, 10)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(255, 50, 50)
    CloseBtn.Font = Enum.Font.GothamBold
    CloseBtn.TextSize = 18
    CloseBtn.ZIndex = 10
    CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

    local Title = Instance.new("TextLabel", MainFrame)
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = Config.HubName
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.Font = Enum.Font.GothamBold;
    Title.TextSize = 16
    Instance.new("UICorner", Title).CornerRadius = UDim.new(0, 15)

    local PromoText = Instance.new("TextLabel", MainFrame)
    PromoText.Size = UDim2.new(0.9, 0, 0, 50)
    PromoText.Position = UDim2.new(0.05, 0, 0, 50)
    PromoText.BackgroundTransparency = 1
    PromoText.Text = Config.HubDescription
    PromoText.TextColor3 = Color3.fromRGB(0, 170, 255)
    PromoText.Font = Enum.Font.GothamBold;
    PromoText.TextSize = 14
    PromoText.TextWrapped = true

    -- Rainbow Stroke Function
    local function AddRainbowStroke(parent)
        local stroke = Instance.new("UIStroke", parent)
        stroke.Thickness = 2
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        task.spawn(function()
            while task.wait() do
                local hue = tick() % 5 / 5
                stroke.Color = Color3.fromHSV(hue, 1, 1)
            end
        end)
    end

    -- Dynamic Positioning for elements
    local currentYOffset = 105

    -- Discord Button
    if Config.ShowDiscord then
        local DiscordBtn = Instance.new("TextButton", MainFrame)
        DiscordBtn.Size = UDim2.new(0.85, 0, 0, 35)
        DiscordBtn.Position = UDim2.new(0.075, 0, 0, currentYOffset)
        DiscordBtn.Text = "      JOIN DISCORD"
        DiscordBtn.Font = "GothamBold";
        DiscordBtn.TextSize = 14
        DiscordBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
        DiscordBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", DiscordBtn)
        AddRainbowStroke(DiscordBtn)

        local DiscordIcon = Instance.new("ImageLabel", DiscordBtn)
        DiscordIcon.Size = UDim2.new(0, 20, 0, 20)
        DiscordIcon.Position = UDim2.new(0.1, 0, 0.5, -10)
        DiscordIcon.BackgroundTransparency = 1
        DiscordIcon.Image = "rbxassetid://18505728201"
        
        DiscordBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.DiscordURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then 
                Status.Text = "Discord Link Copied!"
                Status.TextColor3 = Color3.fromRGB(88, 101, 242)
            end
            -- Auto-extract invite code from config URL
            local inviteCode = string.match(Config.DiscordURL, "discord%.gg/([%w-]+)")
            if syn and syn.request and inviteCode then
                syn.request({Url = "http://localhost:1111/discord?invite=" .. inviteCode, Method = "GET"})
            end
        end)
        
        currentYOffset = currentYOffset + 45
    end

    -- Instagram Button
    if Config.ShowInstagram then
        local InstaBtn = Instance.new("TextButton", MainFrame)
        InstaBtn.Size = UDim2.new(0.85, 0, 0, 35)
        InstaBtn.Position = UDim2.new(0.075, 0, 0, currentYOffset)
        InstaBtn.Text = "      FOLLOW INSTAGRAM"
        InstaBtn.Font = "GothamBold";
        InstaBtn.TextSize = 14
        InstaBtn.BackgroundColor3 = Color3.fromRGB(225, 48, 108)
        InstaBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", InstaBtn)
        AddRainbowStroke(InstaBtn)

        local InstaIcon = Instance.new("ImageLabel", InstaBtn)
        InstaIcon.Size = UDim2.new(0, 20, 0, 20)
        InstaIcon.Position = UDim2.new(0.1, 0, 0.5, -10)
        InstaIcon.BackgroundTransparency = 1
        InstaIcon.Image = "rbxassetid://18355586382"
        
        InstaBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.InstagramURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then 
                Status.Text = "Instagram Link Copied!"
                Status.TextColor3 = Color3.fromRGB(225, 48, 108)
            end
        end)
        
        currentYOffset = currentYOffset + 45
    end

    -- YouTube Button
    if Config.ShowYoutube then
        local YTBtn = Instance.new("TextButton", MainFrame)
        YTBtn.Size = UDim2.new(0.85, 0, 0, 35)
        YTBtn.Position = UDim2.new(0.075, 0, 0, currentYOffset)
        YTBtn.Text = "      SUBSCRIBE YOUTUBE"
        YTBtn.Font = "GothamBold";
        YTBtn.TextSize = 14
        YTBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        YTBtn.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", YTBtn)
        AddRainbowStroke(YTBtn)

        local YTIcon = Instance.new("ImageLabel", YTBtn)
        YTIcon.Size = UDim2.new(0, 20, 0, 20)
        YTIcon.Position = UDim2.new(0.1, 0, 0.5, -10)
        YTIcon.BackgroundTransparency = 1
        YTIcon.Image = "rbxassetid://82532989017804"
        
        YTBtn.MouseButton1Click:Connect(function()
            fSetClipboard(Config.YoutubeURL)
            local Status = MainFrame:FindFirstChild("StatusLabel")
            if Status then
                Status.Text = "YouTube Link Copied!"
                Status.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end)
        
        currentYOffset = currentYOffset + 45
    end

    -- Key Input Box
    local KeyInput = Instance.new("TextBox", MainFrame)
    KeyInput.Size = UDim2.new(0.85, 0, 0, 40)
    KeyInput.Position = UDim2.new(0.075, 0, 0, currentYOffset + 15)
    KeyInput.PlaceholderText = "Enter Key..."
    KeyInput.Text = ""
    KeyInput.Font = Enum.Font.GothamSemibold;
    KeyInput.TextSize = 14
    KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
    KeyInput.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", KeyInput)

    local VerifyBtn = Instance.new("TextButton", MainFrame)
    VerifyBtn.Size = UDim2.new(0.4, 0, 0, 40)
    VerifyBtn.Position = UDim2.new(0.075, 0, 0, currentYOffset + 65)
    VerifyBtn.Text = "VERIFY"
    VerifyBtn.Font = "GothamBold";
    VerifyBtn.TextSize = 14
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255);
    VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", VerifyBtn)

    local GetKeyBtn = Instance.new("TextButton", MainFrame)
    GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 40)
    GetKeyBtn.Position = UDim2.new(0.525, 0, 0, currentYOffset + 65)
    GetKeyBtn.Text = "GET KEY"
    GetKeyBtn.Font = "GothamBold";
    GetKeyBtn.TextSize = 14
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
    GetKeyBtn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", GetKeyBtn)

    local Status = Instance.new("TextLabel", MainFrame)
    Status.Name = "StatusLabel"
    Status.Size = UDim2.new(1, 0, 0, 30)
    Status.Position = UDim2.new(0, 0, 0, currentYOffset + 115)
    Status.BackgroundTransparency = 1
    Status.Text = "Waiting for input..."
    Status.TextColor3 = Color3.fromRGB(150, 150, 150)
    Status.Font = Enum.Font.Gotham;
    Status.TextSize = 12
    
    -- Dynamically adjust main frame height based on active elements
    MainFrame.Size = UDim2.new(0, 340, 0, currentYOffset + 160)

    -- Logic
    VerifyBtn.MouseButton1Click:Connect(function()
        local key = KeyInput.Text
        if key == "" then Status.Text = "Enter a key!"; return end
        Status.Text = "Verifying..."
        local success, msg = redeemKey(key)
        if success then
            Status.Text = "Success! Loading..."
            Status.TextColor3 = Color3.fromRGB(0, 255, 100)
            task.wait(0.5)
            ScreenGui:Destroy()
            StartMainScript()
        else
            Status.Text = msg
            Status.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)


--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script
    Author: OYB
    YouTube: https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ
    
    [ TERMS AND CONDITIONS ]
    - You ARE allowed to use and modify this script for your own games.
    - You ARE NOT allowed to re-upload, redistribute, or claim 
      ownership of this script.
    - Removing or altering these credits is strictly prohibited.
    
    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]

-- ⚠️ IMPORTANT: Put this code at the VERY TOP of your Main Script (before obfuscating) ⚠️

local ProtectionConfig = {
    -- 🔴 CRITICAL: This MUST exactly match the 'Secret' value in your Key System's Config!
    -- If your Key System has: Secret = "Test"
    -- Then this must also be: SecretKey = "Test"
    SecretKey = "PopRock",
    
    -- The name of your Hub (shown in the kick message if they try to bypass)
    HubName = "Aqua Wave"
}

-- Anti-Bypass Logic: Checks if the Key System successfully set the global variable
if not _G[ProtectionConfig.SecretKey] then
    local player = game:GetService("Players").LocalPlayer
    if player then
        player:Kick("\n🛡️ Unauthorized Execution 🛡️\n\nPlease use the official Key System to run " .. ProtectionConfig.HubName)
    end
    return -- Stops the rest of the script from loading!
end

-------------------------------------------------------------------------------
-- 👇 YOUR MAIN SCRIPT CODE STARTS HERE 👇
-------------------------------------------------------------------------------

print(ProtectionConfig.HubName .. " Loaded Successfully!")


--[[
    ╔═══════════════════════════════════════════════════════════════╗
    ║          🌊  AQUA WAVE v2.12 —  Piggy ESP Hub    🌊          ║
    ║                                                               ║
    ║   Ultra-minimal ESP • Inventory tracking • Below-feet tags    ║
    ║   Movement (Fly/Noclip/Speed) • Exploits (TP)                 ║
    ║   Keybind: RightControl or Insert to toggle                   ║
    ╚═══════════════════════════════════════════════════════════════╝
--]]

-- Re-execution safety: shut down any previous instance of this script.
-- Old ESP tags, loops (Fly/Noclip) and UI are cleared before
-- the new instance starts.
local AQUA_GEN = (_G.AquaWaveGEN or 0) + 1
_G.AquaWaveGEN = AQUA_GEN

if _G.AquaWaveESP then
    _G.AquaWaveESP.Kill()
end

---------------------------------------------------------------
-- Services
---------------------------------------------------------------
local Players           = game:GetService("Players")
local UserInputService  = game:GetService("UserInputService")
local Workspace         = game:GetService("Workspace")
local RunService        = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

---------------------------------------------------------------
-- Theme
---------------------------------------------------------------
local T = {
    BG       = Color3.fromRGB(15, 23, 42),
    BG2      = Color3.fromRGB(22, 33, 62),
    Accent   = Color3.fromRGB(56, 189, 248),
    AccGlow  = Color3.fromRGB(100, 210, 255),
    White    = Color3.fromRGB(255, 255, 255),
    Dim      = Color3.fromRGB(140, 160, 185),
    TogOn    = Color3.fromRGB(56, 189, 248),
    TogOff   = Color3.fromRGB(50, 58, 78),
    Red      = Color3.fromRGB(220, 60, 60),
    RedGlow  = Color3.fromRGB(255, 90, 90),
    Green    = Color3.fromRGB(80, 220, 140),
    GreenDim = Color3.fromRGB(50, 180, 110),
    Shadow   = Color3.fromRGB(6, 10, 20),
    Gold     = Color3.fromRGB(255, 200, 60),
    Wave1    = Color3.fromRGB(30, 100, 170),
    Wave2    = Color3.fromRGB(45, 155, 220),
    Wave3    = Color3.fromRGB(56, 189, 248),
}

---------------------------------------------------------------
-- State & tracking tables
---------------------------------------------------------------
local STATE = {
    guiVisible = true,
    itemESP = false, piggyESP = false, playerESP = false,
    fly = false, noclip = false, walkSpeed = 16, flySpeed = 60, infiniteJump = false, speedOn = false,
    noCrouchSlow = false,
    keybind = Enum.KeyCode.RightControl,
    rebinding = false,
}
local itemESP, piggyESP, playerESP = {}, {}, {}
local tpButtons = {}
local tpList = nil
local running = true

---------------------------------------------------------------
-- Body / ignore sets for held-item detection
---------------------------------------------------------------
local BODY = {}
for _, n in {
    "HumanoidRootPart","Head","Torso","UpperTorso","LowerTorso",
    "LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm",
    "RightLowerArm","RightHand","LeftUpperLeg","LeftLowerLeg",
    "LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot",
    "Left Arm","Right Arm","Left Leg","Right Leg","CrouchBlocker","Handle",
} do BODY[n] = true end

local SKIP_CLASS = {}
for _, c in {
    "Humanoid","Shirt","Pants","BodyColors","Script","LocalScript",
    "Accessory","Animator","Status","NumberValue","StringValue",
    "BoolValue","Animation","CharacterMesh","ShirtGraphic",
    "WrapTarget","Attachment","Motor6D","AnimationConstraint",
    "BallSocketConstraint","NoCollisionConstraint","Sound",
    "Vector3Value","HumanoidDescription","Folder","ForceField",
    "BindableEvent","BindableFunction","RemoteEvent","RemoteFunction",
} do SKIP_CLASS[c] = true end

---------------------------------------------------------------
-- Utility
---------------------------------------------------------------
local function getPos(inst)
    if inst:IsA("BasePart") then return inst.Position end
    if inst:IsA("Model") then
        local p = inst.PrimaryPart or inst:FindFirstChildWhichIsA("BasePart")
        return p and p.Position
    end
    return nil
end

local function rootPart()
    local c = LocalPlayer.Character
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function dist(pos)
    local r = rootPart()
    return r and math.floor((r.Position - pos).Magnitude + 0.5) or 0
end

---------------------------------------------------------------
-- Piggy detection
---------------------------------------------------------------
local function isPiggy(model)
    return model:FindFirstChild("Enemy")
        or model:FindFirstChild("PiggyHead")
        or model:FindFirstChild("PlayerMainScript")
        or model:FindFirstChild("BotMainScript")
        or model.Name == "Piggy"
        or model.Name:match("Piggy")
        or model.Name:match("Bot")
        or (model:FindFirstChildOfClass("Humanoid") and model:FindFirstChildOfClass("Humanoid").MaxHealth == math.huge)
end

local function findPiggies()
    local r = {}
    for _, p in Players:GetPlayers() do
        if p ~= LocalPlayer and p.Character and isPiggy(p.Character) then
            table.insert(r, p.Character)
        end
    end
    local npc = Workspace:FindFirstChild("PiggyNPC")
    if npc then
        for _, c in npc:GetChildren() do
            if c:IsA("Model") and c:FindFirstChildOfClass("Humanoid") then table.insert(r, c) end
        end
    end
    for _, c in Workspace:GetChildren() do
        if c:IsA("Model") and (c.Name == "Piggy" or c.Name:match("Piggy")) and c:FindFirstChildOfClass("Humanoid") then
            local dup = false
            for _, x in r do if x == c then dup = true; break end end
            if not dup then table.insert(r, c) end
        end
    end
    for _, folder in Workspace:GetChildren() do
        if folder:IsA("Folder") and folder.Name:match("^-?%d+$") then
            for _, c in folder:GetChildren() do
                if c:IsA("Model") and c:FindFirstChildOfClass("Humanoid") and isPiggy(c) then
                    local dup = false
                    for _, x in r do if x == c then dup = true; break end end
                    if not dup then table.insert(r, c) end
                end
            end
        end
    end
    return r
end

---------------------------------------------------------------
-- Find map items (with readable display names)
---------------------------------------------------------------
local MESH_NAME = {
    ["456878024"] = "Key",
    ["577111754"] = "Grass",
    ["16884681"] = "Wrench",
    ["725833400"] = "Ammo",
    ["4687178936"] = "Coin",
    ["15886761"] = "Crossbow",
    ["72012879"] = "Gun",
    ["21426303"] = "Crowbar",
    ["741743576"] = "Grenade",
    ["60791940"] = "Blueprint",
    ["454339856"] = "Hammer",
    ["365079116"] = "Syringe",
    ["648208345"] = "Mallet",
    ["83842580"] = "Skillet",
}
local SKIP_ITEM = {
    DefaultTrap = true, MainDoor = true, FrontDoor = true,
    Door = true, BlueDoor = true, OrangeDoor = true,
    Panel = true, VendingPart = true, VentPart = true,
    InsertPart = true, BlueprintItem = true, TPPart = true,
    SGPart = true, HumanoidRootPart = true, KeyCodePart = true,
}
local SKIP_PAT = {
    "^Door", "^Part$", "^Button", "^Gear", "^Keypad", "^House$",
    "^Wall", "^Floor", "^Ceiling", "^Roof", "^Window", "^Stair",
    "^Ladder", "^Fence", "^Gate", "^Frame", "^Handle$", "^Light",
    "^Spawn", "^Seat", "^SeatW", "^Trap", "^Cam", "^TPPart",
    "^SGPart", "^Script", "^Model", "^Event", "^Cutscene",
}
local KNOWN_ITEMS = {
    OrangeKey = true, BlueKey = true, YellowKey = true, GreenKey = true,
    PurpleKey = true, RedKey = true, WhiteKey = true, PinkKey = true, GrayKey = true,
    OrangeKeycard = true, BlueKeycard = true, YellowKeycard = true,
    GreenKeycard = true, PurpleKeycard = true, RedKeycard = true, WhiteKeycard = true,
    Wrench = true, Hammer = true, Crowbar = true, Gun = true, Crossbow = true,
    Grenade = true, Skillet = true, Mallet = true, Syringe = true, Dynamite = true,
    Coin = true, Ammo = true, Blueprint = true, Grass = true, Mirror = true,
    Carrot = true, Flashlight = true, Torch = true, Glue = true, Zizzy = true,
    RedGear = true, PurpleGear = true, OrangeGear = true, BlueGear = true,
    YellowGear = true, GreenGear = true, WhiteGear = true, GrayGear = true,
    SafeKey = true, PiggyHead = true, GrandfatherKey = true, RottenBook = true,
    Book = true, Letter = true, Nail = true, Plank = true, Fuse = true,
    Battery = true, Remote = true, Code = true, Mask = true, Umbrella = true,
    ZPotion = true, WhiteGear = true,
}
local function getItemDisplayName(item)
    local raw = item.Name
    if KNOWN_ITEMS[raw] then return raw end
    if raw:match("Key$") or raw:match("Keycard$") or raw:match("Gear$") then return raw end
    local mesh = item:FindFirstChildOfClass("SpecialMesh") or item:FindFirstChildOfClass("FileMesh")
    if mesh then
        local mid = mesh.MeshId:gsub("rbxassetid://", ""):gsub("http://www%.roblox%.com/asset/%?id=", ""):gsub("%s+", "")
        if MESH_NAME[mid] then return MESH_NAME[mid] end
    end
    for _, d in item:GetDescendants() do
        if d:IsA("StringValue") and d.Value ~= "" and #d.Value <= 20 and not d.Value:match("^%d+$") then
            if KNOWN_ITEMS[d.Value] or d.Value:match("Key$") or d.Value:match("Keycard$") or d.Value:match("Gear$") then
                return d.Value
            end
        end
    end
    if raw:match("^%-?%d+$") then
        if mesh then
            local mid = mesh.MeshId:gsub("rbxassetid://", ""):gsub("http://www%.roblox%.com/asset/%?id=", ""):gsub("%s+", "")
            return "Item (" .. mid .. ")"
        end
        return "Item"
    end
    return raw
end
local function isLikelyItem(item)
    local n = item.Name
    if SKIP_ITEM[n] then return false end
    for _, pat in SKIP_PAT do
        if n:match(pat) then return false end
    end
    if n:match("^%-?%d+$") then
        local mesh = item:FindFirstChildOfClass("SpecialMesh") or item:FindFirstChildOfClass("FileMesh")
        if not mesh then return false end
        local mid = mesh.MeshId:gsub("rbxassetid://", ""):gsub("http://www%.roblox%.com/asset/%?id=", ""):gsub("%s+", "")
        if not MESH_NAME[mid] then return false end
    end
    if item:FindFirstChildOfClass("Decal") then return false end
    local sz = item.Size
    local maxDim = math.max(sz.X, sz.Y, sz.Z)
    if maxDim > 4 or maxDim < 0.3 then return false end
    if not item:FindFirstChildOfClass("ClickDetector") then return false end
    return true
end
local function findItems()
    local r, names, seen = {}, {}, {}
    local function add(item)
        if not item or seen[item] then return end
        seen[item] = true
        if not isLikelyItem(item) then return end
        names[item] = getItemDisplayName(item)
        table.insert(r, item)
    end
    for _, d in Workspace:GetDescendants() do
        if d:IsA("ClickDetector") then
            local p = d.Parent
            if p and p:IsA("BasePart") then add(p) end
        end
    end
    return r, names
end

---------------------------------------------------------------
-- Held/Owned item detection (Backpack + Character)
---------------------------------------------------------------
local function scanForItem(container)
    if not container then return nil end
    for _, child in container:GetChildren() do
        if SKIP_CLASS[child.ClassName] then continue end
        if BODY[child.Name] then continue end
        if child:IsA("Tool") then return child end
        if (child:IsA("BasePart") or child:IsA("Model")) and child.Name ~= "Handle" then
            return child
        end
    end
    return nil
end

local function getPlayerItem(player)
    -- Priority 1: equipped in character (welded to model)
    local char = player.Character
    local equipped = char and scanForItem(char)
    if equipped then return equipped, true end
    -- Priority 2: in backpack (owned but not equipped)
    local bp = player:FindFirstChild("Backpack")
    local owned = bp and scanForItem(bp)
    if owned then return owned, false end
    return nil, false
end

local function getItemTexture(item)
    local function check(inst)
        for _, d in inst:GetDescendants() do
            if (d:IsA("SpecialMesh") or d:IsA("FileMesh")) and d.TextureId ~= "" then
                return d.TextureId
            end
        end
        return nil
    end
    if item:IsA("BasePart") then
        local m = item:FindFirstChildOfClass("SpecialMesh") or item:FindFirstChildOfClass("FileMesh")
        if m and m.TextureId ~= "" then return m.TextureId end
    end
    return check(item)
end

---------------------------------------------------------------
-- Movement (Fly / Noclip / Speed)
---------------------------------------------------------------
local flySpeed = 60

local flyConn = nil
local flyBV = nil
local flyBG = nil

local function stopFly()
    STATE.fly = false
    if flyConn then flyConn:Disconnect(); flyConn = nil end
    if flyBV then flyBV:Destroy(); flyBV = nil end
    if flyBG then flyBG:Destroy(); flyBG = nil end
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = false end
end

local function startFly()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.PlatformStand = true end
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    flyBV.Velocity = Vector3.new(0, 0, 0)
    flyBV.Parent = hrp
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    flyBG.D = 220
    flyBG.P = 8000
    flyBG.Parent = hrp
    flyConn = RunService.RenderStepped:Connect(function()
        local r = rootPart()
        local cam = Workspace.CurrentCamera
        if not r or not cam then return end
        local cf = cam.CFrame
        local move = Vector3.new()
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then move += cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then move -= cf.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then move -= cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then move += cf.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move += Vector3.new(0, 1, 0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move -= Vector3.new(0, 1, 0) end
        if move.Magnitude > 0.001 then
            move = move.Unit * flySpeed
        end
        flyBV.Velocity = move
        local look = Vector3.new(cf.LookVector.X, 0, cf.LookVector.Z)
        if look.Magnitude < 0.001 then look = Vector3.new(0, 0, -1) end
        flyBG.CFrame = CFrame.lookAlong(r.Position, look, Vector3.new(0, 1, 0))
    end)
end

local function setFly(on)
    if on then
        STATE.fly = true
        startFly()
    else
        stopFly()
    end
end

local noclipConn = nil

local function stopNoclip()
    STATE.noclip = false
    if noclipConn then noclipConn:Disconnect(); noclipConn = nil end
end

local function startNoclip()
    STATE.noclip = true
    noclipConn = RunService.Heartbeat:Connect(function()
        local char = LocalPlayer.Character
        if not char then return end
        for _, p in char:GetDescendants() do
            if p:IsA("BasePart") then p.CanCollide = false end
        end
    end)
end

local function setNoclip(on)
    if on then startNoclip() else stopNoclip() end
end

local function applyWalkSpeed(v)
    STATE.walkSpeed = v
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = v end
end

local infJumpConn = nil

local function stopInfiniteJump()
    STATE.infiniteJump = false
    if infJumpConn then infJumpConn:Disconnect(); infJumpConn = nil end
end

local function setInfiniteJump(on)
    if on then
        STATE.infiniteJump = true
        if not infJumpConn then
            infJumpConn = UserInputService.InputBegan:Connect(function(input, gp)
                if gp then return end
                if input.KeyCode == Enum.KeyCode.Space then
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if hum then hum.Jump = true end
                    if hrp then
                        hrp.AssemblyLinearVelocity = Vector3.new(hrp.AssemblyLinearVelocity.X, 70, hrp.AssemblyLinearVelocity.Z)
                    end
                end
            end)
        end
    else
        stopInfiniteJump()
    end
end

---------------------------------------------------------------
-- No crouch slow
---------------------------------------------------------------
local crouchConn = nil
local function setNoCrouchSlow(on)
    STATE.noCrouchSlow = on
    if crouchConn then crouchConn:Disconnect(); crouchConn = nil end
    if on then
        crouchConn = RunService.Heartbeat:Connect(function()
            if not STATE.noCrouchSlow then return end
            local char = LocalPlayer.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if hum then
                local target = STATE.speedOn and STATE.walkSpeed or 16
                if hum.WalkSpeed ~= target then
                    hum.WalkSpeed = target
                end
            end
        end)
    end
end

---------------------------------------------------------------
-- ESP tag builders (no background frames)
---------------------------------------------------------------

-- Item ESP: tiny floating text above item
local function mkItemESP(item, displayName)
    if itemESP[item] then return end

    local hl = Instance.new("Highlight")
    hl.Name = "AW"
    hl.Adornee = item
    hl.FillColor = T.Accent
    hl.FillTransparency = 0.78
    hl.OutlineColor = T.AccGlow
    hl.OutlineTransparency = 0.2
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = item

    local bb = Instance.new("BillboardGui")
    bb.Name = "AW"
    bb.Adornee = item
    bb.Size = UDim2.new(0, 100, 0, 22)
    bb.StudsOffset = Vector3.new(0, 2, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.MaxDistance = 200
    bb.Parent = item

    local nl = Instance.new("TextLabel")
    nl.Size = UDim2.new(1, 0, 0.55, 0)
    nl.Position = UDim2.new(0, 0, 0, 0)
    nl.BackgroundTransparency = 1
    nl.Font = Enum.Font.GothamBold
    nl.TextSize = 10
    nl.TextColor3 = T.Accent
    nl.TextStrokeTransparency = 0.35
    nl.TextStrokeColor3 = T.Shadow
    nl.Text = displayName or getItemDisplayName(item)
    nl.TextXAlignment = Enum.TextXAlignment.Center
    nl.Parent = bb

    local dl = Instance.new("TextLabel")
    dl.Name = "D"
    dl.Size = UDim2.new(1, 0, 0.45, 0)
    dl.Position = UDim2.new(0, 0, 0.55, 0)
    dl.BackgroundTransparency = 1
    dl.Font = Enum.Font.Gotham
    dl.TextSize = 8
    dl.TextColor3 = T.Dim
    dl.TextStrokeTransparency = 0.45
    dl.TextStrokeColor3 = T.Shadow
    dl.Text = "0m"
    dl.TextXAlignment = Enum.TextXAlignment.Center
    dl.Parent = bb

    itemESP[item] = { hl = hl, bb = bb, dl = dl }
end

local function rmItemESP(item)
    local d = itemESP[item]; if not d then return end
    if d.hl and d.hl.Parent then d.hl:Destroy() end
    if d.bb and d.bb.Parent then d.bb:Destroy() end
    itemESP[item] = nil
end

local function clearItemESP() for i in pairs(itemESP) do rmItemESP(i) end; itemESP = {} end

-- Piggy ESP: small red text above head
local function mkPiggyESP(model)
    if piggyESP[model] then return end

    local isBot = model:FindFirstChild("BotMainScript") ~= nil

    local hl = Instance.new("Highlight")
    hl.Name = "AW"
    hl.Adornee = model
    hl.FillColor = isBot and Color3.fromRGB(255, 100, 0) or T.Red
    hl.FillTransparency = 0.65
    hl.OutlineColor = isBot and Color3.fromRGB(255, 140, 0) or T.RedGlow
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = model

    local ad = model:FindFirstChild("Head") or model:FindFirstChild("HumanoidRootPart") or model:FindFirstChildWhichIsA("BasePart")

    local bb = Instance.new("BillboardGui")
    bb.Name = "AW"
    bb.Adornee = ad or model
    bb.Size = UDim2.new(0, 80, 0, 24)
    bb.StudsOffset = Vector3.new(0, 3, 0)
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.MaxDistance = 300
    bb.Parent = model

    local nl = Instance.new("TextLabel")
    nl.Size = UDim2.new(1, 0, 0.58, 0)
    nl.BackgroundTransparency = 1
    nl.Font = Enum.Font.GothamBlack
    nl.TextSize = 11
    nl.TextColor3 = isBot and Color3.fromRGB(255, 140, 0) or T.RedGlow
    nl.TextStrokeTransparency = 0.25
    nl.TextStrokeColor3 = Color3.fromRGB(50, 0, 0)
    nl.Text = isBot and "BOT" or "PIGGY"
    nl.TextXAlignment = Enum.TextXAlignment.Center
    nl.Parent = bb

    local dl = Instance.new("TextLabel")
    dl.Name = "D"
    dl.Size = UDim2.new(1, 0, 0.42, 0)
    dl.Position = UDim2.new(0, 0, 0.58, 0)
    dl.BackgroundTransparency = 1
    dl.Font = Enum.Font.GothamBold
    dl.TextSize = 8
    dl.TextColor3 = T.White
    dl.TextStrokeTransparency = 0.4
    dl.TextStrokeColor3 = T.Shadow
    dl.Text = "0m"
    dl.TextXAlignment = Enum.TextXAlignment.Center
    dl.Parent = bb

    piggyESP[model] = { hl = hl, bb = bb, dl = dl }
end

local function rmPiggyESP(m)
    local d = piggyESP[m]; if not d then return end
    if d.hl and d.hl.Parent then d.hl:Destroy() end
    if d.bb and d.bb.Parent then d.bb:Destroy() end
    piggyESP[m] = nil
end

local function clearPiggyESP() for m in pairs(piggyESP) do rmPiggyESP(m) end; piggyESP = {} end

-- Player ESP: positioned BELOW feet, shows name + dist + item
local function mkPlayerESP(player)
    local char = player.Character
    if not char or playerESP[player] then return end
    if isPiggy(char) then return end

    local hl = Instance.new("Highlight")
    hl.Name = "AW"
    hl.Adornee = char
    hl.FillColor = T.Green
    hl.FillTransparency = 0.82
    hl.OutlineColor = T.GreenDim
    hl.OutlineTransparency = 0.25
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = char

    local hrp = char:FindFirstChild("HumanoidRootPart")

    local bb = Instance.new("BillboardGui")
    bb.Name = "AW"
    bb.Adornee = hrp or char:FindFirstChildWhichIsA("BasePart")
    bb.Size = UDim2.new(0, 110, 0, 38)
    bb.StudsOffset = Vector3.new(0, -4.5, 0) -- BELOW feet
    bb.AlwaysOnTop = true
    bb.LightInfluence = 0
    bb.MaxDistance = 250
    bb.Parent = char

    -- Name
    local nl = Instance.new("TextLabel")
    nl.Name = "N"
    nl.Size = UDim2.new(1, 0, 0, 12)
    nl.Position = UDim2.new(0, 0, 0, 0)
    nl.BackgroundTransparency = 1
    nl.Font = Enum.Font.GothamBold
    nl.TextSize = 10
    nl.TextColor3 = T.Green
    nl.TextStrokeTransparency = 0.3
    nl.TextStrokeColor3 = T.Shadow
    nl.Text = player.DisplayName
    nl.TextXAlignment = Enum.TextXAlignment.Center
    nl.Parent = bb

    -- Distance
    local dl = Instance.new("TextLabel")
    dl.Name = "D"
    dl.Size = UDim2.new(1, 0, 0, 10)
    dl.Position = UDim2.new(0, 0, 0, 12)
    dl.BackgroundTransparency = 1
    dl.Font = Enum.Font.Gotham
    dl.TextSize = 8
    dl.TextColor3 = T.Dim
    dl.TextStrokeTransparency = 0.4
    dl.TextStrokeColor3 = T.Shadow
    dl.Text = "0m"
    dl.TextXAlignment = Enum.TextXAlignment.Center
    dl.Parent = bb

    -- Item row: icon + name
    local icon = Instance.new("ImageLabel")
    icon.Name = "Ic"
    icon.Size = UDim2.new(0, 14, 0, 14)
    icon.Position = UDim2.new(0, 2, 0, 23)
    icon.BackgroundTransparency = 1
    icon.ScaleType = Enum.ScaleType.Fit
    icon.Image = ""
    icon.Visible = false
    icon.Parent = bb

    local il = Instance.new("TextLabel")
    il.Name = "I"
    il.Size = UDim2.new(1, 0, 0, 12)
    il.Position = UDim2.new(0, 0, 0, 24)
    il.BackgroundTransparency = 1
    il.Font = Enum.Font.Gotham
    il.TextSize = 13
    il.TextScaled = false
    il.TextColor3 = T.AccGlow
    il.TextStrokeTransparency = 0.4
    il.TextStrokeColor3 = T.Shadow
    il.Text = ""
    il.TextXAlignment = Enum.TextXAlignment.Center
    il.Parent = bb

    playerESP[player] = { hl = hl, bb = bb, dl = dl, il = il, icon = icon }
end

local function rmPlayerESP(p)
    local d = playerESP[p]; if not d then return end
    if d.hl and d.hl.Parent then d.hl:Destroy() end
    if d.bb and d.bb.Parent then d.bb:Destroy() end
    playerESP[p] = nil
end

local function clearPlayerESP() for p in pairs(playerESP) do rmPlayerESP(p) end; playerESP = {} end

---------------------------------------------------------------
-- Update loops
---------------------------------------------------------------
local iRun, pRun, plRun, tpRun = false, false, false, false

local function loopItems()
    if iRun then return end; iRun = true
    task.spawn(function()
        while running and STATE.itemESP do
            local items, names = findItems()
            local set = {}
            for _, i in items do set[i] = true; if not itemESP[i] then mkItemESP(i, names[i]) end end
            for i in pairs(itemESP) do if not set[i] or not i.Parent then rmItemESP(i) end end
            for i, d in pairs(itemESP) do
                local p = getPos(i)
                if p and d.dl then d.dl.Text = dist(p) .. "m" end
            end
            task.wait(0.5)
        end
        clearItemESP(); iRun = false
    end)
end

local function loopPiggy()
    if pRun then return end; pRun = true
    task.spawn(function()
        while running and STATE.piggyESP do
            local pigs = findPiggies()
            local set = {}
            for _, m in pigs do set[m] = true; if not piggyESP[m] then mkPiggyESP(m) end end
            for m in pairs(piggyESP) do if not set[m] or not m.Parent then rmPiggyESP(m) end end
            for m, d in pairs(piggyESP) do
                local p = getPos(m)
                if p and d.dl then d.dl.Text = dist(p) .. "m" end
            end
            task.wait(0.35)
        end
        clearPiggyESP(); pRun = false
    end)
end

local function loopPlayers()
    if plRun then return end; plRun = true
    task.spawn(function()
        while running and STATE.playerESP do
            for _, player in Players:GetPlayers() do
                if player == LocalPlayer then continue end
                local char = player.Character
                if not char or not char.Parent then
                    if playerESP[player] then rmPlayerESP(player) end
                    continue
                end
                if isPiggy(char) then
                    if playerESP[player] then rmPlayerESP(player) end
                    continue
                end
                if not playerESP[player] then mkPlayerESP(player) end
            end
            for player in pairs(playerESP) do
                if not player.Parent or not player.Character or not player.Character.Parent then
                    rmPlayerESP(player)
                end
            end
            for player, data in pairs(playerESP) do
                local char = player.Character
                if not char then continue end
                local p = getPos(char)
                if p and data.dl then data.dl.Text = dist(p) .. "m" end

                -- Item tracking: Backpack + Character
                local item, equipped = getPlayerItem(player)
                if item then
                    local prefix = equipped and "✋ " or "🎒 "
                    data.il.Text = prefix .. item.Name
                    data.il.TextColor3 = equipped and T.AccGlow or T.Dim
                    local tex = getItemTexture(item)
                    if tex then
                        data.icon.Image = tex
                        data.icon.Visible = true
                        data.il.Position = UDim2.new(0, 16, 0, 24)
                        data.il.Size = UDim2.new(1, -16, 0, 12)
                    else
                        data.icon.Visible = false
                        data.il.Position = UDim2.new(0, 0, 0, 24)
                        data.il.Size = UDim2.new(1, 0, 0, 12)
                    end
                else
                    data.il.Text = ""
                    data.icon.Visible = false
                end
            end
            task.wait(0.4)
        end
        clearPlayerESP(); plRun = false
    end)
end

---------------------------------------------------------------
-- Exploits — TP helpers
---------------------------------------------------------------
local function headshot(player)
    return "rbxthumb://type=AvatarHeadShot&id=" .. player.UserId .. "&w=150&h=150"
end

local function tpTo(player)
    local char = player.Character
    if not char then return end
    local myChar = LocalPlayer.Character
    local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myHRP then return end
    local head = char:FindFirstChild("Head")
    local hrp = char:FindFirstChild("HumanoidRootPart")
    local base = head or hrp or char:FindFirstChildWhichIsA("BasePart")
    if not base then return end
    -- Teleport slightly above the target's head so you don't get stuck inside them/geometry
    myHRP.CFrame = base.CFrame + Vector3.new(0, 3, 0)
end

local function sortPlayers(list)
    table.sort(list, function(a, b)
        return (a.DisplayName or a.Name) < (b.DisplayName or b.Name)
    end)
end

local function aliveOthers()
    local r = {}
    for _, player in Players:GetPlayers() do
        if player == LocalPlayer then continue end
        local char = player.Character
        if not char or not char.Parent then continue end
        table.insert(r, player)
    end
    return r
end

local function refreshTPList()
    local current = {}
    for _, player in aliveOthers() do
        if isPiggy(player.Character) then continue end
        table.insert(current, player)
    end
    sortPlayers(current)
    local order = 0
    for _, player in current do
        order = order + 1
        if not tpButtons[player] then
            local row = Instance.new("TextButton")
            row.Name = "Tp"
            row.Size = UDim2.new(1, 0, 0, 34)
            row.LayoutOrder = order
            row.BackgroundColor3 = T.BG2
            row.BackgroundTransparency = 0.2
            row.BorderSizePixel = 0
            row.Text = ""
            row.Parent = tpList
            Instance.new("UICorner", row).CornerRadius = UDim.new(0, 6)

            local av = Instance.new("ImageLabel")
            av.Size = UDim2.new(0, 26, 0, 26)
            av.Position = UDim2.new(0, 4, 0.5, -13)
            av.BackgroundColor3 = T.Shadow
            av.BackgroundTransparency = 0.3
            av.Image = headshot(player)
            av.ScaleType = Enum.ScaleType.Crop
            av.Parent = row
            Instance.new("UICorner", av).CornerRadius = UDim.new(1, 0)

            local nm = Instance.new("TextLabel")
            nm.Size = UDim2.new(1, -40, 1, 0)
            nm.Position = UDim2.new(0, 36, 0, 0)
            nm.BackgroundTransparency = 1
            nm.Text = "⚡ " .. player.DisplayName
            nm.TextColor3 = T.White
            nm.TextSize = 10
            nm.Font = Enum.Font.GothamBold
            nm.TextXAlignment = Enum.TextXAlignment.Left
            nm.Parent = row

            row.MouseButton1Click:Connect(function() tpTo(player) end)
            tpButtons[player] = row
        else
            tpButtons[player].LayoutOrder = order
        end
    end
    for player, row in pairs(tpButtons) do
        local still = false
        for _, c in ipairs(current) do
            if c == player then still = true break end
        end
        if not still and row and row.Parent then
            row:Destroy()
            tpButtons[player] = nil
        end
    end
    if tpList then
        tpList.Size = UDim2.new(1, 0, 0, #current * 37 + 4)
    end
end

local function clearTPList()
    for player, row in pairs(tpButtons) do
        if row and row.Parent then row:Destroy() end
    end
    tpButtons = {}
    if tpList then tpList.Size = UDim2.new(1, 0, 0, 0) end
end

local function loopTPList()
    if tpRun then return end; tpRun = true
    task.spawn(function()
        while running do
            refreshTPList()
            task.wait(1)
        end
        clearTPList(); tpRun = false
    end)
end

---------------------------------------------------------------
-- Unload (used by Settings tab)
---------------------------------------------------------------
local function unloadScript()
    running = false
    _G.AquaWaveGEN = (_G.AquaWaveGEN or 0) + 1
    stopFly()
    stopNoclip()
    stopInfiniteJump()
    setNoCrouchSlow(false)
    clearItemESP()
    clearPiggyESP()
    clearPlayerESP()
    clearTPList()
    local g = LocalPlayer.PlayerGui:FindFirstChild("AquaWaveESP")
    if g then g:Destroy() end
    local tg = LocalPlayer.PlayerGui:FindFirstChild("AquaWaveToggle")
    if tg then tg:Destroy() end
    _G.AquaWaveESP = nil
end

---------------------------------------------------------------
-- Destroy old GUI
---------------------------------------------------------------
local old = LocalPlayer.PlayerGui:FindFirstChild("AquaWaveESP")
if old then old:Destroy() end
local oldToggle = LocalPlayer.PlayerGui:FindFirstChild("AquaWaveToggle")
if oldToggle then oldToggle:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "AquaWaveESP"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = LocalPlayer.PlayerGui

---------------------------------------------------------------
-- Main Frame
---------------------------------------------------------------
local MIN_W, MIN_H = 360, 420
local MAX_W, MAX_H = 620, 640
local DEF_W, DEF_H = 430, 520

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, DEF_W, 0, DEF_H)
Main.Position = UDim2.new(0.5, -DEF_W/2, 1, 0)
Main.BackgroundColor3 = T.BG
Main.BackgroundTransparency = 0.01
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = true
Main.Parent = Gui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)
local ms = Instance.new("UIStroke", Main)
ms.Color = T.Accent; ms.Thickness = 1.5; ms.Transparency = 0.15

-- Shadow
local shd = Instance.new("Frame")
shd.Size = UDim2.new(1, 12, 1, 12)
shd.Position = UDim2.new(0, -6, 0, -6)
shd.BackgroundColor3 = T.Shadow
shd.BackgroundTransparency = 0.5
shd.BorderSizePixel = 0
shd.ZIndex = -1
shd.Parent = Main
Instance.new("UICorner", shd).CornerRadius = UDim.new(0, 18)

local rh = nil

---------------------------------------------------------------
-- Title Bar
---------------------------------------------------------------
local TB = Instance.new("Frame")
TB.Size = UDim2.new(1, 0, 0, 46)
TB.BackgroundColor3 = T.BG2
TB.BorderSizePixel = 0
TB.Parent = Main
Instance.new("UICorner", TB).CornerRadius = UDim.new(0, 12)

local icon = Instance.new("TextLabel")
icon.Size = UDim2.new(0, 26, 0, 26)
icon.Position = UDim2.new(0, 10, 0.5, -13)
icon.BackgroundTransparency = 1
icon.Text = "🌊"; icon.TextSize = 16; icon.Font = Enum.Font.GothamBold
icon.Parent = TB

local tt = Instance.new("TextLabel")
tt.Size = UDim2.new(1, -70, 0, 16)
tt.Position = UDim2.new(0, 42, 0, 6)
tt.BackgroundTransparency = 1
tt.Text = "AQUA WAVE"
tt.TextColor3 = T.AccGlow; tt.TextSize = 15; tt.Font = Enum.Font.GothamBlack
tt.TextXAlignment = Enum.TextXAlignment.Left
tt.TextStrokeTransparency = 0.4; tt.TextStrokeColor3 = T.Shadow
tt.Parent = TB

local ts = Instance.new("TextLabel")
ts.Size = UDim2.new(1, -70, 0, 12)
ts.Position = UDim2.new(0, 42, 0, 24)
ts.BackgroundTransparency = 1
ts.Text = "Piggy ESP v2.12 • Movement & Exploits"
ts.TextColor3 = T.Dim; ts.TextSize = 9; ts.Font = Enum.Font.Gotham
ts.TextXAlignment = Enum.TextXAlignment.Left
ts.Parent = TB

-- Small wave accents in the title bar
local function wave(p, x, y, col, tr, h, w, rot)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(0, w, 0, h)
    f.Position = UDim2.new(1, x, 0, y)
    f.BackgroundColor3 = col; f.BackgroundTransparency = tr
    f.BorderSizePixel = 0; f.ZIndex = 2; f.Rotation = rot
    f.Parent = p
    Instance.new("UICorner", f).CornerRadius = UDim.new(0, h)
end
wave(TB, -60, 30, T.Wave1, 0.6, 9, 46, 0)
wave(TB, -42, 22, T.Wave2, 0.5, 7, 36, -8)
wave(TB, -24, 16, T.Wave3, 0.4, 5, 26, -14)

---------------------------------------------------------------
-- Sidebar (tabs) — clean, solid dark slate
---------------------------------------------------------------
local SB = Instance.new("Frame")
SB.Size = UDim2.new(0, 112, 1, -46)
SB.Position = UDim2.new(0, 0, 0, 46)
SB.BackgroundColor3 = T.BG2
SB.BackgroundTransparency = 0
SB.BorderSizePixel = 0
SB.Parent = Main
Instance.new("UICorner", SB).CornerRadius = UDim.new(0, 12)

local sbPad = Instance.new("UIPadding", SB)
sbPad.PaddingTop = UDim.new(0, 10); sbPad.PaddingBottom = UDim.new(0, 14)
sbPad.PaddingLeft = UDim.new(0, 7); sbPad.PaddingRight = UDim.new(0, 7)

local sbLy = Instance.new("UIListLayout", SB)
sbLy.SortOrder = Enum.SortOrder.LayoutOrder
sbLy.Padding = UDim.new(0, 6)

---------------------------------------------------------------
-- Palm Tree graphic (bottom-left of sidebar) — sunset image
---------------------------------------------------------------
local PALM_IMAGE = "rbxassetid://299751924"

local palm = Instance.new("Frame")
palm.Name = "PalmTree"
palm.Size = UDim2.new(0, 104, 0, 112)
palm.Position = UDim2.new(0, 0, 1, -156)
palm.BackgroundTransparency = 1
palm.BorderSizePixel = 0
palm.ClipsDescendants = true
palm.ZIndex = 2
palm.Parent = Main
Instance.new("UICorner", palm).CornerRadius = UDim.new(0, 10)

local palmImg = Instance.new("ImageLabel")
palmImg.Name = "PalmImage"
palmImg.Size = UDim2.new(1, 0, 1, 0)
palmImg.Position = UDim2.new(0, 0, 0, 0)
palmImg.BackgroundTransparency = 1
palmImg.BorderSizePixel = 0
palmImg.Image = PALM_IMAGE
palmImg.ScaleType = Enum.ScaleType.Crop
palmImg.ZIndex = 2
palmImg.Parent = palm

---------------------------------------------------------------
-- Panel + Pages
---------------------------------------------------------------
local Panel = Instance.new("Frame")
Panel.Size = UDim2.new(1, -112, 1, -46)
Panel.Position = UDim2.new(0, 112, 0, 46)
Panel.BackgroundTransparency = 1
Panel.BorderSizePixel = 0
Panel.Parent = Main

local function mkPage(name)
    local page = Instance.new("ScrollingFrame")
    page.Name = name
    page.Size = UDim2.new(1, 0, 1, 0)
    page.BackgroundTransparency = 1
    page.BorderSizePixel = 0
    page.ScrollBarThickness = 2
    page.ScrollBarImageColor3 = T.Accent
    page.ScrollBarImageTransparency = 0.5
    page.CanvasSize = UDim2.new(0, 0, 0, 0)
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    page.Visible = false
    page.Parent = Panel
    local l = Instance.new("UIListLayout", page)
    l.SortOrder = Enum.SortOrder.LayoutOrder; l.Padding = UDim.new(0, 6)
    local p = Instance.new("UIPadding", page)
    p.PaddingLeft = UDim.new(0, 10); p.PaddingRight = UDim.new(0, 10)
    p.PaddingTop = UDim.new(0, 8); p.PaddingBottom = UDim.new(0, 10)
    return page
end

local visualsPage   = mkPage("Visuals")
local exploitsPage  = mkPage("Exploits")
local movementPage  = mkPage("Movement")
local settingsPage  = mkPage("Settings")
local infoPage      = mkPage("Info")

---------------------------------------------------------------
-- Tab system
---------------------------------------------------------------
local tabData = {}
local activePage = visualsPage

local function setTab(page)
    activePage = page
    for _, tab in ipairs(tabData) do
        local on = (tab.page == page)
        tab.page.Visible = on
        tab.frame.BackgroundColor3 = on and T.Accent or T.BG2
        tab.frame.BackgroundTransparency = on and 0.2 or 0.75
        tab.lbl.TextColor3 = on and Color3.fromRGB(255, 255, 255) or T.Dim
    end
end

local function mkTabButton(label, iconTxt, order, page)
    local btn = Instance.new("Frame")
    btn.Size = UDim2.new(1, 0, 0, 38)
    btn.BackgroundColor3 = T.BG2
    btn.BackgroundTransparency = 0.75
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.Parent = SB
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 7)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -6, 1, 0)
    lbl.Position = UDim2.new(0, 5, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = iconTxt .. " " .. label
    lbl.TextColor3 = T.Dim
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = btn

    local hit = Instance.new("TextButton")
    hit.Size = UDim2.new(1, 0, 1, 0)
    hit.BackgroundTransparency = 1
    hit.Text = ""
    hit.Parent = btn
    hit.MouseButton1Click:Connect(function() setTab(page) end)

    table.insert(tabData, { page = page, frame = btn, lbl = lbl })
end

mkTabButton("Info", "ⓘ", 1, infoPage)
mkTabButton("Visuals", "👁", 2, visualsPage)
mkTabButton("Exploits", "🛠", 3, exploitsPage)
mkTabButton("Movement", "🏃", 4, movementPage)
mkTabButton("Settings", "⚙", 5, settingsPage)
setTab(infoPage)

---------------------------------------------------------------
-- Toggle Builder
---------------------------------------------------------------
local function mkToggle(parent, label, desc, initial, order, cb)
    local c = Instance.new("Frame")
    c.Size = UDim2.new(1, 0, 0, 48)
    c.BackgroundColor3 = T.BG2; c.BackgroundTransparency = 0.25
    c.BorderSizePixel = 0; c.LayoutOrder = order; c.Parent = parent
    Instance.new("UICorner", c).CornerRadius = UDim.new(0, 8)
    local cs = Instance.new("UIStroke", c)
    cs.Color = T.Accent; cs.Thickness = 1; cs.Transparency = 0.8

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.7, 0, 0, 14)
    lbl.Position = UDim2.new(0, 10, 0, 7)
    lbl.BackgroundTransparency = 1
    lbl.Text = label; lbl.TextColor3 = T.White
    lbl.TextSize = 11; lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = c

    local dsc = Instance.new("TextLabel")
    dsc.Size = UDim2.new(0.7, 0, 0, 10)
    dsc.Position = UDim2.new(0, 10, 0, 23)
    dsc.BackgroundTransparency = 1
    dsc.Text = desc; dsc.TextColor3 = T.Dim
    dsc.TextSize = 8; dsc.Font = Enum.Font.Gotham
    dsc.TextXAlignment = Enum.TextXAlignment.Left
    dsc.TextWrapped = true; dsc.Parent = c

    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(0, 34, 0, 18)
    bg.Position = UDim2.new(1, -44, 0.5, -9)
    bg.BackgroundColor3 = initial and T.TogOn or T.TogOff
    bg.BorderSizePixel = 0; bg.Parent = c
    Instance.new("UICorner", bg).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = initial and UDim2.new(1, -18, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
    knob.BackgroundColor3 = T.White; knob.BorderSizePixel = 0; knob.Parent = bg
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local on = initial
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 1, 0)
    btn.BackgroundTransparency = 1; btn.Text = ""; btn.Parent = c

    btn.MouseButton1Click:Connect(function()
        on = not on
        bg.BackgroundColor3 = on and T.TogOn or T.TogOff
        knob.Position = on and UDim2.new(1, -18, 0.5, -7) or UDim2.new(0, 2, 0.5, -7)
        cs.Transparency = on and 0.45 or 0.8
        cb(on)
    end)
    btn.MouseEnter:Connect(function() c.BackgroundTransparency = 0.1 end)
    btn.MouseLeave:Connect(function() c.BackgroundTransparency = 0.25 end)
end

---------------------------------------------------------------
-- Generic button builder (with optional color)
---------------------------------------------------------------
local function mkButton(parent, text, order, cb, color)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 30)
    b.LayoutOrder = order
    b.BackgroundColor3 = color or T.BG2
    b.BackgroundTransparency = 0.15
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = T.White
    b.TextSize = 11
    b.Font = Enum.Font.GothamBold
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
    b.MouseButton1Click:Connect(cb)
    return b
end

---------------------------------------------------------------
-- Slider Builder
---------------------------------------------------------------
local function mkSlider(parent, label, min, max, default, order, cb)
    local c = Instance.new("Frame")
    c.Size = UDim2.new(1, 0, 0, 52)
    c.BackgroundColor3 = T.BG2; c.BackgroundTransparency = 0.25
    c.BorderSizePixel = 0; c.LayoutOrder = order; c.Parent = parent
    Instance.new("UICorner", c).CornerRadius = UDim.new(0, 8)

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.6, 0, 0, 14)
    lbl.Position = UDim2.new(0, 10, 0, 6)
    lbl.BackgroundTransparency = 1
    lbl.Text = label; lbl.TextColor3 = T.White
    lbl.TextSize = 11; lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = c

    local valLbl = Instance.new("TextLabel")
    valLbl.Size = UDim2.new(0, 40, 0, 14)
    valLbl.Position = UDim2.new(1, -48, 0, 6)
    valLbl.BackgroundTransparency = 1
    valLbl.Text = tostring(default)
    valLbl.TextColor3 = T.Accent; valLbl.TextSize = 11; valLbl.Font = Enum.Font.GothamBold
    valLbl.TextXAlignment = Enum.TextXAlignment.Right
    valLbl.Parent = c

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -20, 0, 6)
    track.Position = UDim2.new(0, 10, 0, 32)
    track.BackgroundColor3 = T.TogOff
    track.BackgroundTransparency = 0.3
    track.BorderSizePixel = 0
    track.Parent = c
    Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = T.Accent
    fill.BorderSizePixel = 0
    fill.Parent = track
    Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

    local knob = Instance.new("Frame")
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.BackgroundColor3 = T.White
    knob.BorderSizePixel = 0
    knob.Parent = track
    Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

    local dragging = false

    local function setFromPct(pct)
        pct = math.clamp(pct, 0, 1)
        local v = math.clamp(math.floor(min + (max - min) * pct + 0.5), min, max)
        valLbl.Text = tostring(v)
        fill.Size = UDim2.fromScale(pct, 1)
        knob.Position = UDim2.fromScale(pct, 0.5)
        cb(v)
    end

    local function update(input)
        if track.AbsoluteSize.X <= 0 then return end
        local rel = (input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X
        setFromPct(rel)
    end

    track.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            update(input)
        end
    end)
    track.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
    end)

    setFromPct((default - min) / (max - min))
end

---------------------------------------------------------------
-- Visuals tab
---------------------------------------------------------------
mkToggle(visualsPage, "🔑  Item ESP", "Keys, tools & map items", false, 1, function(on)
    STATE.itemESP = on; if on then loopItems() end
end)
mkToggle(visualsPage, "🐷  Piggy ESP", "Monster tracking + red glow", false, 2, function(on)
    STATE.piggyESP = on; if on then loopPiggy() end
end)
mkToggle(visualsPage, "👥  Player ESP", "Survivors + inventory below feet", false, 3, function(on)
    STATE.playerESP = on; if on then loopPlayers() end
end)

---------------------------------------------------------------
-- Exploits tab (TP)
---------------------------------------------------------------
local tpHeader = Instance.new("TextLabel")
tpHeader.Size = UDim2.new(1, 0, 0, 20)
tpHeader.LayoutOrder = 1
tpHeader.BackgroundTransparency = 1
tpHeader.Text = "⚡ TP to Survivor"
tpHeader.TextColor3 = T.AccGlow
tpHeader.TextSize = 12
tpHeader.Font = Enum.Font.GothamBold
tpHeader.TextXAlignment = Enum.TextXAlignment.Left
tpHeader.Parent = exploitsPage

tpList = Instance.new("Frame")
tpList.Size = UDim2.new(1, 0, 0, 0)
tpList.LayoutOrder = 2
tpList.BackgroundTransparency = 1
tpList.BorderSizePixel = 0
tpList.Parent = exploitsPage
local tpLy = Instance.new("UIListLayout", tpList)
tpLy.SortOrder = Enum.SortOrder.LayoutOrder
tpLy.Padding = UDim.new(0, 3)

local function tpNearestItem()
    local items = findItems()
    local myHRP = rootPart()
    if not myHRP or #items == 0 then return end
    local best, bestD = nil, math.huge
    for _, i in items do
        local p = getPos(i)
        if p then
            local d = (myHRP.Position - p).Magnitude
            if d < bestD then best, bestD = i, d end
        end
    end
    if best then
        local p = getPos(best)
        if p then myHRP.CFrame = CFrame.new(p + Vector3.new(0, 3, 0)) end
    end
end

mkButton(exploitsPage, "🧰  TP to Nearest Item", 3, function() tpNearestItem() end, T.Red)


---------------------------------------------------------------
-- Movement tab
---------------------------------------------------------------
mkToggle(movementPage, "🕊  Fly", "Smooth flight (WASD + Space/Shift)", false, 1, function(on)
    setFly(on)
end)
mkSlider(movementPage, "🕊  Fly Speed", 20, 200, 60, 2, function(v)
    flySpeed = v
end)
mkSlider(movementPage, "🏃  SpeedWalk", 16, 120, 16, 3, function(v)
    applyWalkSpeed(v)
end)
local sliderTip = Instance.new("TextLabel")
sliderTip.Size = UDim2.new(1, 0, 0, 18)
sliderTip.BackgroundTransparency = 1
sliderTip.Text = "💡 Lock UI in Settings to use sliders without moving the menu"
sliderTip.TextColor3 = T.Gold
sliderTip.TextSize = 8
sliderTip.Font = Enum.Font.Gotham
sliderTip.TextXAlignment = Enum.TextXAlignment.Center
sliderTip.LayoutOrder = 10
sliderTip.Parent = movementPage
mkToggle(movementPage, "🚶  Noclip", "Walk through doors & walls", false, 4, function(on)
    setNoclip(on)
end)
mkToggle(movementPage, "⬆  Infinite Jump", "Jump as high as you want", false, 5, function(on)
    setInfiniteJump(on)
end)
mkToggle(movementPage, "🦿  No Crouch Slow", "Keep full speed while crouching", false, 6, function(on)
    setNoCrouchSlow(on)
end)

---------------------------------------------------------------
-- Settings tab
---------------------------------------------------------------
mkToggle(settingsPage, "🔒  Lock UI", "Disable dragging & resizing", false, 1, function(on)
    Main.Draggable = not on
    if rh then rh.Visible = not on end
end)
mkButton(settingsPage, "🗑  Unload Aqua Wave", 2, function() unloadScript() end)

local keybindBtn = Instance.new("TextButton")
keybindBtn.Size = UDim2.new(1, 0, 0, 36)
keybindBtn.LayoutOrder = 3
keybindBtn.BackgroundColor3 = T.BG2
keybindBtn.BackgroundTransparency = 0.15
keybindBtn.BorderSizePixel = 0
keybindBtn.Text = ""
keybindBtn.TextColor3 = T.White
keybindBtn.Font = Enum.Font.GothamBold
keybindBtn.Parent = settingsPage
Instance.new("UICorner", keybindBtn).CornerRadius = UDim.new(0, 6)

keybindLabel = Instance.new("TextLabel")
keybindLabel.Size = UDim2.new(1, -20, 1, 0)
keybindLabel.Position = UDim2.new(0, 10, 0, 0)
keybindLabel.BackgroundTransparency = 1
keybindLabel.Text = "⌨  Keybind: RightControl"
keybindLabel.TextColor3 = T.White
keybindLabel.TextSize = 11
keybindLabel.Font = Enum.Font.GothamBold
keybindLabel.TextXAlignment = Enum.TextXAlignment.Left
keybindLabel.Parent = keybindBtn

local keybindHint = Instance.new("TextLabel")
keybindHint.Size = UDim2.new(1, -20, 0, 10)
keybindHint.Position = UDim2.new(0, 10, 1, -12)
keybindHint.BackgroundTransparency = 1
keybindHint.Text = "Tap then press any key to rebind"
keybindHint.TextColor3 = T.Dim
keybindHint.TextSize = 8
keybindHint.Font = Enum.Font.Gotham
keybindHint.TextXAlignment = Enum.TextXAlignment.Left
keybindHint.Parent = keybindBtn

keybindBtn.MouseButton1Click:Connect(function()
    STATE.rebinding = true
    keybindLabel.Text = "⌨  Press any key..."
end)

---------------------------------------------------------------
-- Info tab
---------------------------------------------------------------
local infoSpacer1 = Instance.new("Frame")
infoSpacer1.Size = UDim2.new(1, 0, 0, 8)
infoSpacer1.BackgroundTransparency = 1
infoSpacer1.LayoutOrder = 0
infoSpacer1.Parent = infoPage

local avatarFrame = Instance.new("Frame")
avatarFrame.Size = UDim2.new(0, 80, 0, 80)
avatarFrame.Position = UDim2.new(0.5, -40, 0, 10)
avatarFrame.BackgroundColor3 = T.BG2
avatarFrame.BorderSizePixel = 0
avatarFrame.LayoutOrder = 1
avatarFrame.Parent = infoPage
Instance.new("UICorner", avatarFrame).CornerRadius = UDim.new(0, 12)
local avatarStroke = Instance.new("UIStroke", avatarFrame)
avatarStroke.Color = T.Accent
avatarStroke.Thickness = 2
avatarStroke.Transparency = 0.2

local avatarImg = Instance.new("ImageLabel")
avatarImg.Size = UDim2.new(1, 0, 1, 0)
avatarImg.BackgroundTransparency = 1
avatarImg.ScaleType = Enum.ScaleType.Fit
avatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=420&h=420"
avatarImg.Parent = avatarFrame

local helloLabel = Instance.new("TextLabel")
helloLabel.Size = UDim2.new(1, -20, 0, 24)
helloLabel.Position = UDim2.new(0, 10, 0, 100)
helloLabel.BackgroundTransparency = 1
helloLabel.Text = "Hello, " .. LocalPlayer.DisplayName .. "!"
helloLabel.TextColor3 = T.AccGlow
helloLabel.TextSize = 16
helloLabel.Font = Enum.Font.GothamBlack
helloLabel.TextXAlignment = Enum.TextXAlignment.Center
helloLabel.LayoutOrder = 2
helloLabel.Parent = infoPage

local heartLabel = Instance.new("TextLabel")
heartLabel.Size = UDim2.new(1, -20, 0, 60)
heartLabel.Position = UDim2.new(0, 10, 0, 132)
heartLabel.BackgroundTransparency = 1
heartLabel.Text = "Thank you for using Aqua Wave. Every time you load this script, it means the world to me. You are the reason this keeps growing, and I hope it brings you even a little bit of joy in every round."
heartLabel.TextColor3 = T.Dim
heartLabel.TextSize = 10
heartLabel.Font = Enum.Font.Gotham
heartLabel.TextXAlignment = Enum.TextXAlignment.Center
heartLabel.TextWrapped = true
heartLabel.LayoutOrder = 3
heartLabel.Parent = infoPage

local discordCard = Instance.new("Frame")
discordCard.Size = UDim2.new(1, -20, 0, 36)
discordCard.BackgroundColor3 = T.BG2
discordCard.BackgroundTransparency = 0.2
discordCard.BorderSizePixel = 0
discordCard.LayoutOrder = 4
discordCard.Parent = infoPage
Instance.new("UICorner", discordCard).CornerRadius = UDim.new(0, 8)

local discordIcon = Instance.new("TextLabel")
discordIcon.Size = UDim2.new(0, 30, 1, 0)
discordIcon.Position = UDim2.new(0, 10, 0, 0)
discordIcon.BackgroundTransparency = 1
discordIcon.Text = "💬"
discordIcon.TextSize = 14
discordIcon.TextColor3 = T.White
discordIcon.Parent = discordCard

local discordText = Instance.new("TextLabel")
discordText.Size = UDim2.new(1, -50, 1, 0)
discordText.Position = UDim2.new(0, 38, 0, 0)
discordText.BackgroundTransparency = 1
discordText.Text = "2q4p on Discord"
discordText.TextColor3 = T.Accent
discordText.TextSize = 12
discordText.Font = Enum.Font.GothamBold
discordText.TextXAlignment = Enum.TextXAlignment.Left
discordText.Parent = discordCard

---------------------------------------------------------------
-- Status Bar (toggle key indicator + live FPS)
---------------------------------------------------------------
local sb = Instance.new("Frame")
sb.Size = UDim2.new(1, -16, 0, 24)
sb.Position = UDim2.new(0, 8, 1, -32)
sb.BackgroundColor3 = T.BG2; sb.BackgroundTransparency = 0.4
sb.BorderSizePixel = 0; sb.ZIndex = 3; sb.Parent = Main
Instance.new("UICorner", sb).CornerRadius = UDim.new(0, 6)

local stxt = Instance.new("TextLabel")
stxt.Size = UDim2.new(1, -10, 1, 0)
stxt.Position = UDim2.new(0, 6, 0, 0)
stxt.BackgroundTransparency = 1
stxt.Text = "⌨ " .. STATE.keybind.Name .. "  •  0 FPS"
stxt.TextColor3 = T.Dim; stxt.TextSize = 9
stxt.Font = Enum.Font.Gotham; stxt.TextXAlignment = Enum.TextXAlignment.Left
stxt.Parent = sb

local vr = Instance.new("TextLabel")
vr.Size = UDim2.new(0, 40, 1, 0)
vr.Position = UDim2.new(1, -44, 0, 0)
vr.BackgroundTransparency = 1
vr.Text = "v2.12"; vr.TextColor3 = T.Accent
vr.TextSize = 9; vr.Font = Enum.Font.GothamBold
vr.TextXAlignment = Enum.TextXAlignment.Right
vr.Parent = sb

-- Live FPS counter in the footer
local fpsFrames = 0
local fpsLast = 0
RunService.RenderStepped:Connect(function()
    fpsFrames = fpsFrames + 1
    local now = os.clock()
    local delta = now - fpsLast
    if delta >= 0.5 then
        local fps = math.round(fpsFrames / delta)
        fpsFrames = 0
        fpsLast = now
        stxt.Text = "⌨ " .. STATE.keybind.Name .. "  •  " .. tostring(fps) .. " FPS"
    end
end)

---------------------------------------------------------------
-- Resize Handle
---------------------------------------------------------------
rh = Instance.new("TextButton")
rh.Size = UDim2.new(0, 18, 0, 18)
rh.Position = UDim2.new(1, -18, 1, -18)
rh.BackgroundColor3 = T.Accent; rh.BackgroundTransparency = 0.5
rh.BorderSizePixel = 0; rh.Text = "⤡"; rh.TextColor3 = T.White
rh.TextSize = 9; rh.Font = Enum.Font.GothamBold; rh.ZIndex = 10
rh.AutoButtonColor = false; rh.Parent = Main
Instance.new("UICorner", rh).CornerRadius = UDim.new(0, 5)

local resizing = false
local rStart, sStart

rh.MouseButton1Down:Connect(function()
    resizing = true
    rStart = UserInputService:GetMouseLocation()
    sStart = Main.AbsoluteSize
end)
UserInputService.InputChanged:Connect(function(input)
    if resizing and input.UserInputType == Enum.UserInputType.MouseMovement then
        local m = UserInputService:GetMouseLocation()
        local d = m - rStart
        Main.Size = UDim2.new(0,
            math.clamp(sStart.X + d.X, MIN_W, MAX_W), 0,
            math.clamp(sStart.Y + d.Y, MIN_H, MAX_H))
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then resizing = false end
end)
rh.MouseEnter:Connect(function() rh.BackgroundTransparency = 0.2 end)
rh.MouseLeave:Connect(function() rh.BackgroundTransparency = 0.5 end)

---------------------------------------------------------------
-- Keybind
---------------------------------------------------------------
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if STATE.rebinding then
        if input.UserInputType == Enum.UserInputType.Keyboard then
            STATE.keybind = input.KeyCode
            STATE.rebinding = false
            keybindLabel.Text = "Keybind: " .. input.KeyCode.Name
            stxt.Text = "⌨ " .. input.KeyCode.Name .. "  •  0 FPS"
        end
        return
    end
    if input.KeyCode == STATE.keybind then
        STATE.guiVisible = not STATE.guiVisible
        Main.Visible = STATE.guiVisible
    end
end)

---------------------------------------------------------------
-- Floating Toggle Button (draggable, always visible)
---------------------------------------------------------------
local WAVE_IMG = "rbxassetid://6031075938"

local toggleGui = Instance.new("ScreenGui")
toggleGui.Name = "AquaWaveToggle"
toggleGui.ResetOnSpawn = false
toggleGui.DisplayOrder = 999
toggleGui.Parent = LocalPlayer.PlayerGui

local TOGGLE_SIZE = 50
local toggleBtn = Instance.new("TextButton")
toggleBtn.Name = "WaveToggle"
toggleBtn.Size = UDim2.new(0, TOGGLE_SIZE, 0, TOGGLE_SIZE)
toggleBtn.Position = UDim2.new(0, 16, 1, -120)
toggleBtn.BackgroundColor3 = Color3.fromRGB(20, 60, 120)
toggleBtn.BorderSizePixel = 0
toggleBtn.Text = ""
toggleBtn.AutoButtonColor = false
toggleBtn.ZIndex = 100
toggleBtn.Parent = toggleGui
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)

local toggleStroke = Instance.new("UIStroke", toggleBtn)
toggleStroke.Color = T.AccGlow
toggleStroke.Thickness = 2
toggleStroke.Transparency = 0.3

local waveGrad = Instance.new("UIGradient", toggleBtn)
waveGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 50, 110)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(35, 110, 200)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 170, 240)),
})
waveGrad.Rotation = 135

local waveIcon = Instance.new("ImageLabel")
waveIcon.Size = UDim2.new(0, 30, 0, 30)
waveIcon.Position = UDim2.new(0.5, -15, 0.5, -15)
waveIcon.BackgroundTransparency = 1
waveIcon.Image = WAVE_IMG
waveIcon.ScaleType = Enum.ScaleType.Fit
waveIcon.ZIndex = 101
waveIcon.Parent = toggleBtn

local toggleDragging = false
local toggleDragStart = nil
local toggleBtnStart = nil
local toggleHasMoved = false
local DRAG_THRESHOLD = 10

toggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
        toggleDragging = true
        toggleHasMoved = false
        toggleDragStart = input.Position
        toggleBtnStart = toggleBtn.AbsolutePosition
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - toggleDragStart
        if not toggleHasMoved and delta.Magnitude > DRAG_THRESHOLD then
            toggleHasMoved = true
        end
        if toggleHasMoved then
            local parentAbs = toggleGui.AbsolutePosition
            local newX = (toggleBtnStart.X - parentAbs.X) + delta.X
            local newY = (toggleBtnStart.Y - parentAbs.Y) + delta.Y
            toggleBtn.Position = UDim2.new(0, newX, 0, newY)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if toggleDragging and (input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch) then
        toggleDragging = false
        if not toggleHasMoved then
            STATE.guiVisible = not STATE.guiVisible
            Main.Visible = STATE.guiVisible
        end
    end
end)

toggleBtn.MouseEnter:Connect(function()
    toggleStroke.Transparency = 0
end)
toggleBtn.MouseLeave:Connect(function()
    toggleStroke.Transparency = 0.3
end)

---------------------------------------------------------------
-- Player list loops
---------------------------------------------------------------
loopTPList()

---------------------------------------------------------------
-- Auto-refresh
---------------------------------------------------------------
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(2)
    if STATE.itemESP then clearItemESP(); loopItems() end
    if STATE.piggyESP then clearPiggyESP(); loopPiggy() end
    if STATE.playerESP then clearPlayerESP(); loopPlayers() end
    if STATE.fly then startFly() end
    if STATE.noclip then startNoclip() end
    if STATE.infiniteJump then setInfiniteJump(true) end
    applyWalkSpeed(STATE.walkSpeed)
end)

task.spawn(function()
    local nf = Workspace:WaitForChild("PiggyNPC", 10)
    if nf then
        nf.ChildAdded:Connect(function(c)
            if running and STATE.piggyESP and c:IsA("Model") then
                task.wait(0.5); if running and isPiggy(c) then mkPiggyESP(c) end
            end
        end)
    end
end)

---------------------------------------------------------------
-- Notification
---------------------------------------------------------------
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "🌊 Aqua Wave v2.12",
        Text = "RightControl to toggle • Drag the wave button on mobile!",
        Duration = 4,
    })
end)

---------------------------------------------------------------
-- Entrance animation
---------------------------------------------------------------
local TS = game:GetService("TweenService")
local slideUp = TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)
local fadeIn = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

Main.Position = UDim2.new(0.5, -DEF_W/2, 1, 60)

toggleBtn.Position = UDim2.new(0, -60, 1, -120)

task.spawn(function()
    task.wait(0.2)
    TS:Create(Main, slideUp, {
        Position = UDim2.new(0.5, -DEF_W/2, 0.5, -DEF_H/2)
    }):Play()
    task.wait(0.15)
    TS:Create(toggleBtn, fadeIn, {
        Position = UDim2.new(0, 16, 1, -120)
    }):Play()
end)

---------------------------------------------------------------
-- Register kill switch so a re-executed script can shut this one down
---------------------------------------------------------------
_G.AquaWaveESP = {
    Kill = function()
        running = false
        _G.AquaWaveGEN = (_G.AquaWaveGEN or 0) + 1
        stopFly()
        stopNoclip()
        stopInfiniteJump()
        clearItemESP()
        clearPiggyESP()
        clearPlayerESP()
        clearTPList()
        local g = LocalPlayer.PlayerGui:FindFirstChild("AquaWaveESP")
        if g then g:Destroy() end
        local tg = LocalPlayer.PlayerGui:FindFirstChild("AquaWaveToggle")
        if tg then tg:Destroy() end
    end,
}

print("[Aqua Wave v2.12] 🌊 Loaded")
    GetKeyBtn.MouseButton1Click:Connect(function()
        Status.Text = "Getting Link..."
        local success, link = cacheLink()
        if success then
            fSetClipboard(link)
            Status.Text = "Link Copied!"
            Status.TextColor3 = Color3.fromRGB(0, 170, 255)
        else
            Status.Text = "Error: " .. tostring(link)
        end
    end)

    -- Auto Check Saved Key
    if isfile and isfile(Config.KeyFileName) then
        local savedKey = readfile(Config.KeyFileName)
        if savedKey ~= "" then
            Status.Text = "Found saved key, verifying..."
            task.spawn(function()
                local success, msg = redeemKey(savedKey)
                if success then
                    Status.Text = "Auto-login success!"
                    Status.TextColor3 = Color3.fromRGB(0, 255, 100)
                    task.wait(0.5)
                    ScreenGui:Destroy()
                    StartMainScript()
                else
                    Status.Text = "Saved key expired or invalid."
                    Status.TextColor3 = Color3.fromRGB(255, 150, 0)
                end
            end)
        end
    end
end

-- Check if main script GUI is already open
local player = game:GetService("Players").LocalPlayer
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript() -- Run if main script is already active
    return
end

-- Initialize Key System GUI
CreateGUI()
