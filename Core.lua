getgenv().GetJointsAttachedToInstance = function(Instance)
    local Joints = {}
    local Workspace = game:GetService("Workspace")
    for _,v in pairs(Workspace:GetDescendants()) do
        if v:IsA("JointInstance") and not Joints[v] and v.Part0 == Instance or v.Part1 == Instance then
            table.insert(Joints, v)
        elseif v:IsA("JointInstance") and not Joints[v] and v.Part0 ~= Instance and v.Part1 ~= Instance then
            for _,k in pairs(Instance:GetConnectedParts()) do
                if k:FindFirstChild(tostring(v)) then
                    table.insert(Joints, k:FindFirstChild(tostring(v)))
                end
            end
        end
    end
    return Joints
end
