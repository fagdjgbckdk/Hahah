local p=game.Players.LocalPlayer c=p.Character or p.CharacterAdded:Wait() hrp=c:WaitForChild("HumanoidRootPart")
local g=Instance.new("ScreenGui",p:WaitForChild("PlayerGui"))local f=Instance.new("Frame",g)f.Size=UDim2.new(0,150,0,120)f.Position=UDim2.new(0,20,0,100)f.BackgroundColor3=Color3.new()
local n={"Fly","NoClip","Invisible"}local s={false,false,false}
local bv=Instance.new("BodyVelocity")local bg=Instance.new("BodyGyro")bv.MaxForce=Vector3.one*9e9 bv.P=1250 bv.Velocity=Vector3.zero bg.MaxTorque=Vector3.one*9e9 bg.P=3000 bg.CFrame=CFrame.new()
for i=1,3 do local b=Instance.new("TextButton",f)b.Size=UDim2.new(0,130,0,30)b.Position=UDim2.new(0,10,0,(i-1)*35+10)b.Text=n[i]..": OFF"b.BackgroundColor3=Color3.new(0.4,0,0)b.TextColor3=Color3.new(1,1,1)
b.MouseButton1Click:Connect(function()s[i]=not s[i]b.Text=n[i]..": "..(s[i]and"ON"or"OFF")b.BackgroundColor3=s[i]and Color3.new(0,0.5,0)or Color3.new(0.4,0,0)
if i==1 then if s[i]then bv.Parent=hrp bg.Parent=hrp else bv.Parent=nil bg.Parent=nil end end
if i==3 then for _,v in pairs(c:GetDescendants())do if v:IsA("BasePart")or v:IsA("Decal")then v.LocalTransparencyModifier=s[i]and 1 or 0 end end end
end)end
game:GetService("RunService").RenderStepped:Connect(function()
if s[1]then local cf=workspace.CurrentCamera.CFrame local mv=Vector3.zero local uis=game:GetService("UserInputService")
if uis:IsKeyDown(Enum.KeyCode.W)then mv+=cf.LookVector end if uis:IsKeyDown(Enum.KeyCode.S)then mv-=cf.LookVector end
if uis:IsKeyDown(Enum.KeyCode.A)then mv-=cf.RightVector end if uis:IsKeyDown(Enum.KeyCode.D)then mv+=cf.RightVector end
if uis:IsKeyDown(Enum.KeyCode.Space)then mv+=cf.UpVector end if uis:IsKeyDown(Enum.KeyCode.LeftControl)then mv-=cf.UpVector end
bv.Velocity=mv.Magnitude>0 and mv.Unit*100 or Vector3.zero bg.CFrame=cf end
for _,v in pairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"then v.CanCollide=not s[2] end end
end)
p.CharacterAdded:Connect(function(ch)c=ch hrp=c:WaitForChild("HumanoidRootPart")end)
