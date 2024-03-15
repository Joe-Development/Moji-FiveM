local function SanString(message)
    for emoji, replacement in pairs(Config.emojis) do
        message = message:gsub(emoji, replacement)
    end
    return message
end

AddEventHandler('chatMessage', function(source, name, message)
    local sanitizedMessage = SanString(message)
    TriggerClientEvent('chatMessage', -1, name, { 255, 255, 255 }, sanitizedMessage)
    CancelEvent()
end)
