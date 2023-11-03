local GSMConfiguration = {}

local _groupFT = "groupFunctionTable"
local _deviceFT = "deviceFunctionTable"
local _detectionTimeout = "detectionTimeout"
local _readyForAutomatedHandlingCallback = "readyForAutomatedHandlingCallback"
local _disabledResources = "disabledResources"

GSMConfiguration.__groupFunctionTableKey      = _groupFT
GSMConfiguration.__deviceFunctionTableKey     = _deviceFT
GSMConfiguration.__detectionTimeoutKey        = _detectionTimeout
GSMConfiguration.__readyForAutomatedHandlingCallbackKey = _readyForAutomatedHandlingCallback
GSMConfiguration.__disabledResourcesKey       = _disabledResources

for key, value in pairs(GSMConfiguration) do
    print(key.."=="..value)
end
--[[
    ‘由上可知’
    GSMConfiguration = {
        __readyForAutomatedHandlingCallbackKey : "readyForAutomatedHandlingCallback",
        __disabledResourcesKey : "disabledResources",
        __detectionTimeoutKey : "detectionTimeout",
        __groupFunctionTableKey : "groupFunctionTable",
        __deviceFunctionTableKey : "deviceFunctionTable"
    }
]]

local groupFunctionTable = {
    setup = "groupSetup",
    getSlots = "unitDetection",
    start = "groupStart",
    stop = "groupStop",
    loopAgain = "loopAgain",
    groupShouldExit = "groupShouldExit",
    teardown = "teardownGroupPlugins"
}

local deviceFunctionTable = {
    setup = "deviceStart",
    scheduleDAG = "scheduleDAG",
    scheduleFinalDAG = "scheduleFinalDAG",
    teardown = "deviceTeardown"
}



------------------- Internal APIs
local registeredConfiguration = {}

registeredConfiguration[_groupFT] = groupFunctionTable
registeredConfiguration[_deviceFT] = deviceFunctionTable
