---
--- Created by fox.
--- DateTime: 2018/3/14 21:40
---
--[[
    使用这个框架将会注册以下几个全局变量，请注意不要冲突
        class
        import
--]]

class = require("nodeFrame.class");
import = require("nodeFrame.import");

local Node = require("nodeFrame.core.Display.Node");
local Drawable = require("nodeFrame.core.Display.Drawable");
--local Graphics = require("nodeFrame.core.Display.Graphics");

local Loader = require("nodeFrame.core.Net.Loader");

local Timer = require("nodeFrame.core.Utils.Timer");
local Tween = require("nodeFrame.core.Utils.Tween");
local Ease = require("nodeFrame.core.Utils.Ease");

local Label = require("nodeFrame.ui.Label");
local Sprite = require("nodeFrame.ui.Sprite");


local function update(dt)
    Timer._updateAll(dt);
    Tween._update(dt);
end

local function draw()
end

local function resize( w, h)
end

local function wheelmoved( x, y )
end

local function touchmoved( id, x, y, dx, dy, pressure )
end
local function touchpressed( id, x, y, dx, dy, pressure )
end
local function touchreleased( id, x, y, dx, dy, pressure )
end

local function mousereleased(x, y, button, istouch)
end
local function mousepressed(x, y, button, istouch)
end
local function mousemoved( x, y, dx, dy, istouch)
end

local function keypressed(key, scancode, isrepeat)
end
local function keyreleased(key, scancode)
end

local function focus(b)
end

local export = {
    version = 0.1,
    versionName = "node",

    Node = Node,
    Drawable = Drawable,
    Loader = Loader,
    Timer = Timer,
    Tween = Tween,
    Ease = Ease,

    Label = Label,
    Sprite = Sprite,

    --@public
    stage = nil,

    --@public
    register = nil,
    update = update,
    draw = draw,
    focus = focus,
    resize = resize,
    keypressed = keypressed,
    keyreleased = keyreleased,
    mousemoved = mousemoved,
    mousepressed = mousepressed,
    mousereleased = mousereleased,
    touchmoved = touchmoved,
    touchpressed = touchpressed,
    touchreleased = touchreleased,
    wheelmoved = wheelmoved,

}

local function register()
    local funcs = {"update","draw","focus","resize","keypressed","keyreleased","mousemoved","mousepressed","mousereleased","touchmoved","touchreleased","touchpressed","wheelmoved"};
    for _, name in pairs(funcs) do
        love[name] = export[name];
    end
    return export;
end

export.register = register;

return export;