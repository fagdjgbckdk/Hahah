local p=game.Players.LocalPlayer
local c=p.Character or p.CharacterAdded:Wait()
local g=Instance.new("ScreenGui",p.PlayerGui)
local f=Instance.new("Frame",g)f.Size=UDim2.new(0,140,0,80)f.Position=UDim2.new(0,20,0,100)f.BackgroundColor3=Color3.new()
local n={"Invisible","NoClip"}local s={false,false}
for i=1,2 do local b=Instance.new("TextButton",f)b.Size=UDim2.new(0,120,0,30)b.Position=UDim2.new(0,10,0,(i-1)*35+10)b.Text=n[i]..": OFF"
b.BackgroundColor3=Color3.new(0.4,0,0)b.TextColor3=Color3.new(1,1,1)
b.MouseButton1Click:Connect(function()
s[i]=not s[i]b.Text=n[i]..": "..(s[i]and"ON"or"OFF")b.BackgroundColor3=s[i]and Color3.new(0,0.5,0)or Color3.new(0.4,0,0)
if i==1 then for _,v in pairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"or v:IsA("Decal")then v.Transparency=s[i]and 1 or 0 end end end
end)end
game:GetService("RunService").Heartbeat:Connect(function()
for _,v in pairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"then v.CanCollide=not s[2] end end
end)
