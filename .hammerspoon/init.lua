require("hs.ipc")

function ssidChangedCallback()
    newSSID = hs.wifi.currentNetwork()

    if newSSID ~= lastSSID then
--        hs.alert.show("WiFi changed, muting speakers", 5)
        hs.audiodevice.findOutputByName("MacBook Pro Speakers"):setOutputVolume(20)
        hs.audiodevice.findOutputByName("MacBook Pro Speakers"):setOutputMuted(true)
    end

    lastSSID = newSSID
end

wifiWatcher = hs.wifi.watcher.new(ssidChangedCallback)
wifiWatcher:start()
