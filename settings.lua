-- I SINCERELY DISLIKE USING UTILITIES.LUA, BUT WHATEVER.
dofile("data/scripts/lib/mod_settings.lua")
dofile("data/scripts/lib/utilities.lua")
local mod_id = "Copi.EnableGlitches"
local initialized = false
local longest = 0
---@diagnostic disable-next-line: lowercase-global
mod_settings_version = 1
---@diagnostic disable-next-line: lowercase-global
mod_settings = {{
    ---@diagnostic disable-next-line: undefined-global
    scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
    id = "Copi.EnableGlitches.MAIN",
    ui_name = "MAIN",
    ui_description = "MAIN",
}
}

local magic_numbers = {
    {
        id   = [[UI_WAND_TAG_OVERWRITES_NAME]],
        name = [[Wand Tag Naming]],
        desc = [[Items with the Wand tag will forcibly display the name "Wand"]],
        default = true
    },
    {
        id   = [[DESIGN_ALLOW_INVENTORY_CLOSING_AND_DRAGGING_GLITCH]],
        name = [[Close Inventory When Dragging]],
        desc = [[Allow the inventory to be closed while dragging items]],
        default = false
    },
    {
        id   = [[DESIGN_ALLOW_FULL_INVENTORY_SPELLS_DRAG]],
        name = [[Edit Spells Inventory]],
        desc = [[Allow spells to be moved in the inventory without Tinker With Wands Everywhere]],
        default = true
    },
    {
        id   = [[DESIGN_TELEKINESIS_GLITCH_FOR_TABLETS]],
        name = [[Tabletkinesis]],
        desc = [[Allow the item possession glitch on tablets]],
        default = true
    },
    {
        id   = [[DESIGN_TELEKINESIS_GLITCH_FOR_ITEM_PHYSICS]],
        name = [[General Itemkinesis]],
        desc = [[Allow the item possession glitch on throwable items]],
        default = false
    },
    {
        id   = [[GLITCH_ALLOW_ALT_TAB_SILLINESS]],
        name = [[Alt Tab Silliness]],
        desc = [[Allow alt tab related exploits]],
        default = false
    },
    {
        id   = [[DEBUG_DISPLAY_INTERNAL_ID_IN_PROGRESS_MENU]],
        name = [[Internal IDs in Progress]],
        desc = [[Show internal IDs in the progress menu]],
        default = false
    },
}

--[[
    BELOW: SOME CRAP. BREAKS WITHOUT IT, NOTHING I CAN DO ABOUT IT LOL LMAO.
    USING ANNOTATIONS TO SHUT UP WARNINGS.
]]
function ModSettingsGui(gui, in_main_menu)
    if not initialized then
        local len = #mod_settings
        for i = 1, #magic_numbers do
            local magic_number = magic_numbers[i]
            local length = GuiGetTextDimensions(gui, magic_number.name)
            longest = math.max(longest, length)
            mod_settings[len+i] =  {
                ---@diagnostic disable-next-line: undefined-global
                scope = MOD_SETTING_SCOPE_RUNTIME_RESTART,
                id = "Copi.EnableGlitches." .. magic_number.id,
                ui_name = magic_number.name,
                ui_description = magic_number.desc,
                default_value = magic_number.default,
                ui_fn = function(mod_id2, gui2, in_main_menu2, im_id, setting)
                    GuiLayoutBeginHorizontal(gui2, 0, 0)
                        GuiColorSetForNextWidget(gui2, 0.6, 0.6, 0.6, 0.8)
                        GuiText(gui2, 0, 0, setting.ui_name .. ": ")
                        local old = ModSettingGet(setting.id)
                        if old == nil then old = setting.default_value end
                        local lmb, rmb = GuiButton(gui2, im_id, (longest+2)-length, 0, old and "[True ]" or "[False]")
                        GuiTooltip(gui, setting.ui_name, setting.ui_description)
                        if lmb then
                            ModSettingSet(setting.id, not old)
                        elseif rmb then
                            ModSettingSet(setting.id, setting.default_value)
                        end
                    GuiLayoutEnd(gui2)
                end
            }
        end
        initialized = true
    end
    ---@diagnostic disable-next-line: lowercase-global
    screen_width, screen_height = GuiGetScreenDimensions(gui)
    ---@diagnostic disable-next-line: undefined-global
    mod_settings_gui(mod_id, mod_settings, gui, in_main_menu)
end

function ModSettingsGuiCount()
    ---@diagnostic disable-next-line: undefined-global
    return mod_settings_gui_count(mod_id, mod_settings)
end

function ModSettingsUpdate(init_scope)
    ---@diagnostic disable-next-line: undefined-global
    local old_version = mod_settings_get_version(mod_id)
    ---@diagnostic disable-next-line: undefined-global
    mod_settings_update(mod_id, mod_settings, init_scope)
end
