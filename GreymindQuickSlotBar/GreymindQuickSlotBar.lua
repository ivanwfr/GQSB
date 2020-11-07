-- GreymindQuickSlotBar_tag (201107:15h:13) --{{{
--  Feature Author: ivanwfr
--}}}
--[[ CHANGELOG
-- TODO: when API changed, do not forget to update version in GreymindQuickSlotBar.txt
v2.6.2   201107 {{{
- [color="yellow"]Checked with Update 28 Markarth (6.2.0): PTS (API 100033)[/color]
- [color="orange"]Button Background Opacity slider[/color]
- [color="orange"]UI Handles hidden by default (unless Lock UI is off)[/color]
- [color="orange"]Weapon swap color applies to current slot button when Hiding buttons background is ON[/color]
}}}
v2.6.2.2 201018 {{{
- [color="yellow"]Checked: PTS (API 100033)[/color]
- [color="orange"]Button Background Opacity slider[/color]
- [color="orange"]UI Handles hidden by default (unless Lock UI is off)[/color]
- [color="orange"]Weapon swap color applies to current slot button when Hiding buttons background is ON[/color]
}}}
v2.6.2.1 201010 {{{
- [color="yellow"]Checked: PTS (API 100033)[/color]
- [color="orange"]Button Background Opacity[/color]
}}}
v2.6.1   200824 {{{
- [color="yellow"]Checked with Update 27 Stonethorn (6.1.0): PTS (API 100032)[/color]
- [color="orange"]Saving last Preset selected slot[/color]
}}}
v2.6.1.4 200823 {{{
- [color="yellow"]Checked with Update XX (X.X.X): PTS (API 100032)[/color]
- [color="orange"]Saving last Preset selected slot[/color]
}}}
v2.6.1.3 200717  {{{
- [color="yellow"]Checked with Update XX (X.X.X): PTS (API 100032)[/color]
}}}
v2.6.1.2 200703 {{{
- [color="yellow"]Checked with Update 26 (6.0.8): Greymoor (API 100031)[/color]
}}}
v2.6.1.1 200614 {{{
- [color="yellow"]Checked with Update 26 (6.0.5): Greymoor (API 100031)[/color]
- [color="orange"]Solved issue "3137: function expected" .. global conflict declared local[/color]
}}}
v2.6.0   200530 {{{
- [color="yellow"]Checked with Update 26 (6.0.5): Greymoor (API 100031)[/color]
- [color="orange"]UI hidden while scrying or digging Antiquities[/color]
}}}
v2.5.0   200527 {{{
- [color="yellow"]Checked with Update 26 (6.0.5): Greymoor (API 100031)[/color]
- [color="orange"]Chat Clear restored[/color] thanks to still supported code from [color="orange"]ChatWindowManager[/color]
- [color="orange"]Blink Changes[/color] shows Slot buttons only, excluding Settings handles
}}}
v2.5.0.2 200413 {{{
- [color="yellow"]Checked with Update 25 (5.3.4): Harrowstorm (API 100030)[/color]
- [color="orange"]Blink Changes[/color] shows Slot buttons only, excluding Settings handles

}}}
v2.5.0.1 200304 {{{
- [color="yellow"]Checked with Update 25 (5.3.4): Harrowstorm (API 100030)[/color]
- [color="orange"]Chat Clear restored[/color] thanks to still supported code from [color="orange"]ChatWindowManager[/color]

}}}
v2.4.9   200229 {{{
- [color="yellow"]Checked with Update 25 (5.3.4): Harrowstorm (API 100030)[/color]
- [color="red"]ZO_ChatWindowTemplate1Buffer[/color] .. Chat clear not supported since Update 25

}}}
v2.4.9.2 191125 {{{
- [color="red"]ON-LOAD[/color] .. hide unwanted top-left rectangle
- [color="red"]ON-LOAD[/color] .. apply Show Policy
- [color="red"]TOOLTIP[/color] .. empty itemLink shown as [-]

}}}
v2.4.9.1 191118 {{{
- [color="yellow"]Saving characters by ID to support renaiming .. [ZO_SavedVars:NewCharacterId] [/color]

}}}
v2.4.8   191102 {{{

- [color="yellow"]Checked with Update 24 (5.2.5): Dragonhold (API 100029)[/color]

[u]Trader08_mod[/u]
- [color="magenta"][b]LockThisPreset[/b][/color]
- [color="magenta"][b]DelayPresetSwapWhileInCombat[/b][/color]
- [color="magenta"][b]Items with same Id but different flavors[/b][/color] improved support based on [b]Items Link[/b].

[u]Chat[/u]
- [color="orange"][b]LinkToChatOnClick[/b][/color] to copy button's item link into chat.
- [color="orange"]ChatMax[/color] utility option to unlock Chat Window maximum size.
- [color="orange"]ChatMute[/color] option to block all Chat warning messages.
- (a per-session option i.e. not per-preset): one for [b]Account-wide[/b], one by [b]Character[/b].

[u]Option defaults[/u]
- [color="lightblue"]Re-shuffled Settings Menu.[/color]
- [color="lightblue"]Default Show Policy[/color] set to [Never] instead of [Always]
- [color="lightblue"]Default Visual Cue[/color] set to [OFF] instead of [Warn + Alert]
- [color="lightblue"]UI layout[/color] may be reduced to a single [1x1 cell] .. down from [2R x 1C]
- [color="lightblue"][X] Defaults Settings button[/color] will only reset the Current Preset.
- (use the [color="red"]/resetall[/color] slash-command to reset all 5 Preset at once).

[u]Addons dependency[/u]
- [color="lightblue"]Preventing early calls to [b]Refresh_handler[/b] from globalapi.lua at login[/color]
- [color="lightblue"]Deleted ## DependsOn: directive in favor of embedded ranked-up libraries[/color]
- [color="lightblue"]Updated ## Description: directive in embedded libraries manifest[/color]

}}}
--]]

local DEBUG          = false
local DEBUG_ITEM     = false
local DEBUG_EQUIP    = false
local DEBUG_EVENT    = false
local DEBUG_TASK     = false
local DEBUG_STATION  = false
local DEBUG_STATUS   = false
local DEBUG_TOOLTIP  = false
local DEBUG_HANDLE   = false

-- LOCAL
-- SYMBOLS {{{
-- UNICODE -- (utf-8 is not supported by current font)
--local SYMBOL_GEAR                = "\226\154\153"
  local SYMBOL_GEAR                = "→"
--}}}
-- COLORS --{{{

-- RGB
local COLOR_R                    = "|cFF2222"
local COLOR_G                    = "|c22FF22"
local COLOR_B                    = "|c2222FF"
local COLOR_C                    = "|c44FFFF"
local COLOR_M                    = "|cFF44FF"
local COLOR_Y                    = "|cFFFF44"

-- ECC
local COLOR_0                    = "|r"
local COLOR_1                    = "|c964B00"
local COLOR_2                    = "|cFF0000"
local COLOR_3                    = "|cFFA500"
local COLOR_4                    = "|cFFFF00"
local COLOR_5                    = "|c9ACD32"
local COLOR_6                    = "|c6495ED"
local COLOR_7                    = "|cEE82EE"
local COLOR_8                    = "|cA0A0A0"
local COLOR_9                    = "|cFFFFFF"
local COLOR_X                    = { COLOR_1, COLOR_2, COLOR_3, COLOR_4, COLOR_5, COLOR_6, COLOR_7, COLOR_8, COLOR_9 }
--[[
:!start explorer "https://en.wikipedia.org/wiki/Electronic_color_code"
--]]

-- VISUAL-CUE BORDERS
local COLOR_PENDING_TASK            = { R =1  , G =1  , B =1  , A = 1   } -- white

-- EQUIPPED [ALERT .. WARNING .. NORMAL]
local COLOR_ALERT                   = { R =1  , G =0  , B =0  , A = 1   }
local COLOR_WARNING                 = { R =1  , G =1  , B =0  , A = 1   }
local COLOR_NORMAL                  = { R =0.6, G =0.6, B =0.6, A = 0.6 } -- grayish

-- CURRENT SLOT
local COLOR_CURRENTSLOT             = { R =0.5, G =1  , B =0.5, A = 1   }

-- BACKGROUND AnD ACTIVE WEAPON PAIR
local COLOR_BACKGROUND              = { R =0  , G =0  , B =0  , A = 0.6 } -- was COLOR_NORMAL as of 2.6.1
local COLOR_ACTIVEWEAPONPAIR1       = { R =0  , G =1  , B =0  , A = 1.0 }
local COLOR_ACTIVEWEAPONPAIR2       = { R =1  , G =0  , B =0  , A = 1.0 }

-- COLORS --}}}
-- CONSTANTS --{{{

-- DELAYS
local ZO_CALLLATER_DELAY_HIDE         =  200 -- Hide
local ZO_CALLLATER_DELAY_SHOW         =  200 -- Show
local ZO_CALLLATER_DELAY_HANDLER      =  200 -- Show   or Hide
local ZO_CALLLATER_DELAY_BLINK_CHANGE =  500 -- Show then Hide
local ZO_CALLLATER_DELAY_NEXT         =  200 -- NextAuto
local ZO_CALLLATER_DELAY_REFRESH      =   10 -- Refresh
local ZO_CALLLATER_DELAY_REFRESH_MAX  = 1000 -- Refresh burst
local ZO_CALLLATER_DELAY_SOUND        =   10 -- PlaySound
local ZO_CALLLATER_DELAY_LIB          =   10 -- PlaySound
local ZO_CALLLATER_DELAY_TASKS        =   20 -- clear_or_equip
local ZO_COOL_DOWN_DELAY_TASKS        = 7000 -- tasks_cooldown_begin tasks_cooldown_end
local ZO_CALLLATER_DELAY_ONMOUSEEXIT  =  100 -- Hide Handles
local ZO_MENU_SHOW_HIDE_DELAY         =  500

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
= "PRESET CHANGE "..COLOR_9.." ON COOLDOWN|r\n"
..COLOR_8.."to avoid a SPAM WARNING message"

local PENDING_TT
= "PRESET CHANGE "..COLOR_5.." DELAYED|r\n"
..COLOR_5.."requested while IN-COMBAT\n"

-- KEYS
local MOD_NONE                = "No Modifier"

local MOD_ALT                 = "Alt"
local MOD_ALT_KEYCODE         = 5           -- KEY_ALT

local MOD_COMMAND             = "Command"
local MOD_COMMAND_KEYCODE     = 6           -- KEY_COMMAND

local MOD_CONTROL             = "Control"
local MOD_CONTROL_KEYCODE     = 4           -- KEY_CTRL

local MOD_SHIFT               = "Shift"
local MOD_SHIFT_KEYCODE       = 7           -- KEY_SHIFT

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
local KBNAME_SETTINGS         = COLOR_9.."Settings"

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

    "CONSOLE_GAME_ENTER",
    "DUEL_START",
    "ACHIEVEMENT_AWARDED",
    "AVA_GATE_CLOSED",
    "AVA_GATE_OPENED",

    "EMPEROR_ABDICATED",
    "GROUP_KICK",
    "GROUP_PROMOTE",

    NO_SOUND
}
--[[
 :!start explorer "https://wiki.esoui.com/Sounds"
--]]

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
    { name=KBNAME_SETTINGS             , id="GREYMIND_QUICK_SLOT_BAR_SETTINGS"            }, -- QSB_Settings
}

local KEYBINDINGS_SWAPS = {

    { name="Load Preset #1"            , id="SWAPS_BUTTON_1"},
    { name="Load Preset #2"            , id="SWAPS_BUTTON_2"},
    { name="Load Preset #3"            , id="SWAPS_BUTTON_3"},
    { name="Load Preset #4"            , id="SWAPS_BUTTON_4"},
    { name="Load Preset #5"            , id="SWAPS_BUTTON_5"},

}

--}}}
-- ITEM_MSG {{{
local ITEM_3_SAVE                    = COLOR_3.."ITEM SAVE"
local ITEM_4_EQUIP                   = COLOR_4.."ITEM EQUIP"
local ITEM_5_EQUIP_CHANGED           = COLOR_5.."ITEM EQUIP CHANGED"
local ITEM_2_EQUIP_ERROR_ITEMLINK    = COLOR_2.."ITEM EQUIP ERROR LINK"
local ITEM_2_EQUIP_ERROR_SLOT        = COLOR_2.."ITEM EQUIP ERROR SLOT"
local ITEM_2_EQUIP_ERROR_TYPE        = COLOR_2.."ITEM EQUIP ERROR TYPE"
local ITEM_6_UPDATE                  = COLOR_6.."ITEM UPDATE"

--}}}
-- ATTRIBUTES {{{

local HAND18_FONT = "EsoUI/Common/Fonts/univers57.otf|18|soft-shadow-thin"
local HAND24_FONT = "EsoUI/Common/Fonts/univers57.otf|24|soft-shadow-thin"

local SETTINGSPANELNAME                 = COLOR_5.."G "..COLOR_3.."Quick "..COLOR_4.."Slot "..COLOR_6.."Bar"
local QSB_SLASH_COMMAND                 = "/gqsb"
local Loaded_QSB_Settings = {}
local QSB = {

    Name                                = "GreymindQuickSlotBar",
    Panel                               = nil,
    Version                             = "v2.6.2", -- 201107 previous: 201018 201010 200824 200823 200717 200703 200614 200530 200527 200413 200304 200229 191125 191118 191102 191027 191006 190928 190918 190909 190907 190904 190824 190822 190821 190819 190817 190816 190815 190814 190813 190628 190522 190405 190304 190226 190207 190205 190126 190111 181113 181027 181023 181022 180815 180722 180522 180312 180310 180302 180226 180214 180213 171230 171219 171128 171028 170917 170902 170829 170822 170818 170815 170714 170722 170720 170717 170715 170709 170524 170206 161128 161007 160824 160823 160803 160601 160310 160219 160218 151108 150905 150514 150406 150403 150330 150314 150311 15021800
    SettingsVersion                     = 1,

    -- CHOICES
  --KeyModifier_ChoiceList              = { MOD_NONE   , MOD_SHIFT , MOD_CONTROL, MOD_ALT },
    Visibility_ChoiceList               = { VIS_ALWAYS, VIS_RETICLE, VIS_COMBAT, VIS_BLINK_CHANGES, VIS_NEVER },
    VisualCue_ChoiceList                = { VISCUE_OFF, VISCUE_WA  , VISCUE_WAC },

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
    CloneCurrentToEmtpyPreset           = false,

    -- small helper tags
    UIHandles_label_tooltip             = {
        {   label="L"  , tooltip="Lock UI"      }
        , { label="P1" , tooltip="Preset 1"     }
        , { label="P2" , tooltip="Preset 2"     }
        , { label="P3" , tooltip="Preset 3"     }
        , { label="P4" , tooltip="Preset 4"     }
        , { label="P5" , tooltip="Preset 5"     }
        , { label="S"  , tooltip="Settings menu"}
    },
    UIHandles                           = {},

    -- Settings-Menu entries to be updated at each Preset activation
    SettingsControls                    = {},

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
    ChatMax                             = false,
    ChatMute                            = false,
    LockUI                              = false,
    LockThisPreset                      = false,
    DelayPresetSwapWhileInCombat        = false,
    NextPrevWrap                        = false,
    NextAuto                            = false,
    ShowBackground                      = false,
    SwapBackgroundColors                = false,
    Visibility                          = VIS_NEVER,
    PresetName                          = PRESETNAMES[1],
    SoundAlert                          = SOUNDNAMES[1],
    SoundSlotted                        = SOUNDNAMES[2],

    -- (170615 - Marazota)
    SlotItem = {
        KeyBindAlignH                   = ALIGNH[2],
        KeyBindAlignV                   = ALIGNV[2],
        ButtonBackgroundOpacity         = 60,
        NotSelectedButtonOpacity        = 30,
            OverlayButtonOpacity        = 30,
        QuantityAlert                   = 5,
        QuantityLabelPositionHorizontal = ALIGNH[4],
        QuantityLabelPositionVertical   = ALIGNV[4],
        QuantityWarning                 = 10,
        HideSlotBackground              = false,
        ShowKeyBindings                 = false,
        ShowNumbers                     = false,
        LinkToChatOnClick               = true,
        ShowQuantityLabels              = true,
        VisualCue                       = VISCUE_OFF,
    },
    SlotItemTable  = {
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil },
        { itemName = "", slotId = 0, itemId = 0, itemLink = 0, texture = nil, itemLevel = nil }
    },

    -- (200823 - Atavus)
    CurrentSlotIndex                    = 0,

    -- (200823 - moved to table end)
    Presets                             = { P1={}, P2={}, P3={}, P4={}, P5={} },

} --}}}
-- FORWARD DECLARATIONS --{{{
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
local ClearKeyBindings
local CopyFromTo
local CopyNotNilSettingsFromTo
local DeepCopy
local GameActionButtonHideHandler
local GetAlignmentXY
local GetKeyBindInfo
local GetSlotItemKeyName
local Get_preset_pending_IN_COMBAT
local HideUIHandles
local Hide_delayed
local Hide_handler
local Initialize
local IsEmptySlot
local Load_ZO_SavedVars
local OnClicked_bNum
local OnClicked_handle
local OnMouseClicked
local OnMouseDown
local OnMouseEnter
local OnMouseExit
local OnMouseNotClicked
local OnMoveStart
local OnMoveStop
local OnResizeStart
local OnResizeStop
local OnSlashCommand
local PlaySoundAlert
local PlaySoundSlotted
local Process_preset_pending_IN_COMBAT
local QSB_SetCurrentQuickslot
local QSB_SetCurrentQuickslot_handler
local QSB_Setting_Preset_Changed
local QSB_Settings_Changed
local Refresh
local Refresh_handler
local RegisterEventHandlers
local Release_Settings_Locked
local ResetAllPresets
local ResetThisPreset
local SaveCurrentPreset
local SelectButton
local SelectNextAuto
local SelectNextAuto_delayed
local SelectPreset
local SetChatMax
local SetUIHandlesVisibility
local Set_preset_pending_IN_COMBAT
local Settings_Locked
local ShowOrHide
local ShowOrHideUIHandles
local ShowOrHideUIHandles_handler
local ShowUIHandles
local Show_delayed
local UIWindowChanged
local bNum_to_slotIndex
local check_QSB_BAG_BACKPACK_UPDATE_bagIndex_to_check
local clear_bNum
local d_signature
local d_table
local equip_bNum
local getItem_itID_from_slot
local getItem_name_from_slot
local getItem_normalized_link
local getItem_slot_from_link
local getItem_slot_from_name
local getItem_tooltip
local handle_ACTION_SLOT_UPDATED
local is_SlotItemTable_empty
local is_same_item_link
local loadPresetSlots
local populate_an_empty_SlotItemTable
local save_QSB_to_SlotItemTable
local slotIndex_to_bNum
local string_split
local table_includes
local tasks_cooldown_begin
local tasks_cooldown_end
local tasks_handler

local BlockBarVisibility            = false
local ForceBarVisibility            = false
local Hide_pending                  = false
local PlaySoundAlert_pending        = false
local PlaySoundSlotted_pending      = false
local Rebuild_LibAddonMenu_pending  = false
local Reticle_isHidden              = false
local SelectNextAuto_pending        = false
--}}}
--{{{
local QSB_BAG_BACKPACK_UPDATE_bagIndex  = -1
local QSB_BAG_BACKPACK_UPDATE_itemLevel = -1
local QSB_BAG_BACKPACK_UPDATE_mutex     = false

local tasks_loaded = {} -- collection of clear or equip function calls
local tasks_posted = {} -- cloned version (for thread-proof in-progress handling)
local tasks_cooldown_inprogress
--}}}
-- LOGGING --{{{
-- d {{{
local function c(args)
    if not QSB                   then return end
    if not QSB.Settings          then return end
    if     QSB.Settings.ChatMute then return end
    d(args)
end
--}}}
-- D {{{
local function D(msg)
    if DEBUG then
        c(COLOR_7..".QSB.DEBUG:|r "..msg)
    end
end
--}}}
-- D_EQUIP {{{
local function D_EQUIP(title, bNum, itemId, itemType, itemLevel, itemLink)

    if    itemLink == "" then

        c("→ "..title
        .." " ..COLOR_4.." #"..  bNum
        ..                " ".. (itemId   and (COLOR_8..          tostring(itemId   )) or "→")
        .." " ..COLOR_3.."→ → →"
        ..      COLOR_8.." empty slot")

    else

        c("→ "..title
        .." " ..COLOR_4.." #"..  bNum
        ..               " ".. (itemId    and (COLOR_8..          tostring(itemId   )) or "→")
        ..      COLOR_3.." ".. (itemType  and (                   tostring(itemType )) or "→")
        ..               " ".. (itemLevel and (COLOR_5.."Level "..tostring(itemLevel)) or "→")
        ..             "|r "..                                    tostring(itemLink ))
    end

end
--}}}
-- D_EVENT {{{
local function D_EVENT(eventName)
    if DEBUG_EVENT or DEBUG then
        c(COLOR_7..".QSB.DEBUG: "..COLOR_C..eventName)
    end
end

--}}}
-- D_ITEM {{{
local function D_ITEM(msg)
    if DEBUG_ITEM or DEBUG then
        c(msg)
    end
end

--}}}
-- D_QSB {{{
local function D_QSB(title, bNum)

    if(QSB.Settings.SlotItemTable[bNum].slotId) then

        c( COLOR_X[bNum]      .. title.."["..bNum.."]"
        .. COLOR_9 .." Link_" .. tostring( QSB.Settings.SlotItemTable[bNum].itemLink  )
        .. COLOR_2 .." ID_"   .. tostring( QSB.Settings.SlotItemTable[bNum].itemId    )
        .. COLOR_3 .." Type_" .. tostring( QSB.Settings.SlotItemTable[bNum].itemType  )
        .. COLOR_4 .." Name_" .. tostring( QSB.Settings.SlotItemTable[bNum].itemName  )
        .. COLOR_5 .." Slot_" .. tostring( QSB.Settings.SlotItemTable[bNum].slotId    )
        .. COLOR_6 .." Level_".. tostring( QSB.Settings.SlotItemTable[bNum].itemLevel )
        )
    else
        c(           title    .. "["..bNum.."] "..COLOR_8.." EMPTY SLOT")
    end

end
--}}}
-- D_STATUS {{{
local function D_STATUS(_caller)
c("\r\n".._caller..":")

    -- ACTIVE OPTIONS
    if          QSB.Settings.LockThisPreset
        or      QSB.Settings.DelayPresetSwapWhileInCombat
        then
            c(COLOR_4.."[".. QSB.Settings.PresetName.."]"
            .. (QSB.Settings.LockThisPreset               and (COLOR_2.." .. IS LOCKED"               ) or "")
            .. (QSB.Settings.DelayPresetSwapWhileInCombat and (COLOR_5.." .. EQUIP AFTER COMBAT IS ON") or "")
            )
        end

    -- TASKS
    local preset_pending_name =  Get_preset_pending_IN_COMBAT()
    local preset_pending      = (preset_pending_name ~= "")
    local tasks_pending       = (#tasks_loaded > 0) or (#tasks_posted > 0)

    if(    tasks_pending
        or preset_pending
        ) then

        c(COLOR_8.."TASKS"
        ..(tasks_pending     and (COLOR_4.." COOLDOWN ["..#tasks_loaded.." loaded] ["..#tasks_posted.." posted]") or "")
        ..(preset_pending    and (COLOR_4.."  DELAYED ["..preset_pending_name.."]"                              ) or "")
        )
    end

    -- INTERFACE
    local interface_showing =     Reticle_isHidden
    local inventory_showing = not ZO_PlayerInventory:IsHidden()
    local qsb_panel_showing = not QSB.Panel:IsHidden()
    local quickslot_showing = not ZO_QuickSlot:IsHidden()

    if(    qsb_panel_showing
        or interface_showing
        or inventory_showing
        or quickslot_showing
        ) then

        c((interface_showing and COLOR_3.." INTERFACE" or "")
        ..(quickslot_showing and COLOR_4.." QSB-WHEEL" or "")
        ..(inventory_showing and COLOR_5.." INVENTORY" or "")
        ..(qsb_panel_showing and COLOR_7.." SETTINGS"  or "")
        )
    end

end
--}}}
--}}}

-- PRESET
-- ResetAllPresets {{{
function ResetAllPresets()
c("QSB: RESETING ALL PRESETS TO DEFAULT VALUES")

    SelectPreset( PRESETNAMES[1] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[2] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[3] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[4] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[5] ); CopySettingsDefaultsTo(QSB.Settings)

    loadPresetSlots()

    ButtonSizeChanged()

    Refresh("ResetAllPresets")
end
--}}}
-- ResetThisPreset {{{
function ResetThisPreset()
c("QSB: reseting this preset to default values")

    -- KEEP CURRENTLY SELECTED PRESET

    CopySettingsDefaultsTo(QSB.Settings)

    loadPresetSlots()

    ButtonSizeChanged()

    Refresh("ResetThisPreset")
end
--}}}
-- TRADER08_MOD
--{{{
local presetName_pending_IN_COMBAT = ""
--}}}
-- Set_preset_pending_IN_COMBAT {{{
function Set_preset_pending_IN_COMBAT( selectedPreset )

    -- NEW PRESET REQUESTED
    if( presetName_pending_IN_COMBAT ~= selectedPreset) then
if(DEBUG_EQUIP) then c(COLOR_5.."Set_preset_pending_IN_COMBAT: ["..tostring(selectedPreset).. " REQUEST PENDING]") end

        PlaySound( SOUNDS.ACTIVE_SKILL_MORPH_CHOSEN )

        presetName_pending_IN_COMBAT  = selectedPreset

    -- SAME PRESET REQUESTED .. CANCEL REQUEST
    else
if(DEBUG_EQUIP) then c(COLOR_3.."Set_preset_pending_IN_COMBAT: ["..tostring(selectedPreset).. " REQUEST CANCELED]") end

        PlaySound( SOUNDS.GROUP_PROMOTE )

        presetName_pending_IN_COMBAT  = ""
    end

end
--}}}
-- Process_preset_pending_IN_COMBAT {{{
function Process_preset_pending_IN_COMBAT(inCombat_state)
    if(presetName_pending_IN_COMBAT == "") then return end

if(DEBUG_EQUIP) then c(COLOR_4.."Process_preset_pending_IN_COMBAT: [preset "..tostring(presetName_pending_IN_COMBAT).."] .. [inCombat "..tostring(inCombat_state).."]") end

    SelectPreset( presetName_pending_IN_COMBAT )
    presetName_pending_IN_COMBAT     = ""

    loadPresetSlots()

    Refresh("PENDING IN COMBAT")
end
--}}}
-- Get_preset_pending_IN_COMBAT {{{
function Get_preset_pending_IN_COMBAT()

    return presetName_pending_IN_COMBAT

end
--}}}
-- SelectPreset {{{
function SelectPreset(selectedPreset)
-- Delay In Combat Preset swap {{{
    if IsUnitInCombat('player') then
if(DEBUG_EQUIP) then QSB_ClearChat(); c(COLOR_M.."=== CHAT CLEARED BY DEBUG_EQUIP ===") end

        if QSB.Settings.DelayPresetSwapWhileInCombat then
            Set_preset_pending_IN_COMBAT( selectedPreset )

        else
if(DEBUG_EQUIP) then c(COLOR_5.."IN COMBAT: PRESET NOT CHANGED: "..QSB.Settings.PresetName) end

            PlaySound( SOUNDS.ITEM_ON_COOLDOWN )
        end
        return
    end
--}}}
D("SelectPreset("..COLOR_C..selectedPreset.."|r):")
    local log_this = DEBUG_EQUIP
    -- SAVE CURRENT PRESET .. (unless LockThisPreset is ON and Settings menu is hidden) {{{
    if QSB.Settings.LockThisPreset and QSB.Panel:IsHidden() then

if(log_this) then c(QSB.Settings.PresetName..COLOR_M.." → LOCKED → NOT SAVED") end

    else
        local we_can_save_because -- LUA equivalent to ternary operator ?:
        =    (not QSB.Settings.LockThisPreset)
        and              COLOR_8.."NOT LOCKED"
        or               COLOR_M.."LOCKED|r but "..COLOR_4.."MENU is OPENED"

        SaveCurrentPreset(we_can_save_because)

        if(QSB.Settings.Visibility ~= VIS_BLINK_CHANGES) then
            ShowUIHandles("SelectPreset( "..selectedPreset.." )")
        else
            HideUIHandles("SelectPreset( "..selectedPreset.." )")
        end
    end
    --}}}
    -- MainWindow {{{
    if not QSB.Settings.Presets[selectedPreset].MainWindow then
        QSB   .Settings.Presets[selectedPreset] = DeepCopy(QSB.SettingsDefaults)

    end
    --}}}
    -- LOAD SELECTED PRESET {{{
if(log_this) then c(selectedPreset         ..COLOR_M.." → LOADING:") end

    local from = QSB.Settings.Presets[selectedPreset]
    local to   = QSB.Settings
    CopyNotNilSettingsFromTo(from, to)

    --}}}
    -- DEFAULT TO CLONING CURRENT QUICK SLOT BAR CONTENT -- AND LAYOUT (170818) {{{
    if QSB.CloneCurrentToEmtpyPreset and is_SlotItemTable_empty() then

        -- notify cloning process in chat window
        local currentPreset = QSB.Settings.PresetName
c(COLOR_4.." Preset"  ..COLOR_3.." "..selectedPreset.." "..COLOR_4.."is EMPTY .. CLONING "..COLOR_3.." "..currentPreset..COLOR_4.." (layout and content)")

        from = QSB.Settings.Presets[currentPreset]
        to   = QSB.Settings
        populate_an_empty_SlotItemTable("EMPTY PRESET: CLONING CURRENT QUICK SLOT BAR")

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
    ButtonSizeChanged()

    GameActionButtonHideHandler("SelectPreset")
    --}}}
    -- UPDATE SETTINGS PANEL .. (only if it is showing) {{{
    if not QSB.Panel:IsHidden() then Rebuild_LibAddonMenu() end

    --}}}
end
--}}}
-- SaveCurrentPreset {{{
function SaveCurrentPreset(_caller)
    local log_this = DEBUG_EQUIP

    local currentPreset = QSB.Settings.PresetName
if(log_this) then c("...PRESET __SAVING:".. currentPreset) end

if(log_this) then c(COLOR_4.."SAVING PRESET "..COLOR_M.."["..tostring(currentPreset).."]: ".._caller) end

    -- DEFAULTS SETTINGS
    QSB.Settings.Presets[currentPreset] = DeepCopy(QSB.SettingsDefaults)

    -- SAVE CURRENT QUICK SLOT BAR CONTENT
    if is_SlotItemTable_empty() then populate_an_empty_SlotItemTable("SAVING CURRENT QUICK SLOT BAR") end

    -- SAVE CURRENT PRESET
    if(DEBUG_EQUIP) then
        for bNum = 1, QSB.ButtonCountMax do
            D_EQUIP(QSB.Settings.PresetName.." "..ITEM_3_SAVE
            ,       bNum
            ,       QSB.Settings.SlotItemTable[bNum].itemId
            ,       QSB.Settings.SlotItemTable[bNum].itemType
            ,       QSB.Settings.SlotItemTable[bNum].itemLevel
            ,       QSB.Settings.SlotItemTable[bNum].itemLink)
        end
    end

    local from = QSB.Settings
    local to   = QSB.Settings.Presets[currentPreset]
    CopyNotNilSettingsFromTo(from, to)
    to.PresetName = nil
    to.Presets    = nil

end
--}}}

-- ITEM EQUIP
-- check_QSB_BAG_BACKPACK_UPDATE_bagIndex_to_check {{{
function check_QSB_BAG_BACKPACK_UPDATE_bagIndex_to_check()
    local       log_this = DEBUG_ITEM

    -- IDENTIFY ITEM {{{
    local       bagIndex = QSB_BAG_BACKPACK_UPDATE_bagIndex ; QSB_BAG_BACKPACK_UPDATE_bagIndex  = -1
    local      itemLevel = QSB_BAG_BACKPACK_UPDATE_itemLevel; QSB_BAG_BACKPACK_UPDATE_itemLevel = -1

    -- GET ITEM DETAILS
    local           bNum = slotIndex_to_bNum       ( bagIndex )
    local       itemName = getItem_name_from_slot  ( bagIndex )
    local         itemId = getItem_itID_from_slot  ( bagIndex )
    local       itemLink = getItem_link_from_slot  ( bagIndex )
    local _, _, itemType = ZO_LinkHandler_ParseLink( itemLink )

if(log_this) then D_EQUIP(ITEM_6_UPDATE, bNum, itemId, itemType, itemLevel, itemLink) end
    --}}}

    -- IGNORE EQUIP SIDE-EFFECT EVENTS
    QSB_BAG_BACKPACK_UPDATE_mutex = true

    -- BUTTON FOR THIS ITEM
    for bNum = 1, QSB.ButtonCountMax do
        local  same_itemLink = is_same_item_link(QSB.Settings.SlotItemTable[bNum].itemLink, itemLink)

        -- BUTTON FOUND
        if     same_itemLink then

            -- SAVE ITEM DETAILS
            if(itemLevel ~= -1) then QSB.Settings.SlotItemTable[bNum].itemLevel =  itemLevel end
            if(itemType  ~= "") then QSB.Settings.SlotItemTable[bNum].itemType  =  itemType  end

            -- EQUIP ITEM
            equip_bNum( bNum
            , itemName
            , bagIndex
            , itemId
            , itemType
            , QSB.Settings.SlotItemTable[bNum].itemLevel
            , itemLink
            , QSB.Settings.SlotItemTable[bNum].texture)

            return
        end
    end
end
--}}}
-- loadPresetSlots_checkSlotItemTable {{{
function loadPresetSlots_checkSlotItemTable(log_this)
if(log_this) then c(COLOR_4.."LOADING "..QSB.Settings.PresetName.." SLOTS") end

    if(QSB.Settings.SlotItemTable == nil) then

if(log_this) then c(COLOR_2.." nothing to load|r") end

        return false
    end

    if is_SlotItemTable_empty() then

if(log_this) then c(COLOR_8.." preset is empty|r") end

    end

    return true
end
--}}}
-- loadPresetSlots {{{
function loadPresetSlots()
local log_this = DEBUG_EQUIP or DEBUG_TASK or DEBUG_STATUS or DEBUG_ITEM
    -- SETTINGS CHECK .. (nothing to load when just installed) {{{
    if not loadPresetSlots_checkSlotItemTable(log_this) then return end

    --}}}
    -- MUTEX RAISE .. (to ignore self-induced ACTION_SLOT_UPDATED events) {{{
    QSB_BAG_BACKPACK_UPDATE_mutex = true

    tasks_loaded = {}
    --}}}
    -- CLEAR TASKS .. (empty and changed slots) {{{
    for bNum = 1, QSB.ButtonCountMax do
        -- TASK: [CLEAR EMPTY PRESET SLOT] {{{
        local presetItemName  =          tostring( QSB.Settings.SlotItemTable[bNum].itemName )
        local slotIndex       = bNum_to_slotIndex( bNum                                      )
        local slottedName     =       GetSlotName( slotIndex                                 )
        local emptyPresetSlot = (presetItemName == nil) or (presetItemName == "")
        if(   emptyPresetSlot ) then
            if(slottedName == "") then
if(log_this) then c(COLOR_8.."TASK: SKIP  EMPTY") end

            else
if(log_this) then c(COLOR_8.."TASK: CLEAR UNUSED ["..tostring(slottedName).."]") end

                tasks_loaded[#tasks_loaded + 1]
                = { clear_bNum
                ,   bNum
                ,   "CLEAR  UNUSED"
                ,   log_this }

            end
            --}}}
        -- TASK: [CLEAR CHANGED PRESET SLOT] {{{
        else
            if(not is_same_slotted_item(bNum)) then
if(log_this) then c(COLOR_8.."TASK: CLEAR CHANGED ["..tostring(slottedName).."] ~= ["..tostring(presetItemName).."]") end

                tasks_loaded[#tasks_loaded + 1]
                = { clear_bNum
                ,   bNum
                ,   "CLEAR CHANGED"
                ,   log_this }

            end
        end
        --}}}
    end
    --}}}
    -- EQUIP TASKS .. (equip preset items) {{{
    for bNum = 1, QSB.ButtonCountMax do

        local       presetItemName  = QSB.Settings.SlotItemTable[bNum].itemName
        local       emptyPresetSlot = (presetItemName == nil) or (presetItemName == "")

        if(     not emptyPresetSlot
            and not is_same_slotted_item( bNum )) then

if(log_this) then c(COLOR_9.."TASK: EQUIP ["..tostring(presetItemName).."]") end

            tasks_loaded[#tasks_loaded + 1]
            = { equip_bNum
            ,   bNum
            ,   presetItemName
            ,   QSB.Settings.SlotItemTable[bNum].slotId
            ,   QSB.Settings.SlotItemTable[bNum].itemId
            ,   QSB.Settings.SlotItemTable[bNum].itemType
            ,   QSB.Settings.SlotItemTable[bNum].itemLevel
            ,   QSB.Settings.SlotItemTable[bNum].itemLink
            ,   QSB.Settings.SlotItemTable[bNum].texture
            ,   log_this }

        end
    end
    --}}}
    -- PRESET SELECTED .. (equipment still pending) {{{
    Loaded_QSB_Settings = DeepCopy(QSB.Settings)

    --}}}
    -- TASKS START OR COOLDOWN {{{
    if(#tasks_loaded > 0) then
        if not tasks_cooldown_inprogress then
            if(log_this) then c(COLOR_C.."TASK #"..tostring(#tasks_loaded).." .. NOT ON COOLDOWN") end
            tasks_post(ZO_CALLLATER_DELAY_TASKS)
        else
            if(log_this) then c(COLOR_M.."TASK #"..tostring(#tasks_loaded).." .. ON COOLDOWN .. POSTPONING") end
            tasks_cooldown_begin()
            return
        end

    end
    --}}}
end
--}}}
-- equip_bNum .. Trader08_mod {{{
function equip_bNum(bNum, itemName, slotId, itemId, itemType, itemLevel, itemLink, texture)
local log_this  = DEBUG_EQUIP

if(log_this) then D_EQUIP(ITEM_4_EQUIP, bNum, itemId, itemType, itemLevel, itemLink) end

local slotIndex = bNum_to_slotIndex( bNum )

    -- SYNC ON [itemLink] {{{
    -- (collectibles and quest_items may use itemType and itemId args)
    if(itemLink) then
        local _, _, actualItemType, actualItemId = ZO_LinkHandler_ParseLink( itemLink )

        local          same_type = actualItemType and (actualItemType == itemType)
        local          same_id   = actualItemId   and (actualItemId   == itemId  )
        if(    not     same_type
            or not     same_id   ) then
            itemType = actualItemType   -- switch to currently
            itemId   = actualItemId     -- available item

if(log_this) then D_EQUIP(ITEM_5_EQUIP_CHANGED, bNum, itemId, itemType, itemLevel, itemLink) end
        end
    end
    --}}}
    -- [item] {{{
    if( itemType == "item" and itemLink) then

        -- ITEM COUNT AND SLOT {{{
        local bagIndex   = getItem_slot_from_link(itemLink)
        local _,   count = GetItemInfo(BAG_BACKPACK, bagIndex)
        if(        count > 0 and IsValidItemForSlot(BAG_BACKPACK, bagIndex, slotIndex)) then
            CallSecureProtected("SelectSlotItem"   ,BAG_BACKPACK, bagIndex, slotIndex)

            --}}}
        -- ITEM COUNT=0 WARNING {{{
        elseif(count == 0 or bagIndex == -1) then
            -- Trader08 (190925) {{{
            -- count will always be 0 if we have a bug finding the item
            -- ... or if they actually ran out of this item
            -- I encountered a situation where the slot/save data didn't get cleared
            --}}}

            if(not QSB.Settings.LockThisPreset) then
                    clear_bNum(bNum, "Inventory count 0", log_this)
                    QSB.Settings.SlotItemTable[bNum].itemName  = nil
                    QSB.Settings.SlotItemTable[bNum].itemLevel = nil
                    QSB.Settings.SlotItemTable[bNum].slotId    = nil
                    QSB.Settings.SlotItemTable[bNum].texture   = nil
                    QSB.Settings.SlotItemTable[bNum].itemLink  = nil
            end

            -- ZO ALERT
            local warnMsg
            =      QSB.Settings.LockThisPreset
            and     "can't quickslot"
            or      "it won't be in this quickslot preset ["..QSB.Settings.PresetName.."] anymore"

            ZO_Alert(UI_ALERT_CATEGORY_ERROR
            , QSB.Settings.SoundAlert
            , "You're out of '"..itemName.."' in your inventory, "..warnMsg
            )

            -- CHAT ALERT
            c(                      COLOR_2..QSB.Name..":\r\n"
            ..COLOR_3.."You're out of|r "..tostring(itemLink)
            ..COLOR_3.." in your inventory,|r "
            ..COLOR_4.. warnMsg
            )

        --}}}
        -- ITEM_2_EQUIP_ERROR_SLOT {{{
        else
D_EQUIP(ITEM_2_EQUIP_ERROR_SLOT, bNum, itemId, itemType, itemLevel, itemLink)

            -- CHAT ALERT
            c(                      COLOR_2..QSB.Name..":\r\n"
            .."→. [slotId   ".. tostring( slotId   ) .."]\r\n"
            .."→. [bagIndex ".. tostring( bagIndex ) .."]\r\n"
            .."→. [itemName ".. tostring( itemName ) .."]\r\n")
        end
        --}}}
    --}}}
    -- [collectible] {{{
    elseif(itemType == "collectible" and IsValidCollectibleForSlot(itemId, slotIndex)) then
        CallSecureProtected("SelectSlotSimpleAction", ACTION_TYPE_COLLECTIBLE, itemId, slotIndex)

    --}}}
    -- [quest_item] {{{
    elseif(itemType == "quest_item" and IsValidQuestItemForSlot(itemId, slotIndex)) then
        CallSecureProtected("SelectSlotSimpleAction", ACTION_TYPE_QUEST_ITEM , itemId, slotIndex)

    --}}}
    -- [itemType Unknown] .. (saved item is not available anymore) {{{
    elseif(not itemLink) then
D_EQUIP(ITEM_2_EQUIP_ERROR_ITEMLINK, bNum, itemId, itemType, itemLevel, itemLink)
    else
D_EQUIP(ITEM_2_EQUIP_ERROR_TYPE, bNum, itemId, itemType, itemLevel, itemLink)
    end
    --}}}
end
--}}}
-- clear_bNum {{{
function clear_bNum(bNum, reason, log_this)

    local slotIndex    = bNum_to_slotIndex( bNum      )
    local slottedName  = GetSlotName      ( slotIndex )
    if(   slottedName ~= "") then
if(log_this) then c("_CLEARING ["..COLOR_6..bNum.."|r] ["..COLOR_8..reason.."|r] ["..COLOR_6..tostring( slottedName).."|r]") end

    else
if(log_this) then c("_CLEARING ["..COLOR_6..bNum.."|r] ["..COLOR_8..reason.."|r] ["..COLOR_8.."no slottedName]") end

    end
    CallSecureProtected("ClearSlot", slotIndex)
end
--}}}
-- is_same_slotted_item {{{
function is_same_slotted_item( bNum )

        local  save_itemlLink = QSB.Settings.SlotItemTable       [ bNum ].itemLink

        local  slot_itemLink  = GetSlotItemLink(bNum_to_slotIndex( bNum ))

        return is_same_item_link(save_itemlLink, slot_itemLink)
end
--}}}
-- ITEM TASK
-- tasks_cooldown_begin {{{
function tasks_cooldown_begin()
    -- NO STACKING COOLDOWN {{{
    if tasks_cooldown_inprogress then
if(DEBUG_TASK) then c(COLOR_8.."TASK .. COOLDOWN ALREADY IN PROGRESS") end

        return
    end
    --}}}
if(DEBUG_TASK) then c(COLOR_7.."TASK .. COOLDOWN BEGIN") end
    tasks_cooldown_inprogress = true

    zo_callLater(tasks_cooldown_end, ZO_COOL_DOWN_DELAY_TASKS)
end
--}}}
-- tasks_cooldown_end {{{
function tasks_cooldown_end()
    tasks_cooldown_inprogress = false

    if(#tasks_loaded > 0) then
if(DEBUG_TASK) then c(COLOR_7.."TASK .. COOLDOWN END .. "..COLOR_4.."POSTING "..#tasks_loaded.." LOADED TASKS") end

        tasks_post(ZO_CALLLATER_DELAY_TASKS)
    else
if(DEBUG_TASK) then c(COLOR_7.."TASK .. COOLDOWN END .. "..COLOR_8.."NO MORE LOADED TASKS") end

        Refresh("TASKS COOLDOWN END")
    end

end
--}}}
-- tasks_post {{{
function tasks_post(delay)
if(DEBUG_TASK) then c(COLOR_C.."TASK #"..tostring(#tasks_loaded).." .. POST DELAY("..tostring(delay)..") .. "..#tasks_loaded.." LOADED TASKS") end
    tasks_cooldown_begin()

    tasks_posted = DeepCopy(tasks_loaded)
    tasks_loaded = {}
    zo_callLater(tasks_handler, delay)
end
--}}}
-- tasks_handler {{{
function tasks_handler()
    -- fetch next task {{{
    if(#tasks_posted == 0) then
if(DEBUG_TASK) then c(COLOR_8.."TASK .. NO PENDING TASK") end
        return
    end

    local  tasks_entry = table.remove(tasks_posted, 1)
    if not tasks_entry then return end

    local  clear_or_equip, bNum, itemName_or_reason, slotId, itemId, itemType, itemLink, itemLevel, texture, log_this = unpack(tasks_entry)
    --}}}
-- DEBUG_TASK {{{
if(DEBUG_TASK) then
    if    (clear_or_equip == clear_bNum) then

        c(     COLOR_6.."TASK .. CLEAR b"..COLOR_8..tostring( bNum               )
        .." "..COLOR_6..                            tostring( itemName_or_reason )
        )

    elseif(clear_or_equip == equip_bNum) then

        c(     COLOR_4.."TASK .. EQUIP b"..COLOR_7..tostring( bNum               )
        .." "..COLOR_4..                            tostring( itemName_or_reason )
        .." "..COLOR_8.."slotId="..                 tostring( slotId             )
        .." "..COLOR_8.."itemId="..                 tostring( itemId             )
        .." "..COLOR_8.."itemType="..               tostring( itemType           )
        .." "..COLOR_8.."itemLink="..               tostring( itemLink           )
        ..")"
        )

    else

        c(COLOR_2.."TASKS:")
        c(".....clear_or_equip=["..tostring(clear_or_equip    ).."]")
        c("...............bNum=["..tostring(bNum              ).."]")
        c(".itemName_or_reason=["..tostring(itemName_or_reason).."]")
        c(".............slotId=["..tostring(slotId            ).."]")
        c(".............itemId=["..tostring(itemId            ).."]")
        c("...........itemType=["..tostring(itemType          ).."]")
        c("...........itemLink=["..tostring(itemLink          ).."]")
    end
end
--}}}
    -- execute fetched task {{{
    clear_or_equip( bNum
    ,               itemName_or_reason
    ,               slotId
    ,               itemId
    ,               itemType
    ,               itemLink
    ,               itemLevel
    ,               texture
    ,               log_this )

    --}}}
    -- 1/2 post next task {{{
    if     (#tasks_posted > 0) then
        local delay = ZO_CALLLATER_DELAY_TASKS + (ZO_CALLLATER_DELAY_TASKS/2 * #tasks_posted)
        if(clear_or_equip == clear_bNum) then delay = 0 end

        zo_callLater(tasks_handler, delay)
    --}}}
    -- 2/2 all done and up to date {{{
    elseif(#tasks_loaded == 0) then
if(DEBUG_TASK) then c(COLOR_3.."TASK .. REQUESTED ALL DONE") end

        zo_callLater(QSB_SetCurrentQuickslot_handler, 500)

        tasks_cooldown_begin()

        QSB_BAG_BACKPACK_UPDATE_mutex = false
    end
    --}}}
end
--}}}
-- ITEM STORE
-- is_SlotItemTable_empty {{{
function is_SlotItemTable_empty()

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
end
--}}}
-- populate_an_empty_SlotItemTable {{{
function populate_an_empty_SlotItemTable(msg)
D_ITEM(COLOR_6.."populate_an_empty_SlotItemTable:\n"..COLOR_8..msg.."|r")

    for bNum = 1, QSB.ButtonCountMax do
        save_QSB_to_SlotItemTable(bNum)
    end

end
--}}}
-- handle_ACTION_SLOT_UPDATED {{{
function handle_ACTION_SLOT_UPDATED(bNum)
D_ITEM(COLOR_3.."handle_ACTION_SLOT_UPDATED(bNum="..bNum.."):|r")

    save_QSB_to_SlotItemTable(bNum)
end
--}}}
-- save_QSB_to_SlotItemTable {{{
function save_QSB_to_SlotItemTable(bNum)
local log_this = DEBUG_ITEM or DEBUG_EQUIP
if(log_this) then c("save_QSB_to_SlotItemTable("..bNum.."):") end

    local slotIndex = bNum_to_slotIndex( bNum      )
    local itemName  = GetSlotName      ( slotIndex )
    local texture   = GetSlotTexture   ( slotIndex )
    local itemLink  = GetSlotItemLink  ( slotIndex )

    local itemSlot  = -1
    if   (itemName ~= nil) and (itemName ~= "") then itemSlot =   getItem_slot_from_name( itemName ) end
    if   (itemSlot == -1                      ) then itemSlot = GetCollectibleIdFromLink( itemLink ) end
    local itemLevel = getItem_levl_from_slot(itemSlot)

    local _, _, itemType, itemId = ZO_LinkHandler_ParseLink( itemLink )

    -- QUEST ITEM .. (Trader08 TRICK 190903)
    -- quest_item itemType {{{

    if(     (itemSlot == -1 or itemSlot == nil)
        and (itemType == "quest_item")         ) then

        -- mocking collectible's way
        -- for quest_item not to be handled as empty
        -- quest_item itemType AND itemName confirmed .. no other details
        -- eventually, an itemSlot should be an index pointing to a container slot
        -- :!start explorer "https://esoapi.uesp.net/100029/data/z/o/_/ZO_LinkHandler_ParseLink.html"

        itemSlot = GetQuestItemNameFromLink( itemLink )
        if(itemSlot and CanQuickslotQuestItemById(itemId)) then
            itemSlot = itemId
        end

    end
    --}}}

    -- SINGLE-POINT-INITIALIZATION
    QSB.Settings.SlotItemTable[bNum].itemName  = itemName
    QSB.Settings.SlotItemTable[bNum].itemLevel = itemLevel
    QSB.Settings.SlotItemTable[bNum].slotId    = itemSlot
    QSB.Settings.SlotItemTable[bNum].itemId    = itemId
    QSB.Settings.SlotItemTable[bNum].itemType  = itemType
    QSB.Settings.SlotItemTable[bNum].itemLink  = itemLink
    QSB.Settings.SlotItemTable[bNum].texture   = texture
    -- SINGLE-POINT-INITIALIZATION
end
--}}}


-- ITEM GET
-- getItem_tooltip {{{
function getItem_tooltip(bNum)
    -- itemName {{{
    local itemName  = QSB.Settings.SlotItemTable[bNum].itemName
    if(   itemName == "") then itemName = nil end

    --}}}
    -- slotIndex {{{
    local   slotIndex = bNum_to_slotIndex( bNum )

    --}}}
    -- count {{{
    local       count = GetSlotItemCount( slotIndex ) or 0

    --}}}
    -- itemLink {{{
    local label = "-"
    local itemLink = GetSlotItemLink( slotIndex )
    if(   itemLink and (itemLink ~= "")) then -- 191125 .. ignore empty itemLink
        label = itemLink
    end
    --}}}
    -- collId {{{
    local collId = GetCollectibleIdFromLink( itemLink )

    --}}}
    -- color {{{
    local               color
    if    (count ) then color = COLOR_3 -- RED   .. ITEMS
    elseif(collId) then color = COLOR_9 -- WHITE .. COLLECTIBLE
    else                color = COLOR_8 -- GRAY  .. DEFAULT
    end

    --}}}
    -- label {{{
    if(itemName ~= nil) then
        -- [description] {{{
        if(collId) then
            local description = tostring( GetCollectibleDescription( collId ) )

            if(   description) then
                label = label .."\n"..COLOR_7..description
            end
        else
            local description = tostring( GetItemLinkFlavorText( itemLink ) )

            if(   description ) then
                label = label .."\n"..COLOR_3..description
            end
        end
        --}}}
        --   [itemLevel] {{{
        local itemLevel = QSB.Settings.SlotItemTable[bNum].itemLevel
        if(   itemLevel) then
            label = label ..COLOR_5.." Level ".. tostring( itemLevel )

        end
        --}}}
    end
    --}}}
    -- [tt] {{{
    local  tt = color  .. label .."|r"

    --}}}
    -- QSB .. f(DEBUG_TOOLTIP) {{{
    if(DEBUG_TOOLTIP) then

        tt = tt
        .."\n"
        .."QSB"..COLOR_9..".Settings"  .."  ["..           QSB.Settings.PresetName.."]  ["..bNum       .."]|r\n"
        .."QSB"..COLOR_9..".itemLink"  .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].itemLink  ).. "|r\n"
        .."QSB"..COLOR_2..".itemId"    .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].itemId    ).. "|r\n"
        .."QSB"..COLOR_3..".itemType"  .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].itemType  ).. "|r\n"
        .."QSB"..COLOR_4..".itemName"  .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].itemName  ).. "|r\n"
        .."QSB"..COLOR_5..".slotId"    .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].slotId    ).. "|r\n"
        .."QSB"..COLOR_6..".itemLevel" .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].itemLevel ).. "|r\n"
        .."QSB"..COLOR_8..".texture"   .."|r ".. tostring( QSB.Settings.SlotItemTable[bNum].texture   ).. "|r\n"

    end
    --}}}
    -- ITEM COLLECTIBLE QUEST_ITEM .. f(DEBUG_TOOLTIP) {{{
    if(DEBUG_TOOLTIP and itemName) then
        -- LINK NAME SLOT .. f(slotIndex itemLink itemType itemId) {{{
-- :!start explorer "https://esoapi.uesp.net/100029/data/z/o/_/ZO_LinkHandler_ParseLink.html"

        local _, _, itemType, itemId = ZO_LinkHandler_ParseLink( itemLink  )
        local name_from_slotIndex    = GetSlotName             ( slotIndex )
        local slot_from_name         = getItem_slot_from_name  ( itemName  )
        local slot_from_Link         = getItem_slot_from_link  ( itemLink  )

        local lnk =                         itemLink ; lnk = lnk:gsub("[:|]",".")
        local nnk = getItem_normalized_link(itemLink); nnk = nnk:gsub("[:|]",".")

        tt = tt
        ..    "\n"
        --    "\n"..COLOR_8.."--[bNum == slotIndex]--["..tostring(bNum).." == "..tostring(slotIndex).."]--|r"
        ..    "\n"..COLOR_8.."----- [bNum "..bNum.."] == [slotIndex "  ..slotIndex.."] ----- LINK |r"
        ..    "\n- itemType"                                        ..COLOR_3..  " "..tostring( itemType            ).. "|r"
        ..    "\n- itemId"                                          ..COLOR_2..  " "..tostring( itemId              ).. "|r"
        ..    "\n- itemLink"                                        ..COLOR_4..":\n"..          lnk                  .. "|r"
        ..    "\n- itemLink (normalized)"                           ..COLOR_5..":\n"..          nnk                  .. "|r"
        ..    "\n"..COLOR_8.."----------------------------------------- NAME"
        ..    "\n- GetSlotName("..         COLOR_9.."slotIndex|r)"  ..COLOR_4..":\n"..tostring( name_from_slotIndex ).. "|r"
        ..    "\n"..COLOR_8.."------------------------------------------- SLOT"
        ..    "\n- getItem_slot_from_name"                          ..COLOR_5.. " ["..tostring( slot_from_name      ).."]|r"
        ..    "\n- getItem_slot_from_link("..COLOR_2.. "itemLink|r)"..COLOR_5.. " ["..tostring( slot_from_Link    ).."]|r"

        --}}}
        -- ITEM ......... f(bagIndex) {{{
        local bagIndex  = getItem_slot_from_name( GetSlotName(slotIndex) )
        if(   bagIndex ~= -1) then
            local s = COLOR_5.."bagIndex "..bagIndex

            tt = tt
            .."\n"
            .."\n"..COLOR_3.."---------------------- ITEM -----------------------"
            .."\n- getItem_itID_from_slot("   ..s..")"              ..COLOR_2.. " ["..tostring(  getItem_itID_from_slot( bagIndex  )).."]|r"
            .."\n- GetItemId("                ..s..")"              ..COLOR_2.. " ["..tostring(  GetItemId(BAG_BACKPACK, bagIndex  )).."]|r"
            .."\n- GetItemName("              ..s..")"              ..COLOR_4..":\n"..tostring(GetItemName(BAG_BACKPACK, bagIndex  )).. "|r"
            .."\n- getItem_link_from_slot("   ..s..")"              ..COLOR_9..":\n"..tostring(  getItem_link_from_slot( bagIndex  )).. "|r"
            .."\n- getItem_name_from_slot("   ..s..")"              ..COLOR_4..":\n"..tostring(  getItem_name_from_slot( bagIndex  )).. "|r"
            .."\n"

        end
        --}}}
        -- COLLECTIBLE .. f(itemLink) {{{
        local collectibleIdFromLink  = GetCollectibleIdFromLink( itemLink  )
        if(   collectibleIdFromLink ) then
            local i = COLOR_7.."itemLink "..itemLink

            tt = tt
            .."\n"
            .."\n"..COLOR_6.."----------------- COLLECTIBLE -----------------"
            .."\n- GetCollectibleIdFromLink(" ..i..")"              ..COLOR_2.. " ["..         collectibleIdFromLink                 .."]|r"

        end
        --}}}
        -- QUEST_ITEM ... f(itemLink) {{{
        local questItemNameFromLink = GetQuestItemNameFromLink( itemLink  )
        if(   questItemNameFromLink ) then
            local i = COLOR_7.."itemLink "..itemLink

            tt = tt
            .."\n"
            .."\n"..COLOR_6.."----------------- QUEST_ITEM  -----------------"
            .."\n- GetQuestItemNameFromLink(" ..i..")"              ..COLOR_4..":\n"..tostring(questItemNameFromLink)                .. "|r"
        end
        --}}}
    end
    --}}}
    return tt
end
--}}}
-- getItem_slot_from_link {{{
function getItem_slot_from_link(itemLink)
local log_this = DEBUG_ITEM

    if(not itemLink) then return -1 end

    itemLink = getItem_normalized_link( itemLink )
if(log_this) then c("getItem_slot_from_link("..COLOR_1..tostring(itemLink).."|r)") end

    for _, data in pairs(SHARED_INVENTORY.bagCache[BAG_BACKPACK]) do
        if data ~= nil then
                if(is_same_item_link(itemLink, GetItemLink(BAG_BACKPACK, data.slotIndex))) then
                    return data.slotIndex
                end
        end
    end

if(log_this) then c(COLOR_8.."ITEM NOT FOUND: return [-1]") end
    return -1
end
--}}}
-- getItem_slot_from_name {{{
function getItem_slot_from_name(itemName)
local log_this = DEBUG_ITEM

    itemName = tostring( itemName )

if(log_this) then c("getItem_slot_from_name("..BAG_BACKPACK..","..itemName..")") end

    for _, data in pairs(SHARED_INVENTORY.bagCache[BAG_BACKPACK]) do
        if data ~= nil then
            local bagItemName  = GetItemName(BAG_BACKPACK, data.slotIndex)
            if(   bagItemName == itemName) then

if(log_this) then c(COLOR_3.."...return [data.slotIndex "..tostring(data.slotIndex).."]") end
                  return data.slotIndex
            end
        end
    end

if(log_this) then c(COLOR_8.."...return [-1]") end
    return -1
end
--}}}
-- getItem_name_from_slot {{{
function getItem_name_from_slot(bagIndex)
    local itemName = nil
    local data     = SHARED_INVENTORY.bagCache[BAG_BACKPACK][bagIndex]
    if(   data    ~= nil) then
        itemName   = GetItemName(BAG_BACKPACK, data.slotIndex)
    end

D_ITEM("getItem_name_from_slot("..tostring(bagIndex).."): return ["..tostring(itemName).."]")
    return itemName -- IVAN (190828) IL Y AVAIT UNE ERREUR DANS LA VERSION PRECEDENTE (return nil)
end

--}}}
-- getItem_itID_from_slot {{{
function getItem_itID_from_slot(bagIndex)
    local itemId   = nil
    local    data  = SHARED_INVENTORY.bagCache[BAG_BACKPACK][bagIndex]
    if(      data ~= nil) then
        itemId     = GetItemId(BAG_BACKPACK, data.slotIndex)
    end

D_ITEM("getItem_itID_from_slot("..tostring(bagIndex).."): return ["..tostring(itemId).."]")
    return itemId -- IVAN (190828) IL Y AVAIT UNE ERREUR DANS LA VERSION PRECEDENTE (return nil)
end
--}}}
-- getItem_link_from_slot {{{
function getItem_link_from_slot(bagIndex)
    local itemLink = ""
    local    data  = SHARED_INVENTORY.bagCache[BAG_BACKPACK][bagIndex]
    if(      data ~= nil) then
        itemLink   = GetItemLink(BAG_BACKPACK, data.slotIndex)
    end

D_ITEM("getItem_link_from_slot("..tostring(bagIndex).."): return ["..tostring(itemLink).."]")
    return itemLink
end
--}}}
-- getItem_levl_from_slot {{{
function getItem_levl_from_slot(bagIndex)

    local  data  = SHARED_INVENTORY.bagCache[BAG_BACKPACK][bagIndex]
    if(    data == nil) then return 0 end

    local itemLevel = data.requiredLevel
    if(   itemLevel == nil or itemLevel == -1) then itemLevel = 0 end

    return itemLevel
end

--}}}
-- getItem_normalized_link {{{
function getItem_normalized_link( itemLink )

    itemLink = tostring( itemLink );

    if(not itemLink             ) then return "" end
    if(string.len(itemLink) < 10) then return "" end

    local t = string_split(itemLink,":")

    -- COLL |H0:item:54339:308:50:8454917
    -- _____1__:2___:3____:4__:5_ 6______

    -- ITEM |H0:item:54339:308:50:0:0:0:0:0:0:0:0:0:0:0:0:36:0:0:0:0:8454917
    -- _____|1__:2__:3____:4__:5_:.:.:.:.:.:.:.:.:.:.:.:.:..:.:.:.:.:23_____

    if(  #t < 7) then
        return itemLink     -- normalized already

    else
        local  type         = t[ 2]
        local  id           = t[ 3]
        local  level        = t[ 5]
        local  potion_buffs = t[23]

        return  t[1]
        ..":".. type
        ..":".. id
        ..":".. t[4]
        ..":".. level
        ..":".. potion_buffs

    end
end
--}}}
-- is_same_item_link {{{
function is_same_item_link(l1, l2)
local log_this = DEBUG_ITEM

    if(not l1 or not l2) then return false end

    local result = getItem_normalized_link( l1 ) == getItem_normalized_link( l2 )

if(log_this) then c("l1=["..l1.."] == l2=["..l2.."] .. return "..tostring(result)) end

    return result
end
--}}}

-- COPY
-- DeepCopy {{{
function DeepCopy(orig)
D("DeepCopy()")
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
end
--}}}
-- CopyFromTo {{{
function CopyFromTo(orig, dest)
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
end
--}}}
-- CopyNotNilSettingsFromTo {{{
function CopyNotNilSettingsFromTo(orig, dest)
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
    if( orig.LockThisPreset                           ~= nil) then dest.LockThisPreset                           = orig.LockThisPreset                           end
    if( orig.DelayPresetSwapWhileInCombat             ~= nil) then dest.DelayPresetSwapWhileInCombat             = orig.DelayPresetSwapWhileInCombat             end
    if( orig.NextPrevWrap                             ~= nil) then dest.NextPrevWrap                             = orig.NextPrevWrap                             end
    if( orig.NextAuto                                 ~= nil) then dest.NextAuto                                 = orig.NextAuto                                 end
    if( orig.ShowBackground                           ~= nil) then dest.ShowBackground                           = orig.ShowBackground                           end
    if( orig.SwapBackgroundColors                     ~= nil) then dest.SwapBackgroundColors                     = orig.SwapBackgroundColors                     end
    if( orig.Visibility                               ~= nil) then dest.Visibility                               = orig.Visibility                               end
    if( orig.SoundSlotted                             ~= nil) then dest.SoundSlotted                             = orig.SoundSlotted                             end
    if( orig.SoundAlert                               ~= nil) then dest.SoundAlert                               = orig.SoundAlert                               end
    if( orig.SlotItemTable                            ~= nil) then dest.SlotItemTable                            = DeepCopy(orig.SlotItemTable)                  end
    if( orig.CurrentSlotIndex                         ~= nil) then dest.CurrentSlotIndex                         = DeepCopy(orig.CurrentSlotIndex)               end

    if( orig.SlotItem.KeyBindAlignH                   ~= nil) then dest.SlotItem.KeyBindAlignH                   = orig.SlotItem.KeyBindAlignH                   end
    if( orig.SlotItem.KeyBindAlignV                   ~= nil) then dest.SlotItem.KeyBindAlignV                   = orig.SlotItem.KeyBindAlignV                   end
    if( orig.SlotItem.ButtonBackgroundOpacity         ~= nil) then dest.SlotItem.ButtonBackgroundOpacity         = orig.SlotItem.ButtonBackgroundOpacity         end
    if( orig.SlotItem.NotSelectedButtonOpacity        ~= nil) then dest.SlotItem.NotSelectedButtonOpacity        = orig.SlotItem.NotSelectedButtonOpacity        end
    if( orig.SlotItem.OverlayButtonOpacity            ~= nil) then dest.SlotItem.OverlayButtonOpacity            = orig.SlotItem.OverlayButtonOpacity            end
    if( orig.SlotItem.QuantityAlert                   ~= nil) then dest.SlotItem.QuantityAlert                   = orig.SlotItem.QuantityAlert                   end
    if( orig.SlotItem.QuantityLabelPositionHorizontal ~= nil) then dest.SlotItem.QuantityLabelPositionHorizontal = orig.SlotItem.QuantityLabelPositionHorizontal end
    if( orig.SlotItem.QuantityLabelPositionVertical   ~= nil) then dest.SlotItem.QuantityLabelPositionVertical   = orig.SlotItem.QuantityLabelPositionVertical   end
    if( orig.SlotItem.QuantityWarning                 ~= nil) then dest.SlotItem.QuantityWarning                 = orig.SlotItem.QuantityWarning                 end
    if( orig.SlotItem.HideSlotBackground              ~= nil) then dest.SlotItem.HideSlotBackground              = orig.SlotItem.HideSlotBackground              end
    if( orig.SlotItem.ShowKeyBindings                 ~= nil) then dest.SlotItem.ShowKeyBindings                 = orig.SlotItem.ShowKeyBindings                 end
    if( orig.SlotItem.ShowNumbers                     ~= nil) then dest.SlotItem.ShowNumbers                     = orig.SlotItem.ShowNumbers                     end
    if( orig.SlotItem.LinkToChatOnClick               ~= nil) then dest.SlotItem.LinkToChatOnClick               = orig.SlotItem.LinkToChatOnClick                end
    if( orig.SlotItem.ShowQuantityLabels              ~= nil) then dest.SlotItem.ShowQuantityLabels              = orig.SlotItem.ShowQuantityLabels              end
    if( orig.SlotItem.VisualCue                       ~= nil) then dest.SlotItem.VisualCue                       = orig.SlotItem.VisualCue                       end

end
--}}}
-- CopySettingsDefaultsTo {{{
function CopySettingsDefaultsTo(dest)
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
    dest.LockThisPreset                           = QSB.SettingsDefaults.LockThisPreset
    dest.DelayPresetSwapWhileInCombat             = QSB.SettingsDefaults.DelayPresetSwapWhileInCombat
    dest.NextPrevWrap                             = QSB.SettingsDefaults.NextPrevWrap
    dest.NextAuto                                 = QSB.SettingsDefaults.NextAuto
    dest.ShowBackground                           = QSB.SettingsDefaults.ShowBackground
    dest.SwapBackgroundColors                     = QSB.SettingsDefaults.SwapBackgroundColors
    dest.Visibility                               = QSB.SettingsDefaults.Visibility
    dest.SoundSlotted                             = QSB.SettingsDefaults.SoundSlotted
    dest.SoundAlert                               = QSB.SettingsDefaults.SoundAlert
    dest.SlotItemTable                            = DeepCopy(QSB.SettingsDefaults.SlotItemTable)
    dest.CurrentSlotIndex                         = QSB.SettingsDefaults.CurrentSlotIndex

    dest.SlotItem.KeyBindAlignH                   = QSB.SettingsDefaults.SlotItem.KeyBindAlignH
    dest.SlotItem.KeyBindAlignV                   = QSB.SettingsDefaults.SlotItem.KeyBindAlignV
    dest.SlotItem.ButtonBackgroundOpacity         = QSB.SettingsDefaults.SlotItem.ButtonBackgroundOpacity
    dest.SlotItem.NotSelectedButtonOpacity        = QSB.SettingsDefaults.SlotItem.NotSelectedButtonOpacity
    dest.SlotItem.OverlayButtonOpacity            = QSB.SettingsDefaults.SlotItem.OverlayButtonOpacity
    dest.SlotItem.QuantityAlert                   = QSB.SettingsDefaults.SlotItem.QuantityAlert
    dest.SlotItem.QuantityLabelPositionHorizontal = QSB.SettingsDefaults.SlotItem.QuantityLabelPositionHorizontal
    dest.SlotItem.QuantityLabelPositionVertical   = QSB.SettingsDefaults.SlotItem.QuantityLabelPositionVertical
    dest.SlotItem.QuantityWarning                 = QSB.SettingsDefaults.SlotItem.QuantityWarning
    dest.SlotItem.HideSlotBackground              = QSB.SettingsDefaults.SlotItem.HideSlotBackground
    dest.SlotItem.ShowKeyBindings                 = QSB.SettingsDefaults.SlotItem.ShowKeyBindings
    dest.SlotItem.ShowNumbers                     = QSB.SettingsDefaults.SlotItem.ShowNumbers
    dest.SlotItem.LinkToChatOnClick               = QSB.SettingsDefaults.SlotItem.LinkToChatOnClick
    dest.SlotItem.ShowQuantityLabels              = QSB.SettingsDefaults.SlotItem.ShowQuantityLabels
    dest.SlotItem.VisualCue                       = QSB.SettingsDefaults.SlotItem.VisualCue

end
--}}}

-- UI REFRESH
-- Refresh {{{
local Refresh_count_down  = 0
local Refresh_last_caller = ""

function Refresh(_caller, delay)
if(DEBUG_ITEM or DEBUG_EVENT) then c(COLOR_4.."Refresh "..tostring(_caller)) end

    if(not delay) then delay = ZO_CALLLATER_DELAY_REFRESH end

    if not QSB.Settings               then return end
    if     QSB.Moving or QSB.Resizing then return end

    -- first call will be handled very quick
    local delay
    = (Refresh_count_down == 0) and delay
    or                              ZO_CALLLATER_DELAY_REFRESH * 5 * Refresh_count_down

    -- following calls will queued .. until no more incoming .. (but not forever)
    delay = math.min(delay,         ZO_CALLLATER_DELAY_REFRESH_MAX)

    Refresh_count_down  = Refresh_count_down + 1

    Refresh_last_caller = tostring(_caller)

    zo_callLater(Refresh_handler, delay)

end
--}}}
-- Refresh_handler {{{
function Refresh_handler()
-- Refresh_count_down {{{
    local log_this = DEBUG_TASK

if(log_this) then c("...Refresh_handler() .. ".. tostring(Refresh_count_down)) end

    -- (191001) -- error Anceane
    if not GreymindQuickSlotBarUI then return end
    if not GreymindQuickSlotBarUI.SetClampedToScreen then return end

    -- look for the last call .. ignore preceding ones
    Refresh_count_down = Refresh_count_down -1
    if( Refresh_count_down > 0) then return end

if(log_this) then c("...Refresh_handler() .. "..tostring(Refresh_last_caller)) end

    GameActionButtonHideHandler("Refresh_handler") -- (190819) (160218)

    if(QSB_BAG_BACKPACK_UPDATE_bagIndex >= 0) then
        check_QSB_BAG_BACKPACK_UPDATE_bagIndex_to_check()
    end

    QSB_BAG_BACKPACK_UPDATE_mutex = false
    --}}}
    -- STATES .. [PRESET TASK MENU] {{{

    local tasks_pending     = (#tasks_loaded > 0) or (#tasks_posted > 0)

    local preset_delayed    =  QSB.Settings.DelayPresetSwapWhileInCombat
    local preset_pending    = (Get_preset_pending_IN_COMBAT() ~= "")
    local preset_locked     =  QSB.Settings.LockThisPreset

    local inventory_showing = not ZO_PlayerInventory:IsHidden()
    local quickslot_showing = not ZO_QuickSlot:IsHidden()

    --}}}
    -- BACKGROUND COLORS .. f(STATES) {{{
    local                                           background_color = nil

    local r = 0
    local g = 0
    local b = 0

    if preset_locked  and inventory_showing then r = 1; end -- showing that slotted items wont be saved
    if preset_locked  and quickslot_showing then r = 1; end -- showing that slotted items wont be saved
    if preset_pending and preset_delayed    then g = 1; end -- showing that an combat preset request is pending

    if((r ~= 0) or (g ~= 0) or (b ~= 0)) then
        background_color = { R=r , G=g , B=b , A=1 }
    end
if(log_this) then c("background_color=[ R="..r.." G="..g.." B="..b.." ]") end
    --}}}
    -- GEOMETRY --{{{
    GreymindQuickSlotBarUI:SetClampedToScreen(true)

    if(QSB.Buttons[1] == nil) then
        ButtonSizeChanged()
        BuildUIHandles()
    end

    if( QSB.Settings.MainWindow.X == 0) and (QSB.Settings.MainWindow.Y == 0) then
        QSB.Settings.MainWindow.X = math.floor(GuiRoot:GetWidth()    /   2)
        QSB.Settings.MainWindow.Y = math.floor(GuiRoot:GetHeight()   - 160)

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
    -- LOCK UI --{{{
    if QSB.Settings.LockUI then
        GreymindQuickSlotBarUI:SetMovable(false)
        GreymindQuickSlotBarUI:SetResizeHandleSize(0)
    else
        GreymindQuickSlotBarUI:SetMovable(true)
        GreymindQuickSlotBarUI:SetResizeHandleSize(16) --(QSB.ButtonPadding / 2)
    end

    GreymindQuickSlotBarUI:SetMouseEnabled   (true)
    GreymindQuickSlotBarUI:SetHandler("OnMoveStart"  , OnMoveStart  )
    GreymindQuickSlotBarUI:SetHandler("OnMoveStop"   , OnMoveStop   )

    GreymindQuickSlotBarUI:SetHandler("OnResizeStart", OnResizeStart)
    GreymindQuickSlotBarUI:SetHandler("OnResizeStop" , OnResizeStop )

    GreymindQuickSlotBarUI:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
    GreymindQuickSlotBarUI:SetHandler("OnMouseExit" , ZO_Options_OnMouseExit)

    --}}}
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

    -- PENDING TASKS
    if tasks_pending then
        GreymindQuickSlotBarUI.data = {tooltipText = COOLDOWN_TT}

    -- NOT LOCKED
    elseif not QSB.Settings.LockUI then
        GreymindQuickSlotBarUI.data = {tooltipText = UNLOCKED_TT}

    -- IDLE - VERSION .. ACCOUNT/PLAYER
    else
        GreymindQuickSlotBarUI.data = {
            tooltipText
            =  QSB.Name.." "..QSB.Version.." Markarth\n"
            ..(QSB.AccountWideSettings.SaveAccountWide and COLOR_3.."Account-wide Settings"
            or                                             COLOR_6..GetUnitName("player").."|r Character Settings"
            )
        }

    end
    --}}}

    ----- button_font = "EsoUI/Common/Fonts/esocartographer-bold.otf".."|"..tostring(QSB.Settings.ButtonFontSize).."|".."outline"
    local button_font = "EsoUI/Common/Fonts/univers57.otf"           .."|"..tostring(QSB.Settings.ButtonFontSize).."|".."soft-shadow-thin"

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
            button:SetHandler("OnMouseEnter",            OnMouseEnter)
            button:SetHandler("OnMouseExit" ,            OnMouseExit )

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
            D(COLOR_7.."-GQSB: [slotItemCount=nil] for [slotIndex="..tostring(slotIndex).."]")
            slotItemCount = 1
        end
        --}}}
        -- Update with settings that may have changed {{{
        button       : SetFont( button_font )
        keyLabel     : SetFont( button_font )
        quantityLabel: SetFont( button_font )

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
                color   = COLOR_CURRENTSLOT
            else
                color   = COLOR_NORMAL
            end
            keyLabel:SetColor(color.R, color.G, color.B)

            --}}}
            -- COLOR [visualCueBorder] [quantityLabel] --{{{

            if( tasks_pending ) then
                color = COLOR_PENDING_TASK

            elseif emptySlot      then
                color       = COLOR_NORMAL

            elseif(slotItemCount <= slot_settings.QuantityWarning) then
                if(slotItemCount <= slot_settings.QuantityAlert) then
                    color   = COLOR_ALERT

                else
                    color   = COLOR_WARNING

                end
            else
                color       = COLOR_NORMAL

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
            if( background_color ~= nil) then
                background      : SetHidden( false )
            else
                if(QSB.Settings.SwapBackgroundColors and (slotIndex == current_slotIndex)) then
                    background  : SetHidden( false )
                else
                    background  : SetHidden( slot_settings.HideSlotBackground )
                end
            end

            if( tasks_pending ) then
                visualCueBorder : SetHidden(false)
            else
                visualCueBorder : SetHidden(        slot_settings.VisualCue == VISCUE_OFF                          )
            end

            button              : SetHidden(       (slot_settings.VisualCue == VISCUE_WAC) and (slotItemCount == 0))
            overground          : SetHidden(       (slot_settings.VisualCue == VISCUE_WAC) and (slotItemCount == 0))
            keyLabel            : SetHidden(    not slot_settings.ShowKeyBindings                                  )
            quantityLabel       : SetHidden(    not slot_settings.ShowQuantityLabels                               )

            -- empty slots
            if emptySlot then
                overground      : SetHidden(true)
            end

            -- UNLOCKED LAYOUT
            if not QSB.Settings.LockUI then

                background:SetAlpha(1) -- so we can see what we are doing
                button    :SetAlpha(1)

                button:SetNormalFontColor(1, 0, 0, 1)
                button:SetFont("EsoUI/Common/Fonts/univers57.otf|"..tostring(math.floor(0.8 * QSB.Settings.ButtonSize)))
                button:SetText("X")
                button.data                            = { tooltipText = UNLOCKED_TT           }

                button:SetMouseEnabled(false) -- UI move and resize through

            -- LOCKED LAYOUT
            else
                button:SetMouseEnabled( true) -- button click

                button:SetNormalFontColor(1, 1, 1, 1)

                if     preset_pending then button.data = { tooltipText = PENDING_TT            }
                elseif tasks_pending  then button.data = { tooltipText = COOLDOWN_TT           }
                else                       button.data = { tooltipText = getItem_tooltip(bNum) }

                end
            end

            --}}}
            -- background f(background_color) OR f(GetActiveWeaponPairInfo -- 150329) {{{
            if QSB.Settings.SwapBackgroundColors then
                local activeWeaponPair = GetActiveWeaponPairInfo()
                if(activeWeaponPair == 1) then
                    color   = COLOR_ACTIVEWEAPONPAIR1
                else
                    color   = COLOR_ACTIVEWEAPONPAIR2
                end

            elseif( background_color ~= nil) then
                color       = background_color

            else
                color       = COLOR_BACKGROUND
            end

            background:SetColor(color.R, color.G, color.B)

            alpha           = slot_settings.ButtonBackgroundOpacity / 100     -- from [1-100] to [0-1.0]
            background:SetAlpha(alpha)

            --}}}
        end
    end

    ShowOrHide()
end
--}}}
-- GameActionButtonHideHandler {{{
function GameActionButtonHideHandler(_caller)

    if QSB.Settings.GameActionButtonHide then

        if not ActionButton9:IsHidden() then
D(COLOR_6.."- @@@ HIDING Game Action Slot Button"..COLOR_3.." _caller=[".. _caller .."]|r")  --(160218)
            ActionButton9:SetHidden(true)
        end

    else

            if ActionButton9:IsHidden() then
D(COLOR_5.."- @@@ RESTORING Game Action Slot Button"..COLOR_3.." _caller=[".. _caller .."]|r")  --(160218)
                ActionButton9:SetHidden(false)
            end

    end

end
--}}}
-- BuildUIHandles {{{
function BuildUIHandles()
D("BuildUIHandles():")

    local handleSize = 32
    local offsetX    = -handleSize -2

    local button, texture, label
    for h_num, hNameTooltip in pairs( QSB.UIHandles_label_tooltip ) do

        local hLabel   = hNameTooltip.label
        local hTooltip = hNameTooltip.tooltip

        -- button
        button = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..h_num, GreymindQuickSlotBarUI, CT_BUTTON)
        button:SetDimensions(handleSize, handleSize)
        button:SetAnchor(BOTTOMLEFT, GreymindQuickSlotBarUI, TOPLEFT, offsetX, 0)
        offsetX = offsetX + 2 + handleSize

        -- events
        button:SetHandler("OnClicked"   , function() OnClicked_handle( hLabel ) end)

        button.data      = { tooltipText = hTooltip   } -- required by ZO_Options_OnMouseEnter .. called by local OnMouseEnter
        button:SetHandler("OnMouseEnter", OnMouseEnter)
        button:SetHandler("OnMouseExit" , OnMouseExit )

        if    hLabel == "L" then
            button:SetDimensions(32,32)
            texture = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..h_num.."_texture", GreymindQuickSlotBarUI, CT_TEXTURE)
            texture:SetTexture("/esoui/art/quest/tracked_pin.dds")
            texture:SetAnchorFill(button)
            texture:SetAlpha(0)
            QSB.UIHandles[hLabel] = texture

        elseif hLabel == "S" then
            button:SetDimensions(32,32)
            texture = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..h_num.."_texture", GreymindQuickSlotBarUI, CT_TEXTURE)
            texture:SetTexture("/esoui/art/menubar/menubar_mainmenu_over.dds")
            texture:SetAnchorFill(button)
            texture:SetAlpha(0)
            QSB.UIHandles[hLabel] = texture

        else
            label = WINDOW_MANAGER:CreateControl("QuickSlotHandle_"..h_num.."_label", GreymindQuickSlotBarUI, CT_LABEL)
            label:SetAnchor(CENTER, button, CENTER, 0, 0)
            label:SetFont(HANDLE_FONT)
            label:SetText(hLabel)
            QSB.UIHandles[hLabel] = label

        end
    end

end
--}}}
-- SetChatMax {{{
function SetChatMax(state)
    if(not QSB or not QSB.Panel) then return end

    QSB.Settings.ChatMax = state

    if(state) then
        CHAT_SYSTEM.maxContainerWidth, CHAT_SYSTEM.maxContainerHeight = GuiRoot:GetDimensions()

        c("GQSB: "..COLOR_3.." ChatMax "..COLOR_5.." ON|r → "..CHAT_SYSTEM.maxContainerWidth.." x "..CHAT_SYSTEM.maxContainerHeight)
    else
        for i = 1, #CHAT_SYSTEM.containers do
            CHAT_SYSTEM:ResetContainerPositionAndSize( CHAT_SYSTEM.containers[i] )
        end
        c("GQSB: "..COLOR_3.." ChatMax "..COLOR_8.." OFF → Resized to default")
    end

    CHAT_SYSTEM:Maximize()

    if not QSB.Panel:IsHidden() then Rebuild_LibAddonMenu() end

end
--}}}

-- UI SHOW
-- ShowOrHide {{{
function ShowOrHide()
    if not QSB.Settings then return end

    -- CURRENT STATE OF USER-INTERFACE
    local               vis =     QSB.Settings.Visibility
    local qsb_panel_showing = not QSB.Panel:IsHidden()
    local inventory_showing = not ZO_PlayerInventory:IsHidden()
    local quickslot_showing = not ZO_QuickSlot:IsHidden()
    local          crafting =     ZO_CraftingUtils_IsCraftingWindowOpen()
    local           digging =     ANTIQUITY_DIGGING_ACTIONS_FRAGMENT:IsShowing()
    local           scrying =     IsScryingInProgress()

    -- SHOULD TRANSITION TO SHOWING OR HIDING
    local          show_msg = ""
    local          hide_msg = ""
    if         qsb_panel_showing        then show_msg = "VIS-"..vis.." .. GQSB-MENU SHOWING"
    elseif not QSB.Settings.LockUI      then show_msg = "NOT LOCKED ON SCREEN"
    elseif     BlockBarVisibility       then hide_msg = "BLOCKED IS ON"
    elseif     ForceBarVisibility       then show_msg = "FORCED IS ON"

    elseif     crafting                 then hide_msg = "WHILE CRAFTING"
    elseif      digging                 then hide_msg = "WHILE DIGGING"
    elseif      scrying                 then hide_msg = "WHILE SCRYING"
    elseif not ZO_Skills:IsHidden()     then hide_msg = "WHILE SKILL TUNING"

    elseif     vis == VIS_NEVER         then hide_msg = "VIS-"..vis
    elseif     vis == VIS_ALWAYS        then show_msg = "VIS-"..vis

    elseif     vis == VIS_BLINK_CHANGES then
        if     inventory_showing        then show_msg = "VIS-"..vis.." .. INVENTORY SHOWING"
        elseif quickslot_showing        then show_msg = "VIS-"..vis.." .. QSB-WHEEL SHOWING"
        else   Show_handler();          Hide_delayed(vis, ZO_CALLLATER_DELAY_BLINK_CHANGE)
        end

    elseif     vis == VIS_RETICLE       then
        if not Reticle_isHidden         then show_msg = "VIS-"..vis.." .. RETICLE ON SCREEN"
        elseif inventory_showing        then show_msg = "VIS-"..vis.." .. INVENTORY SHOWING"
        elseif quickslot_showing        then show_msg = "VIS-"..vis.." .. QSB-WHEEL SHOWING"
        else                                 hide_msg = "VIS-"..vis.." .. RETICLE HIDDEN"
        end

    elseif     vis == VIS_COMBAT        then
        if     IsUnitInCombat('player') then show_msg = "VIS-"..vis.." .. IN COMBAT"
        elseif inventory_showing        then show_msg = "VIS-"..vis.." .. INVENTORY SHOWING"
        elseif quickslot_showing        then show_msg = "VIS-"..vis.." .. QSB-WHEEL SHOWING"
        else                                 hide_msg = "VIS-"..vis.." .. NOT IN COMBAT"
        end

    else
        if     inventory_showing        then show_msg = "VIS-"..vis.." .. INVENTORY SHOWING"
        elseif quickslot_showing        then show_msg = "VIS-"..vis.." .. QSB-WHEEL SHOWING"
        else                                 hide_msg = "VIS-"..vis.." .. RETICLE ON SCREEN"
        end
    end

    -- BUTTONS SHOWING OR HIDING
    if    (hide_msg ~= ""          ) then Hide_delayed(        hide_msg                   ) end
    if    (show_msg ~= ""          ) then Show_delayed(        show_msg                   ) end

    -- HANDLES SHOWING (BLINK BACK INTO HIDING)
    if    (show_msg ~= ""          ) then ShowOrHideUIHandles( show_msg                   )    
    elseif(QSB.Settings.LockUI     ) then ShowOrHideUIHandles( "LOCKED ON SCREEN"         )
    else                                        HideUIHandles( hide_msg.." POSSIBLY SHOWN") end

end
--}}}
-- Show_delayed {{{
function Show_delayed(msg)
    local log_this = DEBUG_STATUS

if(log_this) then c("SHOWING: "..COLOR_4..msg) end

    if(not Show_pending) then
        Show_pending = true
        zo_callLater(Show_handler, ZO_CALLLATER_DELAY_SHOW)
    end

end
--}}}
-- Hide_delayed {{{
function Hide_delayed(msg, delay)
    local log_this = DEBUG_STATUS

    if(not delay) then delay = ZO_CALLLATER_DELAY_HIDE end
if(log_this) then c("_HIDING: "..COLOR_8..msg.." (in "..tostring(delay).."ms)") end

    if(not Hide_pending) then
        Hide_pending = true
        zo_callLater(Hide_handler, delay)
    end
end
--}}}
-- Show_handler {{{
function Show_handler()
    Show_pending  = false

    QSB.IsVisible = true
    GreymindQuickSlotBarUI:SetHidden(false)
end
--}}}
-- Hide_handler {{{
function Hide_handler()
    Hide_pending  = false

    QSB.IsVisible = false
    GreymindQuickSlotBarUI:SetHidden(true)
end
--}}}
-- UI HANDLE
-- ShowOrHideUIHandles {{{
local ShowOrHideUIHandles_pending = false
local ShowOrHideUIHandles_caller  = ""

function ShowOrHideUIHandles(_caller)
D("...ShowOrHideUIHandles(".._caller..")")

    if(ShowOrHideUIHandles_pending) then return end

    ShowOrHideUIHandles_caller  = _caller
    ShowOrHideUIHandles_pending = true
    zo_callLater(ShowOrHideUIHandles_handler, ZO_CALLLATER_DELAY_HANDLER)
end
--}}}
-- ShowOrHideUIHandles_handler {{{
function ShowOrHideUIHandles_handler()

    ShowOrHideUIHandles_pending = false

    -- SHOW UI HANDLES WHEN:
    local  qsb_panel_showing = not QSB.Panel:IsHidden()
    local  quickslot_showing = not ZO_QuickSlot:IsHidden()
    local  preset_pending    = Get_preset_pending_IN_COMBAT()
    local  visibility_forced = ForceBarVisibility and not BlockBarVisibility -- precedence!

    if(    visibility_forced
        or qsb_panel_showing
        or quickslot_showing
        or (preset_pending ~= "")
        ) then
        ShowUIHandles( ShowOrHideUIHandles_caller )
    else
        HideUIHandles( ShowOrHideUIHandles_caller )
    end

end
--}}}
-- ShowUIHandles {{{
function ShowUIHandles(_caller)
    if not QSB.UIHandles then return end

    SetUIHandlesVisibility(true , _caller)

  --Refresh(_caller)

end
--}}}
-- HideUIHandles {{{
function HideUIHandles(_caller)
--D("HideUIHandles")
    if not QSB.UIHandles then return end

    SetUIHandlesVisibility(false, _caller)

end
--}}}
-- SetUIHandlesVisibility {{{
function SetUIHandlesVisibility(visible, _caller)
if(DEBUG_STATUS or DEBUG_HANDLE) then D_STATUS(
    "HANDLES VISIBILITY "..(visible and COLOR_4 or COLOR_8)..(visible and "ON" or "OFF") .." .. ".._caller
    )
end
    if not QSB.UIHandles then return end

    local preset_pending = Get_preset_pending_IN_COMBAT()

    for hLabel, handle in pairs( QSB.UIHandles ) do
        if not visible then
            handle:SetAlpha(0)
        else
            -- P1..P5 {{{
            if string.match(hLabel, "P([1-5])")     then      -- preset

                if(hLabel == QSB .Settings.PresetName) then
                    if  QSB .Settings.DelayPresetSwapWhileInCombat then
                        handle:SetColor(0,1,0)      -- green
                    else
                        handle:SetColor(1,1,1)      -- white
                    end
                    handle:SetAlpha(1.0)            -- opaque .. current
                else
                    if(hLabel == preset_pending) then
                        handle:SetColor(1,0,0)      -- red
                    else
                        handle:SetColor(1,0.7,0)    -- orange
                    end

                    handle:SetAlpha(0.5)            -- dimmed .. not selected
                end

                if(hLabel == preset_pending) then
                    handle:SetFont(HAND24_FONT)     -- font BIGGER
                else
                    handle:SetFont(HAND18_FONT)     -- font smaller
                end

                --}}}
                -- SETTINGS GEAR {{{
            elseif string.match(hLabel, "S")        then      -- settings
                if QSB.Settings.LockThisPreset then QSB.UIHandles.S:SetColor(1,0,0) -- red
                else                                QSB.UIHandles.S:SetColor(1,1,1) -- white
                end
                handle:SetAlpha(1)

                --}}}
                -- LockUI {{{
            elseif string.match(hLabel, "L") then             -- lock
                if  QSB.Settings.LockUI then QSB.UIHandles.L:SetColor(0,1,0) -- green .. may unlock
                else                         QSB.UIHandles.L:SetColor(1,0,0) -- red   .. should lock

                    handle:SetAlpha(1)
                end
                --}}}
            end
        end

    end
end
--}}}

-- LAYOUT
-- UIWindowChanged {{{
function UIWindowChanged()
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


end
--}}}
-- ButtonSizeChanged {{{
function ButtonSizeChanged()
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

end
--}}}
-- Adjust_ButtonColumns {{{
function Adjust_ButtonColumns(cols,rows)
D("Adjust_ButtonColumns(cols="..cols..", rows="..rows..")")

    -- [1] >= [cols] <= [ButtonCountMax]
    cols = math.max(cols, 1)                                    -- [cols >= 1             ]
    cols = math.min(cols, QSB.ButtonCountMax)                   -- [cols <= ButtonCountMax]

    -- 1 >= rows <= ButtonCountMax
    rows = math.max(rows, 1)                                    -- [rows >= 1             ]
    rows = math.min(rows, QSB.ButtonCountMax)                   -- [rows <= ButtonCountMax]

    -- 2 >= ButtonCountMax
--[[if ((rows * cols) < 2) then
        rows = 1
    end
--]]
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
end
--}}}
-- Adjust_MainWindow {{{
function Adjust_MainWindow(cols,rows)
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

end
--}}}
-- GetAlignmentXY {{{
function GetAlignmentXY(hAlign, vAlign)

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
end
--}}}

-- SOUND
-- PlaySoundAlert {{{
function PlaySoundAlert(_caller)
D("PlaySoundAlert("..COLOR_7.._caller.."|r)")
    if(QSB.Settings.SoundAlert == NO_SOUND) then return end
    if(not PlaySoundAlert_pending) then
        PlaySoundAlert_pending = true
        zo_callLater(PlaySoundAlert_delayed, ZO_CALLLATER_DELAY_SOUND)
    end
end
--}}}
-- PlaySoundAlert_delayed {{{
function PlaySoundAlert_delayed()
D(COLOR_2.."...PlaySoundAlert_delayed()")
    PlaySoundAlert_pending = false

--  PlaySound(SOUNDS.GENERAL_ALERT_ERROR)
--  PlaySound(SOUNDS.QUICKSLOT_USE_EMPTY)
    PlaySound(QSB.Settings.SoundAlert)
end

--}}}
-- PlaySoundSlotted {{{
function PlaySoundSlotted(_caller)
D("PlaySoundSlotted("..COLOR_7.._caller.."|r)")
    if(QSB.Settings.SoundSlotted == NO_SOUND) then return end
    if(not PlaySoundSlotted_pending) then
        PlaySoundSlotted_pending = true
        zo_callLater(PlaySoundSlotted_delayed, ZO_CALLLATER_DELAY_SOUND)
    end
end
--}}}
-- PlaySoundSlotted_delayed {{{
function PlaySoundSlotted_delayed()
D(COLOR_5.."...PlaySoundSlotted_delayed()|r")
    PlaySoundSlotted_pending = false

--  PlaySound(SOUNDS.ABILITY_SLOTTED)
    PlaySound(QSB.Settings.SoundSlotted)
end

--}}}
-- GetSoundBefore {{{
function GetSoundBefore(soundName)
D("GetSoundBefore("..tostring(soundName)..")")
    soundName = soundName or SOUNDNAMES[1]
    for current = 1, #SOUNDNAMES do
        if(SOUNDNAMES[current] == soundName) then
            return SOUNDNAMES[current-1] or soundName
        end
    end
    return soundName
end
--}}}
-- GetSoundAfter {{{
function GetSoundAfter(soundName)
D("GetSoundAfter("..tostring(soundName)..")")
    soundName = soundName or SOUNDNAMES[#SOUNDNAMES]
    for current = 1, #SOUNDNAMES do
        if(SOUNDNAMES[current] == soundName) then
            return SOUNDNAMES[current+1] or soundName
        end
    end
    return soundName
end
--}}}

-- KEYBIND
-- BuildKeyBindingsMenu {{{
function BuildKeyBindingsMenu()

    for i = 1, #KEYBINDINGS do
        ZO_CreateStringId(KEYBINDINGS_PREFIX .. KEYBINDINGS[i].id , KEYBINDINGS[i].name)
    end

end
--}}}
-- GetKeyBindInfo {{{
function GetKeyBindInfo( actionID )
--D("GetKeyBindInfo(actionID="..actionID..")")

    local _layerIndex, _categoryIndex, _actionIndex
    = GetActionIndicesFromName(actionID)

    local keyBindInfo = {}

    for _bindingIndex = 1, GetMaxBindingsPerAction() do

        local _key, _mod1, _mod2, _mod3, _mod4
        = GetActionBindingInfo(_layerIndex, _categoryIndex, _actionIndex, _bindingIndex)
-- (191006) {{{
--[[
:!start explorer "https://esoapi.uesp.net/100029/src/ingame/keybindings/keyboard/keybindings.lua.html"
    local ctrl    = ZO_Keybindings_DoesKeyMatchAnyModifiers(KEY_CTRL   , _mod1, _mod2, _mod3, _mod4)
    local alt     = ZO_Keybindings_DoesKeyMatchAnyModifiers(KEY_ALT    , _mod1, _mod2, _mod3, _mod4)
    local shift   = ZO_Keybindings_DoesKeyMatchAnyModifiers(KEY_SHIFT  , _mod1, _mod2, _mod3, _mod4)
    local command = ZO_Keybindings_DoesKeyMatchAnyModifiers(KEY_COMMAND, _mod1, _mod2, _mod3, _mod4)
--]]
--}}}

        keyBindInfo[_bindingIndex]
        = {   layerIndex    = _layerIndex
            , categoryIndex = _categoryIndex
            , actionIndex   = _actionIndex
            , bindingIndex  = _bindingIndex
            , keyCode       = _key
            , mod1          = _mod1
            , mod2          = _mod2
            , mod3          = _mod3
            , mod4          = _mod4
        }

    end

    return keyBindInfo

end
--}}}
-- GetSlotItemKeyName {{{
function GetSlotItemKeyName( bNum )
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

end
--}}}
-- ApplyKeyBindingsModifier {{{
function ApplyKeyBindingsModifier()

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

end
--}}}
-- ApplyKeyBindingsModifier_SWAPS {{{
function ApplyKeyBindingsModifier_SWAPS()

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

end
--}}}
-- ClearKeyBindings {{{
function ClearKeyBindings()

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

end
--}}}
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
function QSB_P1()    SelectPreset( PRESETNAMES[1] ); loadPresetSlots(); Refresh("P1"); end
function QSB_P2()    SelectPreset( PRESETNAMES[2] ); loadPresetSlots(); Refresh("P2"); end
function QSB_P3()    SelectPreset( PRESETNAMES[3] ); loadPresetSlots(); Refresh("P3"); end
function QSB_P4()    SelectPreset( PRESETNAMES[4] ); loadPresetSlots(); Refresh("P4"); end
function QSB_P5()    SelectPreset( PRESETNAMES[5] ); loadPresetSlots(); Refresh("P5"); end

--}}}

-- TRANSTITION
-- SelectNextAuto {{{
local SelectNextAuto_caller = ""

function SelectNextAuto(_caller)
D("SelectNextAuto(".._caller..")")
    if not QSB.Settings.NextAuto              then return end
    if not IsEmptySlot(GetCurrentQuickslot()) then return end

    if(not SelectNextAuto_pending) then
        SelectNextAuto_pending = true
        SelectNextAuto_caller  = _caller
        zo_callLater(SelectNextAuto_delayed, ZO_CALLLATER_DELAY_NEXT)
    end
end
--}}}
-- SelectNextAuto_delayed {{{
function SelectNextAuto_delayed()
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
        QSB_SetCurrentQuickslot(bNum_to_slotIndex(bNum), " NEXT AUTO ("..SelectNextAuto_caller..")")
    else
        PlaySoundAlert("SelectNextAuto")
    end

end
--}}}
-- QSB_NextItem {{{
function QSB_NextItem()
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
        QSB.Settings.CurrentSlotIndex = slotIndex
        QSB_SetCurrentQuickslot(bNum_to_slotIndex(bNum), " NEXT ITEM")
    else
        PlaySoundAlert("NextItem")
    end
end
--}}}
-- QSB_PreviousItem {{{
function QSB_PreviousItem()
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
        QSB.Settings.CurrentSlotIndex = slotIndex
        QSB_SetCurrentQuickslot(bNum_to_slotIndex(bNum), " PREV ITEM")
    else
        PlaySoundAlert("NextItem")
    end
end
--}}}
-- QSB_ForceBarVisibility {{{
function QSB_ForceBarVisibility()

    ForceBarVisibility = not ForceBarVisibility

    local keyName      = ""
    local keyBindInfo  = GetKeyBindInfo("GREYMIND_QUICK_SLOT_BAR_FORCE_BAR_VISIBILITY")
    local kbi          = keyBindInfo[1]
    local keyName = (kbi.keyCode ~= 0)
    and              "|r ["..GetKeyName( kbi.keyCode ).."]"
    or               ""

    local state = ForceBarVisibility
    and            COLOR_5.."FORCED ON"
    or             COLOR_8.."FORCED OFF"

c(keyName..COLOR_5.." GQSB: Bar Visibility "..COLOR_9..QSB.Settings.Visibility..COLOR_4.." "..state)

    if(QSB.Settings.Visibility ~= VIS_BLINK_CHANGES) then
        ShowUIHandles(QSB.Settings.Visibility)
    else
        HideUIHandles(QSB.Settings.Visibility)
    end

    Refresh("Bar Visibility "..state)

end
--}}}
-- QSB_BlockBarVisibility {{{
function QSB_BlockBarVisibility()

    BlockBarVisibility = not BlockBarVisibility

    local keyName      = ""
    local keyBindInfo  = GetKeyBindInfo("GREYMIND_QUICK_SLOT_BAR_BLOCK_BAR_VISIBILITY")
    local kbi          = keyBindInfo[1]
    local keyName = (kbi.keyCode ~= 0)
    and              "|r ["..GetKeyName( kbi.keyCode ).."]"
    or               ""

    local state = BlockBarVisibility
    and            COLOR_2.."BLOCKED ON"
    or             COLOR_8.."BLOCKED OFF"

c(keyName..COLOR_5.." GQSB: Bar Visibility "..COLOR_9..QSB.Settings.Visibility..COLOR_7.." "..state)

    Refresh("Bar Visibility "..state)

end
--}}}
-- QSB_ReloadUI {{{
function QSB_ReloadUI()
D("QSB_ReloadUI()")
    SLASH_COMMANDS["/reloadui"]()

end
--}}}
-- QSB_ClearChat {{{
function QSB_ClearChat()
D("QSB_ClearChat()")

local status, err = pcall(
function()
    for i=1, GetNumChatContainerTabs(1), 1 do
--      _G["ZO_ChatWindowTemplate"..    i .."Buffer"]:Clear()
        CHAT_SYSTEM.primaryContainer.currentBuffer:Clear()
    end
end
)
if(err) then
    c("GQSB "..COLOR_2.."* ZO_ChatWindowTemplate is gone since Update 25\n")
    PlaySound("ITEM_ON_COOLDOWN")
end

    CHAT_SYSTEM:Maximize()
end
--}}}
-- QSB_Settings {{{
function QSB_Settings()
D("QSB_Settings()")
    OnClicked_handle( "S" )

end
--}}}

-- UTIL
-- slotIndex_to_bNum {{{
function slotIndex_to_bNum( slotIndex )
    for bNum = 1, #WHEEL_LOOKUPTABLE do
        if WHEEL_LOOKUPTABLE[bNum] == slotIndex then
            return bNum
        end
    end

    return 0
end

--}}}
-- bNum_to_slotIndex {{{
function bNum_to_slotIndex( bNum )
    return  WHEEL_LOOKUPTABLE[ bNum ]
end

--}}}
-- SelectButton {{{
function SelectButton(bNum)
D("SelectButton(bNum=["..tostring(bNum).."])")

    if not QSB.Settings.LockUI then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
    end

    local slotIndex = bNum_to_slotIndex( bNum )

    QSB.Settings.CurrentSlotIndex = slotIndex
    if not IsEmptySlot(slotIndex) then
        PlaySoundSlotted("SelectButton")
        QSB_SetCurrentQuickslot(slotIndex, "SELECT SLOTTED bNum "..tostring(bNum))
    else
        PlaySoundAlert("SelectButton")
        QSB_SetCurrentQuickslot(slotIndex, "SELECT (EMPTY) bNum "..tostring(bNum)) -- force scanning .. (through callbacks)
        SelectNextAuto("BUTTON "..tostring(bNum))
    end

end
--}}}
-- QSB_SetCurrentQuickslot {{{
function QSB_SetCurrentQuickslot_handler()
    QSB_SetCurrentQuickslot(QSB.Settings.CurrentSlotIndex, " CURRENT SLOT")
end

function QSB_SetCurrentQuickslot(slotIndex, _caller)
D("QSB_SetCurrentQuickslot("..tostring(slotIndex)..COLOR_G.." bNum "..slotIndex_to_bNum(slotIndex).."|r , "..tostring(_caller)..")")

    SetCurrentQuickslot( slotIndex )
end
--}}}
-- IsEmptySlot {{{
function IsEmptySlot(slotIndex)
D("IsEmptySlot("..tostring(slotIndex)..")")

       slotItemCount = GetSlotItemCount(slotIndex)
--D_ITEM("...slotItemCount=["..tostring( slotItemCount    ).."]")

    if(slotItemCount == nil) then   -- 150329 -- (ticket from ESOUI) -- GreymindQuickSlotBar.lua:1272: operator < is not supported for nil < number
        return false
    else
        return (GetSlotTexture( slotIndex ) == "") or (slotItemCount < 1)
    end

end
--}}}
-- string_split {{{
function string_split(s, sep)
   local   fields = {}
   local      sep = sep or ":"
   local  pattern = "([^"..sep.."]+)"
   s:gsub(pattern , function(c) fields[#fields+1] = c end)
   return  fields
end
--}}}

-- INIT
-- Initialize {{{
function Initialize(eventCode, addOnName)
D("Initialize()")
    if (addOnName ~= QSB.Name) then return end

    -- KEYBINDINGS
    BuildKeyBindingsMenu()

    -- CHAT SLASH_COMMANDS
    SLASH_COMMANDS[QSB_SLASH_COMMAND] = OnSlashCommand

    Load_ZO_SavedVars(nil)

    BuildSettingsMenu()

  --CHAT_SYSTEM.maxContainerWidth, CHAT_SYSTEM.maxContainerHeight = GuiRoot:GetDimensions()
  --SetChatMax( QSB.Settings.ChatMax )

    -- EVENT HANDLERS
    GreymindQuickSlotBarUI:SetHidden( true )  -- 191125 .. hide top-left rectangle on reloadui
    zo_callLater(RegisterEventHandlers, 500)

end
--}}}
-- Load_ZO_SavedVars {{{
function Load_ZO_SavedVars(value)
--c(COLOR_9.." Load_ZO_SavedVars("..tostring(value)..")")

    local changed = (value ~= nil) and QSB_Settings_Changed()

    -- [QSB.AccountWideSettings]
    -- GET/SET {{{
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

    if(QSB.AccountWideSettings.SaveAccountWide ) then
        -- QSB.Settings .. f(AccountWide.SaveAccountWide) {{{
        --:!start explorer "https://wiki.esoui.com/Circonians_Saved_Variables_Tutorial"
        --:!start explorer "https://esodata.uesp.net/100029/data/z/o/_/ZO_SavedVars.NewCharacterIdSettings.html"
c("LOADING "..COLOR_5.."Account-wide|r Settings")
        QSB.Settings = ZO_SavedVars:NewAccountWide(
        "GreymindQuickSlotBarSettings"
        , QSB.SettingsVersion
        , nil
        , QSB.SettingsDefaults
        , "AccountWide"
        )

        --}}}
    else
        -- QSB.Settings .. LOAD OLD .. AS FALLBACK FOR NEW {{{
c("LOADING "..COLOR_4..GetUnitName("player").."|r Character-NAME (OLD Settings)")

        QSB.Settings = ZO_SavedVars:New(
        "GreymindQuickSlotBarSettings"
        , QSB.SettingsVersion
        , nil
        , QSB.SettingsDefaults
        , "Default"
        )

        --}}}
        -- QSB.Settings .. LOAD NEW .. USE OLD AS DEFAULT {{{
c("LOADING "..COLOR_3..GetUnitName("player").."|r Character-ID (NEW Settings)")

        QSB.Settings = ZO_SavedVars:NewCharacterIdSettings(
        "GreymindQuickSlotBarSettings"
        , QSB.SettingsVersion
        , nil
        , QSB.Settings -- defaults to OLD
        , "Default"
        )

        --}}}
    end

    -- [Loaded_QSB_Settings] {{{
    if(value == nil) then
--c("ROOTING: "..COLOR_2.." Loaded_QSB_Settings")

        Loaded_QSB_Settings = DeepCopy(QSB.Settings)
    --}}}
    -- [QSB_ReloadUI] or [Refresh] .. f(changed) {{{
    else
        if( changed ) then
c(COLOR_2.." GQSB RELOADING\n"..COLOR_2..tostring(changed))

            zo_callLater(QSB_ReloadUI, 3000)
        else
            Rebuild_LibAddonMenu()

            loadPresetSlots()
            zo_callLater(QSB_SetCurrentQuickslot_handler, 500)
            Refresh("Load_ZO_SavedVars")
        end
    end
    --}}}
end
--}}}
-- QSB_Settings_Changed {{{
function QSB_Settings_Changed(q,l,presetName)

    local presetName;      local changed = QSB_Setting_Preset_Changed(QSB.Settings                    , Loaded_QSB_Settings       , QSB.Settings.PresetName); if changed then return changed end
    presetName = PRESETNAMES[1]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[2]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[3]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[4]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end
    presetName = PRESETNAMES[5]; changed = QSB_Setting_Preset_Changed(QSB.Settings.Presets[presetName], Loaded_QSB_Settings.Presets[presetName], presetName); if changed then return changed end

    return false
end
--}}}
-- QSB_Setting_Preset_Changed {{{
function QSB_Setting_Preset_Changed(q,l,presetName)

    local k
    k = "ButtonColumns"                ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonFontSize"               ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonSize"                   ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ButtonsDisplayed"             ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ChatMax"                      ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ChatMute"                     ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "CurrentSlotIndex"             ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "DelayPresetSwapWhileInCombat" ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "GameActionButtonHide"         ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "LockThisPreset"               ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "LockUI"                       ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "NextAuto"                     ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "NextPrevWrap"                 ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "PresetName"                   ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SaveAccountWide"              ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "ShowBackground"               ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SoundAlert"                   ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SoundSlotted"                 ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "SwapBackgroundColors"         ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "Visibility"                   ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end
    k = "version"                      ; if(q[k] and l[k] and (q[k] ~= l[k])) then return(presetName.." "..k.." FROM ["..l[k].."] TO ["..q[k].."]") end

    return false
end
--}}}
-- QSB {{{
function QSB.Update(...)
D("Update()")
    --if not QSB.Settings then return end

    -- Updates on each frame are not required:
    -- ...all changes are handled by RegisterEventHandlers synchronized handlers
    GreymindQuickSlotBarUI:SetHandler("OnUpdate", nil)
    D("Removed \"OnUpdate\" Event Handler")

end
--}}}

-- MENU LAM
-- BuildSettingsMenu {{{
local LAM = LibAddonMenu2

function BuildSettingsMenu()
D("BuildSettingsMenu()")

    -- [panelData] {{{
--  local panel = LAM:CreateControlPanel("QSB_Settings", SETTINGSPANELNAME)
--  LAM:AddHeader(panel, "QSB_UserInterface", "")

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
        resetFunc           = ResetThisPreset,  --(optional) custom function to run after settings are reset to defaults
    }

    QSB.Panel = LAM:RegisterAddonPanel( QSB.Name, panelData)
    --}}}

    local controlName, control
    QSB.SettingsControls = {}

    -- SESSION SCOPE
    -- Account-wide Settings --{{{
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
        warning     = "May involve "..COLOR_3.."Reloading User Interface|r\n"
        ..            "\n"
        ..            "And you should check and possibly "
        ..   COLOR_2.." Reslot|r or"
        ..   COLOR_2.." Reset|r each Preset"
        ..            " after a Game  or Addon release"
        ..            " in order to synchronize all items references.|r\n"
        ,
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- PRESET SCOPE
    control = { type  = "header", name  = COLOR_1.."1 PRESET",      width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- Preset Selection {{{
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
            loadPresetSlots()
            Refresh("Preset Selection")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- LockUI --{{{
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
            Refresh("LockUI")
        end,
        width       = "full",
        warning     = "Disabling the lock will "..COLOR_3.."force UI visibility|r and the background to show so you can reposition it with guidance",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- LockThisPreset {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_LockThisPreset",
        name        = COLOR_2..SYMBOL_GEAR.."|r Lock This Preset ",
        tooltip     = "Whether to keep this Preset's quickslots static\n"
        ..            COLOR_M.."Trader08_mod\n"
        ..            "\n"
        ..            COLOR_8.."A click on the Settings menu Gear-Handle while"
        ..                     " this menu is already showing will toggle"
        ..            COLOR_2.." LockThisPreset state"
        ..            COLOR_8.." → Saving a Locked Preset in the process",
        warning     = COLOR_3.."You can turn this option\n"
        ..            "\n"
        ..            COLOR_M.."ON |r to lock this Preset\n"
        ..            "\n"
        ..            COLOR_8.."OFF|r to save it before loading another\n"
        ..            "\n"
        ..            COLOR_3.."About the locking mecanism:|r\n"
        ..                     "The saving happens when you "..COLOR_4.."change Preset|r"
        ..                     " and when you "..COLOR_4.."leave the game.|r\n"
        ..            "\n"
        ..            COLOR_3.."WHEN THIS SETTINGS MENU IS OPENED:|r\n"
        ..                     "You can update and force the saving of the current Preset"
        ..                      " by "..COLOR_4.."swiching this option from|r "..COLOR_8.."OFF|r "..COLOR_4.."to|r "..COLOR_M.."ON|r.\n"
        ..                     "Also, "..COLOR_4.."Selecting another Preset|r during a configuration will save"
        ..                      " the one you just left, both its options and its slotted items.\n"
        ..            "\n"
        ..            COLOR_3.."But when this option is "..COLOR_M.."ON"..COLOR_3..":|r\n"
        ..                     "All you equip from your bags on the "..COLOR_4.."QSB wheel|r"
        ..                     " wont be automatically saved in the current Preset anymore.\n"
        ..                     "And this is by design, letting you mess-up your "..COLOR_M.."Locked bars|r"
        ..                     " knowing you can restore them with a click on "..COLOR_4.."P1..P5|r or a "..COLOR_4.."shortcut|r key stroke.\n"
        ..            "\n"
        ..            COLOR_3.."Conclusion:|r\n"
        ..                     "Better do your homework in the "..COLOR_8.."OFF|r state"
        ..                     ", choose your "..COLOR_8.."default selected slot|r,"
        ..                     " and only then, you can "..COLOR_M.."LOCK ON everything|r.\n"
        ..            "\n"
        ..            COLOR_2.."You still can save a messed-up bar from here"
        ..                     " if you forgot to reload it before opening this menu!"
        ,
        getFunc     = function()
            return QSB.Settings.LockThisPreset
        end,
        setFunc     = function(value)
            set_LockThisPreset_state(value)

            Refresh("LockThisPreset")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- DelayPresetSwapWhileInCombat {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_DelayCombatPresetSwap",
        name        = COLOR_5..SYMBOL_GEAR.." Delay|r In Combat Preset Swap",
        tooltip     = "Wheter "..COLOR_5.."In-Combat Preset swap|r"
        ..            " should be remembered to be executed at the end of the fight"
        ..            " instead of being ignored "..COLOR_8.."(as it is not allowed)|r.\n"
        ..            COLOR_M.."Trader08_mod",
        warning     = COLOR_3.."You can turn this option to handle UNAUTHORIZED PRESET-CHANGES while "..COLOR_R.."IN-COMBAT|r\n"
        ..            "\n"
        ..            COLOR_5.."ON |r to DELAY the change until after the end of the fight.\n"
        ..            "\n"
        ..            COLOR_8.."OFF|r to silently IGNORE all requested changes while in combat"
        ..            COLOR_8.." (the default in-game behavior.)\n"
        ..            "\n"
        ..            COLOR_9.."For each preset, you can spot when this option is checked"
        ..            " from the "..COLOR_5.."color of the P1..P5|r tags above the icons"
        ..            "\n"
        ..            COLOR_5.."You will get a sound and a visual proc feedback."
        ,
        getFunc     = function()
            if( QSB.Settings   .DelayPresetSwapWhileInCombat == nil) then
                QSB.Settings   .DelayPresetSwapWhileInCombat = false
            end
            return QSB.Settings.DelayPresetSwapWhileInCombat
        end,
        setFunc     = function(value)
            QSB.Settings       .DelayPresetSwapWhileInCombat = value

            Refresh(           "DelayPresetSwapWhileInCombat")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    --}}}
    control = { type  = "header", name  = COLOR_2.."2 BEHAVIOR",    width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- Show Policy {{{
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
                Refresh("Visibility")
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Auto-select next not empty slot --{{{
    control = {
        type        = "checkbox",
        reference   = "QSB_NextAuto",
        name        = "Auto-select next not empty slot",
        tooltip     = "Whether the "..COLOR_5.."next not empty slot|r should be automatically"
        ..            " selected when current gets empty.\n"
        ..            "1. When you select an empty slot.\n"
        ..            "2. When last of the current slot items has just been consumed.\n",
        getFunc     = function()
            return QSB.Settings.NextAuto
        end,
        setFunc     = function(value)
            QSB.Settings.NextAuto = value
            Refresh("NextAuto")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Next <-o-> Previous Wrap --{{{
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
            Refresh("NextPrevWrap")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Disable Default Quick Slot {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_DisableQuickSlotActionButton",
        name        = "Disable Default Quick Slot Button",
        tooltip     = "Whether to disable the game's default quick slot action button.\n"
        ..COLOR_6.."When OFF, no hiding or showing this button will interfere.",
        getFunc     = function()
            return QSB.Settings.GameActionButtonHide
        end,
        setFunc     = function(value)
            QSB.Settings.GameActionButtonHide = value

            GameActionButtonHideHandler("Settings.control")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Link to Chat .. (default true) --{{{
    control = {
        type        = "checkbox",
        reference   = "QSB_PrintDescription",
        name        = "Link to Chat on click",
        tooltip     = "Whether to print an Item Link\n"
        ..COLOR_4   .."in the main Chat Window\n"
        ..COLOR_5   .."when clicked",
        getFunc     = function()
            return QSB.Settings.SlotItem.LinkToChatOnClick
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.LinkToChatOnClick = value

        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    --}}}
    control = { type  = "header", name  = COLOR_3.."3 LAYOUT",      width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- ButtonSize {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_ButtonSize",
        name        = "Button Size",
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
            Refresh("SlotItem_ButtonSize")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- ButtonFontSize {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_ButtonFontSize",
        name        = "Button Font Size",
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
            Refresh("SlotItem_ButtonFontSize")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Show frame background {{{
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
            Refresh("ShowBackground")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Hide buttons background {{{
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
            Refresh("SlotItem_ShowBackground")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Weapon swap background colors {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_SwapBackgroundColors",
        name        = "Weapon swap "..COLOR_6.." background "..COLOR_5.." color",
        tooltip     = "Whether to change buttons background colors on Weapon Swap\n"
        ..COLOR_2.."Applies only to selected slot when\n"
        ..COLOR_5.."Hiding buttons background is ON",
        getFunc     = function()
            return QSB.Settings.SwapBackgroundColors
        end,
        setFunc     = function(value)
            QSB.Settings.SwapBackgroundColors = value
            Refresh("SwapBackgroundColors")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
     --}}}
    -- ButtonBackgroundOpacity {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_ButtonBackgroundOpacity",
        name        = "Button Background Opacity"..COLOR_3.." (new since v2.6.2)|r",
        tooltip     = "From plain invisible to full opacity",
        min         = 0,
        max         = 100,
        step        = 5,
        getFunc     = function()
            return QSB.Settings.SlotItem.ButtonBackgroundOpacity
        end,
        setFunc     = function(value)
            value   = tonumber(value); if not value then return end
            value   = math.max(value,   0)
            value   = math.min(value, 100)
            QSB.Settings.SlotItem.ButtonBackgroundOpacity = value
            Refresh("SlotItem_ButtonBackgroundOpacity")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- NotSelectedButtonOpacity {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_NotSelectedButtonOpacity",
        name        = "Not Selected Opacity",
        tooltip     = "From plain invisible to full opacity",
        min         = 0,
        max         = 100,
        step        = 5,
        getFunc     = function()
            return QSB.Settings.SlotItem.NotSelectedButtonOpacity
        end,
        setFunc     = function(value)
            value   = tonumber(value); if not value then return end
            value   = math.max(value,   0)
            value   = math.min(value, 100)
            QSB.Settings.SlotItem.NotSelectedButtonOpacity = value
            Refresh("SlotItem_NotSelectedButtonOpacity")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- OverlayButtonOpacity {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_OverlayButtonOpacity",
        name        = "Gray-out opacity",
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
            Refresh("SlotItem_OverlayButtonOpacity")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    --}}}
    control = { type  = "header", name  = COLOR_4.."4 VISUAL CUE",  width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- VisualCue_ChoiceList {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_VisualCue",
        name        = "Visual Cue Display Policy",
        tooltip     = "Choose how visual cues should be displayed",
        choices     = QSB.VisualCue_ChoiceList,
        getFunc     = function()
            return QSB.Settings.SlotItem.VisualCue or QSB.SettingsDefaults.SlotItem.VisualCue
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.VisualCue = value
                Refresh("VisualCue")
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityWarning {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_WarningQuantity",
        name        = "Visual Cue Warning Quantity",
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
            Refresh("SlotItem_WarningQuantity")
            if clamped then Rebuild_LibAddonMenu() end
        end,
        width       = "full",
        warning     = "* must be higher than "..COLOR_3.."Alert Quantity|r"
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityAlert {{{
    control = {
        type        = "slider",
        reference   = "QSB_SlotItem_AlertQuantity",
        name        = "Visual Cue Alert Quantity",
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
            Refresh("SlotItem_AlertQuantity")
            if clamped then Rebuild_LibAddonMenu() end
        end,
        width       = "full",
        warning     = "* must be lower than "..COLOR_3.."Warning Quantity|r",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    --}}}
    control = { type  = "header", name  = COLOR_5.."5 LABELS",      width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- SlotNumber SHOW {{{
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

            Refresh("ShowNumbers")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- KeyBindings SHOW {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_ShowKeyBindings",
        name        = "Show Key Bindings",
        tooltip     = "Whether to show key bindings for the slots in Quick Slot Bar",
        getFunc     = function()
            return QSB.Settings.SlotItem.ShowKeyBindings
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.ShowKeyBindings = value
            Refresh("ShowKeyBindings")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- KeyBindings ALIGNV {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_KeyBindPositionVertical",
        name        = "Key Bindings Position (Vertical)",
        tooltip     = "Select where you'd like the key bind displayed in relation to the slot item vertically",
        choices     = ALIGNV,
        getFunc     = function()
            return QSB.Settings.SlotItem.KeyBindAlignV
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.KeyBindAlignV = value
                Refresh("SlotItem_KeyBindPositionVertical")
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- KeyBindings ALIGNH {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_KeyBindPositionHorizontal",
        name        = "Key Bindings Position (Horizontal)",
        tooltip     = "Select where you'd like the key bind displayed in relation to the slot item horizontally",
        choices     = ALIGNH,
        getFunc     = function()
            return QSB.Settings.SlotItem.KeyBindAlignH
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.KeyBindAlignH = value
                Refresh("SlotItem_KeyBindPositionHorizontal")
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityLabels SHOW {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_ShowQuantityLabels",
        name        = "Show Quantity",
        tooltip     = "Whether to show quantity of items for the slots in Quick Slot Bar",
        getFunc     = function()
            return QSB.Settings.SlotItem.ShowQuantityLabels
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.ShowQuantityLabels = value
            Refresh("ShowQuantityLabels")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityLabels ALIGNV {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_QuantityLabelPositionVertical",
        name        = "Quantity Position (Vertical)",
        tooltip     = "Select where you'd like the quantity label displayed in relation to the slot item vertically",
        choices     = ALIGNV,
        getFunc     = function()
            return QSB.Settings.SlotItem.QuantityLabelPositionVertical
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.QuantityLabelPositionVertical = value
                Refresh("SlotItem_QuantityLabelPositionVertical")
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- QuantityLabels ALIGNH {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_QuantityLabelPositionHorizontal",
        name        = "Quantity Position (horizontal)",
        tooltip     = "Select where you'd like the quantity label displayed in relation to the slot item horizontally",
        choices     = ALIGNH,
        getFunc     = function()
            return QSB.Settings.SlotItem.QuantityLabelPositionHorizontal
        end,
        setFunc     = function(value)
            if not Are_Settings_Locked(controlName, value) then
                QSB.Settings.SlotItem.QuantityLabelPositionHorizontal = value
                Refresh("SlotItem_QuantityLabelPositionHorizontal")
            end
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    --}}}
    control = { type  = "header", name  = COLOR_6.."6 SOUND",       width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- SoundAlert {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_SoundAlert",
        name        = "Alert",
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
    -- SoundSlotted {{{
    control = {
        type        = "dropdown",
        reference   = "QSB_SoundSlotted",
        name        = "Slotted",
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
    -- SoundAlert prev button {{{
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
    -- SoundSlotted prev button {{{
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
    -- SoundAlert next button {{{
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
    -- SoundSlotted next button {{{
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
    --}}}
    control = { type  = "header", name  = COLOR_7.."7 wilderness",  width = "full", } QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --{{{
    -- Auto-Clone previous-to-empty preset {{{

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
            Refresh("CloneCurrentToEmtpyPreset")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- ChatMax --{{{
    control = {
        type        = "checkbox",
        reference   = "SetChatMax",
        name        = "Chat Window Unlock Max",
        tooltip     = "Whether to allow resizing Chat Window up to whole screen size",
        getFunc     = function()
            return QSB.Settings.ChatMax
        end,
        setFunc     = function(value)
            SetChatMax(value)
        end,
        width       = "full",
        warning     = "This is an "..COLOR_3.."all Presets|r option\n\n"
        ..            "Switching from "..COLOR_5.."ON|r to "..COLOR_8.."OFF|r"
        ..            " will restore the default size,"
        ..            " but the maximun width and height"
        ..            " will remain unlocked until logout."
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- ChatMute --{{{
    control = {
        type        = "checkbox",
        reference   = "SetChatMute",
        name        = "ChatMute",
        tooltip     = "Whether to suppress all Chat Warning Messages",
        getFunc     = function()      return QSB.Settings.ChatMute end,
        setFunc     = function(value) QSB.Settings.ChatMute = value if(not value) then c(COLOR_5.." GQSB: ChatMute turned OFF") end end,
        width       = "full",
        warning     = "This is an "..COLOR_3.."all Presets|r option\n\n"
        ..            "Default is to allow somehow important messages to be displayed in the Main Chat window"
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Prepare Key modifiers {{{
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
        width       = "full",
        warning     = COLOR_5.."Brace yourself!|r This is not a friendly procedure, but it works!\n"
        .."\n"
        .."First you will have to click on "..COLOR_3.."Not Bound|r keys"
        .." in the "..COLOR_4.."CONTROLS-Keybinds|r window"
        .." which eventually shows up as "..COLOR_6.."SHIFT-F12 - F24|r you must redefine.\n"
        .."\n"
        .." Just another quest that could cost you a few calls to /reloadUI ..."
        .." Good luck!\n",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Verbose Tooltips {{{
    control = {
        type        = "checkbox",
        reference   = "QSB_DEBUG_TOOLTIP",
        name        = "Verbose "..COLOR_M.."Tooltips",
        tooltip     = COLOR_M.."to insert technical details into buttons tooltips",
        warning     = COLOR_8.."...a dev-tool",
        getFunc     = function()
            if( DEBUG_TOOLTIP == nil) then
                DEBUG_TOOLTIP = false
            end
            return DEBUG_TOOLTIP
        end,
        setFunc     = function(value)
            DEBUG_TOOLTIP = value
            if(DEBUG_TOOLTIP) then c("DEBUG_TOOLTIP "..COLOR_M.."ON" )
                else               c("DEBUG_TOOLTIP "..COLOR_8.."OFF")
                end

            Refresh("DEBUG_TOOLTIP")
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    --}}}

    LAM:RegisterOptionControls(QSB.Name, QSB.SettingsControls)
end
--}}}
-- Are_Settings_Locked {{{
function Are_Settings_Locked(option, value)
    if Settings_Locked then
        --c(COLOR_2..".SET:|r "..tostring(QSB.Settings.PresetName)..": "..tostring(option).."=["..tostring(value).."] "..COLOR_2..".REJECTED")
        return true
    else
        --c(COLOR_2..".SET:|r "..tostring(QSB.Settings.PresetName)..": "..tostring(option).."=["..tostring(value).."]")
    end
end
--}}}
-- Release_Settings_Locked {{{
function Release_Settings_Locked()
    Settings_Locked = false
--c(COLOR_C..".^^^^ SETTINGS UNLOCKED|r")
end

--}}}
-- Rebuild_LibAddonMenu {{{
function Rebuild_LibAddonMenu()
D("Rebuild_LibAddonMenu()")
    if(not Rebuild_LibAddonMenu_pending) then
        Rebuild_LibAddonMenu_pending = true
        LAM:OpenToPanel( nil )
        zo_callLater(Rebuild_LibAddonMenu_delayed, ZO_CALLLATER_DELAY_LIB)
    end
end

--}}}
-- Rebuild_LibAddonMenu_delayed {{{
function Rebuild_LibAddonMenu_delayed()
D("Rebuild_LibAddonMenu_delayed()")
    LAM:OpenToPanel( QSB.Panel )
    Rebuild_LibAddonMenu_pending = false
end

--}}}

-- EVENTS
-- RegisterEventHandlers {{{
function RegisterEventHandlers()
D("RegisterEventHandlers()")
    -- Refresh .. ACTION_SLOT_UPDATED --{{{
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

        Refresh("ACTION_SLOT_UPDATED")

    end)
    --}}}
    -- Refresh .. ITEM_SLOT_CHANGED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.ITEM_SLOT_CHANGED"
    , EVENT_ITEM_SLOT_CHANGED
    , function(event, slotIndex)
D_ITEM("ITEM_SLOT_CHANGED: slotIndex=["..slotIndex.."]")

        Refresh("ITEM_SLOT_CHANGED")

    end)
    --}}}
    -- Refresh .. ACTIVE_QUICKSLOT_CHANGED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTIVE_QUICKSLOT_CHANGED"
    , EVENT_ACTIVE_QUICKSLOT_CHANGED
    , function(event, slotIndex) -- (*integer* _slotId_)
if(DEBUG_EQUIP) then c("ACTIVE_QUICKSLOT_CHANGED: slotIndex=["..slotIndex.."]") end

        Refresh("ACTIVE_QUICKSLOT_CHANGED")

    end)
    --}}}
    -- Refresh .. INVENTORY_SINGLE_SLOT_UPDATE --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.INVENTORY_SINGLE_SLOT_UPDATE"
    , EVENT_INVENTORY_SINGLE_SLOT_UPDATE
    , function(event, bagId, bagIndex) -- (*integer* _bagId_, *integer* _slotId_, *bool* _isNewItem_, *integer* _itemSoundCategory_, *integer* _updateReason_)
        -- FILTER ON  BAG_BACKPACK
        if(bagId ~= BAG_BACKPACK) then return end

if(DEBUG_EQUIP) then c("INVENTORY_SINGLE_SLOT_UPDATE: [bagId "..bagId.."] [bagIndex "..bagIndex.."]") end

        -- bagIndex itemLevel {{{
        local data  = SHARED_INVENTORY.bagCache[BAG_BACKPACK][bagIndex]
        if(   data == nil) then
if(DEBUG_EQUIP) then c(COLOR_8.."ITEM REMOVED") end

        else
            local itemName  = GetItemName(BAG_BACKPACK, data.slotIndex )
            local itemLevel = getItem_levl_from_slot( bagIndex )

if(DEBUG_EQUIP) then c(COLOR_5.."ITEM UPDATED: [ID "..bagIndex.."] [Level "..tostring(itemLevel).."] ["..tostring(itemName).."]") end

            QSB_BAG_BACKPACK_UPDATE_bagIndex  = bagIndex
            QSB_BAG_BACKPACK_UPDATE_itemLevel = itemLevel
        end
        --}}}

        SelectNextAuto("INVENTORY UPDATED")
        Refresh("INVENTORY UPDATED")

    end)
    --}}}
    -- Refresh .. RETICLE_HIDDEN_UPDATE --{{{
    -- hide or show in sync with VIS_RETICLE
    EVENT_MANAGER:RegisterForEvent("GQSB.RETICLE_HIDDEN_UPDATE"
    , EVENT_RETICLE_HIDDEN_UPDATE
    , function(...) -- (*bool* _hidden_)
        Reticle_isHidden = select(2,...)

        local refresh_reason
        =  ((not ZO_QuickSlot:IsHidden()                        ) and "quickslot_showing")
        or ((QSB.Settings.Visibility                            ) and "following_reticle")
        or (((vis == VIS_BLINK_CHANGES) and not Reticle_isHidden) and "have_to_blink"    )
        or ""
        D_EVENT("RETICLE_HIDDEN_UPDATE ["..(Reticle_isHidden and "HIDDEN" or "SHOWING").."] "..refresh_reason)

        if(refresh_reason ~= "") then
            Refresh("RETICLE_HIDDEN_UPDATE: "..refresh_reason, ZO_MENU_SHOW_HIDE_DELAY)
        end
    end)
    --}}}
    -- _______ .. RETICLE_TARGET_CHANGED .. GameActionButtonHideHandler --{{{
    -- hide or show in sync with VIS_RETICLE state
    EVENT_MANAGER:RegisterForEvent("GQSB.RETICLE_TARGET_CHANGED"
    , EVENT_RETICLE_TARGET_CHANGED
    , function(...)
        D_EVENT("RETICLE_TARGET_CHANGED")
        if not QSB.Settings then return end

        GameActionButtonHideHandler("RETICLE_TARGET_CHANGED")

    end)
    --}}}
    -- Refresh .. PLAYER_COMBAT_STATE .. GameActionButtonHideHandler  --{{{
    -- hide or show in sync with VIS_COMBAT state
    EVENT_MANAGER:RegisterForEvent("GQSB.PLAYER_COMBAT_STATE"
    , EVENT_PLAYER_COMBAT_STATE
    , function(...) -- (*bool* _inCombat_)
        D_EVENT("PLAYER_COMBAT_STATE")

        Refresh("PLAYER_COMBAT_STATE")

        -- Trader08_mod: AUTO CHANGE TO SELECTED PRESET WHEN OUT OF COMBAT
        local inCombat_state = select(2,...)
        Process_preset_pending_IN_COMBAT( inCombat_state )

        GameActionButtonHideHandler("PLAYER_COMBAT_STATE")

    end)
    --}}}
    -- Refresh .. PLAYER_ACTIVATED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.PLAYER_ACTIVATED"
    , EVENT_PLAYER_ACTIVATED
    , function(self)
        D_EVENT("PLAYER_ACTIVATED")

        Refresh("PLAYER_ACTIVATED")
    end)

    --}}}
    -- Refresh .. ACTIVE_WEAPON_PAIR_CHANGED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTIVE_WEAPON_PAIR_CHANGED"
    , EVENT_ACTIVE_WEAPON_PAIR_CHANGED
    , function(eventCode, activeWeaponPair, locked) -- (*integer* _activeWeaponPair_, *bool* _locked_)
        D_EVENT("ACTIVE_WEAPON_PAIR_CHANGED")
--c("ACTIVE_WEAPON_PAIR_CHANGED: activeWeaponPair "..tostring(activeWeaponPair).." - locked "..tostring(locked))
        if(not locked) then
            D(COLOR_7.." Active Weapon Pair: "..COLOR_C..tostring(activeWeaponPair).."|r")
        end
        Refresh("ACTIVE_WEAPON_PAIR_CHANGED")
--c("GetActiveWeaponPairInfo() returns ["..tostring(GetActiveWeaponPairInfo()).."]")
    end)

    --}}}
    -- Refresh .. KEYBINDING_SET --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.KEYBINDING_SET"
    , EVENT_KEYBINDING_SET
    , function(self) -- (*luaindex* _layerIndex_, *luaindex* _categoryIndex_, *luaindex* _actionIndex_, *luaindex* _bindingIndex_, *integer* _keyCode_, *integer* _mod1_, *integer* _mod2_, *integer* _mod3_, *integer* _mod4_)
        D_EVENT("KEYBINDING_SET")

        Refresh("KEYBINDING_SET")
    end)

    --}}}
    -- Refresh .. KEYBINDING_CLEARED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.KEYBINDING_CLEARED"
    , EVENT_KEYBINDING_CLEARED
    , function(self) -- (*luaindex* _layerIndex_, *luaindex* _categoryIndex_, *luaindex* _actionIndex_, *luaindex* _bindingIndex_)
        D_EVENT("KEYBINDING_CLEARED")

        Refresh("KEYBINDING_CLEARED")

    end)
    --}}}
    -- Refresh .. END_FAST_TRAVEL_INTERACTION --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.END_FAST_TRAVEL_INTERACTION"
    , EVENT_END_FAST_TRAVEL_INTERACTION
    , function(self)
        D_EVENT("END_FAST_TRAVEL_INTERACTION")

        Refresh("END_FAST_TRAVEL_INTERACTION")
    end)
    --}}}
    -- Refresh .. END_FAST_TRAVEL_KEEP_INTERACTION --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.END_FAST_TRAVEL_KEEP_INTERACTION"
    , EVENT_END_FAST_TRAVEL_KEEP_INTERACTION
    , function(self)
        D_EVENT("END_FAST_TRAVEL_KEEP_INTERACTION")

        Refresh("END_FAST_TRAVEL_KEEP_INTERACTION")

    end)
    --}}}
    -- loaded {{{
    D(string.format("Version %s loaded", QSB.Version))
    Refresh("RegisterForEvent")             -- 191125 .. apply Show Policy onload

    --}}}
    -- Refresh ========================= EVENT_ANTIQUITY_SCRYING_RESULT --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.EVENT_ANTIQUITY_SCRYING_RESULT"
    ,                                    EVENT_ANTIQUITY_SCRYING_RESULT
    , function(self) D_EVENT(           "EVENT_ANTIQUITY_SCRYING_RESULT")
                           Hide_delayed("EVENT_ANTIQUITY_SCRYING_RESULT") end
    )
    --}}}
end
--}}}
-- MouseDown {{{
local MouseDown

--}}}
-- OnMoveStart {{{
function OnMoveStart()
D("OnMoveStart")
    QSB.Moving   = true
    OnMouseDown()
end
--}}}
-- OnMoveStop {{{
function OnMoveStop()
D("OnMoveStop: MouseDown=["..tostring(MouseDown).."]")
    QSB.Moving = false

    if (MouseDown) then
        OnMouseClicked()
    else
        UIWindowChanged()
    end
end
--}}}
-- OnResizeStart {{{
function OnResizeStart()
D("OnResizeStart")
    QSB.Resizing = true
    OnMouseDown()
end
--}}}
-- OnResizeStop {{{
function OnResizeStop()
D("OnResizeStop: MouseDown=["..tostring(MouseDown).."]")
    QSB.Resizing = false

    if (MouseDown) then
        OnMouseClicked()
    else
        UIWindowChanged()
        Refresh("OnResizeStop")
    end
end
--}}}
-- OnMouseDown {{{
function OnMouseDown()
D("OnMouseDown")

    MouseDown = true
    zo_callLater(OnMouseNotClicked, 250)

end
--}}}
-- OnMouseNotClicked {{{
function OnMouseNotClicked()
D("OnMouseNotClicked")

    MouseDown = false

end
--}}}
-- OnMouseClicked {{{
function OnMouseClicked()
D("OnMouseClicked: MouseDown=["..tostring(MouseDown).."]")

    if not QSB.Settings.LockUI then
        QSB.Settings.LockUI = true
        Rebuild_LibAddonMenu()
        Refresh("OnMouseClicked")
    end

end
--}}}

-- UI CALLBACK
-- OnClicked_handle {{{
function OnClicked_handle( handleName )
D("OnClicked_handle("..tostring(handleName)..")")

    -- LOCK PIN ------- [UI-LOCK .. TOGGLE]
    if handleName == "L" then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
        Rebuild_LibAddonMenu()
        Refresh("OnClicked_handle L")

    -- SETTINGS GEAR -- [MENU .. SHOW]
    elseif handleName == "S" then
        if QSB.Panel:IsHidden() then
            Rebuild_LibAddonMenu()

            Refresh("OnClicked_handle SHOWING GQSB Settings Menu"..handleName, ZO_MENU_SHOW_HIDE_DELAY)
        else
            set_LockThisPreset_state(not QSB.Settings.LockThisPreset)

            Rebuild_LibAddonMenu()
            Refresh("OnClicked_handle "..handleName.." .. WITH GQSB MENU ON SCREEN .. Toggle LockThisPreset")
        end

    -- PRESET P1..P5 -- [PRESET .. SELECT]
    elseif    string.match(handleName, "P([1-5])") then

        local arg = string.match(handleName, "P([1-5])")
        local presetName = PRESETNAMES[ tonumber(arg) ]

        if QSB.Panel:IsHidden()
            or presetName ~= QSB.Settings.PresetName
            then
                SelectPreset( presetName )
                loadPresetSlots()

                Refresh("OnClicked_handle "..handleName)
            else
                QSB.Settings.DelayPresetSwapWhileInCombat =  not QSB.Settings.DelayPresetSwapWhileInCombat

                Rebuild_LibAddonMenu()
                Refresh("OnClicked_handle "..handleName.." .. WITH GQSB MENU ON SCREEN .. Toggle DelayPresetSwapWhileInCombat")
            end

    end

end
--}}}
-- set_LockThisPreset_state {{{
function set_LockThisPreset_state( state )

    QSB.Settings.LockThisPreset = state

    -- CHECKED-ON .. FORCE SAVING CURRENT PRESET
    if( QSB.Settings.LockThisPreset ) then
        SaveCurrentPreset("LockThisPreset JUST CHECKED-ON")

        -- NOTIFY IN CHAT WINDOW
        c("GQSB"..COLOR_M.." Preset "..COLOR_4.. QSB.Settings.PresetName ..COLOR_M.." saved and locked")
    end
end
--}}}
-- OnMouseEnter .. OnMouseExit {{{
local      MouseOver         = false
local    OnMouseExit_pending = false

function OnMouseEnter(control)

    MouseOver = true

    ZO_Options_OnMouseEnter(control)

    ShowUIHandles("OnMouseEnter")
end

function OnMouseExit(control)

    MouseOver = false

    ZO_Options_OnMouseExit(control)

    if not OnMouseExit_pending then
        zo_callLater(OnMouseExit_handler, ZO_CALLLATER_DELAY_ONMOUSEEXIT)
    end
end

function OnMouseExit_handler()
    OnMouseExit_pending = false
    if not MouseOver then
        ShowOrHideUIHandles("OnMouseExit")
    end
end
--}}}
-- OnClicked_bNum {{{
function OnClicked_bNum(bNum)

    SelectButton( bNum )

    if QSB.Settings.SlotItem.LinkToChatOnClick then

        local       itemLink         = QSB.Settings.SlotItemTable[ bNum ].itemLink
        local       itemLevel        = QSB.Settings.SlotItemTable[ bNum ].itemLevel
        local _, _, itemType, itemId = ZO_LinkHandler_ParseLink(          itemLink )

        D_EQUIP(QSB.Settings.PresetName, bNum, itemId, itemType, itemLevel, itemLink)
        CHAT_SYSTEM:Maximize()

        if(DEBUG_EQUIP) then
            local bagIndex = getItem_slot_from_link(itemLink) --itemId, itemLevel, itemLink, QSB.Settings.SlotItemTable[bNum].texture)
            local data     = SHARED_INVENTORY.bagCache[BAG_BACKPACK][bagIndex]
            d_table("data", data)

        end
    end

end
--}}}

-- DEV
-- OnSlashCommand --{{{
function OnSlashCommand(arg)
    -- arg {{{
    if(arg == "")  then d_signature()
    else                c(QSB_SLASH_COMMAND.." "..arg) end

    --}}}
    local ui_may_have_changed = false
    local          presetName = ""
    -- help --{{{
    if (arg == "") then
        c("→ GQSB Current Settings: "
        ..(QSB.AccountWideSettings.SaveAccountWide and COLOR_6.." Account-wide"
        or                                             COLOR_2..GetUnitName("player").."|r Character"))
        c("\r\n")

    elseif (arg ==  "-h"   )
    or     (arg == "--h"   )
    or     (arg ==  "-help")
    or     (arg ==   "help")
    then
        c(QSB_SLASH_COMMAND..     " p1-p5 .. select Presets "..PRESETNAMES[1].." to "..PRESETNAMES[5].." (current = "..QSB.Settings.PresetName..")")
        c(QSB_SLASH_COMMAND..  " settings .. Settings Panel display (toggle)")
        c(QSB_SLASH_COMMAND..      " lock .. UI lock (toggle)")
        c(QSB_SLASH_COMMAND..   " qsbhide .. Hide Default Quick Slot Button (toggle)")
        c(QSB_SLASH_COMMAND.. " clearchat .. clears all chat windows")
        c(QSB_SLASH_COMMAND..   " refresh .. rebuild and redisplay UI")
        c(QSB_SLASH_COMMAND..     " clone .. auto-clone previous-to-empty preset (toggle)")
        c(QSB_SLASH_COMMAND..     " clear .. to clear Current-Preset-Items")
        c(QSB_SLASH_COMMAND..     " reset .. reset this preset settings to default")
        c(QSB_SLASH_COMMAND..  " resetall .. RESET ALL PRESETS SETTINGS TO DEFAULT")
        c(QSB_SLASH_COMMAND..     " force .. to toggle FORCE Bar Visiblity")
        c(QSB_SLASH_COMMAND..     " block .. to toggle BLOCK Bar Visiblity (overrides force)")
        c(QSB_SLASH_COMMAND..   " account .. to toggle between "..GetUnitName("player").." and Account-wide Settings")
        if DEBUG_ITEM then
            c(QSB_SLASH_COMMAND.. '     _G["ZO_ChatWindowTemplate1Buffer"]')
            c(QSB_SLASH_COMMAND.. ' lua _G["ZO_ChatWindowTemplate1Buffer"]:Clear()')
            c(QSB_SLASH_COMMAND.. ' lua _G["SLASH_COMMANDS"]')
        end

    --}}}
    -- chatmax chatreset {{{
    elseif(arg == "chatmax"  ) then
        SetChatMax( true)

    elseif(arg == "chatreset") then
        SetChatMax(false)

    --}}}
    -- hide show refresh reset p1-5 kbclr kbmod {{{
    elseif(arg == "hide"       ) then Hide_delayed("OnSlashCommand /"..arg)
    elseif(arg == "show"       ) then Show_delayed("OnSlashCommand /"..arg)
    elseif(arg == "showorhide" ) then ShowOrHide()
    elseif(arg == "refresh"    ) then Refresh("OnSlashCommand")
    elseif(arg == "reset"      ) then ResetThisPreset()
    elseif(arg == "resetall"   ) then ResetAllPresets()
    elseif(arg == "account"    ) then Load_ZO_SavedVars(not QSB.AccountWideSettings.SaveAccountWide)
    elseif(arg == "compare"    ) then QSB_Settings_Changed()

    elseif(arg == "p1"         ) then presetName = PRESETNAMES[1]
    elseif(arg == "p2"         ) then presetName = PRESETNAMES[2]
    elseif(arg == "p3"         ) then presetName = PRESETNAMES[3]
    elseif(arg == "p4"         ) then presetName = PRESETNAMES[4]
    elseif(arg == "p5"         ) then presetName = PRESETNAMES[5]

    elseif(arg == "kbclr"      ) then ClearKeyBindings()
    elseif(arg == "kbmod"      ) then ApplyKeyBindingsModifier(); ApplyKeyBindingsModifier_SWAPS()
    --}}}
    -- clone {{{
    elseif(arg == "clone") then
        QSB.CloneCurrentToEmtpyPreset = not QSB.CloneCurrentToEmtpyPreset
        if (QSB.CloneCurrentToEmtpyPreset) then
            c(COLOR_6.." @@@ AUTO-CLONING|r IS ON")
        else
            c(COLOR_6.." @@@ AUTO-CLONING|r IS OFF")
        end
      --Rebuild_LibAddonMenu()

    --}}}
    -- clear {{{
    elseif(arg == "clear"       ) then
        for bNum = 1, QSB.ButtonCountMax do
            clear_bNum(bNum, "/clear", true)
            QSB.Settings.SlotItemTable[bNum].itemName  = nil
            QSB.Settings.SlotItemTable[bNum].itemLevel = nil
            QSB.Settings.SlotItemTable[bNum].slotId    = nil
            QSB.Settings.SlotItemTable[bNum].texture   = nil
            QSB.Settings.SlotItemTable[bNum].itemLink  = nil -- Trader08 added
       end

       loadPresetSlots()

        c("..."..COLOR_2.."QSB.Settings.SlotItemTable CLEARED|r\n")

        ui_may_have_changed = true
    --}}}
    -- lock {{{
    elseif(arg == "lock"   ) then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
        Rebuild_LibAddonMenu()

        ui_may_have_changed = true
    --}}}
    -- gabhide (160218) {{{
    elseif(arg == "qsbhide") then
        QSB.Settings.GameActionButtonHide = not QSB.Settings.GameActionButtonHide
        if (QSB.Settings.GameActionButtonHide) then
            c(COLOR_6.." @@@ HIDING|r Default Quick Slot Button")
        else
            c(COLOR_4.." @@@ SHOWING|r Default Quick Slot Button")
        end
        GameActionButtonHideHandler("OnSlashCommand")

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
    -- color {{{
    elseif(arg == "bg") then
        COLOR_BACKGROUND   = { R =0  , G =0  , B =0  , A = 1.0 }
        Refresh(arg .. "COLOR_BACKGROUND=" .. tostring(COLOR_BACKGROUND))

    elseif(arg == "black") then
        COLOR_BACKGROUND.R =0
        COLOR_BACKGROUND.G =0
        COLOR_BACKGROUND.B =0
        Refresh(arg .. "COLOR_BACKGROUND=" .. tostring(COLOR_BACKGROUND))

    elseif(arg == "white") then
        COLOR_BACKGROUND.R =1
        COLOR_BACKGROUND.G =1
        COLOR_BACKGROUND.B =1
        Refresh(arg .. "COLOR_BACKGROUND=" .. tostring(COLOR_BACKGROUND))

    elseif(arg == "red") then
        COLOR_BACKGROUND.R =1
        COLOR_BACKGROUND.G =0
        COLOR_BACKGROUND.B =0
        Refresh(arg .. "COLOR_BACKGROUND=" .. tostring(COLOR_BACKGROUND))

    elseif(arg == "green") then
        COLOR_BACKGROUND.R =0
        COLOR_BACKGROUND.G =1
        COLOR_BACKGROUND.B =0
        Refresh(arg .. "COLOR_BACKGROUND=" .. tostring(COLOR_BACKGROUND))

    elseif(arg == "blue") then
        COLOR_BACKGROUND.R =0
        COLOR_BACKGROUND.G =0
        COLOR_BACKGROUND.B =1
        Refresh(arg .. "COLOR_BACKGROUND=" .. tostring(COLOR_BACKGROUND))

    --}}}
    -- DEBUG -- {{{
    elseif(arg == "debug"         ) then DEBUG          = not DEBUG         ; c("...DEBUG..........=[" ..tostring( DEBUG          ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_equip"   ) then DEBUG_EQUIP    = not DEBUG_EQUIP   ; c("...DEBUG_EQUIP....=[" ..tostring( DEBUG_EQUIP    ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_event"   ) then DEBUG_EVENT    = not DEBUG_EVENT   ; c("...DEBUG_EVENT....=[" ..tostring( DEBUG_EVENT    ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_handle"  ) then DEBUG_HANDLE   = not DEBUG_HANDLE  ; c("...DEBUG_HANDLE...=[" ..tostring( DEBUG_HANDLE   ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_item"    ) then DEBUG_ITEM     = not DEBUG_ITEM    ; c("...DEBUG_ITEM.....=[" ..tostring( DEBUG_ITEM     ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_station" ) then DEBUG_STATION  = not DEBUG_STATION ; c("...DEBUG_STATION..=[" ..tostring( DEBUG_STATION  ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_status"  ) then DEBUG_STATUS   = not DEBUG_STATUS  ; c("...DEBUG_STATUS...=[" ..tostring( DEBUG_STATUS   ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_task"    ) then DEBUG_TASK     = not DEBUG_TASK    ; c("...DEBUG_TASK.....=[" ..tostring( DEBUG_TASK     ).. "]"); ui_may_have_changed = true
    elseif(arg == "debug_tooltip" ) then DEBUG_TOOLTIP  = not DEBUG_TOOLTIP ; c("...DEBUG_TOOLTIP..=[" ..tostring( DEBUG_TOOLTIP  ).. "]"); ui_may_have_changed = true
    --}}}
    else -- LUA
        -- _G --{{{
        local lua_expr = string.match(arg, "^%s*_G% *(.*)") -- as a global var name
        if lua_expr then
        --QSB_ClearChat()
            local   o  =  _G[lua_expr]
            if(type(o) == 'table') then

                c("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" )
                c("| o=_G["..COLOR_5..lua_expr.."|r]")
                c("| " ..COLOR_C..tostring(o)        )
                c("|vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv" )

                for k,v in pairs( o ) do
                    c("|→ "..COLOR_9..k.."|r=["..COLOR_2..tostring(v).."|r] ("..COLOR_6..type(v).."|r)\n")
                end
            end
            c(    "|^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^" )
            c(    "| o=_G["..COLOR_5..lua_expr.."|r]")
            c(    "| " ..COLOR_C..tostring(o)        )
            c(    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" )
        end
        --}}}
        -- lua {{{
        ------------ EXPRESSION ----------------------------------------------------------------------
        -- /gqsb lua c("txt")                                        -- TEXT LOGS IN THE CHAT
        -- /gqsb lua c("\r\n\r\n")                                   -- EMPTY LINES IN THE CHAT
        -- /gqsb lua c("\226\154\153")                               -- FONT HAS NO GLYPH FOR THIS ONE
        -- /gqsb lua PlaySound("GENERAL_ALERT_ERROR")                -- CHECK SOUNDS
        -- /gqsb lua tonumber(nil) == nil                            -- CHECK EXPRESSION
        -- /gqsb lua { question="what...?", answer=42 }              -- RETURNS A TABLE
        -- /gqsb lua ("str" and string.find(string.lower("LUA STR"),"str"))
        -- /gqsb lua            "what...?",        42                -- RETURNS MULTIPLE VALUES

        ------------ VAR
        -- /gqsb lua BAG_BACKPACK

        ------------ FUNCTION
        -- /gqsb lua CHAT_SYSTEM.primaryContainer.currentBuffer.GetNumHistoryLines

        -------------------------------------             TABLE, MAX, KEY      , VAL
        -- /gqsb lua CHAT_SYSTEM
        -- /gqsb lua CHAT_SYSTEM.primaryContainer
        -- /gqsb lua CHAT_SYSTEM.primaryContainer              ,   0, ""       , "function"
        -- /gqsb lua CHAT_SYSTEM.primaryContainer              ,   0, ""       , "bool"
        -- /gqsb lua ZO_ChatSystem                             ,   0, ""       , "function"
        -- /gqsb lua CHAT_SYSTEM.containers[1]                 ,   0, "name"
        -- /gqsb lua SHARED_INVENTORY.bagCache[1]              ,   0, nil      , "true"
        -- /gqsb lua SHARED_INVENTORY.bagCache[1]              ,   5, nil      , "Potion"
        -- /gqsb lua SHARED_INVENTORY.bagCache[1]              ,   5, "rawName"
        -- /gqsb lua SHARED_INVENTORY.bagCache[1]              ,  20, "rawName"
        -- /gqsb lua SHARED_INVENTORY.bagCache[1][1].inventory.sortHeaders.highlightColor
        -- /gqsb lua SHARED_INVENTORY.bagCache[2]              ,   5, "rawName"
        -- /gqsb lua SHARED_INVENTORY.questCache
        -- /gqsb lua SHARED_INVENTORY.questCache               ,   0, nil      , "string"
        -- /gqsb lua SHARED_FURNITURE
        -- /gqsb lua SHARED_FURNITURE.placeableFurniture
        -- /gqsb lua SHARED_FURNITURE.placeableFurniture[1][1][8].slotData
        -- /gqsb lua SHARED_FURNITURE.retrievableFurniture

        ------------ TABLE
        -- /gqsb lua ACTION_BAR_ASSIGNMENT_MANAGER
        -- /gqsb lua ACTIVITY_TRACKER
        -- /gqsb lua BUFF_DEBUFF_FRAGMENT

        lua_expr = string.match(arg, "^%s*lua%s*(.*)")
        if lua_expr then

            -- EXEC
            local status, err = pcall(
            function()
                c(                    "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
                c(                    "zo_loadstring("..COLOR_5.."return "..lua_expr.."|r)\n")
                local f = assert(      zo_loadstring(            "return "..lua_expr        ))
                if f then
                    local r1, r2, r3, r4, r5 = f()
                    c(                "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")

                    if(not   r1 ) then c("@ "..COLOR_2.."*** "..tostring(r1).." ***\n")
                    elseif(  r1 ) then c("@ "..COLOR_5.."r1: "..tostring(r1)..    "\n") end

                    if(      r2 ) then c("@ "..COLOR_5.."r2: "..tostring(r2)..    "\n") end
                    if(      r3 ) then c("@ "..COLOR_5.."r3: "..tostring(r3)..    "\n") end
                    if(      r4 ) then c("@ "..COLOR_5.."r4: "..tostring(r4)..    "\n") end
                    if(      r5 ) then c("@ "..COLOR_5.."r5: "..tostring(r5)..    "\n") end

                    -- partial -- keyFilter -- valFilter ----- NAME TABLE MAX KEY VAL
                    if(type( r1 ) == "table") then d_table(lua_expr,   r1, r2, r3, r4 ) end

                end
            end
            )

            -- [ERROR]
            if(err) then c(              "@ "..COLOR_2.."*** "..         err.." ***\n") end

            c(                        "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@")
            c()
        end
        --}}}
    end
    -- SelectPreset .. f(presetName) {{{
    if presetName ~= "" then
        SelectPreset( presetName )
        loadPresetSlots()
        Refresh("OnClicked_handle "..handleName)

        ui_may_have_changed = true
    end
    --}}}
    -- Refresh .. f(ui_may_have_changed) {{{
    if(ui_may_have_changed) then
        Refresh("OnSlashCommand /"..arg)

    end
    --}}}
end
--}}}
-- table_includes {{{
function table_includes(table, value)

    for i, v in  ipairs(table) do
        if v == value then return true end
    end

    return false
end
--}}}
-- d_table {{{
--{{{
local PAIRS_MAX = 5000
local MATCH_MAX =  100

local pairs_count
local match_count
local match_max
local tables_visited
--}}}
function d_table(tableName, table, indent_or_match_count_max, k_filter, v_filter)
    -- ROOT-TABLE {{{
    if(not table) then c(tableName..": "..tostring(table)) return end

    local          indent = ""
    if("number" == type(indent_or_match_count_max)) then match_max = indent_or_match_count_max
    elseif(             indent_or_match_count_max)  then    indent = indent_or_match_count_max
    else                                                 match_max = MATCH_MAX
    end

    if(indent == "") then
        c(tableName..":")

        if(match_max  <= 0) then match_max = MATCH_MAX end
        pairs_count    = 0
        match_count    = 0
        tables_visited = {}
    end
    tables_visited[#tables_visited+1] = table
    --}}}
    -- FILTER {{{
    k_filter           =  k_filter and (k_filter ~= "") and string.lower(k_filter) or nil
    v_filter           =  v_filter and (v_filter ~= "") and string.lower(v_filter) or nil
    local  filtering   = (k_filter ~= nil) or (v_filter ~= nil)

    local  truncating  = (match_max >  0)

    if(not filtering and (match_max == 0)) then match_max = MATCH_MAX end

    --}}}
    for k, v in pairs(table) do
        -- NEXT HOP {{{
        if     (pairs_count >= PAIRS_MAX)
            or (match_count >= match_max) then

            if(indent == "") then
                c("TABLE size=["..#table.."] .. match=["..match_count.."/"..match_max.."] .. checked pairs=["..pairs_count.."/"..PAIRS_MAX.."]")
            end
            return
        end
        pairs_count = pairs_count + 1
        --}}}
        -- LABEL {{{
        local k_str    = tostring(k)
        local v_str    = tostring(v)
        local v_type   = type    (v)
        local label    = string.format('%32s %-12s %-12s'
        ,                               indent
        , COLOR_8                     .."("..v_type..")"..COLOR_0
        , COLOR_X[1 + match_count % 9]..      "["..k_str.."]"..COLOR_0
        )

        --}}}
        -- SUB-TABLE {{{
        if(       (v_type    == "table"                ) -- sub-table
             --and (indent   == ""                     ) -- from root table only
               and (filtering or truncating            ) -- just in case .. (try not to dump the whole world)
               and not table_includes(tables_visited, v) -- been there, done that
            ) then

            d_table(label, v, indent.."."..k_str, k_filter, v_filter)

        --}}}
        -- ENTRY {{{
        else
            -- [FILTER]
            local k_lower =               string.lower( k_str )
            local v_lower =               string.lower( v_str )
            local k_match = k_filter and (string.find ( k_lower, k_filter) ~= nil)
            local v_match = v_filter and (string.find ( v_lower, v_filter) ~= nil)
            or              v_filter and (string.find ( v_type , v_filter) ~= nil)

            if((not filtering) or k_match or v_match) then

                match_count = match_count + 1

                label = string.format("%3d %s", match_count, label)

                c(string.format('%s .. %s[%s]'
                ,                label
                ,                      COLOR_9
                ,                         v_str))

            end
        end
        --}}}
    end
    if(indent == "") then
        c("(in "..#tables_visited.." tables)")
    end
end
--}}}

-- PUB
-- d_signature {{{
function d_signature()

    d("\r\n"
    .."!! GQSB"..COLOR_C.." "..QSB.Version.." (201107)\n"
    .."!!"..COLOR_6.."- Checked with Update 28 Markarth (6.2.0) API 100033\n"
    .."!!"..COLOR_6.."- Button Background Opacity slider\n"
    .."!!"..COLOR_6.."- UI Handles hidden by default\n"
    .."→ "..COLOR_8..QSB_SLASH_COMMAND.." -h for help|r\n"
    )

    if(QSB.Settings.ChatMute) then d(COLOR_2.." GQSB: ChatMute is ON") end
end
--}}}
GreymindQuickSlotBar = QSB
EVENT_MANAGER:RegisterForEvent(GreymindQuickSlotBar.Name, EVENT_ADD_ON_LOADED, Initialize)

-- LINKS
--[[--{{{
:new C:/LOCAL/GAMES/TESO/ADDONS/2_Greymind_Quick_Slot_Bar/P.txt

--]]--}}}

