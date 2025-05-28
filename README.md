# Chat Moderation (GMod Lua)
[![Lua](https://img.shields.io/badge/Lua-Gmod-blue)](https://www.lua.org/manual/5.4/)

This script in **Lua** is designed to be used on a **Garry's Mod** server to automatically moderate player messages in the chat. It detects certain banned words and applies an automatic sanction (temporary ban) to the offending player.

---

## 📌 Banned Words List

```lua
local forbiddenwords = {"example 1" , "example 2"}
```

> A table (list) containing the banned words in the chat. You can add or remove words as needed for your server.

---

## 🧠 Player Message Detection

```lua
hook.Add("PlayerSay", "ModérationChat", function(ply, text, team)
```

> This hook is triggered every time a player sends a message in the chat (`PlayerSay`).  
It receives three arguments:
- `ply`: the player
- `text`: the message
- `team`: whether the message is team-only

---

## 🔎 Content Check

```lua
local texteMinuscules = string.lower(text)
```

> Converts the player's message to lowercase to make word matching case-insensitive.

```lua
for _, motInterdit in ipairs(forbiddenwords) do
    if string.find(lowercasetext, wordForbidden) then
```

> Loops through the list of banned words and checks if any are found in the message.

---

## 🚫 Automatic Sanction

Two cases are handled depending on the admin system used by the server:

### 1. ULX/ULib

```lua
if ULib and ULib.ban then
    local raison = "Chat-Moderator ---> You have been automatically banned by the server for your behavior in the chat."
    ULib.ban(ply, 120, reason)
```

> The player is **temporarily banned for 120 minutes** using ULib.

### 2. SAM Admin

```lua
elseif SAM then
    local raison = "Chat-Moderator ---> You have been automatically banned by the server for your behavior in the chat."
    game.ConsoleCommand("!samtempban " .. ply:SteamID() .. " 120 " .. raison .. "\n")
```

> The player is banned using the SAM command system.

---

## 🧹 Message Suppression

```lua
return ""
```

> The message is blocked from being displayed in the public chat if a banned word is detected.

---

## ✅ Summary

This script allows you to:
- **Automatically filter** chat messages containing banned words.
- **Automatically apply sanctions** (temporary bans).
- **Block offensive messages** from appearing in chat.

---

## 🛠️ Customization

- Add your own banned words to the `forbiddenwords` table.
- Change the ban duration (120 minutes in this example).
- Modify the reason text according to your server’s rules.

