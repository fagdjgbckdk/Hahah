local c=game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
game:GetService("RunService").Heartbeat:Connect(function()
    for _,v in pairs(c:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end)
