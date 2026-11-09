-- active-workspace: shows the workspace that is active on this bar's display.
--   Click        → popout listing this display's workspaces (click one to switch)
--   Scroll       → previous / next workspace
--   Right-click  → back-and-forth (previously active workspace)

local look = require("../lib/look")

-- Find the workspace currently shown on this bar's display.
-- 1. The focused workspace, if it lives on this display.
-- 2. Otherwise the workspace that is visible here (other monitors).
local function activeWorkspace(ctx)
    local bar = ctx.data.bar
    local list = (bar and bar.workspaces) or {}

    for _, ws in ipairs(list) do
        if ws.focused then
            return ws, list
        end
    end

    local visible = {}
    for _, ws in ipairs(ctx.data.workspaces or {}) do
        if ws.visible then
            visible[ws.id] = true
        end
    end
    for _, ws in ipairs(list) do
        if visible[ws.id] then
            return ws, list
        end
    end

    return nil, list
end

-- Total managed windows in a BarWorkspace (items are grouped by app).
local function windowCount(ws): number
    local n = 0
    for _, item in ipairs(ws.windows or {}) do
        n += item.count or 0
    end
    return n
end

local function option(ctx, name: string, default: boolean): boolean
    local v = ctx.select("settings", name)
    if v == nil then
        return default
    end
    return v == true
end

-- Scroll handler with a small cooldown so a trackpad flick
-- doesn't fly through every workspace.
local function onScroll(ctx, event)
    local now = os.clock()
    if (ctx.state.lastScroll or 0) + 0.25 > now then
        return
    end
    local dy = event.dy or 0
    if dy == 0 then
        return
    end
    ctx.state.lastScroll = now
    if option(ctx, "invertScroll", false) then
        dy = -dy
    end
    omniwm.run(dy > 0 and "switch-workspace prev" or "switch-workspace next")
end

function render(ctx)
    local style = ctx.data.bar.style
    if style == nil then
        return ui.box{ w = 0, h = 0 }
    end

    local ws = activeWorkspace(ctx)
    local fallback = ctx.data.workspace
    local name = (ws and ws.name) or (fallback ~= "" and fallback) or "—"
    local focusedHere = ws ~= nil and ws.focused
    local scale = look.scale(ctx)
    local vertical = style.vertical

    -- Optional: accent-colored name and icon on the display that holds focus.
    -- nil keeps the bar's default text color, like the bundled widgets.
    local highlight = if focusedHere and option(ctx, "highlightFocused", false) then "accent" else nil

    local props = {
        key = "active-workspace",
        help = "Workspace " .. name,
        onClick = ui.popout,
        onRightClick = "switch-workspace back-and-forth",
        onScroll = onScroll,
    }

    if option(ctx, "showIcon", true) and not vertical then
        props.symbol = "square.grid.2x2"   -- drawn by look.bar at the style's symbol size
        props.tint = highlight
    end

    props[#props + 1] = look.text{
        text = name,
        size = look.px(ctx, "text"),
        weight = "medium",
        -- nil color = the bar's default text color (and your custom one, if set)
        color = highlight,
    }

    if ws and option(ctx, "showCount", true) and not vertical then
        local n = windowCount(ws)
        if n > 0 then
            props[#props + 1] = look.text{
                text = tostring(n),
                style = "mono",
                size = 11 * scale,
                color = "secondaryForeground",
            }
        end
    end

    if focusedHere and option(ctx, "showApp", false) and not vertical and ctx.data.app ~= "" then
        props[#props + 1] = look.text{ text = ctx.data.app, size = 13 * scale, color = "secondaryForeground" }
    end

    -- look.bar sets height, padding, radius, hover and (depending on the style)
    -- capsule fill + border or the subtle background, exactly like bundled widgets.
    return look.bar(ctx, props)
end

function popout(ctx)
    local active, list = activeWorkspace(ctx)
    local width = look.panelWidth("workspaces")
    local rows = {}

    for _, ws in ipairs(list) do
        local isActive = active ~= nil and ws.id == active.id
        local n = windowCount(ws)
        rows[#rows + 1] = ui.row{
            key = "ws-" .. ws.id,
            w = width - 28,
            gap = 10,
            pad = 8,
            radius = look.radius(8),
            fill = isActive and "foreground/0.08" or nil,
            hover = look.hover,
            -- Lets OmniWM attach its native workspace menu and window drops
            target = ws.id,
            menu = true,
            drop = true,
            onClick = "switch-workspace " .. ws.id,
            look.glyph{
                name = isActive and "circle.fill" or "circle",
                size = 8,
                color = isActive and "accent" or "secondaryForeground",
            },
            look.text{
                text = ws.name,
                grow = 1,
                size = 13,
                weight = isActive and "semibold" or nil,
                color = isActive and "foreground" or "secondaryForeground",
            },
            look.text{
                text = n > 0 and tostring(n) or "",
                style = "mono",
                size = 11,
                color = "secondaryForeground",
            },
        }
    end

    if #list == 0 then
        rows[#rows + 1] = look.text{ text = "No workspaces on this display", role = "secondary" }
    end

    local title = ctx.data.bar and ctx.data.bar.monitor or "Workspaces"
    return look.panel(ctx, { look.heading(title, width - 28), look.list(rows) })
end
