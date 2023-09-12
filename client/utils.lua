function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

function notify(text)
  SetNotificationTextEntry("STRING")
  AddTextComponentString(text)
  DrawNotification(true, true)
end
