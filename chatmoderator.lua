

-- List of prohibited words
local forbiddenwords = {"example 1" , "example 2"}

-- Function to detect player messages
hook.Add("PlayerSay", "ModérationChat", function(ply, text, team)
  
    local lowercasetext = string.lower(text)

    -- Checks if the word appears in the table
    for _, wordForbidden in ipairs(forbiddenwords) do
        if string.find(lowercasetext, wordForbidden) then
            -- Use the correct function according to your admin mode
            if ULib and ULib.ban then
                -- Use ulx
                local reason = "Chat-Moderator ---> You have been automatically banned by the server for your behavior in the chat."
                ULib.ban(ply, 120, reason)
            elseif SAM then
           --Use sam admin
                local reason = "Chat-Moderator ---> You have been automatically banned by the server for your behavior in the chat."
                game.ConsoleCommand("!samtempban " .. ply:SteamID() .. " 120 " .. reason .. "\n")
            end

            -- Make sure messages are not displayed 
            return ""
        end
    end
end)
