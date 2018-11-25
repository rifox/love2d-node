local Drawable = require("Node.Core.Display.Drawable");
local Utils = require("Node.Core.Utils.Utils");
local IView = {};
local uiClass = {}

local function getUIViewClassName(source)
    return string.gsub(source, ".ui", "UI"):gsub("\\", "_"):gsub("/", "_"):gsub('%.', "_");
end

---@param type string
local function getInstance(type, data)
    if type == "UIView" and data.type == "UIView" then
        type = getUIViewClassName(data.source);
    end
    if uiClass[type] then
        return uiClass[type].new();
    else
        print("error: no exist class ", type);
    end
    return Drawable.new()
end

---@param table table
---@param node Node_Core_Display_Drawable
---@param root Node_Core_Display_Drawable
---@return Node_Core_Display_Drawable
local function createComp(table, node, root)
    if type(table) == "string" then
        table = loadstring("return " .. table)();
    end
    local props = table.props;
    if not node then
        node = getInstance(table.type, table);
    end

    local childs = table.child;
    if childs then
        for _, data in ipairs(childs) do
            if node.ItemRender and (data.props.name == "render" or data.props.renderType == "render") then
                node.itemRender = data;
            elseif data.type == "Graphic" then

            else
                local child = createComp(data, nil, root);
                node:addChild(child);
            end
        end

    end

    if props then
        for prop, v in pairs(props) do
            if prop == "var" and root then
                root[v] = node;
            else
                node[prop] = v;
            end
        end

    end

    return node;
end

---@param className string
---@param class table
local function regComponent(className, class)
    uiClass[className] = class;
end

IView.createComp = createComp;
IView.regComponent = regComponent;

return IView;