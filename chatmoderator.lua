

-- List of prohibited words
local forbiddenwords = {"example 1" , "example 2"}

-- Function to detect player messages
hook.Add("PlayerSay", "ModérationChat", function(ply, text, team)
  
    local texteMinuscules = string.lower(text)

    -- Checks if the word appears in the table
    for _, motInterdit in ipairs(forbiddenwords) do
        if string.find(texteMinuscules, motInterdit) then
            -- Use the correct function according to your admin mode
            if ULib and ULib.ban then
                -- Use ulx
                local raison = "Chat-Moderator ---> You have been automatically banned by the server for your behavior in the chat."
                ULib.ban(ply, 120, raison)
            elseif SAM then
           --Use sam admin
                local raison = "Chat-Moderator ---> You have been automatically banned by the server for your behavior in the chat."
                game.ConsoleCommand("!samtempban " .. ply:SteamID() .. " 120 " .. raison .. "\n")
            end

            -- Make sure messages are not displayed 
            return ""
        end
    end
end)
