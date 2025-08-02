local p=game.Players.LocalPlayer
local c=p.Character or p.CharacterAdded:Wait()
local hrp=c:WaitForChild("HumanoidRootPart")
local gui=Instance.new("ScreenGui",p:WaitForChild("PlayerGui"))
local f=Instance.new("Frame",gui)f.Size=UDim2.new(0,150,0,120)f.Position=UDim2.new(0,20,0,100)f.BackgroundColor3=Color3.new()
local t={"Fly","NoClip","Invisible"}local s={false,false,false}local bv=Instance.new("BodyVelocity")bv.MaxForce=Vector3.one*9e9 bv.P=1250 bv.Velocity=Vector3.zero
for i=1,3 do local b=Instance.new("TextButton",f)b.Size=UDim2.new(0,130,0,30)b.Position=UDim2.new(0,10,0,(i-1)*35+10)b.Text=t[i]..": OFF"b.BackgroundColor3=Color3.new(0.4,0,0)b.TextColor3=Color3.new(1,1,1)
b.MouseButton1Click:Connect(function()
s[i]=not s[i]b.Text=t[i]..": "..(s[i]and"ON"or"OFF")b.BackgroundColor3=s[i]and Color3.new(0,0.5,0)or Color3.new(0.4,0,0)
if i==1 then bv.Parent=s[1]and hrp or nil end
if i==3 then for _,v in ipairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"or v:IsA("Decal")then v.Transparency=s[3]and 1 or 0 end end end
end)end
game:GetService("RunService").RenderStepped:Connect(function()
if s[1]then local cam=workspace.CurrentCamera local uis=game:GetService("UserInputService")local dir=Vector3.zero
if uis:IsKeyDown(Enum.KeyCode.W)then dir+=cam.CFrame.LookVector end
if uis:IsKeyDown(Enum.KeyCode.S)then dir-=cam.CFrame.LookVector end
if uis:IsKeyDown(Enum.KeyCode.A)then dir-=cam.CFrame.RightVector end
if uis:IsKeyDown(Enum.KeyCode.D)then dir+=cam.CFrame.RightVector end
if uis:IsKeyDown(Enum.KeyCode.Space)then dir+=cam.CFrame.UpVector end
if uis:IsKeyDown(Enum.KeyCode.LeftControl)then dir-=cam.CFrame.UpVector end
bv.Velocity=dir.Magnitude>0 and dir.Unit*80 or Vector3.zero end
for _,v in ipairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"then v.CanCollide=not s[2] end end
end)
p.CharacterAdded:Connect(function(ch)wait(1)c=ch hrp=c:WaitForChild("HumanoidRootPart")bv=Instance.new("BodyVelocity")bv.MaxForce=Vector3.one*9e9 bv.P=1250 bv.Velocity=Vector3.zero if s[1]then bv.Parent=hrp end end)
