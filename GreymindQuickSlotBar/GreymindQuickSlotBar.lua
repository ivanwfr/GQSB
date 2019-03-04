-- Greymind Quick Slot Bar --{{{
--  Feature Author: ivanwfr
--}}}
-- CHANGELOG --{{{
--[[
v2.4.6 {{{
- [color="aaffaa"]190304[/color]
- Checked with Update 21 (4.3.5): [color="00ff00"]Wrathstone[/color] - APIVersion: 100026.
- [color="ffffee"]"Blink Changes"[/color] display duration set to 500ms (up from 10ms).
- [color="ffffee"]Added PRESET SWAP COOLDOWN[/color] .. trying to prevent SPAM WARNING MESSAGES.

}}}
v2.4.5 {{{
- [color="aaffaa"]190226[/color]
- Checked with Update 21 (4.3.5): [color="00ff00"]Wrathstone[/color] - APIVersion: 100026
* New saved settings option: [color="ffffaa"]Account-wide[/color] or [color="aaaaff"]Character[/color] Settings
* User Interface showing a [color="ff0000"]BIG RED X[/color] when unlocked .. instead of hiding slotted items.

}}}
v2.4.4 {{{
- [color="aaffaa"]181113[/color]
* collectible...: Murkmire missing function call to [SelectSlotCollectible] replaced with [SelectSlotSimpleAction]
................ (thanks to Static's Quickslot Profiles rummage)
* crafting......: UI freezed while working at some Crafting Station (as suggested by Baertram).
* tooltips......: UI shows a few more descriptions

}}}
v2.4.3 {{{
- [color="aaffaa"]181027[/color]
- Checked with Update 20 (4.2.5): [color="00ff00"]Murkmire[/color] - APIVersion: 100025
- UI freezed while working at some Crafting Station (as suggested by Baertram).

}}}
v2.4.2 {{{
- [color="aaffaa"]181023[/color]
- Checked with Update 20 (4.2.5): [color="00ff00"]Murkmire[/color] - APIVersion: 100025
- patch version typo corrected

}}}
v2.4.1 {{{
- [color="aaffaa"]181022[/color]
- Checked with Update 20 Patch v4.2.5: [color="00ff00"]Murkmire[/color] - APIVersion: 100025

}}}
v2.4.0 {{{
- [color="aaffaa"]180815[/color]
- Checked with Update 19 (4.1.15): [color="00ff00"]Wolfhunter[/color] - APIVersion: 100024

}}}
v2.3.9 {{{
- [color="aaffaa"]180522[/color]
- Checked with Update 18 (4.0.5): [color="00ff00"]Summerset[/color] - APIVersion: 100023

}}}
v2.3.8 {{{
- [color="aaffaa"]180312[/color]
- [color="ffffee"]Tracking potions with same slotId .. promoted to a "known issue"[/color]
- [color="ffffee"]New "NO SOUND ENTRY"[/color]
- [color="ffffee"]New "Blink Changed" Display Policy[/color]

- [color="aaffaa"]180310[/color]
- [color="ffffee"]Tracking potions with same slotId .. (forum comment @Nudel)[/color]

}}}
v2.3.7 {{{
- [color="aaffaa"]180302[/color]
- [color="ffffee"]FIXED Collections Issue since API 100022[/color] - [i]GetCollectibleIdFromLink did the trick[/i]

}}}
v2.3.6 {{{
- [color="aaffaa"]180226[/color]
- Checked with Patch 3.3.7
- [color="ffffee"]FIXED GreymindQuickSlotBar.lua:984 error message:[/color] - missing again [color="dd0000"]COLLECTIONS_INVENTORY_SINGLETON[/color]

}}}
v2.3.5 {{{
- [color="aaffaa"]180214[/color]
- [color="ffffee"]WORAROUND:[/color] version tag for the missing [color="dd0000"]COLLECTIONS_INVENTORY_SINGLETON[/color]

}}}
v2.3.4.4 {{{
- [color="aaffaa"]180213[/color]
- Checked with Update 17 (3.3.5): [color="00ff00"]Dragon Bones[/color] - APIVersion: 100022
- [color="ffffee"]TODO:[/color] find a replacement for missing [color="dd0000"]COLLECTIONS_INVENTORY_SINGLETON[/color] to synchronize collectibles
- [color="ee00ee"]QSB Bar visibility: 2 more Keyboard Shortcuts and slash-commands:[/color]
- [color="ee00ee"]New slash-command.: /gqsb force[/color] .. to force Bar Visiblity
- [color="ee00ee"]New slash-command.: /gqsb block[/color] .. to block Bar Visiblity (overrides force)
- [color="ee00ee"]Controls-Keybind and Chat-Report colors[/color] .. to better spot what's ON and what's OFF
- [color="ee00ee"]Events bursts handling shorter[/color] .. to update UI faster

}}}
v2.3.4.3 {{{
- [color="aaffaa"]171128[/color]
- [color="ee00ee"]Addon-Version added into the Settings Menu Display Name.[/color]
- [color="ee00ee"]New option........: Auto-Clone previous-to-empty preset (ON OFF) ...whether to copy the CURRENT PRESET LAYOUT AND CONTENT When selecting an EMPTY PRESET.[/color]
- [color="ee00ee"]New slash-command.: /gqsb clear[/color] ...to clear Current-Preset-Items.

}}}
v2.3.4.2 {{{
- [color="aaffaa"]171028[/color]
- Checked with Update 16 (3.2.6): [color="00ff00"]Clockwork City[/color] - APIVersion: 100021
- [color="ee00ee"]Works with [b]LibAddonMenu 2.0 r25[/b][/color]

}}}
v2.3.4.1 {{{
- [color="aaffaa"]170917[/color]
[color="ee00ee"]Collectible Presets properly saved and restored.[/color]

}}}
v2.3.4   {{{
- [color="aaffaa"]170902[/color]
[color="ee00ee"]Collectible Items Support.[/color]
[color="808080"]Collectible tooltip active state missing (Found no sync capable EVENT_XXX).[/color]

}}}
v2.3.3.2 {{{
- [color="aaffaa"]170829[/color]
[color="ee00ee"]LibAddonMenu empty panel issue: could not find any workaround.[/color]
[color="404040"]
- lib author wont consider his buttons should not be the only means to change addon settings.
- Found no way to avoid this side-effect when I need to refresh Per Preset Settings Panel UI.
- workaround: use the cog ro the right of the Addon UI.
[/color]

}}}
v2.3.3.1 {{{
- [color="aaffaa"]170822[/color]
[color="ee00ee"]Preset selection: 5 more Keyboard Shortcuts[/color]

}}}
v2.3.3 {{{
- [color="aaffaa"]170818[/color]
[color="ee00ee"]Changed from Account-wide to Per-character Preset[/color]
...meaning each character will save and restore its own full-preset
[color="ee00ee"]Activating an EMPTY PRESET will clone the CURRENT PRESET (Layout and Content)[/color]
[color="ee00ee"]Instant UI update when [b]Weapon Swap Colors[/b] is changed[/color]

}}}
v2.3.2.1 {{{
- [color="aaffaa"]170814[/color]
- Checked with Update 15 (3.1.5): [color="00ff00"]Horns of the Reach[/color] - APIVersion: 100020
- [color="ee00ee"]Works with [b]LibAddonMenu 2.0 r24[/b] and [b]LibStub-1.0r4[/b][/color]
- correction for error message: [536: operator .. is not supported for nil .. string]

[color="ee00ee"]5x SlotItemTable (one per PRESET):[/color]
.. a new table to save and restore 8x [Quick Slot Bar itemName] [BAG_BACKPACK slotID] [button texture]

- Each preset saves and restores its own Quick Slot Items Set.
...can be used to setup ACTIVITY-SPECIFIC-ITEM-SETS (i.e. PvP, PvE or some other ativities)

- A new BIG TOOLTIP stating you have to click the red-pin when the Addon-UI is UNLOCKED during layout.

[color="00DD00"]- IMPORTANT NOTE ABOUT "EXCESSIVE MESSAGE WARNING" [/color]
 * Item swap adds up in the count of message spamming.
 * If you get this warning, be sure to wait a few seconds before your next preset swap.
 * (...it looks like chances to get this warning are low when the Item bag is showing)

[color="00DD00"]- check_QSB_BAG_BACKPACK_slotId_to_check:[/color]
 . When a new item is added into the BAG_BACKPACK,
 . if this item is part of the current PRESET-ITEM-SET,
 . it is added to the Quick slot bar when it is missing.
 . This may happen when some pre-selected items are not available when a particular PRESET is activated.
 . As adding items missing from the BAG_BACKPACK is not supported, it must be done when available.

[color="00DD00"]- get_slotId_itemName:[/color]
 . Access a BAG_BACKPACK [slotID] item name.

[color="00DD00"]- loadItemSlots:[/color]
 . Clear PRESET-UNCONFIGURED Quick Bar Slots,
 . Equip PRESET-CONFIGURED   Quick Bar Slots,
 . Nothing happens when upgrading from previous addon-version,
 . preserving whatever is slotted in the Quick Bar at that time.

[color="00DD00"]- is_SlotItemTable_empty:[/color]
 . ON FIRST USE OF THE NEW FEATURE:
 . refrain from clearing current Quick Slot Bar (a NON-EXISTENT-PRESET is not the same as an EMPTY-PRESET)

[color="00DD00"]- populate_an_empty_SlotItemTable:[/color]
 . ON FIRST USE OF THE NEW FEATURE:
 . capture current Quick Slot Bar content into an empty PRESET before SAVING OR USING it.

[color="00DD00"]- clear_bNum:[/color]
 . Clears a Quick Slot Bar entry based on intentionally-left-empty PRESET slot.

[color="00DD00"]- equip_bNum_item_slotId:[/color]
 . Equip a Quick Slot Bar entry based on an configured PRESET slot.

[color="00DD00"]- handle_ACTION_SLOT_UPDATED:[/color]
 . Save the item added to a Quick Slot Bar entry.
 . ON FIRST USE OF THE NEW FEATURE:
 . save all current Quick Slot Bar entries to update the Addon UI.

[color="00DD00"]- save_QSB_to_SlotItemTable:[/color]
 . save one of the CURRENT PRESET slot item: [item-name] [BAG_BACKPACK slotID] [button texture]

[color="00DD00"]- getItem_slotId:[/color]
 . Search the BAG_BACKPACK to get the Item ID passed to equip_bNum_item_slotId.

[color="00DD00"]- get_tooltipText:[/color]
 . get information about currently EQUIPPED or SAVED item name.

}}}
v2.3.1 {{{
- [color="aaffaa"]170524[/color]
- Checked with Update 14 (3.0.5): [color="00ff00"]Morrowind[/color] - APIVersion: 100019

}}}
v2.3.0 {{{
- [color="aaffaa"]170207[/color]
- Checked with Update 13 (2.7.5): [color="00ff00"]Homestead[/color] - APIVersion: 100018
- (typo -= 1) (vertical->horizontal) (thx zasy99)

}}}
v2.2.9 {{{
- [color="aaffaa"]161007[/color]
- Checked with Update 12 (2.6.4): [color="00ff00"]One Tamriel[/color] - APIVersion: 100017
- Shortened a few more keyNames: Insert=[INS] Caps Lock=[Caps] Page Down=[PgDn] Page Up=[PgUp]
- [color="ee00ee"]changed lua file format from dos to unix (maybe the cause of some release issue in the comments)[/color]
- [color="ee00ee"]added the missing GreymindQuickSlotBar.xml[/color]

}}}
v2.2.8 {{{
- [color="aaffaa"]160823[/color]
- Shortened a few displayed keyNames: BACKSPACE=[BKS] DELETE=[DEL] ENTER=[ENT]
...with the right caps such as......: Backspace=[BKS] Delete=[DEL] Enter=[ENT]

}}}
v2.2.7 {{{
- [color="aaffaa"]160803[/color]
- Checked with Update 2.5.5: [color="00ff00"]Shadows of the Hist[/color] - APIVersion: 100016
- no change required

}}}
v2.2.6 {{{
- [color="aaffaa"]160601[/color]
- Checked with Update 2.4.5: [color="00ff00"]Dark Brotherhood[/color] - APIVersion: 100015
- no change required

}}}
v2.2.5 {{{
- [color="aaffaa"]160310[/color]
- Cheked with Update 2.2.5: [color="00ff00"]Thieves Guild[/color] - APIVersion: 100014
- Addon Settings of [b]Warning and Alert Quantity[/b] clamping working again: [i](Alert < Warning)[/i]
- Works with [b]LibAddonMenu 2.0 r19[/b]
- Works with [b]LibStub-1.0r4[/b]

}}}
--]]
--}}}
-- LINKS --{{{
--[[
[PATCH NOTES]:
 :!start explorer "https://forums.elderscrollsonline.com/en/discussion/430154/pc-mac-patch-notes-v4-1-5-wolfhunter-update-19"

[COMMENTS] GreymindQuickSlotBar:
 :!start explorer "http://www.esoui.com/downloads/fileinfo.php?id=258"
 :!start explorer "http://www.esoui.com/forums/showthread.php?p=31752"
 :!start explorer "http://www.esoui.com/forums/showthread.php?p=31942"

[WIKI] APIVersion
 :!start explorer "http://wiki.esoui.com/APIVersion"

[OBJECTS] All 23507 GLOBAL objects as exported from the game
 :!start explorer "https://esoapi.uesp.net/100025/globals.html"

[SOURCE] Browse the 857 Lua source code files starting at the root directory
 :!start explorer "https://esoapi.uesp.net/100025/src/luadir.html"

[FUNCTIONS] An alphabetical listing of all 50331 Lua functions
 :!start explorer "https://esoapi.uesp.net/100025/functions.html"

[actionbar quickslot tooltip hud inventory]
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/actionbar/luadir.html"
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/quickslot/luadir.html"
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/tooltip/luadir.html"
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/hud/luadir.html"
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/inventory/luadir.html"

[COLLECTIONS_INVENTORY_SINGLETON]
 :!start explorer "https://esodata.uesp.net/100025/src/ingame/collections/collectionsinventorysingleton.lua.html"
 :!start explorer "https://esodata.uesp.net/100025/src/ingame/inventory/inventoryslot.lua.html"

--]]
--}}}
local DEBUG       = false
local DEBUG_ITEM  = false
local DEBUG_EQUIP = false
local DEBUG_EVENT = false
local DEBUG_TASKS = false
-- LOCAL
-- CONSTANTS --{{{

-- DELAYS
local ZO_CALLLATER_DELAY_HIDE    =  500 -- Hide
local ZO_CALLLATER_DELAY_NEXT    =  200 -- NextAuto
local ZO_CALLLATER_DELAY_REFRESH =   10 -- Refresh
local ZO_CALLLATER_DELAY_SHOW    =   10 -- Show
local ZO_CALLLATER_DELAY_SOUND   =   10 -- PlaySound
local ZO_CALLLATER_DELAY_LIB     =   10 -- PlaySound
local ZO_CALLLATER_DELAY_TASKS   =   20 -- clear_or_equip
local ZO_COOL_DOWN_DELAY_TASKS   = 7000 -- tasks_cooldown_begin tasks_cooldown_end

-- RGB COLORS
local COLOR_R                    = "|cFF2222"
local COLOR_G                    = "|c22FF22"
local COLOR_B                    = "|c2222FF"
local COLOR_C                    = "|c44FFFF"
local COLOR_M                    = "|cFF44FF"
local COLOR_Y                    = "|cFFFF44"

-- ECC COLORS
local COLOR_1                    = "|c964B00"
local COLOR_2                    = "|cFF0000"
local COLOR_3                    = "|cFFA500"
local COLOR_4                    = "|cFFFF00"
local COLOR_5                    = "|c9ACD32"
local COLOR_6                    = "|c6495ED"
local COLOR_7                    = "|cEE82EE"
local COLOR_8                    = "|cA0A0A0"
local COLOR_9                    = "|cFFFFFF"

-- VISUAL-CUE BORDERS
local COLORBLACK              = { R =0  , G =0  , B =0  , A = 1   }
local COLORCOOLDOWN           = { R =1  , G =1  , B =1  , A = 1   }

local COLORALERT              = { R =1  , G =0  , B =0  , A = 1   }
local COLORCURRENTKEY         = { R =0.5, G =1  , B =0.5, A = 1   }
local COLORNORMAL             = { R =0.5, G =0.5, B =0.5, A = 1   }
local COLORWARNING            = { R =1  , G =1  , B =0  , A = 1   }
local COLORACTIVEWEAPONPAIR1  = { R =0.0, G =1.0, B =0  , A = 0.5 }
local COLORACTIVEWEAPONPAIR2  = { R =0.0, G =0.0, B =1.0, A = 0.5 }

-- QUICK SLOT WHEEL NUMBERING
local WHEEL_LOOKUPTABLE       = { 12, 11, 10, 9, 16, 15, 14, 13 } -- holds, and hide, the ESO Wheel items order

-- VISIBILITY POLICY
local VISCUE_OFF              = "Off"
local VISCUE_WA               = "Warn + Alert"
local VISCUE_WAC              = "Warn + Alert + Hide Consumed"

local VIS_COMBAT              = "In Combat Only"
local VIS_NEVER               = "Never"
local VIS_ALWAYS              = "Always"
local VIS_RETICLE             = "Reticle"
local VIS_BLINK_CHANGES       = "Blink Changes"

-- TEXTURES
local BACKGROUNDTEXTURE       = "ESOUI/art/actionbar/quickslotbg.dds"
local BASEBACKGROUNDTEXTURE   = "ESOUI/art/actionbar/abilityframe64_empty.dds"
local BORDERTEXTURE           = "ESOUI/art/actionbar/abilityframe64_up.dds"
local VISUALCUEBORDERTEXTURE  = "GreymindQuickSlotBar/BorderAlt.dds"

-- TOOLTIP
local UNLOCKED_TT
= "UI currently "..COLOR_2.." UNLOCKED for layout|r\n"
.."...that's why you can't see any icons...\n"
.."Click "..COLOR_2.." RED PIN |r to "..COLOR_5.." Lock on screen"

local COOLDOWN_TT
= "PRESET CHANGE "..COLOR_9.." PENDING|r\n"
.."delayed by cooldown\n"
.."to avoid a spam warning message"

-- KEYS
local MOD_NONE                = "No Modifier"
local MOD_SHIFT               = "Shift"
local MOD_CONTROL             = "Control"
local MOD_ALT                 = "Alt"
local MOD_SHIFT_KEYCODE       = 7
local MOD_CONTROL_KEYCODE     = 4
local MOD_ALT_KEYCODE         = 5

local KEYBINDINGS_PREFIX      = "SI_BINDING_NAME_"

local KBNAME_P1               = COLOR_1.."Preset P1"
local KBNAME_P2               = COLOR_2.."Preset P2"
local KBNAME_P3               = COLOR_3.."Preset P3"
local KBNAME_P4               = COLOR_4.."Preset P4"
local KBNAME_P5               = COLOR_5.."Preset P5"

local KBNAME_FORCE            = COLOR_5.."Bar Visibility "..COLOR_5.."FORCED"
local KBNAME_BLOCK            = COLOR_5.."Bar Visibility "..COLOR_2.."BLOCKED"
local KBNAME_PREVIOUS         = COLOR_3.."Previous Quick Slot Item"
local KBNAME_NEXT             = COLOR_4.."Next Quick Slot Item"
local KBNAME_RELOADUI         = COLOR_8.."Reload UI"
local KBNAME_CLEARCHAT        = COLOR_8.."Clear Chat"

-- CHOICE-LISTS
local ALIGNH                  = { "Off-Left", "Left", "Center", "Right"  , "Off-Right"}
local ALIGNV                  = { "Above"   , "Top" , "Middle", "Bottom" , "Below"    }
local PRESETNAMES             = { "P1"      , "P2"  , "P3"    , "P4"     , "P5"       }
local NO_SOUND                = "NO SOUND"
local SOUNDNAMES              = {
    "QUICKSLOT_USE_EMPTY",
    "ABILITY_SLOTTED",
    "ALCHEMY_SOLVENT_PLACED",
    "DIALOG_DECLINE",
    "DYEING_APPLY_CHANGES",
    "DYEING_SWATCH_SELECTED",
    "DYEING_TOOL_DYE_USED",
    "DYEING_TOOL_ERASE_USED",
    "DYEING_TOOL_FILL_USED",
    "DYEING_UNDO_CHANGES",
    "ENCHANTING_EXTRACT_START_ANIM",
    "FENCE_ITEM_LAUNDERED",
    "GUILD_SELF_JOINED",
    "GUILD_SELF_LEFT",
    "ITEM_ON_COOLDOWN",
    "LOCKPICKING_CHAMBER_LOCKED",
    "LOCKPICKING_CHAMBER_RESET",
    "LOCKPICKING_CHAMBER_STRESS",
    "LOCKPICKING_FORCE",
    "LOCKPICKING_START",
    "LOCKPICKING_UNLOCKED",
    "MAIL_SENT",
    "MAP_PING",
    "MAP_PING_REMOVE",
    "NEW_MAIL",
    "NOTE_CLOSE",
    "QUICKSLOT_CLEAR",
    "QUICKSLOT_MOUSEOVER",
    "QUICKSLOT_SET",
    NO_SOUND
}

local KEYBINDINGS = {

    { name=COLOR_1.."Quick Slot Item 1", id="GREYMIND_QUICK_SLOT_BAR_ITEM_1"              }, -- QSB_Item1
    { name=COLOR_2.."Quick Slot Item 2", id="GREYMIND_QUICK_SLOT_BAR_ITEM_2"              }, -- QSB_Item2
    { name=COLOR_3.."Quick Slot Item 3", id="GREYMIND_QUICK_SLOT_BAR_ITEM_3"              }, -- QSB_Item3
    { name=COLOR_4.."Quick Slot Item 4", id="GREYMIND_QUICK_SLOT_BAR_ITEM_4"              }, -- QSB_Item4
    { name=COLOR_5.."Quick Slot Item 5", id="GREYMIND_QUICK_SLOT_BAR_ITEM_5"              }, -- QSB_Item5
    { name=COLOR_6.."Quick Slot Item 6", id="GREYMIND_QUICK_SLOT_BAR_ITEM_6"              }, -- QSB_Item6
    { name=COLOR_7.."Quick Slot Item 7", id="GREYMIND_QUICK_SLOT_BAR_ITEM_7"              }, -- QSB_Item7
    { name=COLOR_8.."Quick Slot Item 8", id="GREYMIND_QUICK_SLOT_BAR_ITEM_8"              }, -- QSB_Item8

    { name=KBNAME_FORCE                , id="GREYMIND_QUICK_SLOT_BAR_FORCE_BAR_VISIBILITY"}, -- QSB_ForceBarVisibility
    { name=KBNAME_BLOCK                , id="GREYMIND_QUICK_SLOT_BAR_BLOCK_BAR_VISIBILITY"}, -- QSB_BlockBarVisibility
    { name=KBNAME_PREVIOUS             , id="GREYMIND_QUICK_SLOT_BAR_PREVIOUS_ITEM"       }, -- QSB_PreviousItem
    { name=KBNAME_NEXT                 , id="GREYMIND_QUICK_SLOT_BAR_NEXT_ITEM"           }, -- QSB_NextItem

    { name=KBNAME_P1                   , id="GREYMIND_QUICK_SLOT_BAR_P_1"                 }, -- QSB_P1
    { name=KBNAME_P2                   , id="GREYMIND_QUICK_SLOT_BAR_P_2"                 }, -- QSB_P2
    { name=KBNAME_P3                   , id="GREYMIND_QUICK_SLOT_BAR_P_3"                 }, -- QSB_P3
    { name=KBNAME_P4                   , id="GREYMIND_QUICK_SLOT_BAR_P_4"                 }, -- QSB_P4
    { name=KBNAME_P5                   , id="GREYMIND_QUICK_SLOT_BAR_P_5"                 }, -- QSB_P5

    { name=KBNAME_RELOADUI             , id="GREYMIND_QUICK_SLOT_BAR_RELOADUI"            }, -- QSB_ReloadUI
    { name=KBNAME_CLEARCHAT            , id="GREYMIND_QUICK_SLOT_BAR_CLEARCHAT"           }, -- QSB_ClearChat
}

local KEYBINDINGS_SWAPS = {

    { name="Load First Preset"         , id="SWAPS_BUTTON_1"},
    { name="Load Second Preset"        , id="SWAPS_BUTTON_2"},
    { name="Load Third Preset"         , id="SWAPS_BUTTON_3"},
    { name="Load Fourth Preset"        , id="SWAPS_BUTTON_4"},
    { name="Load Fifth Preset"         , id="SWAPS_BUTTON_5"},
    { name="Load Sixth Preset"         , id="SWAPS_BUTTON_6"},
    { name="Load Seventh Preset"       , id="SWAPS_BUTTON_7"},
    { name="Load Height Preset"        , id="SWAPS_BUTTON_8"},
    { name="Load Ninth Preset"         , id="SWAPS_BUTTON_9"},
    { name="Load Tenth Preset"         , id="SWAPS_BUTTON_10"},

}

--}}}
-- ATTRIBUTES {{{
local SETTINGSPANELNAME                 = COLOR_5.."G "..COLOR_3.."Quick "..COLOR_4.."Slot "..COLOR_6.."Bar"
local QSB_SLASH_COMMAND                 = "/gqsb"
local Loaded_QSB_Settings = {}
local QSB = {

    Name                                = "GreymindQuickSlotBar",
    Panel                               = nil,
    Version                             = "v2.4.6", -- 190304 previous: 190226 190207 190205 190126 190111 181113 181027 181023 181022 180815 180722 180522 180312 180310 180302 180226 180214 180213 171230 171219 171128 171028 170917 170902 170829 170822 170818 170815 170714 170722 170720 170717 170715 170709 170524 170206 161128 161007 160824 160823 160803 160601 160310 160219 160218 151108 150905 150514 150406 150403 150330 150314 150311 150218
    SettingsVersion                     = 1,

    -- CHOICES
  --KeyModifier_ChoiceList              = { MOD_NONE   , MOD_SHIFT , MOD_CONTROL, MOD_ALT },
    Visibility_ChoiceList               = { VIS_RETICLE, VIS_COMBAT, VIS_NEVER, VIS_ALWAYS , VIS_BLINK_CHANGES },
    VisualCue_ChoiceList                = { VISCUE_OFF , VISCUE_WA , VISCUE_WAC },

    -- STATES
    Moving                              = false,
    Resizing                            = false,
    IsVisible                           = false,

    -- NUMBERS
    ButtonCountMax                      = 8,
    ButtonMargin                        = 2,
    ButtonPadding                       = 8,

    -- ELEMENTS
    Buttons                             = {},
    Backgrounds                         = {},
    Basegrounds                         = {},
    Overgrounds                         = {},
    Borders                             = {},
    KeyLabels                           = {},
    QuantityLabels                      = {},
    VisualCueBorders                    = {},

    Presets                             = { P1={}, P2={}, P3={}, P4={}, P5={} },

    SomeSlotItemChanged                 = false,
    CloneCurrentToEmtpyPreset           = true,

    -- small helper windows
    UIHandleNames    = { "L", "P1", "P2", "P3", "P4", "P5", "S" },
    UIHandles        = {},

    -- Settings-Menu entries to be updated at each Preset activation
    SettingsControls = {},

} --}}}
-- DEFAULTS --{{{
QSB.SettingsDefaults = {

    MainWindow = {
        X                               = 0,
        Y                               = 0,
        Width                           = 320,
        Height                          = 50,
    },

    ButtonColumns                       = QSB.ButtonCountMax,
    ButtonFontSize                      = 18,
    ButtonSize                          = 36,
    ButtonsDisplayed                    = QSB.ButtonCountMax,
    GameActionButtonHide                = false,
    LockUI                              = false,
    NextPrevWrap                        = false,
    NextAuto                            = false,
    ShowBackground                      = false,
    SwapBackgroundColors                = false,
    Visibility                          = VIS_RETICLE,
    PresetName                          = PRESETNAMES[1],
    SoundAlert                          = SOUNDNAMES[1],
    SoundSlotted                        = SOUNDNAMES[2],

    SlotItem = {
        KeyBindAlignH                   = ALIGNH[2],
        KeyBindAlignV                   = ALIGNV[2],
        NotSelectedButtonOpacity        = 30,
            OverlayButtonOpacity        = 30,
        QuantityAlert                   = 5,
        QuantityLabelPositionHorizontal = ALIGNH[4],
        QuantityLabelPositionVertical   = ALIGNV[4],
        QuantityWarning                 = 10,
        HideSlotBackground              = false,
        ShowKeyBindings                 = false,
        ShowNumbers                     = false,
        ShowQuantityLabels              = true,
        VisualCue                       = VISCUE_WA,
    },

    Presets                             = { P1={}, P2={}, P3={}, P4={}, P5={} },

    -- (170615 - Marazota)
    SlotItemTable  = {
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, texture = nil, itemLevel = nil }
    },


} --}}}
-- FORWARD DECLARATION OF LOCAL FUNCTIONS --{{{
-- ...so we can call them before their definition in this file

local Adjust_ButtonColumns
local Adjust_MainWindow
local ApplyKeyBindingsModifier
local ApplyKeyBindingsModifier_SWAPS
local Are_Settings_Locked
local BuildKeyBindingsMenu
local BuildSettingsMenu
local BuildUIHandles
local ButtonSizeChanged
local ClearKeyBindings
local CopyFromTo
local CopyNotNilSettingsFromTo
local D
local D_EVENT
local D_ITEM
local DeepCopy
local Display
local GameActionButtonHideHandler
local GetAlignmentXY
local GetKeyBindInfo
local GetSlotItemKeyName
local slotIndex_to_bNum
local bNum_to_slotIndex
local Hide
local Hide_delayed
local Hide_pending = false
local HideUIHandles

local Initialize
local Load_ZO_SavedVars
local QSB_Settings_Changed
local QSB_Setting_Preset_Changed

local IsEmptySlot
local Load_Defaults

local OnClicked_bNum
local OnClicked_handle
local OnMouseEnter
local OnMouseExit
local OnMoveStart
local OnMoveStop
local OnResizeStart
local OnResizeStop

local OnMouseNotClicked
local OnMouseDown
local OnMouseClicked

local OnSlashCommand
local PlaySoundAlert
local PlaySoundAlert_pending = false
local PlaySoundSlotted
local PlaySoundSlotted_pending = false
local Refresh
local Refresh_delayed
local Refresh_pending = false
local RegisterEventHandlers
local Release_Settings_Locked
local SelectButton
local SelectNextAuto
local SelectNextAuto_delayed
local SelectNextAuto_pending = false
local Rebuild_LibAddonMenu_pending = false
local SelectPreset
local  check_QSB_BAG_BACKPACK_slotId_to_check
local  get_slotId_itemName
local  loadItemSlots
local  is_SlotItemTable_empty
local  populate_an_empty_SlotItemTable
local  clear_bNum
local  equip_bNum_item_slotId
local  handle_ACTION_SLOT_UPDATED
local  save_QSB_to_SlotItemTable
local  getItem_slotId
local   getItem_BAG_BACKPACK_slotId
local   getItem_bagId_slotId
--cal   getItem_collId_and_activeState
--cal   get_collId_itemName
local  get_tooltipText

local  tasks_cooldown_begin
local  tasks_cooldown_end
local  tasks_handler

local SetUIHandlesVisibility
local Settings_Locked
local Show
local Show_delayed
local Show_pending = false
local ShowUIHandles
local UIWindowChanged

local BlockBarVisibility = false
local ForceBarVisibility = false
local Reticle_isHidden   = false

--}}}
-- PRESETS
function Load_Defaults() --{{{
D("Load_Defaults()")

    -- revert to default values
--  CopyFromTo(QSB.SettingsDefaults, QSB.Settings)
--  QSB.Settings = DeepCopy(QSB.SettingsDefaults)

d("...QSB: RESETING ALL PRESETS TO DEFAULT VALUES:")

    SelectPreset( PRESETNAMES[1] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[2] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[3] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[4] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[5] ); CopySettingsDefaultsTo(QSB.Settings)

    loadItemSlots()

    ButtonSizeChanged()
    Refresh()
    Show()
end --}}}
function SelectPreset(selectedPreset) --{{{
D("SelectPreset("..COLOR_C..selectedPreset.."|r):")

    -- UNCHANGED {{{
    -- @see ../../SavedVariables/GreymindQuickSlotBar.lua

    if string.match(selectedPreset, QSB.Settings.PresetName) then
D("..."..COLOR_7..".SelectedPreset matches QSB.Settings.PresetName|r")

        return
    end
    --}}}
    -- SAVE CURRENT PRESET {{{
    local currentPreset = QSB.Settings.PresetName
D("...PRESET __SAVING:".. currentPreset)

    --}}}
    -- DEFAULTS SETTINGS {{{
    QSB.Settings.Presets[currentPreset] = DeepCopy(QSB.SettingsDefaults)

    --}}}
    -- SAVING CURRENT QUICK SLOT BAR CONTENT {{{
    if is_SlotItemTable_empty() then populate_an_empty_SlotItemTable("SAVING CURRENT QUICK SLOT BAR") end

    --}}}
    -- CURRENT SETTINGS {{{
    local from, to
    from = QSB.Settings
    to   = QSB.Settings.Presets[currentPreset]
    CopyNotNilSettingsFromTo(from, to)
    to.PresetName = nil
    to.Presets    = nil

    --}}}
    -- SELECTED PRESET {{{
    if not QSB.Settings.Presets[selectedPreset].MainWindow then
        QSB   .Settings.Presets[selectedPreset] = DeepCopy(QSB.SettingsDefaults)
    end
    from = QSB.Settings.Presets[selectedPreset]
    to   = QSB.Settings
    CopyNotNilSettingsFromTo(from, to)

    --}}}
    -- DEFAULT TO CLONING CURRENT QUICK SLOT BAR CONTENT -- AND LAYOUT (170818) {{{
    if QSB.CloneCurrentToEmtpyPreset and is_SlotItemTable_empty() then
--d(SETTINGSPANELNAME)
d(COLOR_4.." Preset"  ..COLOR_3.." "..selectedPreset.." "..COLOR_4.."is EMPTY .. CLONING "..COLOR_3.." "..currentPreset..COLOR_4.." (layout and content)")

        from = QSB.Settings.Presets[currentPreset]
        to   = QSB.Settings
        populate_an_empty_SlotItemTable("EMPTY PRESET: CLONING CURRENT QUICK SLOT BAR")
--d(".ButtonColumns"    .." from [".. to.ButtonColumns    .."] to [".. from.ButtonColumns    .."]")
--d(".ButtonFontSize"   .." from [".. to.ButtonFontSize   .."] to [".. from.ButtonFontSize   .."]")
--d(".ButtonSize"       .." from [".. to.ButtonSize       .."] to [".. from.ButtonSize       .."]")
--d(".ButtonsDisplayed" .." from [".. to.ButtonsDisplayed .."] to [".. from.ButtonsDisplayed .."]")
--d(".MainWindow.X"     .." from [".. to.MainWindow.X     .."] to [".. from.MainWindow.X     .."]")
--d(".MainWindow.Y"     .." from [".. to.MainWindow.Y     .."] to [".. from.MainWindow.Y     .."]")
        to.ButtonColumns    = from.ButtonColumns
        to.ButtonFontSize   = from.ButtonFontSize
        to.ButtonSize       = from.ButtonSize
        to.ButtonsDisplayed = from.ButtonsDisplayed
        to.MainWindow.X     = from.MainWindow.X
        to.MainWindow.Y     = from.MainWindow.Y
    end

    --}}}
    -- PRESET SELECTED {{{
    QSB.Settings.PresetName = selectedPreset
D("...PRESET SELECTED:"..QSB.Settings.PresetName)

    --}}}
    -- UPDATE DEPENDENCIES {{{
    ButtonSizeChanged()                                 -- UI geometry
    GameActionButtonHideHandler(true,"SelectPreset")    -- Apply selected preset choice

    --}}}
    -- UPDATE SETTINGS PANEL {{{
    if not QSB.Panel:IsHidden() then Rebuild_LibAddonMenu() end

    --}}}
end --}}}
-- ITEM EQUIP
--{{{
local QSB_BAG_BACKPACK_UPDATE_slotId    = -1
local QSB_BAG_BACKPACK_UPDATE_itemLevel = -1
local QSB_BAG_BACKPACK_UPDATE_mutex     = false

local tasks_loaded = {}
local tasks_posted = {}
local tasks_cooldown_inprogress
--}}}
function check_QSB_BAG_BACKPACK_slotId_to_check() --{{{
D_ITEM("check_QSB_BAG_BACKPACK_slotId_to_check:")

    local slotId    = QSB_BAG_BACKPACK_UPDATE_slotId   ; QSB_BAG_BACKPACK_UPDATE_slotId    = -1
    local itemName  = get_slotId_itemName ( slotId )
    local itemLevel = QSB_BAG_BACKPACK_UPDATE_itemLevel; QSB_BAG_BACKPACK_UPDATE_itemLevel = -1
D_ITEM("slotId=["..tostring(slotId).."] itemName=["..tostring(itemName).."] itemLevel=["..tostring(itemLevel).."]")

    QSB_BAG_BACKPACK_UPDATE_mutex = true -- cleared by Refresh_delayed

    for bNum = 1, QSB.ButtonCountMax do
        if(     QSB.Settings.SlotItemTable[bNum].itemName  == itemName ) then
            if( QSB.Settings.SlotItemTable[bNum].itemLevel ~= itemLevel) then
                QSB.Settings.SlotItemTable[bNum].itemLevel  = itemLevel
            end
            equip_bNum_item_slotId(bNum, itemName, slotId)
            return
        end
    end
D_ITEM("---")
end --}}}
function loadItemSlots() --{{{
    -- FIRST TIME USING SlotItemTable {{{
    if (QSB.Settings.SlotItemTable == nil) then
D_EQUIP(COLOR_6.." loadItemSlots: "..COLOR_2.." (QSB.Settings.SlotItemTable == nil)|r")
        return
    end
    --}}}
    -- EMPTY SlotItemTable .. leave Quick Slot Bar as is {{{
    if is_SlotItemTable_empty() then
D_EQUIP(COLOR_6.."loadItemSlots: "..COLOR_8.." SlotItemTable is EMPTY |r")
--[[
        return
--]]
    end
    --}}}
    -- MUTEX: to ignore self-induced ACTION_SLOT_UPDATED events
    QSB_BAG_BACKPACK_UPDATE_mutex = true -- cleared by Refresh_delayed
    tasks_loaded = {}
    -- 1/2 CLEAR slots containing UNSELECTED or DIFFERENT ITEMS {{{
    local itemName, slotIndex, slotName, emptySlot
    for bNum = 1, QSB.ButtonCountMax do
        itemName  = tostring(QSB.Settings.SlotItemTable[bNum].itemName)
        emptySlot = (itemName == nil) or (itemName == "")
        if emptySlot then
            slotIndex = bNum_to_slotIndex( bNum      )
            slotName  = GetSlotName      ( slotIndex )
            if(slotName ~= "") then
if(DEBUG_TASKS) then d(COLOR_8.."....CLEAR EMPTY-SLOT: slotName=["..tostring(slotName).."]") end

                tasks_loaded[#tasks_loaded + 1] = { clear_bNum , bNum , "EMPTY-SLOT"}
            else
if(DEBUG_TASKS) then d(COLOR_8.."....SKIP EMPTY-SLOT") end

            end

        else
            slotIndex = bNum_to_slotIndex( bNum      )
            slotName  = GetSlotName      ( slotIndex )
            if(slotName ~= itemName) then
if(DEBUG_TASKS) then d(COLOR_8.."...filled-slot: slotName=["..tostring(slotName).."] ~= itemName=["..tostring(itemName).."]") end

                tasks_loaded[#tasks_loaded + 1] = { clear_bNum , bNum , "SLOT-ITEM-CHANGED"}
            end
        end
    end
    --}}}

    -- 2/2 EQUIP SELECTED ITEMS (possibly available in BAG_BACKPACK) {{{
    local msg = ""
    local slotId
D_EQUIP("loadItemSlots:")

    for bNum = 1, QSB.ButtonCountMax do
        itemName  = tostring(QSB.Settings.SlotItemTable[bNum].itemName)
D_ITEM("."..bNum.." itemName=["..itemName.."]")


        if (itemName ~= nil) and (itemName ~= "") then

            slotIndex    = bNum_to_slotIndex( bNum      )
D_ITEM("..slotIndex=["..slotIndex.."]")
            slotName     = GetSlotName      ( slotIndex )
D_ITEM("...slotName=["..slotName.."]")

            if(slotName == itemName) then
D_ITEM(".....SAME ITEM NAME")
if(DEBUG_TASKS) then d(COLOR_8..".....SAME ITEM NAME ["..tostring(slotName).."]") end

            else
                if(slotName ~= "") then
                    slotId   = getItem_slotId(slotName)
                else
                    slotId   = -1
                end
D_ITEM("....slotId=["..slotId.."]")

                if((slotId ~= -1) and (slotId == QSB.Settings.SlotItemTable[bNum].slotId)) then
D_ITEM(".....SAME ITEM ID")
if(DEBUG_TASKS) then d(COLOR_8..".....SAME ITEM ID ["..tostring(slotId).."]") end

                    if DEBUG_EQUIP then
                        msg  = msg.."\n"..COLOR_6..".UNCHANGED ["..COLOR_6..bNum.."=="..slotIndex.."|r] ID["..tostring(slotId).."] ["..COLOR_6..tostring(itemName).."|r] .. slotId=["..tostring(slotId).."]"
                    end
                else
                    slotId   = QSB.Settings.SlotItemTable[bNum].slotId
D_ITEM(".....EQUIP ITEM ID")
if(DEBUG_TASKS) then d(COLOR_8..".....EQUIP ITEM ID ["..tostring(slotId).."]") end

                    if DEBUG_EQUIP then
                        msg  = msg.."\n"..COLOR_3..".EQUIPMENT ["..COLOR_6..bNum.."=="..slotIndex.."|r] ID["..tostring(slotId).."] ["..COLOR_6..tostring(itemName).."|r] .. slotId=["..tostring(slotId).."]"
                    end

                    tasks_loaded[#tasks_loaded + 1] = { equip_bNum_item_slotId , bNum , itemName , slotId }
                end

            end
        end
    end
    --}}}

--d("XXX loadItemSlots: overriding Loaded_QSB_Settings = DeepCopy(QSB.Settings)")
    Loaded_QSB_Settings = DeepCopy(QSB.Settings)
if(msg ~= "") then D_EQUIP(msg) end

    -- EQUIP TASK COOLDOWN {{{
    if(#tasks_loaded > 0) then
        if not tasks_cooldown_inprogress then
if(DEBUG_TASKS) then d(COLOR_C.."tasks_handler: "..tostring(#tasks_loaded).." tasks_loaded .. NOT ON COOLDOWN") end
            tasks_post(ZO_CALLLATER_DELAY_TASKS)
        else
if(DEBUG_TASKS) then d(COLOR_M.."tasks_handler: "..tostring(#tasks_loaded).." tasks_loaded .. ON COOLDOWN .. POSTPONING") end
            tasks_cooldown_begin()
            return
        end

    end
    --}}}

end --}}}
function clear_bNum(bNum) --{{{
    local slotIndex = bNum_to_slotIndex( bNum      )
    local slotName  = GetSlotName      ( slotIndex )
    if(   slotName ~= "") then
D_ITEM("..CLEARING ["..COLOR_6..slotIndex_to_bNum(slotIndex).."=="..slotIndex.."|r] ["..COLOR_6..tostring( slotName).."|r]")
    else
D_ITEM("..CLEARING ["..COLOR_6..slotIndex_to_bNum(slotIndex).."=="..slotIndex.."|r]")
    end
    CallSecureProtected("ClearSlot", slotIndex)
end --}}}
function equip_bNum_item_slotId(bNum, itemName, itemId) --{{{

    local slotIndex = bNum_to_slotIndex( bNum )
D_ITEM(".EQUIPPING ["..COLOR_6..bNum.."=="..slotIndex.."|r] itemId["..tostring(itemId).."] ["..COLOR_6..tostring(itemName).."]")

    local from_bag = (getItem_BAG_BACKPACK_slotId(itemName) >= 0)
D_ITEM("from_bag: "..tostring(from_bag))

    if( from_bag ) then
        local _, count = GetItemInfo(BAG_BACKPACK, itemId)
        if(count > 0) then
D_ITEM("SelectSlotItem.......(itemId=["..tostring(itemId).."], slotIndex=["..tostring(slotIndex).."])")
            CallSecureProtected("SelectSlotItem"       , BAG_BACKPACK, itemId, slotIndex)
        end
    else
        -- TODO check if available
--[[{{{
:new C:/LOCAL/GAMES/TESO/ADDONS/13_StaticsQuickslotProfiles/StaticsQuickslotProfiles/StaticsQuickslotProfiles.lua
 :!start explorer "https://www.esoui.com/downloads/fileinfo.php?id=258#comments"
 :!start explorer "https://www.esoui.com/downloads/download1775-StaticsQuickslotProfiles"
 :!start explorer "https://esoapi.uesp.net/100025/data/s/e/l/SelectSlotSimpleAction.html"
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/inventory/luadir.html"
 :!start explorer "https://esoapi.uesp.net/100025/src/ingame/inventory/inventoryslot.lua.html"
}}}--]]
D_ITEM("SelectSlotCollectible(itemId=["..tostring(itemId).."], slotIndex=["..tostring(slotIndex).."])")
      --CallSecureProtected("SelectSlotCollectible" ,                          itemId, slotIndex)
        CallSecureProtected("SelectSlotSimpleAction", ACTION_TYPE_COLLECTIBLE, itemId, slotIndex)
    end

end --}}}

function tasks_cooldown_begin() --{{{
    -- NO STACKING COOLDOWN {{{
    if tasks_cooldown_inprogress then
if(DEBUG_TASKS) then d(COLOR_8.."TASKS COOLDOWN ALREADY IN PROGRESS") end

        return
    end
    --}}}
if(DEBUG_TASKS) then d(COLOR_7.."TASKS COOLDOWN BEGIN") end
    tasks_cooldown_inprogress = true

    zo_callLater(tasks_cooldown_end, ZO_COOL_DOWN_DELAY_TASKS)
end --}}}
function tasks_cooldown_end() --{{{
    tasks_cooldown_inprogress = false

    if(#tasks_loaded > 0) then
if(DEBUG_TASKS) then d(COLOR_7.."TASKS COOLDOWN END .. "..COLOR_4.."POSTING "..#tasks_loaded.." LOADED TASKS") end

        tasks_post(ZO_CALLLATER_DELAY_TASKS)
    else
if(DEBUG_TASKS) then d(COLOR_7.."TASKS COOLDOWN END .. "..COLOR_8.."NO MORE LOADED TASKS") end

        Refresh();
        Show();
    end

end --}}}
function tasks_post(delay) --{{{
if(DEBUG_TASKS) then d(COLOR_C.."tasks_post("..tostring(delay).."): "..tostring(#tasks_loaded).." tasks_loaded") end
    tasks_cooldown_begin()
    tasks_posted = DeepCopy(tasks_loaded)
    tasks_loaded = {}
    zo_callLater(tasks_handler, delay)
end --}}}
function tasks_handler() --{{{
    -- fetch next task {{{
    if(#tasks_posted == 0) then
if(DEBUG_TASKS) then d(COLOR_8.."TASKS: NO PENDING TASK") end
        return
    end

    local  tasks_entry = table.remove(tasks_posted, 1)
    if not tasks_entry then return end

    local  clear_or_equip,bNum,itemName_or_reason,slotId = unpack(tasks_entry)
    --}}}
--{{{
    if    (clear_or_equip == clear_bNum            ) then
if(DEBUG_TASKS) then d(COLOR_6.."TASKS: clear_bNum("..tostring(bNum)..") .. "..tostring(itemName_or_reason)) end

    elseif(clear_or_equip == equip_bNum_item_slotId) then
if(DEBUG_TASKS) then d(COLOR_4.."TASKS: equip_bNum_item_slotId("..COLOR_7..tostring(bNum).." "..COLOR_4..tostring(itemName_or_reason).." "..COLOR_8.." slotId="..tostring(slotId)..")") end

    else

if(DEBUG_TASKS) then
        d(COLOR_2.."TASKS:")
        d(".....clear_or_equip=["..tostring(clear_or_equip    ).."]")
        d("...............bNum=["..tostring(bNum              ).."]")
        d(".itemName_or_reason=["..tostring(itemName_or_reason).."]")
        d(".............slotId=["..tostring(slotId            ).."]")
end
    end
--}}}
    -- execute fetched task {{{
    clear_or_equip(bNum,itemName_or_reason,slotId)

    --}}}
    -- 1/2 post next task {{{
    if     (#tasks_posted > 0) then
        local delay = ZO_CALLLATER_DELAY_TASKS + (ZO_CALLLATER_DELAY_TASKS/2 * #tasks_posted)
        if(clear_or_equip == clear_bNum) then delay = 0 end

        zo_callLater(tasks_handler, delay)
    --}}}
    -- 2/2 all done and up to date {{{
    elseif(#tasks_loaded == 0) then
if(DEBUG_TASKS) then d(COLOR_3.."TASKS: REQUESTED ALL DONE") end

        tasks_cooldown_begin()

        QSB_BAG_BACKPACK_UPDATE_mutex = false
    end
    --}}}
end --}}}

-- ITEM SETTINGS
function is_SlotItemTable_empty() --{{{

    if (QSB.Settings.SlotItemTable == nil) then
        return true
    end

    for bNum = 1, QSB.ButtonCountMax do
        local itemName  = QSB.Settings.SlotItemTable[bNum].itemName
        if  ( itemName ~= nil)
        and ( itemName ~= "" )
        then
            return false
        end
    end

    return true
end --}}}
function populate_an_empty_SlotItemTable(msg) --{{{
D_ITEM(COLOR_6.."populate_an_empty_SlotItemTable:\n"..COLOR_8..msg.."|r")

    for bNum = 1, QSB.ButtonCountMax do
        save_QSB_to_SlotItemTable(bNum)
    end

end --}}}
function handle_ACTION_SLOT_UPDATED(bNum) --{{{
D_ITEM(COLOR_3.."handle_ACTION_SLOT_UPDATED(bNum="..bNum.."):|r")
    save_QSB_to_SlotItemTable(bNum)

end --}}}
function save_QSB_to_SlotItemTable(bNum) --{{{
D_ITEM("save_QSB_to_SlotItemTable("..bNum.."):")

    local slotIndex = bNum_to_slotIndex( bNum      )
    local texture   = GetSlotTexture   ( slotIndex )
    local slotName  = GetSlotName      ( slotIndex )
    local slotId    = -1
    if (slotName    ~= nil) and (slotName ~= "") then
        slotId       = getItem_slotId(slotName)
    end

    if(slotId == -1) then slotId = GetCollectibleIdFromLink( GetSlotItemLink(slotIndex) ) end
D_ITEM("+++slotId...f(slotIndex).=["..tostring( slotId    ).."]")

    -- SINGLE-POINT-INITIALIZATION
    QSB.Settings.SlotItemTable[bNum].itemName  = slotName
    QSB.Settings.SlotItemTable[bNum].itemLevel = get_slotId_itemLevel(slotId)
    QSB.Settings.SlotItemTable[bNum].slotId    = slotId
    QSB.Settings.SlotItemTable[bNum].texture   = texture
    -- SINGLE-POINT-INITIALIZATION

--D_ITEM(get_tooltipText(bNum))
end --}}}
-- ITEM INFO
function get_tooltipText(bNum) --{{{

    local  itemName   = QSB.Settings.SlotItemTable[bNum].itemName if(itemName == "") then itemName = nil end
    local  slotIndex  = bNum_to_slotIndex( bNum )

    -- FROM [BAG_BACKPACK]
    local  count      = GetSlotItemCount( slotIndex ) or 0

    -- FROM [COLLECTIONS_INVENTORY]
    local itemLink = GetSlotItemLink         ( slotIndex )
    local collId   = GetCollectibleIdFromLink( itemLink  )

    -- COLOR .. f(count or collId)
    local  color
    if    (count ) then color = COLOR_6
    elseif(collId) then color = COLOR_4
    else                color = COLOR_8
    end

    -- LABEL [COLLECTIBLE] OR [ITEM]
    local description
    local itemLevel
    local label
    if(itemName ~= nil) then

        label = tostring(itemName)
        -- [description] {{{
        if(collId) then
            description = tostring( GetCollectibleDescription(collId) )
            if(description) then
                label = label .."\n"..COLOR_7..description
            end
        end
        --}}}
        -- [itemLevel] {{{
        itemLevel = QSB.Settings.SlotItemTable[bNum].itemLevel
        if(itemLevel) then
            label = label ..COLOR_5.." level ".. tostring(itemLevel)
        end

        --}}}
        -- [flavor] {{{
        description = tostring( GetItemLinkFlavorText(itemLink) )
        if(description) then
            label = label .."\n"..COLOR_3..description
        end
        --}}}
--[[
        -- [combination] {{{
        description = tostring( GetItemLinkCombinationDescription(itemLink) )
        if(description) then
            label = label .."\n"..COLOR_4.."Combination: "..description
        end
        --}}}
        -- [materialLevel] {{{
        description = tostring( GetItemLinkMaterialLevelDescription(itemLink) )
        if(description) then
            label = label .."\n"..COLOR_4.."Material Level: "..description
        end
        --}}}
        -- [Writ] {{{
        description = tostring( GenerateMasterWritBaseText(itemLink) )
        if(description) then
            label = label .."\n"..COLOR_4.."Writ: "..description
        end
        --}}}
        -- [Reward] {{{
        description = tostring( GenerateMasterWritRewardText(itemLink) )
        if(description) then
            label = label .."\n"..COLOR_4.."Reward: "..description
        end
        --}}}
--]]
    -- LABEL [EMPTY]
    else
        label = "empty"
        color = COLOR_8
    end

    -- [TOOLTIP]
    local  tt = color  .. label .."|r"

    -- DEBUG
    if(DEBUG or DEBUG_ITEM) then
        local tt_Id
        if(collId) then
            tt_Id = "\n- collId "  ..COLOR_4..tostring   ( collId   ).."|r"

        elseif(itemName ~= nil) then

            local slotId   = getItem_BAG_BACKPACK_slotId( itemName )

            tt_Id = "\n- itemLink "..COLOR_6..tostring   ( itemLink ).."|r"
            ..      "\n- collId "  ..COLOR_6..tostring   ( collId   ).."|r"
            ..      "\n- slotId "  ..COLOR_6..tostring   ( slotId   ).."|r"

        else  
            tt_Id = "\n...empty "  ..COLOR_3.."itemName|r"

        end

        tt = tt
        ..tt_Id
        .."\n- qsb_Id "            ..color  ..tostring( QSB.Settings.SlotItemTable[bNum].slotId  ) .."|r"
        .."\n- texture"            ..COLOR_8..tostring( QSB.Settings.SlotItemTable[bNum].texture ) .."|r"
    end

--D_ITEM("get_tooltipText("..tostring(bNum).."):\n"..tt)
    return tt

end --}}}

-- BAG OR COLLECTIONS
function getItem_slotId(itemName) --{{{

    local               itemId = getItem_BAG_BACKPACK_slotId   ( itemName )
--  if(itemId < 0) then itemId = getItem_collId_and_activeState( itemName ) end
    return itemId
end --}}}
function get_slotId_itemName(slotId) --{{{
    local itemName = nil
    local    data  = SHARED_INVENTORY.bagCache[BAG_BACKPACK][slotId]
    if(      data ~= nil) then
        itemName   = GetItemName(BAG_BACKPACK, data.slotIndex)
--  else itemName   = get_collId_itemName(slotId)
    end
D_ITEM("get_slotId_itemName("..tostring(slotId).."): return ["..tostring(itemName).."]")
    return nil
end
--}}}
-- BAG_BACKPACK
function getItem_BAG_BACKPACK_slotId(itemName) --{{{

    return getItem_bagId_slotId(BAG_BACKPACK, itemName)

end --}}}
function getItem_bagId_slotId(bagId, itemName) --{{{

    bagId    = tonumber(bagId)
    itemName = tostring(itemName)
D_ITEM("getItem_bagId_slotId("..bagId..","..itemName..")")

    for _, data in pairs(SHARED_INVENTORY.bagCache[bagId]) do
        if data ~= nil then
            local slotName  = GetItemName(bagId, data.slotIndex)
            if(   slotName == itemName) then
D_ITEM(            "...return ["..tostring(data.slotIndex).."]")
                  return data.slotIndex
            end
        end
    end

D_ITEM("getItem_bagId_slotId("..COLOR_3..bagId..", "..COLOR_4..tostring(itemName).."): return [-1]")
    return -1
end --}}}
function get_slotId_itemLevel(slotId) --{{{
    local  data  = SHARED_INVENTORY.bagCache[BAG_BACKPACK][slotId]
    if(    data == nil) then return nil end
    return data.requiredLevel
end
--}}}

-- COLLECTIONS_INVENTORY_SINGLETON
--function getItem_collId_and_activeState(itemName) --{{{
---- TODO (180213) .. (find a replacement to COLLECTIONS_INVENTORY_SINGLETON)
--
--    if(COLLECTIONS_INVENTORY_SINGLETON == nil) then
--D_ITEM("getItem_collId_and_activeState("..COLOR_5..tostring(itemName).."):\n"..COLOR_3.."*** (COLLECTIONS_INVENTORY_SINGLETON == nil) ***")
--    else
--        local data = COLLECTIONS_INVENTORY_SINGLETON:GetQuickslotData()
--        for i = 1, #data do
--            local slotName  = data[i].name
--            if(   slotName == itemName) then
--D_ITEM("getItem_collId_and_activeState("..COLOR_5..tostring(itemName)..")\n: return ["..tostring(data[i].collectibleId).."] active=["..tostring(data[i].active).."]")
--
--            return data[i].collectibleId, data[i].active
--        end
--    end
--end
--
--D_ITEM("getItem_collId_and_activeState("..COLOR_3..tostring(itemName).."): return [-1]")
--return -1, false
--end --}}}
--function get_collId_itemName(slotId) --{{{
--
--    local itemName = nil
--    if(COLLECTIONS_INVENTORY_SINGLETON == nil) then
--        D_ITEM("get_collId_itemName("..COLOR_5..tostring(slotId).."):\n"..COLOR_3.."*** (COLLECTIONS_INVENTORY_SINGLETON == nil) ***")
--    else
--        local     data = COLLECTIONS_INVENTORY_SINGLETON:GetQuickslotData()
--        for i = 1, #data do
--            if(   data[i].collectibleId == slotId) then
--                D_ITEM(COLOR_5.."name.........=[".. tostring(data[i].name         ) .."]")
--                D_ITEM(COLOR_5.."active.......=[".. tostring(data[i].active       ) .."]")
--                D_ITEM(COLOR_5.."categoryType.=[".. tostring(data[i].categoryType ) .."]")
--                D_ITEM(COLOR_5.."collectibleId=[".. tostring(data[i].collectibleId) .."]")
--                D_ITEM(COLOR_5.."iconFile.....=[".. tostring(data[i].iconFile     ) .."]")
--                itemName = data[i].name
--            end
--        end
--    end
--
--D_ITEM("get_collId_itemName("..tostring(slotId).."): return ["..tostring(itemName).."]")
--return itemName
--end --}}}
-- COLLECTIONS_BOOK_SINGLETON
--[[
 :!start explorer "http://esoapi.uesp.net/100017/src/ingame/collections/collectionsinventorysingleton.lua.html"
 :!start explorer "http://esoapi.uesp.net/100022/src/ingame/collections/collectionsbook_manager.lua.html"
--]]

-- COPY
function DeepCopy(orig) --{{{
--D("DeepCopy()")
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[DeepCopy(orig_key)] = DeepCopy(orig_value)
        end
        setmetatable(copy, DeepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end --}}}
function CopyFromTo(orig, dest) --{{{
D("CopyFromTo()")
    local orig_type = type(orig)
    local dest_type = type(dest)
    if  orig_type == 'table'
    and dest_type == 'table'
    then
        for orig_key, orig_value in pairs(orig) do
            dest[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
    --  if orig ~= nil then dest = orig end -- conservative
                            dest = orig
    end
end --}}}
function CopyNotNilSettingsFromTo(orig, dest) --{{{
--D("CopyNotNilSettingsFromTo()")

    -- not copied:
    -- any nil orgin value
    -- ...so as: copying settings from an obsolete-SavedVariables-version wont harm with nil values attached to missing fields
    -- PresetName
    -- Presets

    if( orig.MainWindow.X                             ~= nil) then dest.MainWindow.X                             = orig.MainWindow.X                             end
    if( orig.MainWindow.Y                             ~= nil) then dest.MainWindow.Y                             = orig.MainWindow.Y                             end
    if( orig.MainWindow.Width                         ~= nil) then dest.MainWindow.Width                         = orig.MainWindow.Width                         end
    if( orig.MainWindow.Height                        ~= nil) then dest.MainWindow.Height                        = orig.MainWindow.Height                        end

    if( orig.ButtonColumns                            ~= nil) then dest.ButtonColumns                            = orig.ButtonColumns                            end
    if( orig.ButtonFontSize                           ~= nil) then dest.ButtonFontSize                           = orig.ButtonFontSize                           end
    if( orig.ButtonSize                               ~= nil) then dest.ButtonSize                               = orig.ButtonSize                               end
    if( orig.ButtonsDisplayed                         ~= nil) then dest.ButtonsDisplayed                         = orig.ButtonsDisplayed                         end
    if( orig.GameActionButtonHide                     ~= nil) then dest.GameActionButtonHide                     = orig.GameActionButtonHide                     end
    if( orig.LockUI                                   ~= nil) then dest.LockUI                                   = orig.LockUI                                   end
    if( orig.NextPrevWrap                             ~= nil) then dest.NextPrevWrap                             = orig.NextPrevWrap                             end
    if( orig.NextAuto                                 ~= nil) then dest.NextAuto                                 = orig.NextAuto                                 end
    if( orig.ShowBackground                           ~= nil) then dest.ShowBackground                           = orig.ShowBackground                           end
    if( orig.SwapBackgroundColors                     ~= nil) then dest.SwapBackgroundColors                     = orig.SwapBackgroundColors                     end
    if( orig.Visibility                               ~= nil) then dest.Visibility                               = orig.Visibility                               end
    if( orig.SoundSlotted                             ~= nil) then dest.SoundSlotted                             = orig.SoundSlotted                             end
    if( orig.SoundAlert                               ~= nil) then dest.SoundAlert                               = orig.SoundAlert                               end
    if( orig.SlotItemTable                            ~= nil) then dest.SlotItemTable                            = DeepCopy(orig.SlotItemTable)                  end

    if( orig.SlotItem.KeyBindAlignH                   ~= nil) then dest.SlotItem.KeyBindAlignH                   = orig.SlotItem.KeyBindAlignH                   end
    if( orig.SlotItem.KeyBindAlignV                   ~= nil) then dest.SlotItem.KeyBindAlignV                   = orig.SlotItem.KeyBindAlignV                   end
    if( orig.SlotItem.NotSelectedButtonOpacity        ~= nil) then dest.SlotItem.NotSelectedButtonOpacity        = orig.SlotItem.NotSelectedButtonOpacity        end
    if( orig.SlotItem.OverlayButtonOpacity            ~= nil) then dest.SlotItem.OverlayButtonOpacity            = orig.SlotItem.OverlayButtonOpacity            end
    if( orig.SlotItem.QuantityAlert                   ~= nil) then dest.SlotItem.QuantityAlert                   = orig.SlotItem.QuantityAlert                   end
    if( orig.SlotItem.QuantityLabelPositionHorizontal ~= nil) then dest.SlotItem.QuantityLabelPositionHorizontal = orig.SlotItem.QuantityLabelPositionHorizontal end
    if( orig.SlotItem.QuantityLabelPositionVertical   ~= nil) then dest.SlotItem.QuantityLabelPositionVertical   = orig.SlotItem.QuantityLabelPositionVertical   end
    if( orig.SlotItem.QuantityWarning                 ~= nil) then dest.SlotItem.QuantityWarning                 = orig.SlotItem.QuantityWarning                 end
    if( orig.SlotItem.HideSlotBackground              ~= nil) then dest.SlotItem.HideSlotBackground              = orig.SlotItem.HideSlotBackground              end
    if( orig.SlotItem.ShowKeyBindings                 ~= nil) then dest.SlotItem.ShowKeyBindings                 = orig.SlotItem.ShowKeyBindings                 end
    if( orig.SlotItem.ShowNumbers                     ~= nil) then dest.SlotItem.ShowNumbers                     = orig.SlotItem.ShowNumbers                     end
    if( orig.SlotItem.ShowQuantityLabels              ~= nil) then dest.SlotItem.ShowQuantityLabels              = orig.SlotItem.ShowQuantityLabels              end
    if( orig.SlotItem.VisualCue                       ~= nil) then dest.SlotItem.VisualCue                       = orig.SlotItem.VisualCue                       end

end --}}}
function CopySettingsDefaultsTo(dest) --{{{
--D("CopySettingsDefaultsTo()")

    dest.MainWindow.X                             = QSB.SettingsDefaults.MainWindow.X
    dest.MainWindow.Y                             = QSB.SettingsDefaults.MainWindow.Y
    dest.MainWindow.Width                         = QSB.SettingsDefaults.MainWindow.Width
    dest.MainWindow.Height                        = QSB.SettingsDefaults.MainWindow.Height

    dest.ButtonColumns                            = QSB.SettingsDefaults.ButtonColumns
    dest.ButtonFontSize                           = QSB.SettingsDefaults.ButtonFontSize
    dest.ButtonSize                               = QSB.SettingsDefaults.ButtonSize
    dest.ButtonsDisplayed                         = QSB.SettingsDefaults.ButtonsDisplayed
    dest.GameActionButtonHide                     = QSB.SettingsDefaults.GameActionButtonHide
    dest.LockUI                                   = QSB.SettingsDefaults.LockUI
    dest.NextPrevWrap                             = QSB.SettingsDefaults.NextPrevWrap
    dest.NextAuto                                 = QSB.SettingsDefaults.NextAuto
    dest.ShowBackground                           = QSB.SettingsDefaults.ShowBackground
    dest.SwapBackgroundColors                     = QSB.SettingsDefaults.SwapBackgroundColors
    dest.Visibility                               = QSB.SettingsDefaults.Visibility
    dest.SoundSlotted                             = QSB.SettingsDefaults.SoundSlotted
    dest.SoundAlert                               = QSB.SettingsDefaults.SoundAlert
    dest.SlotItemTable                            = DeepCopy(QSB.SettingsDefaults.SlotItemTable)

    dest.SlotItem.KeyBindAlignH                   = QSB.SettingsDefaults.SlotItem.KeyBindAlignH
    dest.SlotItem.KeyBindAlignV                   = QSB.SettingsDefaults.SlotItem.KeyBindAlignV
    dest.SlotItem.NotSelectedButtonOpacity        = QSB.SettingsDefaults.SlotItem.NotSelectedButtonOpacity
    dest.SlotItem.OverlayButtonOpacity            = QSB.SettingsDefaults.SlotItem.OverlayButtonOpacity
    dest.SlotItem.QuantityAlert                   = QSB.SettingsDefaults.SlotItem.QuantityAlert
    dest.SlotItem.QuantityLabelPositionHorizontal = QSB.SettingsDefaults.SlotItem.QuantityLabelPositionHorizontal
    dest.SlotItem.QuantityLabelPositionVertical   = QSB.SettingsDefaults.SlotItem.QuantityLabelPositionVertical
    dest.SlotItem.QuantityWarning                 = QSB.SettingsDefaults.SlotItem.QuantityWarning
    dest.SlotItem.HideSlotBackground              = QSB.SettingsDefaults.SlotItem.HideSlotBackground
    dest.SlotItem.ShowKeyBindings                 = QSB.SettingsDefaults.SlotItem.ShowKeyBindings
    dest.SlotItem.ShowNumbers                     = QSB.SettingsDefaults.SlotItem.ShowNumbers
    dest.SlotItem.ShowQuantityLabels              = QSB.SettingsDefaults.SlotItem.ShowQuantityLabels
    dest.SlotItem.VisualCue                       = QSB.SettingsDefaults.SlotItem.VisualCue

end --}}}

-- UI (build & refresh)
function Refresh() --{{{
D("Refresh()")
    if not QSB.Settings then return end
    if     QSB.Moving or QSB.Resizing then return end
    if not ZO_Skills:IsHidden() then  D(COLOR_5.."Refresh: not ZO_Skills:IsHidden()"); return end

    GameActionButtonHideHandler(false,"Refresh") -- (160218)

    if(not Refresh_pending) then
        Refresh_pending = true
        zo_callLater(Refresh_delayed, ZO_CALLLATER_DELAY_REFRESH)
    end
end  --}}}
function Refresh_delayed() --{{{
D("...Refresh_delayed()")
    --{{{
    Refresh_pending = false

    if(QSB_BAG_BACKPACK_UPDATE_slotId >= 0) then
        check_QSB_BAG_BACKPACK_slotId_to_check()
    end

    QSB_BAG_BACKPACK_UPDATE_mutex = false
    --}}}
    -- GEOMETRY --{{{
    GreymindQuickSlotBarUI:SetClampedToScreen(true)

    if(QSB.Buttons[1] == nil) then
        ButtonSizeChanged()
        BuildUIHandles()
    end

    if( QSB.Settings.MainWindow.X == 0) and (QSB.Settings.MainWindow.Y == 0) then
        QSB.Settings.MainWindow.X = math.floor(GuiRoot:GetWidth()  / 2)
        QSB.Settings.MainWindow.Y = math.floor(GuiRoot:GetHeight() / 2)

        if     QSB.Settings.PresetName  == "P1" then
            QSB   .Settings.MainWindow.X = QSB.Settings.MainWindow.X -  32
        elseif QSB.Settings.PresetName  == "P2" then
            QSB   .Settings.MainWindow.X = QSB.Settings.MainWindow.X -  64
        elseif QSB.Settings.PresetName  == "P3" then
            QSB   .Settings.MainWindow.X = QSB.Settings.MainWindow.X -  96
        elseif QSB.Settings.PresetName  == "P4" then
            QSB   .Settings.MainWindow.X = QSB.Settings.MainWindow.X - 128
        end

    end

    GreymindQuickSlotBarUI:ClearAnchors()
    GreymindQuickSlotBarUI:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, QSB.Settings.MainWindow.X, QSB.Settings.MainWindow.Y)

    --}}}
    -- LOCK --{{{
    if QSB.Settings.LockUI then
        GreymindQuickSlotBarUI:SetMovable(false)
        GreymindQuickSlotBarUI:SetResizeHandleSize(0)
    else
        GreymindQuickSlotBarUI:SetMovable(true)
        GreymindQuickSlotBarUI:SetResizeHandleSize(16) --(QSB.ButtonPadding / 2)
    end

    GreymindQuickSlotBarUI:SetMouseEnabled   (true)

    GreymindQuickSlotBarUI:SetHandler("OnMouseEnter" , OnMouseEnter )
    GreymindQuickSlotBarUI:SetHandler("OnMouseExit"  , OnMouseExit  )

    GreymindQuickSlotBarUI:SetHandler("OnMoveStart"  , OnMoveStart  )
    GreymindQuickSlotBarUI:SetHandler("OnMoveStop"   , OnMoveStop   )

    GreymindQuickSlotBarUI:SetHandler("OnResizeStart", OnResizeStart)
    GreymindQuickSlotBarUI:SetHandler("OnResizeStop" , OnResizeStop )
GreymindQuickSlotBarUI:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
GreymindQuickSlotBarUI:SetHandler("OnMouseExit" , ZO_Options_OnMouseExit)

    --}}}
    local tasks_pending = (#tasks_loaded > 0) or (#tasks_posted > 0)

    -- BACKGROUND --{{{
    if not QSB.Settings.LockUI then
        GreymindQuickSlotBarUIBackdrop:SetAlpha(1.0)
    elseif QSB.Settings.ShowBackground then
        GreymindQuickSlotBarUIBackdrop:SetAlpha(0.5)
    else
        GreymindQuickSlotBarUIBackdrop:SetAlpha(0.0)
    end
    --}}}
    -- QUICK SLOT BUTTONS {{{
    local slot_settings = QSB.Settings.SlotItem
    local buttonSize    = QSB.Settings.ButtonSize

    --}}}
    -- UI TOOLTIP {{{
    if QSB.Settings.LockUI then
        if tasks_pending then
            GreymindQuickSlotBarUI.data = {tooltipText = COOLDOWN_TT}
        else
            GreymindQuickSlotBarUI.data = {
                tooltipText
                =  QSB.Name.." "..QSB.Version.." Wolfhunter\n"
                ..(QSB.AccountWideSettings.SaveAccountWide and COLOR_3.."Account-wide Settings"
                or                                             COLOR_6..GetUnitName("player").."|r Character Settings"
                )

        }
    end
    else
        GreymindQuickSlotBarUI.data = {tooltipText = UNLOCKED_TT}
    end

    --}}}

    local x, y, hAlign, vAlign, row, col, color, alpha
    row = 0
    col = 0
    local current_slotIndex = GetCurrentQuickslot()
    for bNum = 1, QSB.ButtonCountMax do
        local slotIndex  = bNum_to_slotIndex( bNum )
        -- Buttons first build {{{
        if (QSB.Buttons[bNum] == nil) then
            tostring_bNum = tostring(bNum)
            QSB.Buttons[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButton" .. tostring_bNum, GreymindQuickSlotBarUI, CT_BUTTON)
            local button = QSB.Buttons[bNum]
            button:SetDimensions(buttonSize, buttonSize)
            button:SetState(BSTATE_NORMAL)
            button:SetNormalFontColor(1, 1, 1, 1)
            button:SetHidden(false)
            button:SetEnabled(true)
            button:SetVerticalAlignment(1)
            button:SetHandler("OnClicked"   , function() OnClicked_bNum(bNum) end)
            button:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
            button:SetHandler("OnMouseExit" , ZO_Options_OnMouseExit)

            QSB.Basegrounds[bNum]       = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonBaseground"       .. tostring_bNum, GreymindQuickSlotBarUI, CT_TEXTURE)
            local baseground            = QSB.Basegrounds[bNum]
            baseground                  :SetTexture(BASEBACKGROUNDTEXTURE)
            baseground                  :SetAnchorFill(button)

            QSB.Backgrounds[bNum]       = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonBackground"       .. tostring_bNum, GreymindQuickSlotBarUI, CT_TEXTURE)
            local background            = QSB.Backgrounds[bNum]
            background                  :SetTexture(BACKGROUNDTEXTURE)
            background                  :SetAnchorFill(button)

            QSB.VisualCueBorders[bNum]  = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonVisualCue"        .. tostring_bNum, GreymindQuickSlotBarUI, CT_TEXTURE)
            local visualCueBorder       = QSB.VisualCueBorders[bNum]
            visualCueBorder             :SetTexture(VISUALCUEBORDERTEXTURE)
            visualCueBorder             :SetAnchorFill(button)

            QSB.Borders[bNum]           = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonBorder"           .. tostring_bNum, GreymindQuickSlotBarUI, CT_TEXTURE)
            local border                = QSB.Borders[bNum]
            border                      :SetTexture(BORDERTEXTURE)
            border                      :SetAnchorFill(button)

            QSB.Overgrounds[bNum]       = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonOverground"       .. tostring_bNum, GreymindQuickSlotBarUI, CT_TEXTURE)
            local overground            = QSB.Overgrounds[bNum]
            overground                  :SetAnchorFill(button)
            overground                  :SetColor(0.0,0.0,0.0)

            QSB.KeyLabels[bNum]         = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonKeyName"          .. tostring_bNum, GreymindQuickSlotBarUI, CT_LABEL)
            local keyLabel              = QSB.KeyLabels[bNum]
            keyLabel                    :SetAnchor(CENTER, button, CENTER, 0, -(buttonSize / 2) - QSB.ButtonPadding)

            QSB.QuantityLabels[bNum]    = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonQuantityLabel"    .. tostring_bNum, GreymindQuickSlotBarUI, CT_LABEL)
            local quantityLabel         = QSB.QuantityLabels[bNum]
            quantityLabel               :SetAnchor(CENTER, button, CENTER, 0, -(buttonSize / 2) - QSB.ButtonPadding)

        end --}}}

        -- Collect button elements --{{{
        local button            = QSB.Buttons[bNum]
        local background        = QSB.Backgrounds[bNum]
        local baseground        = QSB.Basegrounds[bNum]
        local visualCueBorder   = QSB.VisualCueBorders[bNum]
        local border            = QSB.Borders[bNum]
        local overground        = QSB.Overgrounds[bNum]
        local keyLabel          = QSB.KeyLabels[bNum]
        local quantityLabel     = QSB.QuantityLabels[bNum]
        local slotItemCount     = GetSlotItemCount(slotIndex)
        local buttonTexture     = GetSlotTexture(slotIndex)
        local emptySlot         = (buttonTexture == "")

        -- PRESET texture (i.e. GetSlotTexture is missing when stackCount is null)
        if  (QSB.Settings.SlotItemTable               ~= nil)
        and (QSB.Settings.SlotItemTable[bNum].texture ~= nil)
        then
            buttonTexture = QSB.Settings.SlotItemTable[bNum].texture
--D_ITEM("...["..bNum.."] ["..COLOR_3..QSB.Settings.SlotItemTable[bNum].itemName.."]:")
--D_ITEM("...["..bNum.."] ["..COLOR_4..buttonTexture.."]")
        end

        --}}}
        -- ESOUI-vedarion --{{{
        if not slotItemCount then
            D(COLOR_7.."-GQSB: [slotItemCount=nil] for [slotIndex="..tostring(slotIndex).."]");
            slotItemCount = 1;
        end
        --}}}
        -- Update with settings that may have changed {{{
        local font_arg = "EsoUI/Common/Fonts/univers57.otf"           .."|"..tostring(QSB.Settings.ButtonFontSize).."|".."soft-shadow-thin"
        ----- font_arg = "EsoUI/Common/Fonts/esocartographer-bold.otf".."|"..tostring(QSB.Settings.ButtonFontSize).."|".."outline"
        button       : SetFont( font_arg )
        keyLabel     : SetFont( font_arg )
        quantityLabel: SetFont( font_arg )

        --}}}
        -- Start with elements not displayed --{{{

        background      : SetHidden(true)
        button          : SetHidden(true)
        keyLabel        : SetHidden(true)
        quantityLabel   : SetHidden(true)
        visualCueBorder : SetHidden(true)

        button          : SetDimensions(1, 1)   -- find out IF AND WHY this is required

        background      : SetAlpha(0)
        border          : SetAlpha(0)
        button          : SetAlpha(0)
        keyLabel        : SetAlpha(0)
        quantityLabel   : SetAlpha(0)
        visualCueBorder : SetAlpha(0)

        --}}}
        if (bNum <= QSB.Settings.ButtonsDisplayed) then
            -- layout
            -- [buttonSize] [buttonTexture] [x,y] [row,col] --{{{
            button:SetDimensions(buttonSize, buttonSize)
if(buttonTexture) then
            button:SetNormalTexture(buttonTexture)
            overground:SetTexture(buttonTexture)
end
            x = QSB.ButtonPadding + col * (buttonSize + QSB.ButtonMargin)
            y = QSB.ButtonPadding + row * (buttonSize + QSB.ButtonMargin)
            button:SetAnchor(TOPLEFT, GreymindQuickSlotBarUI, TOPLEFT, x, y)
            col = col + 1
            if ((col % QSB.Settings.ButtonColumns) == 0) then
                row = row + 1
                col = 0
            end

            --}}}
            -- text
            -- ShowNumbers --{{{
            if slot_settings.ShowNumbers then
                button:SetText(tostring(bNum))
            else
                button:SetText("")
            end

            --}}}
            -- quantityLabel [text, layout] --{{{
            if not emptySlot then
                quantityLabel:SetText(GetSlotItemCount(slotIndex))
            else
                quantityLabel:SetText("")
            end

            quantityLabel:ClearAnchors()

            hAlign = slot_settings.QuantityLabelPositionHorizontal
            vAlign = slot_settings.QuantityLabelPositionVertical
            x, y   = GetAlignmentXY(hAlign, vAlign)

            quantityLabel:SetAnchor(CENTER, button, CENTER, x,  y)

            --}}}
            -- keyLabel [text, layout] --{{{
            keyLabel:SetText(GetSlotItemKeyName(bNum))

            keyLabel:ClearAnchors()

            hAlign = slot_settings.KeyBindAlignH
            vAlign = slot_settings.KeyBindAlignV
            x, y   = GetAlignmentXY(hAlign, vAlign)

            keyLabel:SetAnchor(CENTER, button, CENTER, x,  y)

            --}}}
            -- color
            -- COLOR [keyLabel] --{{{
            if slotIndex == current_slotIndex then
                color   = COLORCURRENTKEY
            else
                color   = COLORNORMAL
            end
            keyLabel:SetColor(color.R, color.G, color.B)

            --}}}
            -- COLOR [quantityLabel] --{{{
--[[
            if slotItemCount == 0 then
                color   = COLORALERT
            else
                color   = COLORNORMAL
            end
            quantityLabel:SetColor(color.R, color.G, color.B)

--]]
            --}}}
            -- COLOR [visualCueBorder] --{{{
            if tasks_pending then
                color       = COLORCOOLDOWN
            elseif emptySlot then
                color       = COLORNORMAL
            elseif(slotItemCount <= slot_settings.QuantityWarning) then
                if(slotItemCount <= slot_settings.QuantityAlert) then
                    color   = COLORALERT
                else
                    color   = COLORWARNING
                end
            else
                color       = COLORNORMAL
            end
            visualCueBorder:SetColor(color.R, color.G, color.B)
            quantityLabel  :SetColor(color.R, color.G, color.B)
            --}}}
            -- alpha
            -- ALPHA [background, baseground, border, button, keyLabel, quantityLabel] --{{{
            if slotIndex == current_slotIndex then
                alpha = 1.0
                border        :SetAlpha(alpha)
                button        :SetAlpha(alpha)
                keyLabel      :SetAlpha(alpha)
                quantityLabel :SetAlpha(alpha)
                background    :SetAlpha(alpha)
                baseground    :SetAlpha(alpha)
                overground    :SetAlpha(0)

            else
                alpha = slot_settings.NotSelectedButtonOpacity / 100     -- from [1-100] to [0-1.0]
                if QSB.SomeSlotItemChanged then
                    if( alpha < 0.5) then
                        alpha = 0.5
                    end
                end
                border        :SetAlpha( alpha )
                button        :SetAlpha( alpha )
                keyLabel      :SetAlpha( alpha )
                quantityLabel :SetAlpha( alpha )
                if slotItemCount ~= 0 then
                    background:SetAlpha( alpha )
                    baseground:SetAlpha( alpha )
                else
                    background:SetAlpha(0.1) -- Consumed dark background
                    baseground:SetAlpha(0.1)
                end
                overground:SetAlpha(slot_settings.OverlayButtonOpacity / 100)

            end

            --}}}
            -- ALPHA [visualCueBorder] --{{{
            if tasks_pending then
                    alpha = 1.0
            elseif(slotIndex == current_slotIndex) then
                if(slotItemCount <= slot_settings.QuantityWarning) then
                    alpha = 1.0
                else
                    alpha = 0.0
                end
            else
                if  not emptySlot
                and (slotItemCount <= slot_settings.QuantityWarning)
                then
                    alpha = slot_settings.NotSelectedButtonOpacity / 100     -- from [1-100] to [0-1.0]
                else
                    alpha = 0.0
                end
            end
            visualCueBorder:SetAlpha(alpha)

            --}}}
            -- display-hide
            --{{{
            background      : SetHidden(    slot_settings.HideSlotBackground)
            button          : SetHidden(   (slot_settings.VisualCue == VISCUE_WAC) and (slotItemCount == 0)                        )
            overground      : SetHidden(   (slot_settings.VisualCue == VISCUE_WAC) and (slotItemCount == 0)                        )
            keyLabel        : SetHidden(not slot_settings.ShowKeyBindings)
            quantityLabel   : SetHidden(not slot_settings.ShowQuantityLabels)
            visualCueBorder : SetHidden(    slot_settings.VisualCue == VISCUE_OFF and not tasks_pending)

            -- empty slots
            if emptySlot then
                overground      : SetHidden(true)
            end

            -- UNLOCKED LAYOUT
            if not QSB.Settings.LockUI then

                if tasks_pending then
                    visualCueBorder:SetColor(COLORCOOLDOWN.R, COLORCOOLDOWN.G, COLORCOOLDOWN.B)
                else
                    visualCueBorder:SetColor(COLORALERT.R   , COLORALERT.G   , COLORALERT.B   )
                end

                background:SetAlpha(1) -- so we can see what we are doing
                button    :SetAlpha(1)

                button:SetNormalFontColor(1, 0, 0, 1)
                button:SetFont("EsoUI/Common/Fonts/univers57.otf|"..tostring(math.floor(0.8 * QSB.Settings.ButtonSize)))
                button:SetText("X")
                button.data = {tooltipText = UNLOCKED_TT}

                button:SetMouseEnabled(false) -- UI move and resize through

            -- LOCKED LAYOUT
            else
                button:SetMouseEnabled( true) -- button click

                button:SetNormalFontColor(1, 1, 1, 1)
                if tasks_pending then
                    button.data = {tooltipText = COOLDOWN_TT}
                else
                    button.data = {tooltipText = get_tooltipText(bNum)}
                end
            end

            --}}}
            -- background f(GetActiveWeaponPairInfo) -- 150329 {{{
            if QSB.Settings.SwapBackgroundColors then
                local activeWeaponPair = GetActiveWeaponPairInfo()
--d("Refresh: activeWeaponPair=["..tostring( activeWeaponPair ).."]")
                if(activeWeaponPair == 1) then
                    color   = COLORACTIVEWEAPONPAIR1
                else
                    color   = COLORACTIVEWEAPONPAIR2
                end
            else
                    color   = COLORNORMAL
            end

            if tasks_pending then
                color   = COLORCOOLDOWN
            end

            background:SetColor(color.R, color.G, color.B)
            background:SetAlpha(color.A)
            --}}}
        end
    end

    Display()

end  --}}}
function BuildUIHandles() --{{{
D("BuildUIHandles():")

    local font_arg   = "EsoUI/Common/Fonts/univers57.otf|18|soft-shadow-thin"
    local handleSize = 32
    local offsetX    = -handleSize -2

    local button, texture, label
    for hNum, hName in pairs( QSB.UIHandleNames ) do

        -- button
        button = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..hNum, GreymindQuickSlotBarUI, CT_BUTTON)
        button:SetDimensions(handleSize, handleSize)
        button:SetAnchor(BOTTOMLEFT, GreymindQuickSlotBarUI, TOPLEFT, offsetX, 0)
        offsetX = offsetX + 2 + handleSize

        -- events
        button:SetHandler("OnClicked"   , function() OnClicked_handle(hName) end)
        button:SetHandler("OnMouseEnter", OnMouseEnter)
        button:SetHandler("OnMouseExit" , OnMouseExit )

        if    hName == "L" then
            button:SetDimensions(32,32)
            texture = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..hNum.."_texture", GreymindQuickSlotBarUI, CT_TEXTURE)
            texture:SetTexture("/esoui/art/quest/tracked_pin.dds")
            texture:SetAnchorFill(button)
            QSB.UIHandles[hName] = texture

        elseif hName == "S" then
            button:SetDimensions(32,32)
            texture = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..hNum.."_texture", GreymindQuickSlotBarUI, CT_TEXTURE)
            texture:SetTexture("/esoui/art/menubar/menubar_mainmenu_over.dds")
            texture:SetAnchorFill(button)
            QSB.UIHandles[hName] = texture

        else
            label = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..hNum.."_label", GreymindQuickSlotBarUI, CT_LABEL)
            label:SetAnchor(CENTER, button, CENTER, 0, 0)
            label:SetFont(font_arg)
            label:SetText(hName)
            QSB.UIHandles[hName] = label

        end
    end

end --}}}
function GameActionButtonHideHandler(just_changed,caller) --{{{
D(COLOR_5.."GameActionButtonHideHandler(just_changed="..tostring(just_changed)..COLOR_3.." caller=[".. caller .."]):|r")

    if     QSB.Settings.GameActionButtonHide then
        if not ActionButton9:IsHidden() then
            D(COLOR_6.."- @@@ HIDING Game Action Slot Button"..COLOR_3.." caller=[".. caller .."]|r")  --(160218)
            ActionButton9:SetHidden(true)
        end

    else
        -- if asked not to handle button anymore, make it visible again in case it is hidden
        if just_changed then
            if ActionButton9:IsHidden() then
                D(COLOR_5.."- @@@ RESTORING Game Action Slot Button"..COLOR_3.." caller=[".. caller .."]|r")  --(160218)
                ActionButton9:SetHidden(false)
            end
        end

    end

end --}}}
function ShowUIHandles() --{{{ D("ShowUIHandles")
    if not QSB.UIHandles then return end

    SetUIHandlesVisibility( true )

end --}}}
function HideUIHandles() --{{{
--D("HideUIHandles")
    if not QSB.UIHandles then return end

    SetUIHandlesVisibility( false )

end --}}}
function SetUIHandlesVisibility( visible ) --{{{
--D("SetUIHandlesVisibility("..tostring(visible)..")")
    if not QSB.UIHandles then return end

    for k, v in pairs( QSB.UIHandles ) do
        if not visible then
            QSB.UIHandles[k]:SetAlpha(0)
        else
            if string.match(k, "P([1-5])") then         -- preset

                if k == QSB.Settings.PresetName then
                    QSB.UIHandles[k]:SetColor(1,1,1)    -- white
                    QSB.UIHandles[k]:SetAlpha(1.0)      -- current
                else
                    QSB.UIHandles[k]:SetColor(1,0.7,0)  -- orange
                    QSB.UIHandles[k]:SetAlpha(0.5)      -- can be selected
                end

            elseif string.match(k, "S") then            -- settings

                QSB.UIHandles[k]:SetAlpha(1)

            elseif string.match(k, "L") then            -- lock

                QSB.UIHandles[k]:SetAlpha(1)

            end

        end
    end

end --}}}

-- UI (display)
function Display() --{{{
    if not QSB.Settings then return end

    -- VIS_NEVER -- only show with ForceBarVisibility
    if QSB.Settings.Visibility == VIS_NEVER then
        if not ForceBarVisibility and not Reticle_isHidden then
            Hide("Display.VIS_NEVER")
        end
        return
    end

    -- VIS_ALWAYS -- ...
    if QSB.Settings.Visibility == VIS_ALWAYS then
        Show()
        return
    end

    -- UNLOCKED -- always show
    if not QSB.Settings.LockUI then
        Show()
        return
    end

    -- VIS_RETICLE      -- event handler provides

    -- VIS_COMBAT       -- combat state decides
    if QSB.Settings.Visibility == VIS_COMBAT then
        if IsUnitInCombat('player') then
            Show()
        elseif not ForceBarVisibility and not Reticle_isHidden then
            Hide("Display.VIS_COMBAT")
        end
    end

    -- VIS_BLINK_CHANGES -- hide in all cases
    if QSB.Settings.Visibility == VIS_BLINK_CHANGES then
        if not ForceBarVisibility and not Reticle_isHidden then
            Hide("Display.VIS_BLINK_CHANGES")
        end
    end

end --}}}
function Show() --{{{
D("Show()")
    if((QSB.Settings.Visibility == VIS_NEVER) and (not ForceBarVisibility)) then return end
    if not ZO_Skills:IsHidden() then  D(COLOR_5.." Show: not ZO_Skills:IsHidden()"); return end

    if ZO_CraftingUtils_IsCraftingWindowOpen() then
        D(COLOR_3.." Show: ZO_CraftingUtils_IsCraftingWindowOpen");
        return
    end

    if(not Show_pending) then
        Show_pending = true
        zo_callLater(Show_delayed, ZO_CALLLATER_DELAY_SHOW)
    end
end  --}}}
function Show_delayed() --{{{
D("...Show_delayed()")
    Show_pending = false

    if BlockBarVisibility then return end

    QSB.IsVisible = true
    GreymindQuickSlotBarUI:SetHidden(false)

    OnMouseExit()
end --}}}
function Hide(caller) --{{{
D("Hide(caller=["..caller.."])")
    if(not Hide_pending) then
        Hide_pending = true
        zo_callLater(Hide_delayed, ZO_CALLLATER_DELAY_HIDE)
    end
end  --}}}
function Hide_delayed() --{{{
D("...Hide_delayed()")
    Hide_pending = false

    if ForceBarVisibility and not BlockBarVisibility then return end

    QSB.IsVisible = false
    GreymindQuickSlotBarUI:SetHidden(true)
end --}}}

-- LAYOUT (edit)
function UIWindowChanged() --{{{
D("UIWindowChanged()")

    -- POSITION --> X,Y
    QSB.Settings.MainWindow.X = GreymindQuickSlotBarUI:GetLeft()
    QSB.Settings.MainWindow.Y = GreymindQuickSlotBarUI:GetTop()

    -- SIZE --> COLS x ROWS
    local winW  = math.floor(    GreymindQuickSlotBarUI:GetWidth ()) - 2 * QSB.ButtonPadding
    local winH  = math.floor(    GreymindQuickSlotBarUI:GetHeight()) - 2 * QSB.ButtonPadding

    winW        = math.max(winW, QSB.Settings.ButtonSize)
    winH        = math.max(winH, QSB.Settings.ButtonSize)

    winW        = math.floor(winW+0.5)
    winH        = math.floor(winH+0.5)

    local cols  = math.floor(0.25 + (winW / QSB.Settings.ButtonSize))
    local rows  = math.floor(0.25 + (winH / QSB.Settings.ButtonSize))


    -- Normalize ButtonColumns
    cols, rows = Adjust_ButtonColumns(cols, rows)

    -- Normalize MainWindow
    Adjust_MainWindow(cols,rows)


end --}}}
function ButtonSizeChanged() --{{{
D("ButtonSizeChanged()")

    -- COLS x ROWS --> WIDTH x HEIGHT

    local cols =           QSB.Settings.ButtonColumns
    local rows = math.ceil(QSB.Settings.ButtonsDisplayed / cols)

    QSB.ButtonPadding = QSB.Settings.ButtonSize / 4.5
    QSB.ButtonMargin  = QSB.Settings.ButtonSize / 18

    -- Normalize ButtonColumns
    cols, rows = Adjust_ButtonColumns(cols, rows)

    -- Normalize MainWindow
    Adjust_MainWindow(cols,rows)

end --}}}
function Adjust_ButtonColumns(cols,rows) --{{{
D("Adjust_ButtonColumns(cols="..cols..", rows="..rows..")")

    -- [1] >= [cols] <= [ButtonCountMax]
    cols = math.max(cols, 1)                                    -- [cols >= 1             ]
    cols = math.min(cols, QSB.ButtonCountMax)                   -- [cols <= ButtonCountMax]

    -- 1 >= rows <= ButtonCountMax
    rows = math.max(rows, 1)                                    -- [rows >= 1             ]
    rows = math.min(rows, QSB.ButtonCountMax)                   -- [rows <= ButtonCountMax]

    -- 2 >= ButtonCountMax
    if ((rows * cols) < 2) then
        rows = 2
    end

    -- rows <= ButtonCountMax
    if ((rows * cols) >  QSB.ButtonCountMax) then
        rows = math.ceil(QSB.ButtonCountMax / cols)
    end

    -- rows*cols <= ButtonsDisplayed <= ButtonCountMax
    if ((rows * cols) > QSB.ButtonCountMax) then
        QSB.Settings.ButtonsDisplayed = QSB.ButtonCountMax
    else
        QSB.Settings.ButtonsDisplayed = (rows * cols)
    end

    -- ButtonColumns
    QSB.Settings.ButtonColumns = cols

    return cols, rows
end --}}}
function Adjust_MainWindow(cols,rows) --{{{
D("Adjust_MainWindow(cols="..cols..", rows="..rows..")")

    -- window width to match cols
    local winW  =            QSB.ButtonPadding
                +  cols    * QSB.Settings.ButtonSize
                + (cols-1) * QSB.ButtonMargin
                +            QSB.ButtonPadding

    -- window height to match rows
    local winH  =            QSB.ButtonPadding
                +  rows    * QSB.Settings.ButtonSize
                + (rows-1) * QSB.ButtonMargin
                +            QSB.ButtonPadding

    winW        = math.floor(winW+0.5)
    winH        = math.floor(winH+0.5)

    -- MainWindow Geometry
    QSB.Settings.MainWindow.Width  = winW
    QSB.Settings.MainWindow.Height = winH

    -- UI Geometry
    GreymindQuickSlotBarUI:SetWidth (QSB.Settings.MainWindow.Width )
    GreymindQuickSlotBarUI:SetHeight(QSB.Settings.MainWindow.Height)

end --}}}
function GetAlignmentXY(hAlign, vAlign) --{{{

    local bSize_2 = QSB.Settings.ButtonSize     / 2
    local fSize_2 = QSB.Settings.ButtonFontSize / 2

    local x
    if     hAlign == ALIGNH[1] then  x = -bSize_2 - fSize_2  -- Off-Left
    elseif hAlign == ALIGNH[2] then  x = -bSize_2 + fSize_2  --     Left
    elseif hAlign == ALIGNH[4] then  x =  bSize_2 - fSize_2  --     Right
    elseif hAlign == ALIGNH[5] then  x =  bSize_2 + fSize_2  -- Off-Right
    else                             x = 0                   --     Center
    end

    local y
    if     vAlign == ALIGNV[1] then  y = -bSize_2 - fSize_2  -- Above
    elseif vAlign == ALIGNV[2] then  y = -bSize_2 + fSize_2  -- Top
    elseif vAlign == ALIGNV[4] then  y =  bSize_2 - fSize_2  -- Bottom
    elseif vAlign == ALIGNV[5] then  y =  bSize_2 + fSize_2  -- Below
    else                             y = 0                   -- Middle
    end

    return x, y
end --}}}

-- SOUND
function PlaySoundAlert(caller) --{{{
D("PlaySoundAlert("..COLOR_7..caller.."|r)")
    if(QSB.Settings.SoundAlert == NO_SOUND) then return end
    if(not PlaySoundAlert_pending) then
        PlaySoundAlert_pending = true
        zo_callLater(PlaySoundAlert_delayed, ZO_CALLLATER_DELAY_SOUND)
    end
end  --}}}
function PlaySoundAlert_delayed() --{{{
D(COLOR_2.."...PlaySoundAlert_delayed()")
    PlaySoundAlert_pending = false

--  PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
--  PlaySound(SOUNDS.QUICKSLOT_USE_EMPTY)
    PlaySound(QSB.Settings.SoundAlert)
end
--}}}
function PlaySoundSlotted(caller) --{{{
D("PlaySoundSlotted("..COLOR_7..caller.."|r)")
    if(QSB.Settings.SoundSlotted == NO_SOUND) then return end
    if(not PlaySoundSlotted_pending) then
        PlaySoundSlotted_pending = true
        zo_callLater(PlaySoundSlotted_delayed, ZO_CALLLATER_DELAY_SOUND)
    end
end  --}}}
function PlaySoundSlotted_delayed() --{{{
D(COLOR_5.."...PlaySoundSlotted_delayed()|r")
    PlaySoundSlotted_pending = false

--  PlaySound(SOUNDS.ABILITY_SLOTTED)
    PlaySound(QSB.Settings.SoundSlotted)
end
--}}}
function GetSoundBefore(soundName) --{{{
D("GetSoundBefore("..tostring(soundName)..")")
    soundName = soundName or SOUNDNAMES[1]
    for current = 1, #SOUNDNAMES do
        if(SOUNDNAMES[current] == soundName) then
            return SOUNDNAMES[current-1] or soundName
        end
    end
    return soundName
end --}}}
function GetSoundAfter(soundName) --{{{
D("GetSoundAfter("..tostring(soundName)..")")
    soundName = soundName or SOUNDNAMES[#SOUNDNAMES]
    for current = 1, #SOUNDNAMES do
        if(SOUNDNAMES[current] == soundName) then
            return SOUNDNAMES[current+1] or soundName
        end
    end
    return soundName
end --}}}

-- KEYBINDINGS
function BuildKeyBindingsMenu() --{{{

    for i = 1, #KEYBINDINGS do
        ZO_CreateStringId(KEYBINDINGS_PREFIX .. KEYBINDINGS[i].id , KEYBINDINGS[i].name)
    end

end --}}}
function GetKeyBindInfo( actionID ) --{{{
--D("GetKeyBindInfo(actionID="..actionID..")")

    local _layerIndex, _categoryIndex, _actionIndex
    = GetActionIndicesFromName(actionID)

    local keyBindInfo = {}

    for _bindingIndex = 1, GetMaxBindingsPerAction() do

        local _key, _mod1, _mod2, _mod3, _mod4
        = GetActionBindingInfo(_layerIndex, _categoryIndex, _actionIndex, _bindingIndex)

        keyBindInfo[_bindingIndex] = {
              layerIndex    = _layerIndex
            , categoryIndex = _categoryIndex
            , actionIndex   = _actionIndex
            , bindingIndex  = _bindingIndex
            , keyCode  = _key
            , mod1     = _mod1
            , mod2     = _mod2
            , mod3     = _mod3
            , mod4     = _mod4
        }

    end

    return keyBindInfo

end --}}}
function GetSlotItemKeyName( bNum ) --{{{
--D("GetSlotItemKeyName(bNum="..bNum.."):")

    local keyName = ""

    local actionID    = "GREYMIND_QUICK_SLOT_BAR_ITEM_"..tostring(bNum)
    local keyBindInfo = GetKeyBindInfo( actionID )

    for bindingIndex = 1, GetMaxBindingsPerAction() do
        local kbi = keyBindInfo[ bindingIndex ]
        if kbi.keyCode ~= 0 then

            keyName = keyName .. GetKeyName( kbi.keyCode )

            -- Request by Eloora (160823)
            if     keyName == "Backspace"   then keyName = "BKS"
            elseif keyName == "BACKSPACE"   then keyName = "BKS"

            elseif keyName == "Delete"      then keyName = "DEL"
            elseif keyName == "DELETE"      then keyName = "DEL"

            elseif keyName == "Enter"       then keyName = "ENT"
            elseif keyName == "ENTER"       then keyName = "ENT"

            -- Request by Eloora (160824)
            elseif keyName == "Insert"      then keyName = "INS"
            elseif keyName == "INSERT"      then keyName = "INS"

            elseif keyName == "CAPSLOCK"    then keyName = "Caps"
            elseif keyName == "Caps Lock"   then keyName = "Caps"

            elseif keyName == "Scroll Lock" then keyName = "SLCK"
            elseif keyName == "SCROLL LOCK" then keyName = "SLCK"

            elseif keyName == "Page Down"   then keyName = "PgDn"
            elseif keyName == "PGDOWN"      then keyName = "PgDn"

            elseif keyName == "Page Up"     then keyName = "PgUp"
            elseif keyName == "PGUP"        then keyName = "PgUp"
            end

            if    (kbi.mod1 == MOD_ALT_KEYCODE    ) then keyName = "!" .. keyName end
            if    (kbi.mod1 == MOD_CONTROL_KEYCODE) then keyName = "^" .. keyName end
            if    (kbi.mod1 == MOD_SHIFT_KEYCODE  ) then keyName = "+" .. keyName end

            if    (kbi.mod2 == MOD_ALT_KEYCODE    ) then keyName = "!" .. keyName end
            if    (kbi.mod2 == MOD_CONTROL_KEYCODE) then keyName = "^" .. keyName end
            if    (kbi.mod2 == MOD_SHIFT_KEYCODE  ) then keyName = "+" .. keyName end

            if    (kbi.mod3 == MOD_ALT_KEYCODE    ) then keyName = "!" .. keyName end
            if    (kbi.mod3 == MOD_CONTROL_KEYCODE) then keyName = "^" .. keyName end
            if    (kbi.mod3 == MOD_SHIFT_KEYCODE  ) then keyName = "+" .. keyName end

            break   -- return first defined (from Primary or Secondary keybinding)
        end
    end

    return keyName

end --}}}
function ApplyKeyBindingsModifier() --{{{

    -- Set keybinds modifiers
    local mod = MOD_SHIFT_KEYCODE
    D("ApplyKeyBindingsModifier(): mod=["..mod.."]")

    local key = 87 -- F13-F24
    for i = 1, #KEYBINDINGS do
        local actionID    = KEYBINDINGS[i].id
        D(" actionID["..i.."]=["..key.."] ["..tostring(actionID).."]")

        for bindingIndex  = 1, GetMaxBindingsPerAction() do
            CreateDefaultActionBind(actionID, key, mod, 0, 0, 0)
        end
        key = key + 1
    end

end --}}}
function ApplyKeyBindingsModifier_SWAPS() --{{{

    -- Set keybinds modifiers
    local mod = MOD_CONTROL_KEYCODE
    D("ApplyKeyBindingsModifier_SWAPS(): mod=["..mod.."]")

    local key = 87 -- F13-F24
    for i = 1, #KEYBINDINGS_SWAPS do
        local actionID    = KEYBINDINGS_SWAPS[i].id
        D(" actionID["..i.."]=["..key.."] ["..tostring(actionID).."]")

        for bindingIndex  = 1, GetMaxBindingsPerAction() do
            CreateDefaultActionBind(actionID, key, mod, 0, 0, 0)
        end
        key = key + 1
    end

end --}}}
function ClearKeyBindings() --{{{

    -- XXX wont work (protected)

    local mod = 0
    local key = 0
    for i = 1, #KEYBINDINGS do
        local actionID    = KEYBINDINGS[i].id
        D(" actionID["..i.."]=["..key.."] ["..tostring(actionID).."]")

        for bindingIndex  = 1, GetMaxBindingsPerAction() do
            CreateDefaultActionBind(actionID, key, mod, 0, 0, 0)
        end
    end

end  --}}}
-- KEYBOARD-SHORTCUTS: Item[1..8] {{{

function QSB_Item1() SelectButton(1) end
function QSB_Item2() SelectButton(2) end
function QSB_Item3() SelectButton(3) end
function QSB_Item4() SelectButton(4) end
function QSB_Item5() SelectButton(5) end
function QSB_Item6() SelectButton(6) end
function QSB_Item7() SelectButton(7) end
function QSB_Item8() SelectButton(8) end

--}}}
-- KEYBOARD-SHORTCUTS: P[1..5] {{{
function QSB_P1()    SelectPreset( PRESETNAMES[1] ); loadItemSlots(); Refresh(); Show(); end
function QSB_P2()    SelectPreset( PRESETNAMES[2] ); loadItemSlots(); Refresh(); Show(); end
function QSB_P3()    SelectPreset( PRESETNAMES[3] ); loadItemSlots(); Refresh(); Show(); end
function QSB_P4()    SelectPreset( PRESETNAMES[4] ); loadItemSlots(); Refresh(); Show(); end
function QSB_P5()    SelectPreset( PRESETNAMES[5] ); loadItemSlots(); Refresh(); Show(); end

--}}}

function SelectNextAuto() --{{{
D("SelectNextAuto()")
    if not QSB.Settings.NextAuto              then return end
    if not IsEmptySlot(GetCurrentQuickslot()) then return end

    if(not SelectNextAuto_pending) then
        SelectNextAuto_pending = true
        zo_callLater(SelectNextAuto_delayed, ZO_CALLLATER_DELAY_NEXT)
    end
end  --}}}
function SelectNextAuto_delayed() --{{{
D(COLOR_7.."...SelectNextAuto_delayed()")
    SelectNextAuto_pending = false

    local slotIndex = GetCurrentQuickslot()
    local bNum      = slotIndex_to_bNum( slotIndex )
    D("...bNum=["..bNum.."]")

    -- select next not empty slot
    local step     = 0
    local step_max = QSB.Settings.ButtonsDisplayed+1
    repeat
        step = step + 1
        bNum = bNum + 1
        if QSB.Settings.NextPrevWrap then
            bNum = math.fmod(bNum+step_max, step_max) -- cares for negative values
        end
        slotIndex = bNum_to_slotIndex( bNum )
    until not IsEmptySlot(slotIndex) or (step > step_max)

    D("...bNum=["..bNum.."] slotIndex=["..tostring(slotIndex).."]")

    if not IsEmptySlot(slotIndex) then
        PlaySoundSlotted("SelectNextAuto")
        SetCurrentQuickslot( bNum_to_slotIndex(bNum) )
    else
        PlaySoundAlert("SelectNextAuto")
    end

end --}}}
function QSB_NextItem() --{{{
D("NextItem()")
    local slotIndex = GetCurrentQuickslot()
    local bNum      = slotIndex_to_bNum( slotIndex )

    -- select next not empty slot
    local step = 0
    local step_max = QSB.Settings.ButtonsDisplayed+1
    repeat
        step = step + 1
        bNum = bNum + 1
        if QSB.Settings.NextPrevWrap then
            bNum = math.fmod(bNum+step_max, step_max) -- cares for negative values
        end
        slotIndex = bNum_to_slotIndex( bNum )
    until not IsEmptySlot(slotIndex) or (step > step_max)

    if not IsEmptySlot(slotIndex) then
        PlaySoundSlotted("NextItem")
        SetCurrentQuickslot( bNum_to_slotIndex(bNum) )
    else
        PlaySoundAlert("NextItem")
    end
end --}}}
function QSB_PreviousItem() --{{{
D("PreviousItem()")
    local slotIndex = GetCurrentQuickslot()
    local bNum      = slotIndex_to_bNum( slotIndex )

    -- select previous not empty slot
    local step = 0
    local step_max = QSB.Settings.ButtonsDisplayed+1
    repeat
        step = step + 1
        bNum = bNum - 1
        if QSB.Settings.NextPrevWrap then
            bNum = math.fmod(bNum+step_max, step_max) -- cares for negative values
        end
        slotIndex = bNum_to_slotIndex( bNum )
    until not IsEmptySlot(slotIndex) or (step > step_max)

    if not IsEmptySlot(slotIndex) then
        PlaySoundSlotted("PreviousItem")
        SetCurrentQuickslot( bNum_to_slotIndex(bNum) )
    else
        PlaySoundAlert("NextItem")
    end
end --}}}
function QSB_ForceBarVisibility() --{{{

    ForceBarVisibility = not ForceBarVisibility

    local keyName      = ""
    local keyBindInfo  = GetKeyBindInfo("GREYMIND_QUICK_SLOT_BAR_FORCE_BAR_VISIBILITY")
    local kbi          = keyBindInfo[1]
    local keyName = (kbi.keyCode ~= 0)
    and              "|r ["..GetKeyName( kbi.keyCode ).."]"
    or               ""

    local state = ForceBarVisibility
    and            COLOR_3.." ON"
    or             COLOR_6.." OFF"

d(keyName..COLOR_5.." GQSB: Bar Visibility "..COLOR_4.." FORCED "..state)

    if ForceBarVisibility and not BlockBarVisibility then
        Show()
    else
        Hide("QSB_ForceBarVisibility")
    end

end --}}}
function QSB_BlockBarVisibility() --{{{

    BlockBarVisibility = not BlockBarVisibility

    local keyName      = ""
    local keyBindInfo  = GetKeyBindInfo("GREYMIND_QUICK_SLOT_BAR_BLOCK_BAR_VISIBILITY")
    local kbi          = keyBindInfo[1]
    local keyName = (kbi.keyCode ~= 0)
    and              "|r ["..GetKeyName( kbi.keyCode ).."]"
    or               ""

    local state = BlockBarVisibility
    and            COLOR_3.." ON"
    or             COLOR_6.." OFF"

d(keyName..COLOR_5.." GQSB: Bar Visibility "..COLOR_7.." BLOCKED "..state)


    if BlockBarVisibility then
        Hide("QSB_BlockBarVisibility")
    else
        Show()
    end

end --}}}
function QSB_ReloadUI() --{{{
D("QSB_ReloadUI()")
    SLASH_COMMANDS["/reloadui"]()

end --}}}
function QSB_ClearChat() --{{{
D("QSB_ClearChat()")
    for i=1, GetNumChatContainerTabs(1), 1 do
        _G["ZO_ChatWindowTemplate".. i .."Buffer"]:Clear()
    end

end --}}}

-- UTILITIES
function slotIndex_to_bNum(slotIndex) --{{{
    for bNum = 1, #WHEEL_LOOKUPTABLE do
        if WHEEL_LOOKUPTABLE[bNum] == slotIndex then
            return bNum
        end
    end

    return 0
end
--}}}
function bNum_to_slotIndex(bNum) --{{{
    return  WHEEL_LOOKUPTABLE[ bNum ]
end
--}}}
function SelectButton(bNum) --{{{
D("SelectButton(bNum=["..tostring(bNum).."])")

    if not QSB.Settings.LockUI then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
    end

    local slotIndex = bNum_to_slotIndex( bNum )

    if IsEmptySlot(slotIndex) then
        PlaySoundAlert("SelectButton")
        SetCurrentQuickslot( slotIndex ) -- force scanning
        SelectNextAuto()
    else
        PlaySoundSlotted("SelectButton")
        SetCurrentQuickslot( slotIndex )
    end

end --}}}
function IsEmptySlot(slotIndex) --{{{
D("IsEmptySlot("..tostring(slotIndex)..")")

       slotItemCount = GetSlotItemCount(slotIndex)
--D_ITEM("...slotItemCount=["..tostring( slotItemCount    ).."]")

    if(slotItemCount == nil) then   -- 150329 -- (ticket from ESOUI) -- GreymindQuickSlotBar.lua:1272: operator < is not supported for nil < number
        return false
    else
        return (GetSlotTexture( slotIndex ) == "") or (slotItemCount < 1)
    end

end --}}}
-- LOGGING
function D(msg) --{{{
    if DEBUG then
        d(COLOR_7..".QSB.DEBUG:|r "..msg)
    end
end
--}}}
function D_EVENT(eventName) --{{{
    if DEBUG_EVENT or DEBUG then
        d(COLOR_7..".QSB.DEBUG: "..COLOR_C..eventName)
    end
end
--}}}
function D_ITEM(msg) --{{{
    if DEBUG_ITEM or DEBUG then
        d(msg)
    end
end
--}}}
function D_EQUIP(msg) --{{{
    if DEBUG_ITEM or DEBUG_EQUIP or DEBUG then
        d(msg)
    end
end
--}}}

-- EVENTS (public handlers)
function Initialize(eventCode, addOnName) --{{{
D("Initialize()")
    if (addOnName ~= QSB.Name) then return end

    -- KEYBINDINGS
    BuildKeyBindingsMenu()

    -- CHAT SLASH_COMMANDS
    SLASH_COMMANDS[QSB_SLASH_COMMAND] = OnSlashCommand

    Load_ZO_SavedVars(nil)

    BuildSettingsMenu()

    -- EVENT HANDLERS
    zo_callLater(RegisterEventHandlers, 500)

end --}}}
function Load_ZO_SavedVars(value) --{{{
--d(COLOR_9.." Load_ZO_SavedVars("..tostring(value)..")")

    local changed = (value ~= nil) and QSB_Settings_Changed()

    -- [QSB.AccountWideSettings] .. GET/SET {{{
--[[
:!start explorer "https://wiki.esoui.com/Circonians_Saved_Variables_Tutorial"
--]]
    if(value == nil) then
        QSB.AccountWideSettings = ZO_SavedVars:NewAccountWide(
        "GreymindQuickSlotBarSettings" -- savedVariableTable
        , QSB.SettingsVersion          -- version
        , nil                          -- namespace
        , QSB.SettingsDefaults         -- defaults
        , "AccountWide"                -- profile
        )                              -- displayName

    else
        QSB.AccountWideSettings.SaveAccountWide = value

    end
    --}}}
    -- [QSB.Settings] .. f(AccountWide.SaveAccountWide) {{{
    if(QSB.AccountWideSettings.SaveAccountWide ) then
d("LOADING "..COLOR_5.."Account-wide|r Settings")

        QSB.Settings = ZO_SavedVars:NewAccountWide(
        "GreymindQuickSlotBarSettings"
        , QSB.SettingsVersion
        , nil
        , QSB.SettingsDefaults
        , "AccountWide"
        )

    else
d("LOADING "..COLOR_3..GetUnitName("player").."|r Character Settings")

        QSB.Settings = ZO_SavedVars:New(
        "GreymindQuickSlotBarSettings"
        , QSB.SettingsVersion
        , nil
        , QSB.SettingsDefaults
        , "Default"
        )
    end

    --}}}
    -- [Loaded_QSB_Settings] {{{
    if(value == nil) then
--d("ROOTING: "..COLOR_2.." Loaded_QSB_Settings")

        Loaded_QSB_Settings = DeepCopy(QSB.Settings)
    --}}}
    -- [QSB_ReloadUI] or [Refresh] .. f(changed) {{{
    else
        if( changed ) then
d(COLOR_2.." GQSB RELOADING\n"..COLOR_2..tostring(changed))
            zo_callLater(QSB_ReloadUI, 3000)
--[[--{{{
--d("...SHOULD "..COLOR_2.." QSB_ReloadUI")
            Rebuild_LibAddonMenu()
            Refresh()
            Show()
            loadItemSlots()
--]]--}}}
        else
--d("...CALLING "..COLOR_5.." Rebuild_LibAddonMenu .. Refresh .. Show")

            Rebuild_LibAddonMenu()
            Refresh()
            Show()
            loadItemSlots()
        end
    end
    --}}}
end --}}}
function QSB_Settings_Changed(q,l,presetName) --{{{

    local presetName;      local changed = QSB_Setting_Preset_Changed(QSB.Settings                    , Loaded_QSB_Settings       , QSB.Settings.PresetName); if changed then return changed end
    presetName = PRESETNAMES[1]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[2]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[3]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[4]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[5]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end

    return false
end --}}}
function QSB_Setting_Preset_Changed(q,l,presetName) --{{{

    local k
    k = "NextAuto"            ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SoundSlotted"        ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonSize"          ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "version"             ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "GameActionButtonHide"; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "Visibility"          ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SoundAlert"          ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SaveAccountWide"     ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ShowBackground"      ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonsDisplayed"    ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "PresetName"          ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonColumns"       ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "NextPrevWrap"        ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "LockUI"              ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SwapBackgroundColors"; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonFontSize"      ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end

    return false
end --}}}
function QSB.Update(...) --{{{
D("Update()")
    --if not QSB.Settings then return end

    -- Updates on each frame are not required:
    -- ...all changes are handled by RegisterEventHandlers synchronized handlers
    GreymindQuickSlotBarUI:SetHandler("OnUpdate", nil)
    D("Removed \"OnUpdate\" Event Handler")

end --}}}

-- SETTINGS (menu get & set functions)
local LAM   = LibStub("LibAddonMenu-2.0")
function BuildSettingsMenu() --{{{
D("BuildSettingsMenu()")

--  local panel = LAM:CreateControlPanel("QSB_Settings", SETTINGSPANELNAME)
--  LAM:AddHeader(panel, "QSB_UserInterface", "")

    -- panelData {{{
    local panelData = {
        type                = "panel",
        reference           = "QSB_Settings",
        name                = "G Quick Slot Bar",
        displayName         = SETTINGSPANELNAME..COLOR_8.." - "..QSB.Version,
        author              = "ivanwfr",
        version             = QSB.version,
        slashCommand        = nil,              --(optional) will register a keybind to open to this panel
        registerForRefresh  = true,             --boolean (optional) (will refresh all options controls when a setting is changed and when the panel is shown)
        registerForDefaults = true,             --boolean (optional) (will set all options controls back to default values)
        resetFunc           = Load_Defaults,    --(optional) custom function to run after settings are reset to defaults
    }
    --}}}
    QSB.Panel = LAM:RegisterAddonPanel( QSB.Name, panelData)

    -- optionsTable {{{
    QSB.SettingsControls = {}
    local controlName, control

    -- header --{{{
--[[
    control = {
        type        = "header",
        reference   = "QSB_header",
        name        = nil,
        width       = "full", --or "half" (optional)
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
--]]
    --}}}
    -- description --{{{
--[[
    control = {
        type        = "description",
        reference   = "QSB_description",
        title       = nil,
        text        = "quick slot bar with key bindings",
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
--]]
    --}}}

    -- SaveAccountWide (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_SaveAccountWide",
        name        = "Account-wide Settings",
        tooltip     = "Must be OFF for "..COLOR_2..GetUnitName("player").."|r Character Settings",
        getFunc     = function()
            return QSB.AccountWideSettings.SaveAccountWide
        end,
        setFunc     = function(value)
            if(QSB.AccountWideSettings.SaveAccountWide ~= value) then
                if(value) then
                    Load_ZO_SavedVars(  true )
                else
                    Load_ZO_SavedVars( false )
                end
            end
        end,
        width       = "full",
        warning     = "May involve "..COLOR_3.."Reload User Interface|r",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- LockUI (Checkbox) --{{{
    control = {
        type        = "checkbox",
        reference   = "QSB_LockUI",
        name        = "Lock|r on screen",
        tooltip     = "Whether to allow moving and resizing Quick Slot Bar\n"
        ..COLOR_6.."You can also Lock or Unlock with a mouse click on the UI's pin handle",
        getFunc     = function()
            return QSB.Settings.LockUI
        end,
        setFunc     = function(value)
            QSB.Settings.LockUI = value
            Refresh()
            Show()
        end,
        width       = "full",
        warning     = "Disabling the lock will "..COLOR_3.."force UI visibility|r and the background to show so you can reposition it with guidance",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Visibility_ChoiceList (Dropdown) --{{{
    control = {
        type        = "dropdown",
        reference   = "QSB_Visibility",
        name        = "Show|r Policy",
        tooltip     = "Choose when you'd like Quick Slot Bar displayed or hidden",
        choices     = QSB.Visibility_ChoiceList,
        getFunc     = function()
            return QSB.Settings.Visibility or QSB.SettingsDefaults.Visibility
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.Visibility = value
                Refresh()
                Show()
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep1", "")
    local KW_Button = COLOR_5.."Button:|r "
    -- ButtonSize (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_ButtonSize",
        name        = KW_Button.."Size",
        tooltip     = "The size of each button",
        min         = 24,
        max         = 64,
        step        = 1,
        getFunc     = function()
            return QSB.Settings.ButtonSize
        end,
        setFunc     = function(value)
            value = tonumber(value); if not value then return end
            value = math.max(value, 24)
            value = math.min(value, 64)
            QSB.Settings.ButtonSize = value
            ButtonSizeChanged()
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- ButtonFontSize (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_ButtonFontSize",
        name        = KW_Button.."Font Size",
        tooltip     = "For Keybind and Quantity labels",
        min         = 12,
        max         = 32,
        step        = 1,
        getFunc     = function()
            return QSB.Settings.ButtonFontSize
        end,
        setFunc     = function(value)
            value = tonumber(value); if not value then return end
            value = math.max(value, 12)
            value = math.min(value, 32)
            QSB.Settings.ButtonFontSize = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- NotSelectedButtonOpacity (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_NotSelectedButtonOpacity",
        name        = KW_Button.."Not Selected Opacity",
        tooltip     = "From plain invisible to full opacity",
        min         = 0,
        max         = 100,
        step        = 5,
        getFunc     = function()
            return QSB.Settings.SlotItem.NotSelectedButtonOpacity
        end,
        setFunc     = function(value)
            value = tonumber(value); if not value then return end
            value = math.max(value,   0)
            value = math.min(value, 100)
            QSB.Settings.SlotItem.NotSelectedButtonOpacity = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- OverlayButtonOpacity (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_OverlayButtonOpacity",
        name        = KW_Button.."Gray-out opacity",
        tooltip     = "From plain invisible to full opacity",
        min         = 0,
        max         = 100,
        step        = 5,
        getFunc     = function()
            return QSB.Settings.SlotItem.OverlayButtonOpacity
        end,
        setFunc     = function(value)
            value = tonumber(value); if not value then return end
            value = math.max(value,   0)
            value = math.min(value, 100)
            QSB.Settings.SlotItem.OverlayButtonOpacity = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep2", "")
    local KW_Visual_Cues = COLOR_3.."Visual Cue:|r "
    -- VisualCue_ChoiceList (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_VisualCue",
        name        = KW_Visual_Cues.."Display Policy",
        tooltip     = "Choose how visual cues should be displayed",
        choices     = QSB.VisualCue_ChoiceList,
        getFunc     = function()
            return QSB.Settings.SlotItem.VisualCue or QSB.SettingsDefaults.SlotItem.VisualCue
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.VisualCue = value
                Refresh()
                Show()
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityWarning (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_WarningQuantity",
        name        = KW_Visual_Cues.."Warning Quantity",
        tooltip     = "The value at (and below) which the Warning Visual Cue is shown",
        min         = 0,
        max         = 50,
        step        = 1,
        getFunc     = function()
            return QSB.Settings.SlotItem.QuantityWarning
        end,
        setFunc     = function(value)
            value = tonumber(value); if not value then return end
            local clamped = false
            if(value   <= QSB.Settings.SlotItem.QuantityAlert) then
                value   = QSB.Settings.SlotItem.QuantityAlert+1
                clamped = not QSB.Panel:IsHidden()
            end
            QSB.Settings.SlotItem.QuantityWarning = value
            Refresh()
            Show()
            if clamped then Rebuild_LibAddonMenu() end
        end,
        width       = "full",
        warning     = "* must be higher than "..COLOR_3.."Alert Quantity|r"
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityAlert (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_AlertQuantity",
        name        = KW_Visual_Cues.."Alert Quantity",
        tooltip     = "The value at (and below) which the Alert Visual Cue is shown",
        min         = 0,
        max         = 50,
        step        = 1,
        getFunc     = function()
            return QSB.Settings.SlotItem.QuantityAlert
        end,
        setFunc     = function(value)
            value = tonumber(value); if not value then return end
            local clamped = false
            if(value   >= QSB.Settings.SlotItem.QuantityWarning) then
                value   = QSB.Settings.SlotItem.QuantityWarning-1
                clamped = not QSB.Panel:IsHidden()
            end
            QSB.Settings.SlotItem.QuantityAlert = value
            Refresh()
            Show()
            if clamped then Rebuild_LibAddonMenu() end
        end,
        width       = "full",
        warning     = "* must be lower than "..COLOR_3.."Warning Quantity|r",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep3", "")
    local KW_Key_Bindings = COLOR_4.."Key Bindings:|r "
    -- ShowKeyBindings (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_ShowKeyBindings",
        name        = KW_Key_Bindings.."Show",
        tooltip     = "Whether to show key bindings for the slots in Quick Slot Bar",
        getFunc     = function()
            return QSB.Settings.SlotItem.ShowKeyBindings
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.ShowKeyBindings = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- KeyBindAlignV (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_KeyBindPositionVertical",
        name        = KW_Key_Bindings.."Position (Vertical)",
        tooltip     = "Select where you'd like the key bind displayed in relation to the slot item vertically",
        choices     = ALIGNV,
        getFunc     = function()
            return QSB.Settings.SlotItem.KeyBindAlignV
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.KeyBindAlignV = value
                Refresh()
                Show()
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- KeyBindAlignH (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_KeyBindPositionHorizontal",
        name        = KW_Key_Bindings.."Position (Horizontal)",
        tooltip     = "Select where you'd like the key bind displayed in relation to the slot item horizontally",
        choices     = ALIGNH,
        getFunc     = function()
            return QSB.Settings.SlotItem.KeyBindAlignH
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.KeyBindAlignH = value
                Refresh()
                Show()
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep4", "")
    local KW_Label = COLOR_6.."Label:|r "
    -- ShowQuantityLabels (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_ShowQuantityLabels",
        name        = KW_Label.."Show Quantity",
        tooltip     = "Whether to show quantity of items for the slots in Quick Slot Bar",
        getFunc     = function()
            return QSB.Settings.SlotItem.ShowQuantityLabels
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.ShowQuantityLabels = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- ALIGNV (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_QuantityLabelPositionVertical",
        name        = KW_Label.."Quantity Position (Vertical)",
        tooltip     = "Select where you'd like the quantity label displayed in relation to the slot item vertically",
        choices     = ALIGNV,
        getFunc     = function()
            return QSB.Settings.SlotItem.QuantityLabelPositionVertical
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.QuantityLabelPositionVertical = value
                Refresh()
                Show()
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityLabelPositionHorizontal (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_QuantityLabelPositionHorizontal",
        name        = KW_Label.."Quantity Position (horizontal)",
        tooltip     = "Select where you'd like the quantity label displayed in relation to the slot item horizontally",
        choices     = ALIGNH,
        getFunc     = function()
            return QSB.Settings.SlotItem.QuantityLabelPositionHorizontal
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.QuantityLabelPositionHorizontal = value
                Refresh()
                Show()
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep5", "")
    -- Preset Selection (Slider) --{{{

    control = {
        type        = "slider",
        reference   = "QSB_Presets",
        name        = "Preset Selection",
        tooltip     = "Current settings will be saved in current preset before each change",
        min         = 1,
        max         = 5,
        step        = 1,
        getFunc     = function()
            local value = 1
            for k, v in pairs(PRESETNAMES) do
                if string.match(v, QSB.Settings.PresetName) then
                    value = k
                    break
                end
            end
            D("getFunc "..COLOR_2..".QSB_Presets|r: return "..value)
            return value
        end,
        setFunc     = function(value)
            value = tostring(value)
            D("setFunc "..COLOR_2..".QSB_Presets|r: value="..value)
            for k, v in pairs(PRESETNAMES) do
                if string.match(v, tostring(value)) then
                    value = v
                    break
                end
            end
            SelectPreset(value)
            loadItemSlots();
            Refresh();
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Auto-Clone previous-to-empty preset (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_CloneCurrentToEmtpyPreset",
        name        = "Auto-Clone previous-to-empty preset",
        tooltip     = "Whether to copy the CURRENT PRESET LAYOUT AND CONTENT\n"
        ..COLOR_2.."When selecting an EMPTY PRESET",
        getFunc     = function()
            return QSB.CloneCurrentToEmtpyPreset
        end,
        setFunc     = function(value)
            QSB.CloneCurrentToEmtpyPreset = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    local KW_Sound = COLOR_7.."Sound:|r "
    -- SoundAlert (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SoundAlert",
        name        = KW_Sound.."Alert",
        choices     = SOUNDNAMES,
        getFunc     = function()
            return QSB.Settings.SoundAlert
        end,
        setFunc     = function(value)
            QSB.Settings.SoundAlert = value
            PlaySoundAlert_delayed()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- SoundSlotted (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SoundSlotted",
        name        = KW_Sound.."Slotted",
        choices     = SOUNDNAMES,
        getFunc     = function()
            return QSB.Settings.SoundSlotted
        end,
        setFunc     = function(value)
            QSB.Settings.SoundSlotted = value
            PlaySoundSlotted_delayed()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- SoundAlert prev button --{{{
    control = {
        type        = "button",
        reference   = "QSB_SoundAlert_prev",
        name        = "<",
        tooltip     = "previous sound",
        func        = function()
            QSB.Settings.SoundAlert = GetSoundBefore( QSB.Settings.SoundAlert )
            PlaySoundAlert_delayed()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- SoundSlotted prev button --{{{
    control = {
        type        = "button",
        reference   = "QSB_SoundSlotted_prev",
        name        = "<",
        tooltip     = "previous sound",
        func        = function()
            QSB.Settings.SoundSlotted = GetSoundBefore( QSB.Settings.SoundSlotted )
            PlaySoundSlotted_delayed()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- SoundAlert next button --{{{
    control = {
        type        = "button",
        reference   = "QSB_SoundAlert_next",
        name        = ">",
        tooltip     = "next sound",
        func        = function()
            QSB.Settings.SoundAlert = GetSoundAfter( QSB.Settings.SoundAlert )
            PlaySoundAlert_delayed()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- SoundSlotted next button --{{{
    control = {
        type        = "button",
        reference   = "QSB_SoundSlotted_next",
        name        = ">",
        tooltip     = "next sound",
        func        = function()
            QSB.Settings.SoundSlotted = GetSoundAfter( QSB.Settings.SoundSlotted )
            PlaySoundSlotted_delayed()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- Disable Default Quick Slot (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_DisableQuickSlotActionButton",
        name        = "Disable Default Quick Slot Button",
        tooltip     = "Whether to disable the game's default quick slot action button.\n"
        ..COLOR_6.."When OFF, no hiding or showing this button will interfere.",
        getFunc     = function()
            return QSB.Settings.GameActionButtonHide;
        end,
        setFunc     = function(value)
            QSB.Settings.GameActionButtonHide = value;
            GameActionButtonHideHandler(true,"Settings.control")    -- Apply new user choice
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Prepare Key modifiers --{{{

    control = {
        type        = "button",
        reference   = "QSB_ModBingingsButton",
        name        = COLOR_4.."Prepare Key Modifiers",
        tooltip     = "This is a 2 steps operation:\n"
        .."\n"
        .."1. This button will PREPARE this addon's  "..COLOR_5.."EMPTY KEYBINDINGS|r"
        .." with "..COLOR_3.."VIRTUAL KEY COMBINATIONS|r\n"
        .."\n"
        .."2. Then, you have to open the\n"
        ..COLOR_4.."CONTROLS-Keybindings|r window"
        .."\nthat will let you select any "..COLOR_6.."Shift|r"
        ..", "                             ..COLOR_7.."Control|r"
        .." and "                          ..COLOR_2.."Alt|r"
        .." key combinations.\n",
        func        = function()
            ApplyKeyBindingsModifier()
            ApplyKeyBindingsModifier_SWAPS()
        end,
        width       = "half",
        warning     = COLOR_5.."Brace yourself!|r This is not a friendly procedure, but it works!\n"
        .."\n"
        .."First you will have to click on "..COLOR_3.."Not Bound|r keys"
        .." in the "..COLOR_4.."CONTROLS-Keybinds|r window"
        .." which eventually show up as "..COLOR_6.."SHIFT-F12 - F24|r you must redefine.\n"
        .."\n"
        .." Just another quest that could cost you a few calls to /reloadUI ... "
        .."Good luck!\n",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- Auto-select next not empty slot (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_NextAuto",
        name        = "Auto-select next not empty slot",
        tooltip     = "Whether the "..COLOR_5.."next not empty slot|r should be automatically selected when current gets empty.\n"
        .."1. When you select an empty slot.\n"
        .."2. When last of the current slot items has just been consumed.\n",
        getFunc     = function()
            return QSB.Settings.NextAuto
        end,
        setFunc     = function(value)
            QSB.Settings.NextAuto = value
            Refresh()
            Show()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Next <-o-> Previous Wrap (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_NextPrevWrap",
        name        = "Next <-o-> Previous Wrap",
        tooltip     = "Wheter Next & Previous selection should jump from one end to the other?"
        .." - As an elevator that takes you right to the basenent when you keep going past the roof.",
        getFunc     = function()
            return QSB.Settings.NextPrevWrap
        end,
        setFunc     = function(value)
            QSB.Settings.NextPrevWrap = value
            Refresh()
            Show()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- Hide buttons background (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_SlotItem_ShowBackground",
        name        = "Hide "..COLOR_5.."buttons|r background",
        tooltip     = "Controls buttons background texture",
        getFunc     = function()
            return QSB.Settings.SlotItem.HideSlotBackground
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.HideSlotBackground = value
            Refresh()
            Show()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Weapon swap background colors (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_SwapBackgroundColors",
        name        = "Weapon swap "..COLOR_6.." background "..COLOR_5.." color",
        tooltip     = "Whether to change frame background colors on Weapon Swap\n"
        ..COLOR_2.."When not hiding buttons background",
        getFunc     = function()
            return QSB.Settings.SwapBackgroundColors
        end,
        setFunc     = function(value)
            QSB.Settings.SwapBackgroundColors = value
            Refresh()
            Show()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
     --}}}

    -- Show frame background (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_ShowBackground",
        name        = "Show frame background",
        tooltip     = "Whether to show frame background",
        getFunc     = function()
            return QSB.Settings.ShowBackground
        end,
        setFunc     = function(value)
            QSB.Settings.ShowBackground = value
            Refresh()
            Show()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Show slot number (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_ShowNumbers",
        name        = "Show slot number",
        tooltip     = "Whether to show slot number over the icons\n"
        ..COLOR_6.."#1 at ring-top .. clockwise .. to last #8",
        getFunc     = function()
            return QSB.Settings.SlotItem.ShowNumbers
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.ShowNumbers = value
            Refresh()
            Show()
        end,
        width       = "half",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- Reset (Button) --{{{

--[[
    control = {
        type        = "button",
        reference   = "QSB_ResetButton",
        name        = COLOR_2.."Reset|r",
        tooltip     = "Load default settings into"..COLOR_2.." all Presets|r.",
        func        = function()
            Load_Defaults()
        end,
        width       = "half",
        warning     = COLOR_2.." NO CONFIRMATION ASKED!|r\nThis will also reload the UI",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
--]]
    --}}}

    --}}}
    LAM:RegisterOptionControls(QSB.Name, QSB.SettingsControls)

end --}}}
function Are_Settings_Locked(option, value) --{{{
    if Settings_Locked then
        --d(COLOR_2..".SET:|r "..tostring(QSB.Settings.PresetName)..": "..tostring(option).."=["..tostring(value).."] "..COLOR_2..".REJECTED")
        return true
    else
        --d(COLOR_2..".SET:|r "..tostring(QSB.Settings.PresetName)..": "..tostring(option).."=["..tostring(value).."]")
    end
end --}}}
function Release_Settings_Locked() --{{{
    Settings_Locked = false
--d(COLOR_C..".^^^^ SETTINGS UNLOCKED|r")
end

--}}}
function Rebuild_LibAddonMenu() --{{{
D("Rebuild_LibAddonMenu()")
    if(not Rebuild_LibAddonMenu_pending) then
        Rebuild_LibAddonMenu_pending = true
        LAM:OpenToPanel( nil )
        zo_callLater(Rebuild_LibAddonMenu_delayed, ZO_CALLLATER_DELAY_LIB)
    end
end
--}}}
function Rebuild_LibAddonMenu_delayed() --{{{
D("Rebuild_LibAddonMenu_delayed()")
    LAM:OpenToPanel( QSB.Panel )
    Rebuild_LibAddonMenu_pending = false
end
--}}}

-- EVENT HANDLERS (gaming move resize)
function RegisterEventHandlers() --{{{
D("RegisterEventHandlers()")

    -- ACTION_SLOT_UPDATED --{{{ (slotIndex)
    -- update from quickslot wheel
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTION_SLOT_UPDATED"
    , EVENT_ACTION_SLOT_UPDATED
    , function(eventCode, slotIndex)
D_ITEM(COLOR_4.."ACTION_SLOT_UPDATED: slotIndex=["..slotIndex.."]")

        -- Quick Slot Bar item added or removed
        -- Or weapons swapped QSB.Settings.SwapBackgroundColors
        local bNum = slotIndex_to_bNum( slotIndex )
        if(bNum == 0) then return end

        if(QSB_BAG_BACKPACK_UPDATE_mutex or (#tasks_loaded > 0)) then
D_ITEM(COLOR_2.."handle_ACTION_SLOT_UPDATED(bNum "..bNum..") .. MUTEXED")

        else
D_ITEM(COLOR_5.."handle_ACTION_SLOT_UPDATED(bNum "..bNum..") .. CALLED" )

            handle_ACTION_SLOT_UPDATED(bNum)
        end

        SelectNextAuto()
        Refresh()
        Show()
    end)

    --}}}
    -- ACTIVE_QUICKSLOT_CHANGED --{{{ (slotIndex)
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTIVE_QUICKSLOT_CHANGED"
    , EVENT_ACTIVE_QUICKSLOT_CHANGED
    , function(event, slotIndex)
D_ITEM("ACTIVE_QUICKSLOT_CHANGED: slotIndex=["..slotIndex.."]")

      --SelectNextAuto()
        Refresh()
        Show()
    end)

    --}}}
    -- INVENTORY_SINGLE_SLOT_UPDATE --{{{ (bagId, slotId)
    EVENT_MANAGER:RegisterForEvent("GQSB.INVENTORY_SINGLE_SLOT_UPDATE"
    , EVENT_INVENTORY_SINGLE_SLOT_UPDATE
    , function(event, bagId, slotId)
D_ITEM("INVENTORY_SINGLE_SLOT_UPDATE:")
D_ITEM("...bagId=["..bagId.."] slotId=["..slotId.."]")
        if(bagId ~= BAG_BACKPACK) then return end

        -- slotId itemLevel {{{
        local data = SHARED_INVENTORY.bagCache[BAG_BACKPACK][slotId]
        if(data == nil) then
D_ITEM(COLOR_8.."ITEM REMOVED")

        else
            local itemName  = get_slotId_itemName ( slotId )
            local itemLevel = get_slotId_itemLevel( slotId )
D_ITEM(COLOR_5.."ITEM UPDATED: slotId=["..tostring(slotId).."] itemName=["..tostring(itemName).."] (level "..tostring(itemLevel).."]")

            QSB_BAG_BACKPACK_UPDATE_slotId    = slotId
            QSB_BAG_BACKPACK_UPDATE_itemLevel = itemLevel
        end
        --}}}

        SelectNextAuto()
        Refresh()
    end)

    --}}}

    -- RETICLE_HIDDEN_UPDATE --{{{
    -- hide or show in sync with VIS_RETICLE
    EVENT_MANAGER:RegisterForEvent("GQSB.RETICLE_HIDDEN_UPDATE"
    , EVENT_RETICLE_HIDDEN_UPDATE
    , function(...)
        Reticle_isHidden = select(2,...)
        D_EVENT("RETICLE_HIDDEN_UPDATE: Reticle_isHidden="..tostring(Reticle_isHidden))

        -- always show when unlocked
        if not QSB.Settings.LockUI then
            return
        end

        ZO_OptionsWindow:SetHidden(true) -- may have been opened by handle
               QSB.Panel:SetHidden(true)

        if not QSB.Settings then return end

        -- done with UI settings, get back to normal opacity
        if QSB.SomeSlotItemChanged then
            QSB.SomeSlotItemChanged = false
            Refresh()
        end

        -- Show / Hide

        if     QSB.Settings.Visibility == VIS_ALWAYS   then
            Show()

        elseif QSB.Settings.Visibility == VIS_BLINK_CHANGES  then
            if not Reticle_isHidden then Hide("RETICLE_HIDDEN_UPDATE.VIS_BLINK_CHANGES") end -- done with UI settings

        elseif QSB.Settings.Visibility == VIS_COMBAT  then
            if not Reticle_isHidden then Hide("RETICLE_HIDDEN_UPDATE.VIS_COMBAT") end -- done with UI settings

        elseif QSB.Settings.Visibility == VIS_NEVER   then
            if not Reticle_isHidden then Hide("RETICLE_HIDDEN_UPDATE.VIS_NEVER") end -- done with UI settings

        elseif QSB.Settings.Visibility == VIS_RETICLE then
            if(Reticle_isHidden) then
                Hide("RETICLE_HIDDEN_UPDATE.VIS_RETICLE")
            else
                Show()
            end
        end

        GameActionButtonHideHandler(false,"RETICLE_HIDDEN_UPDATE")  -- Apply current user choice

    end)

    --}}}
    -- RETICLE_TARGET_CHANGED --{{{
    -- hide or show in sync with VIS_RETICLE state
    EVENT_MANAGER:RegisterForEvent("GQSB.RETICLE_TARGET_CHANGED"
    , EVENT_RETICLE_TARGET_CHANGED
    , function(...)
        D_EVENT("RETICLE_TARGET_CHANGED")
        if not QSB.Settings then return end

        GameActionButtonHideHandler(false,"RETICLE_TARGET_CHANGED") -- Apply current user choice

    end)

    --}}}
    -- PLAYER_COMBAT_STATE --{{{
    -- hide or show in sync with VIS_COMBAT state
    EVENT_MANAGER:RegisterForEvent("GQSB.PLAYER_COMBAT_STATE"
    , EVENT_PLAYER_COMBAT_STATE
    , function(...)
        D_EVENT("PLAYER_COMBAT_STATE")
        if not QSB.Settings then return end
        if (QSB.Settings.Visibility ~= VIS_COMBAT) then
            Display()
        else
            local inCombat = select(2,...)
            if(inCombat) then
                Show()
            else
                Hide("PLAYER_COMBAT_STATE (not inCombat)")
            end
        end

        GameActionButtonHideHandler(false,"PLAYER_COMBAT_STATE")    -- Apply current user choice

    end)

    --}}}

    -- PLAYER_ACTIVATED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.PLAYER_ACTIVATED"
    , EVENT_PLAYER_ACTIVATED
    , function(self)
        D_EVENT("PLAYER_ACTIVATED")
        Refresh()
    end)

    --}}}
    -- ACTIVE_WEAPON_PAIR_CHANGED (integer eventCode, integer activeWeaponPair, bool locked) --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTIVE_WEAPON_PAIR_CHANGED"
    , EVENT_ACTIVE_WEAPON_PAIR_CHANGED
    , function(eventCode, activeWeaponPair, locked)
        D_EVENT("ACTIVE_WEAPON_PAIR_CHANGED")
--d("ACTIVE_WEAPON_PAIR_CHANGED: activeWeaponPair "..tostring(activeWeaponPair).." - locked "..tostring(locked))
        if(not locked) then
            D(COLOR_7.." Active Weapon Pair: "..COLOR_C..tostring(activeWeaponPair).."|r")
        end
        Refresh()
--d("GetActiveWeaponPairInfo() returns ["..tostring(GetActiveWeaponPairInfo()).."]")
    end)

    --}}}

    -- KEYBINDING_SET --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.KEYBINDING_SET"
    , EVENT_KEYBINDING_SET
    , function(self)
        D_EVENT("KEYBINDING_SET")
        Refresh()
        Show()
    end)

    --}}}
    -- KEYBINDING_CLEARED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.KEYBINDING_CLEARED"
    , EVENT_KEYBINDING_CLEARED
    , function(self)
        D_EVENT("KEYBINDING_CLEARED")
        Refresh()
        Show()
    end)

    --}}}

    -- END_FAST_TRAVEL_INTERACTION --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.END_FAST_TRAVEL_INTERACTION"
    , EVENT_END_FAST_TRAVEL_INTERACTION
    , function(self)
        D_EVENT("END_FAST_TRAVEL_INTERACTION")
        Refresh()
    end)

    --}}}
    -- END_FAST_TRAVEL_KEEP_INTERACTION --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.END_FAST_TRAVEL_KEEP_INTERACTION"
    , EVENT_END_FAST_TRAVEL_KEEP_INTERACTION
    , function(self)
        D_EVENT("END_FAST_TRAVEL_KEEP_INTERACTION")
        Refresh()
    end)

    --}}}
--[[
    -- EVENT_ACTION_LAYER_PUSHED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.EVENT_ACTION_LAYER_PUSHED"
    , EVENT_END_FAST_TRAVEL_KEEP_INTERACTION
    , function(arg1,arg2,arg3)
        D_EVENT("EVENT_ACTION_LAYER_PUSHED")
d(COLOR_7.." EVENT_ACTION_LAYER_PUSHED: "..COLOR_2.." arg1=[".. tostring(arg1).."] "..COLOR_5.." arg2=[".. tostring(arg2).."] "..COLOR_6."arg3=[".. tostring(arg3).."] ")
                                                                                             
    end)                                                                                     
                                                                                             
    --}}}                                                                                    
    -- EVENT_ACTION_LAYER_POPPED --{{{                                                       
    EVENT_MANAGER:RegisterForEvent("GQSB.EVENT_ACTION_LAYER_POPPED"                          
    , EVENT_END_FAST_TRAVEL_KEEP_INTERACTION                                                 
    , function(arg1,arg2,arg3)                                                                         
        D_EVENT("EVENT_ACTION_LAYER_POPPED")                                                 
d(COLOR_7.." EVENT_ACTION_LAYER_POPPED: "..COLOR_2.." arg1=[".. tostring(arg1).."] "..COLOR_5.." arg2=[".. tostring(arg2).."] "..COLOR_6."arg3=[".. tostring(arg3).."] ")
        
    end)

    --}}}
--]]
    -- DELAYED UI DISPLAY
    Refresh()
    D(string.format("Version %s loaded", QSB.Version))

end --}}}

local MouseDown

function OnMoveStart() --{{{
D("OnMoveStart")
    QSB.Moving   = true
    OnMouseDown()
end --}}}
function OnMoveStop() --{{{
D("OnMoveStop: MouseDown=["..tostring(MouseDown).."]")
    QSB.Moving = false

    if (MouseDown) then
        OnMouseClicked()
    else
        UIWindowChanged()
    end
    --Refresh()
end --}}}

function OnResizeStart() --{{{
D("OnResizeStart")
    QSB.Resizing = true
    OnMouseDown()
end --}}}
function OnResizeStop() --{{{
D("OnResizeStop: MouseDown=["..tostring(MouseDown).."]")
    QSB.Resizing = false

    if (MouseDown) then
        OnMouseClicked()
    else
        UIWindowChanged()
        Refresh()
    end
end --}}}

function OnMouseDown() --{{{
D("OnMouseDown")

    MouseDown = true
    zo_callLater(OnMouseNotClicked, 250)

end --}}}
function OnMouseNotClicked() --{{{
D("OnMouseNotClicked")

    MouseDown = false

end --}}}
function OnMouseClicked() --{{{
D("OnMouseClicked: MouseDown=["..tostring(MouseDown).."]")

    if not QSB.Settings.LockUI then
        QSB.Settings.LockUI = true
        Refresh()
        Show()
    end

end --}}}

-- LOCAL
function OnClicked_handle( handleName ) --{{{
D("OnClicked_handle("..tostring(handleName)..")")

    local arg
    if handleName == "L" then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
      --Rebuild_LibAddonMenu()
        Refresh()
        Show()

    elseif handleName == "S" then
        Rebuild_LibAddonMenu()

    elseif    string.match(handleName, "P([1-5])") then
        arg = string.match(handleName, "P([1-5])")

        SelectPreset( PRESETNAMES[ tonumber(arg) ] )
        loadItemSlots();
        Refresh();
        Show()

    end

end --}}}

function OnMouseEnter() --{{{
--D("OnMouseEnter")
    if not QSB.UIHandles   then return end
    if not QSB.UIHandles.L then return end

    if QSB.Settings.LockUI then
        QSB.UIHandles.L:SetColor(0,1,0) -- green = may unlock
    else
        QSB.UIHandles.L:SetColor(1,0,0) -- red   = should lock
    end
    ShowUIHandles()

end --}}}
function OnMouseExit() --{{{
--D("OnMouseExit")
    if not QSB.UIHandles   then return end
    if not QSB.UIHandles.L then return end

    if QSB.Settings.LockUI then
        HideUIHandles()
    else
        QSB.UIHandles.L:SetColor(1,0,0) -- red = should lock
        ShowUIHandles()
    end

end --}}}
function OnClicked_bNum(bNum) --{{{

    SelectButton( bNum )

end --}}}

-- OnSlashCommand --{{{
function OnSlashCommand(arg)
    d("GQSB"..COLOR_C.." "..QSB.Version.." (190304)|r\n"
    .."GQSB"..COLOR_8.." Checked with Update 21 (4.3.5): Wrathstone (API 100026)|r\n"
    .."GQSB"..COLOR_8.." New Settings Option: Account-wide or Character Settings|r\n"
    .."GQSB"..COLOR_8.." Preset swap cooldown to avoid warning message|r\n"
    .."GQSB"..COLOR_8.." "..QSB_SLASH_COMMAND.." -h for help|r\n"
    ..QSB_SLASH_COMMAND.." "..arg)
--d("GQSB "..COLOR_7.." /gqsb debug_equip to track P1..P5 issue")
--{{{
--d("GQSB "..QSB.Version.. " (190226) |r Account-wide or Character Settings")
--d("GQSB "..QSB.Version.. " (181113) |r Murkmire *collectible *crafting *tooltips")
--d("GQSB "..QSB.Version.. " (181027) |r Update 20 (4.2.5): Murkmire (API 100025)")
--d("GQSB "..QSB.Version.. " (181023) |r Update 20 (4.2.5): Murkmire (API 100025)")
--d("GQSB "..QSB.Version.. " (180815) |r Update 19 (4.1.15): Wolfhunter (API 100024)")
--d("GQSB "..QSB.Version.. " (180522) |r Update 18 (4.0.5): Summerset (API 100023)")
--d("GQSB "..QSB.Version.. " (180312) |r New options: Blink Changes & NO SOUND")
--d("GQSB "..QSB.Version.. " (180310) |r Item vs. Collections .. (slotId vs. collId)")
--d("GQSB "..QSB.Version.. " (180302) |r Collectible handling is back")
--d("GQSB "..QSB.Version.. " (180226) |r Update 17 (3.3.7): Dragon Bones (API 100022)\n new option:|r Auto-Clone previous-to-empty preset (ON OFF)\n new kbd and slash-commands:|r clear, force, block\n Quicker UI")
--d("GQSB "..QSB.Version.. " (171128) |r Update 16 (3.2.6): Clockwork City (API 100021)\n new option:|r Auto-Clone previous-to-empty preset (ON OFF)\n new slash-command:|r /gqsb clear ...to clear Current-Preset-Items")
--d("GQSB "..QSB.Version.. " (171028) |r Update 16 (3.2.6): Clockwork City (API 100021)|r")
--d("GQSB "..QSB.Version.. " (170917) |r Update 15 (3.1.5): Horns of the Reach (API 100020)\n Item Presets|r + Keyboard Shortcuts|r + ollectible support(+)|r")
--d("GQSB "..QSB.Version.. " (170902) |r Update 15 (3.1.5): Horns of the Reach (API 100020)\n Item Presets|r + Keyboard Shortcuts|r + ollectible support|r")
--d("GQSB "..QSB.Version.. " (170829) |r Update 15 (3.1.5): Horns of the Reach (API 100020)\n Item Presets (for each char)|r +  Preset Keyboard Shortcuts|r")
--d("GQSB "..QSB.Version.. " (170822) |r Update 15 (3.1.5): Horns of the Reach (API 100020)\n Item Presets (for each char)|r +  Preset Keyboard Shortcuts|r")
--d("GQSB "..QSB.Version.. " (170818) |r Update 15 (3.1.5): Horns of the Reach (API 100020)\n Item Presets (for each char)|r +  LibAddonMenu-2.0 r24 |r")
--d("GQSB "..QSB.Version.. " (170815) |r Update 15 (3.1.5): Horns of the Reach (API 100020)\n Item Presets|r +  LibAddonMenu-2.0 r24 |r")
--d("GQSB "..QSB.Version.. " (170709) |r Update 14 (3.0.5): Morrowind   (API 100019)\n New feature: Item Presets|r")
--d("GQSB "..QSB.Version.. " (170524) |r Update 14 (3.0.5): Morrowind   (API 100019)")
--d("GQSB "..QSB.Version.. " (170207) |r Update 13 (2.7.5): Homestead   (API 100018)")
--d("GQSB "..QSB.Version.. " (161128) |r Update 12 (2.6.4): One Tamriel (API 100017)")
--d("GQSB "..QSB.Version.. " (161007) |r Update 12 (2.6.4): One Tamriel (API 100017)")
--d("GQSB "..QSB.Version.. " (160803) |r Update 2.5.5 : Shadows of the Hist (API 100016)")
--d("GQSB "..QSB.Version.. " (160601) |r Update 2.4.5 : Dark Brotherhood (API 100015)")
--d("GQSB "..QSB.Version.. " (160310) |r Update 2.2.5 : Thieves Guild (API 100014)")
--d("GQSB "..QSB.Version.. " (160219) |r Update 2.2.4 : Orsinium (API 100013)")
--d("GQSB "..QSB.Version.." + Tooltips|r Update 6 (API 100011)")
--d("GQSB "..QSB.Version.." + Settings->Prepare for SWAPS with Control-Keybinds]|r Update 6 (API 100011)")
--d("GQSB "..QSB.Version.." + LibAddonMenu-2.0-r17]|r Update 6 (API 100011)")
--}}}

    local ui_may_have_changed = false
    local presetName = ""
    local lua_expr

    -- help --{{{
    if (arg == "")
    then
        d("GQSB Current Settings: "
        ..(QSB.AccountWideSettings.SaveAccountWide and COLOR_6.." Account-wide"
        or                   COLOR_2..GetUnitName("player").."|r Character"))

    elseif (arg ==  "-h"   )
    or     (arg == "--h"   )
    or     (arg ==  "-help")
    or     (arg ==   "help")
    then
        d(QSB_SLASH_COMMAND..     " p1-p5 .. select Presets "..PRESETNAMES[1].." to "..PRESETNAMES[5].." (current = "..QSB.Settings.PresetName..")")
        d(QSB_SLASH_COMMAND..  " settings .. Settings Panel display (toggle)")
        d(QSB_SLASH_COMMAND..      " lock .. UI lock (toggle)")
        d(QSB_SLASH_COMMAND..   " qsbhide .. Hide Default Quick Slot Button (toggle)")
        d(QSB_SLASH_COMMAND.. " clearchat .. clears all chat windows")
        d(QSB_SLASH_COMMAND..   " refresh .. rebuild and redisplay UI")
        d(QSB_SLASH_COMMAND..     " clone .. auto-clone previous-to-empty preset (toggle)")
        d(QSB_SLASH_COMMAND..     " clear .. to clear Current-Preset-Items")
        d(QSB_SLASH_COMMAND..     " reset .. RESETS ALL CHARACTER SETTINGS TO DEFAULT")
        d(QSB_SLASH_COMMAND..     " force .. to force Bar Visiblity")
        d(QSB_SLASH_COMMAND..     " block .. to block Bar Visiblity (overrides force)")
        d(QSB_SLASH_COMMAND..   " account .. to toggle between "..GetUnitName("player").." and Account-wide Settings")
        if DEBUG_ITEM then
            d(QSB_SLASH_COMMAND.. '     _G["ZO_ChatWindowTemplate1Buffer"]')
            d(QSB_SLASH_COMMAND.. ' lua _G["ZO_ChatWindowTemplate1Buffer"]:Clear()')
            d(QSB_SLASH_COMMAND.. ' lua _G["SLASH_COMMANDS"]')
        end

      --d(QSB_SLASH_COMMAND.. " debug")
      --d(QSB_SLASH_COMMAND.. " debug_item")
      --d(QSB_SLASH_COMMAND.. " debug_event")
      --d(QSB_SLASH_COMMAND.. " _G[...] ... dumps global variable")
      --d(QSB_SLASH_COMMAND.. " kbclr ... Clear all KeyBindings (protected, wont work)")
      --d(QSB_SLASH_COMMAND.. " kbmod ... Apply KeyBindings Modifier")

    --}}}

    elseif(string.match(arg,                "%s*bag%s+(%d)%s*,%s*(.*)")) then
        local bag, name = string.match(arg, "%s*bag%s+(%d)%s*,%s*(.*)")
        bag  = tonumber(bag)
        name = tostring(name)
        getItem_bagId_slotId(bag, name)

    -- hide show refresh reset p1-5 kbclr kbmod {{{
    elseif(arg == "hide"   ) then Hide("OnSlashCommand")
    elseif(arg == "show"   ) then Show()
    elseif(arg == "refresh") then Refresh()
    elseif(arg == "reset"  ) then Load_Defaults()
    elseif(arg == "account") then Load_ZO_SavedVars(not QSB.AccountWideSettings.SaveAccountWide)
    elseif(arg == "compare") then QSB_Settings_Changed()

    elseif(arg == "p1"     ) then presetName = PRESETNAMES[1]
    elseif(arg == "p2"     ) then presetName = PRESETNAMES[2]
    elseif(arg == "p3"     ) then presetName = PRESETNAMES[3]
    elseif(arg == "p4"     ) then presetName = PRESETNAMES[4]
    elseif(arg == "p5"     ) then presetName = PRESETNAMES[5]

    elseif(arg == "kbclr"  ) then ClearKeyBindings()
    elseif(arg == "kbmod"  ) then ApplyKeyBindingsModifier(); ApplyKeyBindingsModifier_SWAPS()
    --}}}
    -- clone {{{
    elseif(arg == "clone") then
        QSB.CloneCurrentToEmtpyPreset = not QSB.CloneCurrentToEmtpyPreset
        if (QSB.CloneCurrentToEmtpyPreset) then
            d(COLOR_6.." @@@ AUTO-CLONING|r IS ON")
        else
            d(COLOR_6.." @@@ AUTO-CLONING|r IS OFF")
        end
      --Rebuild_LibAddonMenu()

    --}}}
    -- clear {{{
    elseif(arg == "clear"       ) then
        for bNum = 1, QSB.ButtonCountMax do
            clear_bNum(bNum)
            QSB.Settings.SlotItemTable[bNum].itemName  = nil
            QSB.Settings.SlotItemTable[bNum].itemLevel = nil
            QSB.Settings.SlotItemTable[bNum].slotId    = nil
            QSB.Settings.SlotItemTable[bNum].texture   = nil
       end

       loadItemSlots()

        d("..."..COLOR_2.."QSB.Settings.SlotItemTable CLEARED|r\n")

        ui_may_have_changed = true
    --}}}
    -- lock {{{
    elseif(arg == "lock"   ) then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
      --Rebuild_LibAddonMenu()

        ui_may_have_changed = true
    --}}}
    -- gabhide (160218) {{{
    elseif(arg == "qsbhide") then
        QSB.Settings.GameActionButtonHide = not QSB.Settings.GameActionButtonHide
        if (QSB.Settings.GameActionButtonHide) then
            d(COLOR_6.." @@@ HIDING|r Default Quick Slot Button")
        else
            d(COLOR_4.." @@@ SHOWING|r Default Quick Slot Button")
        end
        GameActionButtonHideHandler(true,"OnSlashCommand")

    --}}}
    -- settings {{{
    elseif(arg == "settings"  ) then

      --LAM:ToggleAddonPanels( QSB.Panel )
        OnClicked_handle( "S" )

    --}}}
    -- clear -- thanks to SkOODaT's ClearChat {{{
    elseif(arg == "clearchat"  ) then
        QSB_ClearChat()

    --}}}
    -- force {{{
    elseif(arg == "force") then
        QSB_ForceBarVisibility()

    --}}}
    -- block {{{
    elseif(arg == "block") then
        QSB_BlockBarVisibility()

    --}}}
    -- DEBUG DEBUG_EVENT DEBUG_ITEM clear -- {{{
    elseif(arg == "debug"       ) then DEBUG       = not DEBUG      ; d("...DEBUG......=[" ..tostring( DEBUG       ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_event" ) then DEBUG_EVENT = not DEBUG_EVENT; d("...DEBUG_EVENT=[" ..tostring( DEBUG_EVENT ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_equip" ) then DEBUG_EQUIP = not DEBUG_EQUIP; d("...DEBUG_EQUIP=[" ..tostring( DEBUG_EQUIP ).. "]"); ui_may_have_changed = true;
    elseif(arg == "debug_item"  ) then DEBUG_ITEM  = not DEBUG_ITEM ; d("...DEBUG_ITEM.=[" ..tostring( DEBUG_ITEM  ).. "]"); ui_may_have_changed = true;
--      get_collId_itemName(0)
    --}}}
    else
        -- _G --{{{
        lua_expr = string.match(arg, "^%s*_G% *(%a*)") -- as a global var name
        if lua_expr then
        --QSB_ClearChat()
            local   o  =  _G[lua_expr]
            if(type(o) == 'table') then
                for k,v in pairs( o ) do
                    d("..."..COLOR_9..k..'|r="..COLOR_2.."'..tostring(v)..'|r ("..COLOR_6.."'..type(v)..'|r)\n')
                end
            end
            d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            d("@ o=_G["..COLOR_5..lua_expr.."|r]")
            d("@ " ..COLOR_C..tostring(o)    )
            d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
        end
        --}}}
        -- lua --{{{
        lua_expr = string.match(arg, "^%s*lua%s*(.*)")
        if lua_expr then
        --QSB_ClearChat()
            d(               "zo_loadstring("..COLOR_5.."return "..lua_expr.."|r)\n")
            local f = assert( zo_loadstring(           "return "..lua_expr     )   )
            if f then
                local r1, r2, r3, r4, r5 = f()
                d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                if(   r1) then d("@ "..COLOR_5.."r1: "..tostring(r1).."\n")
                else           d("@ "..COLOR_2.."*** NO RESULT ***\n")
                end
                if(   r2) then d("@ "..COLOR_5.."r2: "..tostring(r2).."\n") end
                if(   r3) then d("@ "..COLOR_5.."r3: "..tostring(r3).."\n") end
                if(   r4) then d("@ "..COLOR_5.."r4: "..tostring(r4).."\n") end
                if(   r5) then d("@ "..COLOR_5.."r5: "..tostring(r5).."\n") end
                d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                if(type(r1) == "table") then
                    for k,v in pairs( r1 ) do
                        d("..."..COLOR_9..k.."|r1="..COLOR_2..tostring(v).."|r1 ("..COLOR_7..type(v).."|r1)\n")
                    end
                    d("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                end

            end

        end
        --}}}
    end
    -- CHANGE PRESET {{{
    if presetName ~= "" then
        SelectPreset( presetName )
        loadItemSlots();

        ui_may_have_changed = true
    end
    --}}}

    if(ui_may_have_changed) then
        Refresh()
        Show()
    end

end
--}}}

GreymindQuickSlotBar = QSB
EVENT_MANAGER:RegisterForEvent(GreymindQuickSlotBar.Name, EVENT_ADD_ON_LOADED, Initialize)

