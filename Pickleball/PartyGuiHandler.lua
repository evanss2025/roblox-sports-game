local open = script.Parent:WaitForChild("Open")
local main = script.Parent:WaitForChild("Main"); main.Visible = false
local close = main:WaitForChild("Close")

local rs = game.ReplicatedStorage:WaitForChild("PartyRS")
local re = rs:WaitForChild("RE")
local parties = rs:WaitForChild("Parties")

local inParty = nil


function formatSeconds(totalSecs)
	
	local mins = tostring(math.floor(totalSecs / 60))
	local secs = tostring(totalSecs - (mins * 60))
	
	if string.len(mins) < 2 then
		mins = "0" .. mins
	end
	if string.len(secs) < 2 then
		secs = "0" .. secs
	end
	
	local formatted = mins .. ":" .. secs
	return formatted
end

function displayPage(requestedPage)
	for i, page in pairs(main:GetChildren()) do
		
		if page:IsA("Frame") then
			if page.Name == requestedPage.Name then
				page.Visible = true
			else
				page.Visible = false
			end
		end
	end
end

function getAvatar(playerName)
	if game.Players:FindFirstChild(playerName) then
		local uid = game.Players[playerName].UserId
		
		local image = game.Players:GetUserThumbnailAsync(uid, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
		return image
	end
end

function displayParties()
	for i, partyFrame in pairs(main.PartiesPage.PartiesList:GetChildren()) do
		if partyFrame:IsA("Frame") then
			partyFrame:Destroy()
		end
	end
	
	local partyFrames = {}
	
	for i, party in pairs(parties:GetChildren()) do
		local partyFrame = script.PartyPageParty:Clone()
		table.insert(partyFrames, partyFrame)
		
		local function updatePartyFrame()			
			partyFrame:WaitForChild("NameLabel").Text = party.Name
			
			local leader = nil
			local members = {}
			
			for x, member in pairs(party.Members:GetChildren()) do
				if member:FindFirstChild("Leader") then
					leader = member.Name
				else
					table.insert(members, member.Name)
				end
			end
			
			partyFrame.Leader.Image = getAvatar(leader)
			
			table.sort(members, function(a, b)
				return a < b
			end)
			for x, member in pairs(members) do
				local memberImage = script.PartyPageMember:Clone()
				memberImage.Image = getAvatar(member)
				
				memberImage.Parent = partyFrame.MembersList
			end
			
			partyFrame.NumberOfMembers.Text = #party.Members:GetChildren() .. "/" .. party.MaximumMembers.Value
		end
		updatePartyFrame()
		party.Members.ChildAdded:Connect(updatePartyFrame)
		party.Members.ChildRemoved:Connect(updatePartyFrame)
		
		partyFrame.Join.MouseButton1Click:Connect(function()
			re:FireServer("JOIN", party.Name)
		end)
	end
	
	table.sort(partyFrames, function(a, b)
		return a.NameLabel.Text < b.NameLabel.Text
	end)
	for i, partyFrame in pairs(partyFrames) do
		partyFrame.Parent = main.PartiesPage.PartiesList
	end
	
	displayPage(main.PartiesPage)
end

function displayInParty(party)
	local partyFolder = typeof(party) == "string" and parties[party] or party
	
	local function updatePartyFrame()
		for i, memberFrame in pairs(main.InPartyPage.MembersList:GetChildren()) do
			if memberFrame:IsA("Frame") then
				memberFrame:Destroy()
			end
		end
		
		main.InPartyPage.NameLabel.Text = partyFolder.Name
		
		local leader = nil
		local members = {}
		
		for i, member in pairs(partyFolder.Members:GetChildren()) do
			if member:FindFirstChild("Leader") then
				leader = member.Name
			else
				table.insert(members, member.Name)
			end
		end
		table.sort(members, function(a, b)
			return a < b
		end)
		
		local leaderFrame = script.InPartyPageMember:Clone()
		leaderFrame.NameLabel.Text = leader
		leaderFrame.Avatar.Image = getAvatar(leader)
		leaderFrame.Kick.Visible = false
		
		leaderFrame.Parent = main.InPartyPage.MembersList
		
		if leader == game.Players.LocalPlayer.Name then
			leaderFrame.BackgroundColor3 = Color3.fromRGB(244, 236, 193)
			main.InPartyPage.Queue.BackgroundColor3 = Color3.fromRGB(67, 168, 87)
		else
			main.InPartyPage.Queue.BackgroundColor3 = Color3.fromRGB(172, 167, 165)
		end
		
		for i, member in pairs(members) do
			local memberFrame = script.InPartyPageMember:Clone()
			
			memberFrame.NameLabel.Text = member
			memberFrame.Avatar.Image = getAvatar(member)
			memberFrame.Leader.Visible = false
			
			if member == game.Players.LocalPlayer.Name then
				memberFrame.BackgroundColor3 = Color3.fromRGB(244, 236, 193)
			end
			
			if leader == game.Players.LocalPlayer.Name then
				memberFrame.Kick.Visible = true
				
				memberFrame.Kick.MouseButton1Click:Connect(function()
					re:FireServer("KICK", member)
				end)
			end
			
			memberFrame.Parent = main.InPartyPage.MembersList
		end
	end
	updatePartyFrame()
	party.Members.ChildAdded:Connect(updatePartyFrame)
	party.Members.ChildRemoved:Connect(updatePartyFrame)
	
	displayPage(main.InPartyPage)
	
	while inParty == party do
		if party:FindFirstChild("IN QUEUE") then
			main.InPartyPage.Queue.Text = formatSeconds(party["IN QUEUE"].Value)
		elseif party:FindFirstChild("NOT ENOUGH") then
				main.InPartyPage.Queue.Text = "Not enough players"
			
		else
			main.InPartyPage.Queue.Text = "Queue"
		end
		task.wait(0.2)
	end
end

function displayCreateParty()
	displayPage(main.CreatePage)
	
end


open.MouseButton1Click:Connect(function()
	
	if main.Visible == false then
		main.Visible = true
		
		if inParty then
			displayInParty(inParty)
		else
			displayParties()
		end
		
	else
		main.Visible = false
	end
end)
close.MouseButton1Click:Connect(function()
	main.Visible = false
end)


main.PartiesPage.Create.MouseButton1Click:Connect(function()
	displayCreateParty()
end)

main.CreatePage.Back.MouseButton1Click:Connect(function()
	displayParties()
end)

main.CreatePage.singlesButton.MouseButton1Click:Connect(function()
	local maxMembers = 2
	if maxMembers then

		re:FireServer("CREATE", maxMembers)
	end
end)

main.CreatePage.doublesButton.MouseButton1Click:Connect(function()
	local maxMembers = 4
	if maxMembers then

		re:FireServer("CREATE", maxMembers)
	end
end)


main.InPartyPage.Leave.MouseButton1Click:Connect(function()
	re:FireServer("LEAVE")
end)

main.InPartyPage.Queue.MouseButton1Click:Connect(function()
	re:FireServer("QUEUE")
end)


re.OnClientEvent:Connect(function(instruction, party)
	
	if instruction == "JOIN" then
		inParty = party
		displayInParty(party)
		
	elseif instruction == "LEAVE" then
		inParty = nil
		displayParties()
	end
end)
