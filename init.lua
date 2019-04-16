local modules = (...) and (...):gsub('%.init$', '') .. ".modules." or ""

local node = {
    _LICENSE = "NODE is distributed under the terms of the MIT license. See LICENSE.md.",
    _URL = "https://github.com/imfox/love2d-node",
    _VERSION = "0.3",
    _DESCRIPTION = ""
}

local files = {
    "Utils",
    "Class",
    "Handler",
    "Event",
    "EventDispatcher",
    "Node",
}

for _, file in ipairs(files) do
    node[file] = require(modules .. file)
end

return node