function OnModPreInit()
    local path = "mods/Copi.EnableGlitches/virtual/magic.xml"
    ModTextFileSetContent(path, table.concat{
        "<MagicNumbers\n",
        [[UI_WAND_TAG_OVERWRITES_NAME="]],                          (ModSettingGet("Copi.EnableGlitches.UI_WAND_TAG_OVERWRITES_NAME") or false)                         and "1" or "0", "\"\n",
        [[DESIGN_ALLOW_INVENTORY_CLOSING_AND_DRAGGING_GLITCH="]],   (ModSettingGet("Copi.EnableGlitches.DESIGN_ALLOW_INVENTORY_CLOSING_AND_DRAGGING_GLITCH") or false)  and "1" or "0", "\"\n",
        [[DESIGN_ALLOW_FULL_INVENTORY_SPELLS_DRAG="]],              (ModSettingGet("Copi.EnableGlitches.DESIGN_ALLOW_FULL_INVENTORY_SPELLS_DRAG") or true)              and "1" or "0", "\"\n",
        [[DESIGN_TELEKINESIS_GLITCH_FOR_TABLETS="]],                (ModSettingGet("Copi.EnableGlitches.DESIGN_TELEKINESIS_GLITCH_FOR_TABLETS") or true)                and "1" or "0", "\"\n",
        [[DESIGN_TELEKINESIS_GLITCH_FOR_ITEM_PHYSICS="]],           (ModSettingGet("Copi.EnableGlitches.DESIGN_TELEKINESIS_GLITCH_FOR_ITEM_PHYSICS") or false)          and "1" or "0", "\"\n",
        [[GLITCH_ALLOW_5TH_WAND_CARRY="]],                          (ModSettingGet("Copi.EnableGlitches.GLITCH_ALLOW_5TH_WAND_CARRY") or false)                         and "1" or "0", "\"\n",
        [[GLITCH_ALLOW_ALT_TAB_SILLINESS ="]],                      (ModSettingGet("Copi.EnableGlitches.GLITCH_ALLOW_ALT_TAB_SILLINESS ") or false)                     and "1" or "0", "\"\n",
        [[DEBUG_DISPLAY_INTERNAL_ID_IN_PROGRESS_MENU="]],           (ModSettingGet("Copi.EnableGlitches.DEBUG_DISPLAY_INTERNAL_ID_IN_PROGRESS_MENU") or false)          and "1" or "0", "\"\n",
        "/>"
    })
    ModMagicNumbersFileAdd(path)
end