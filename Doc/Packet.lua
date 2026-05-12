pingT = false
packetsV = 100
stpon = 300
ServerLags:AddToggle("TogglePacketLag", {
    Text = "Lag Server [Packet]",
    Default = false,

    Callback = function(Value)
        pingT = Value

        if pingT then
            task.spawn(function()
                while pingT do
                    pcall(function()

                        local ping = game:GetService("Stats")
                            .Network.ServerStatsItem["Data Ping"]
                            :GetValue()

                        if ping >= stpon then
                            return
                        end

                        rs.GrabEvents.ExtendGrabLine:FireServer(
                            string.rep(
                                "9223372036854776000-9223372036854776000-9223372036854776000-9223372036854776000",
                                packetsV
                            )
                        )

                    end)

                    task.wait()
                end
            end)
        end
    end
})
ServerLags:AddSlider("SliderPacketLag", {
    Text = "Packet AmountData",
    Min = 10,
    Max = 3000,
    Default = 100,
    Callback = function(Value)
        packetsV = Value
    end    
})
ServerLags:AddSlider("Stopinms", {
    Text = "Stop on",
    Min = 90,
    Max = 1000,
    Suffix = 'ms',
    Default = 300,
    Callback = function(Value)
        stpon = Value
    end    
})
