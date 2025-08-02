local p=game.Players.LocalPlayer c=p.Character or p.CharacterAdded:Wait() local hrp=c:WaitForChild("HumanoidRootPart")
local g=Instance.new("ScreenGui",p.PlayerGui)local f=Instance.new("Frame",g)f.Size=UDim2.new(0,220,0,150)f.Position=UDim2.new(0,350,0,100)f.BackgroundColor3=Color3.fromRGB(30,30,30)
local names={"Fly","Invisible","NoClip"}local s={false,false,false}local bv=Instance.new("BodyVelocity",hrp)bv.MaxForce=Vector3.one*9e9 bv.P=1250 bv.Velocity=Vector3.zero bv.Enabled=false
for i=1,3 do local b=Instance.new("TextButton",f)b.Size=UDim2.new(0,200,0,30)b.Position=UDim2.new(0,10,0,10+(i-1)*40)b.Text=names[i]..": OFF"b.BackgroundColor3=Color3.fromRGB(100,0,0)b.TextColor3=Color3.new(1,1,1)
b.MouseButton1Click:Connect(function()s[i]=not s[i]b.Text=names[i]..": "..(s[i]and"ON"or"OFF")b.BackgroundColor3=s[i]and Color3.fromRGB(0,150,0)or Color3.fromRGB(100,0,0)
if i==2 then for _,v in pairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"or v:IsA("Decal")then v.Transparency=s[i]and 1 or 0 end end end end)end
game:GetService("RunService").RenderStepped:Connect(function()if s[1]then local cf=workspace.CurrentCamera.CFrame local mv=Vector3.zero local u=game:GetService("UserInputService")
if u:IsKeyDown(Enum.KeyCode.W)then mv+=cf.LookVector end if u:IsKeyDown(Enum.KeyCode.S)then mv-=cf.LookVector end if u:IsKeyDown(Enum.KeyCode.A)then mv-=cf.RightVector end
if u:IsKeyDown(Enum.KeyCode.D)then mv+=cf.RightVector end if u:IsKeyDown(Enum.KeyCode.Space)then mv+=cf.UpVector end if u:IsKeyDown(Enum.KeyCode.LeftControl)then mv-=cf.UpVector end
bv.Enabled=true bv.Velocity=mv.Magnitude>0 and mv.Unit*100 or Vector3.zero else bv.Enabled=false end for _,v in pairs(c:GetDescendants())do if v:IsA("BasePart")and v.Name~="HumanoidRootPart"then v.CanCollide=not s[3] end end end)
p.CharacterAdded:Connect(function(chr)c=chr hrp=c:WaitForChild("HumanoidRootPart")bv=Instance.new("BodyVelocity",hrp)bv.MaxForce=Vector3.one*9e9 bv.P=1250 bv.Velocity=Vector3.zero end)
