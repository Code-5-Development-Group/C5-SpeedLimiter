local initalNotify = false
local maxSpeed = 20
local limiterEnabled = false

-- data
local kmhValue = 3.6
local mphValue = 2.23694

local function toggleNuiFrame(shouldShow)
  SetNuiFocus(shouldShow, shouldShow)
  SendReactMessage('setVisible', shouldShow)
  SendReactMessage('setShow', shouldShow)
end

RegisterCommand('speed', function()
  toggleNuiFrame(true)
end)

RegisterNUICallback('hideFrame', function(_, cb)
  toggleNuiFrame(false)
  cb({})
end)

RegisterNUICallback('setMaxSpeed', function(data, cb)
  maxSpeed = data.maxSpeed

  toggleNuiFrame(false)

  notify('Max speed set too ' .. maxSpeed .. ' MPH')
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)

    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)

    if vehicle ~= 0 then
      if not initalNotify then
        notify('Press Y too toggle your vehicle speedlimiter.')

        initalNotify = true
      end

      if IsControlJustReleased(0, 246) then
        local toggled = not limiterEnabled

        limiterEnabled = toggled

        if not toggled then
          setSpeed(vehicle, 400)
          
          notify('Speedlimiter disabled.')
        else        
          notify('Speedlimiter enabled.')
        end
      end
    end
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1)

    while limiterEnabled and IsPedInAnyVehicle(PlayerPedId(), false)
    do
      local currentVeh = GetVehiclePedIsIn(GetPlayerPed(-1), false)

      if currentVeh ~= vehicle then
        setSpeed(currentVeh, maxSpeed)
      end

      Citizen.Wait(2500)
    end
  end
end)

function setSpeed(vehicle, _speed)
  local speed = _speed / mphValue

  local vehicleClass = GetVehicleClass(vehicle)

  -- if Config.kmh then
  --     speed = speed / Config.kmhValue
  -- else
  --     speed = speed / Config.mphValue
  -- end

  SetVehicleMaxSpeed(vehicle, speed)

  isSpeedSet = true
end
