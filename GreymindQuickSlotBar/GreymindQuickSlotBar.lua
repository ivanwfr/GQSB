--  Greymind Quick Slot Bar v2.0.6
--  Author: Balki
--  ESO NA Megaserver: @balki
--  Web: greymind.com
--  Feature Author: ivanwfr

-- ESOUI Developer Discussions - General Authoring Discussion - Changes on PTS 1.2.2
-- http://www.esoui.com/forums/showthread.php?t=1811
--  ../../../../ARCHIVES/liveeu/Addons/GreymindQuickSlotBar/lib/LibAddonMenu-1.0
--  lib/LibAddonMenu-2.0/LibAddonMenu-2.0.lua
--  lib/exampleoptions.lua
--  lib/LibAddonMenu-2.0/controls/panel.lua
--  lib/LibAddonMenu-2.0/controls/slider.lua
-- OBSOLETE:
--  /LAM:AddHeader

--[[ CHANGELOG 150218   // 141105
APIVersion: 100011      // 100010
Version     "v2.1.5"    // "v2.1.0"
Bag items update excluding bag #0 events (equipped items wearing stats?)
Some unnecessary GUI refresh removed (small optimization)
--]]

local DEBUG = false
-- LOCAL
-- CONSTANTS --{{{

-- COLORS
local COLOR1                  = "|c4477FF"
local COLOR2                  = "|cFF5555"
local COLOR3                  = "|cFFCC55"
local COLOR4                  = "|c009955"
local COLOR5                  = "|c880088"
local COLOR6                  = "|cBB0000"

-- VISUAL-CUE BORDERS
local COLORALERT              = { R =1  , G =0  , B =0  , A = 1 }
local COLORCURRENTKEY         = { R =0.5, G =1  , B =0.5, A = 1 }
local COLORNORMAL             = { R =0.5, G =0.5, B =0.7, A = 1 }
local COLORWARNING            = { R =1  , G =1  , B =0  , A = 1 }

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

-- TEXTURES
local BACKGROUNDTEXTURE       = "ESOUI/art/actionbar/quickslotbg.dds"
local BASEBACKGROUNDTEXTURE   = "ESOUI/art/actionbar/abilityframe64_empty.dds"
local BORDERTEXTURE           = "ESOUI/art/actionbar/abilityframe64_up.dds"
local VISUALCUEBORDERTEXTURE  = "GreymindQuickSlotBar/BorderAlt.dds"

-- KEYS
local MOD_NONE                = "No Modifier"
local MOD_SHIFT               = "Shift"
local MOD_CONTROL             = "Control"
local MOD_ALT                 = "Alt"
local MOD_SHIFT_KEYCODE       = 7
local MOD_CONTROL_KEYCODE     = 4
local MOD_ALT_KEYCODE         = 5

local KEYBINDINGS_PREFIX      = "SI_BINDING_NAME_"

local KBNAME_FORCE            = COLOR1.."Force Bar Visibility"
local KBNAME_PREVIOUS         = COLOR2.."Previous Quick Slot Item"
local KBNAME_NEXT             = COLOR3.."Next Quick Slot Item"
local KBNAME_RELOADUI         = COLOR4.."Reload UI"
local KBNAME_CLEARCHAT        = COLOR4.."Clear Chat"

-- CHOICE-LISTS
local ALIGNH                  = { "Off-Left", "Left", "Center", "Right"  , "Off-Right"}
local ALIGNV                  = { "Above"   , "Top" , "Middle", "Bottom" , "Below"    }
local PRESETNAMES             = { "P1"      , "P2"  , "P3"    , "P4"     , "P5"       }

local KEYBINDINGS = {

    { name="Quick Slot Item 1"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_1"              }, -- QSB_Item1
    { name="Quick Slot Item 2"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_2"              }, -- QSB_Item2
    { name="Quick Slot Item 3"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_3"              }, -- QSB_Item3
    { name="Quick Slot Item 4"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_4"              }, -- QSB_Item4
    { name="Quick Slot Item 5"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_5"              }, -- QSB_Item5
    { name="Quick Slot Item 6"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_6"              }, -- QSB_Item6
    { name="Quick Slot Item 7"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_7"              }, -- QSB_Item7
    { name="Quick Slot Item 8"        , id="GREYMIND_QUICK_SLOT_BAR_ITEM_8"              }, -- QSB_Item8

    { name=KBNAME_FORCE               , id="GREYMIND_QUICK_SLOT_BAR_FORCE_BAR_VISIBILITY"}, -- QSB_ForceBarVisibility
    { name=KBNAME_PREVIOUS            , id="GREYMIND_QUICK_SLOT_BAR_PREVIOUS_ITEM"       }, -- QSB_PreviousItem
    { name=KBNAME_NEXT                , id="GREYMIND_QUICK_SLOT_BAR_NEXT_ITEM"           }, -- QSB_NextItem

    { name=KBNAME_RELOADUI            , id="GREYMIND_QUICK_SLOT_BAR_RELOADUI"            }, -- QSB_ReloadUI
    { name=KBNAME_CLEARCHAT           , id="GREYMIND_QUICK_SLOT_BAR_CLEARCHAT"           }, -- QSB_ClearChat
}

--}}}
-- ATTRIBUTES {{{
local SETTINGSPANELNAME                 = COLOR1.."G "..COLOR2.."Quick "..COLOR3.."Slot "..COLOR4.."Bar"
local QSB_SLASH_COMMAND                 = "/gqsb"
local QSB = {

    Name                                = "GreymindQuickSlotBar",
    Panel                               = nil,
    Version                             = "v2.1.5", -- 150314 [APIVersion 100011 Update 1.6] previous: 150311 150218
    SettingsVersion                     = 1,

    -- CHOICES
  --KeyModifier_ChoiceList              = { MOD_NONE   , MOD_SHIFT , MOD_CONTROL, MOD_ALT },
    Visibility_ChoiceList               = { VIS_RETICLE, VIS_COMBAT, VIS_NEVER, VIS_ALWAYS  },
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
    Visibility                          = VIS_RETICLE,
    PresetName                          = PRESETNAMES[1],

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

    Presets                             = { P1={}, P2={}, P3={}, P4={}, P5={} }

} --}}}
-- FORWARD DECLARATION OF LOCAL FUNTIONS --{{{
-- ...so we can call them before their definition in this file

local Adjust_ButtonColumns
local Adjust_MainWindow
local ApplyKeyBindingsModifier
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
local DeepCopy
local Display
local GameActionButtonHideHandler
local GetAlignmentXY
local GetKeyBindInfo
local GetSlotItemKeyName
local Get_bNum_of_slotIndex
local Get_slotIndex_of_bNum
local Hide
local HideUIHandles
local Initialize
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

local OnSlashCommand
local PlaySoundAlert
local PlaySoundSlotted
local Refresh
local RegisterEventHandlers
local Release_Settings_Locked
local SelectButton
local SelectNextAuto
local SelectPreset
local SetUIHandlesVisibility
local Settings_Locked
local Show
local ShowUIHandles
local UIWindowChanged

--}}}

-- SETTINGS
function Load_Defaults() --{{{
D("Load_Defaults()")

    -- revert to default values
--  CopyFromTo(QSB.SettingsDefaults, QSB.Settings)
--  QSB.Settings = DeepCopy(QSB.SettingsDefaults)
    SelectPreset( PRESETNAMES[1] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[2] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[3] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[4] ); CopySettingsDefaultsTo(QSB.Settings)
    SelectPreset( PRESETNAMES[5] ); CopySettingsDefaultsTo(QSB.Settings)
    d("...QSB: all presets reset to default values")

    ButtonSizeChanged()
    Refresh()
    Show()
end --}}}
function SelectPreset(selectedPreset) --{{{
D("SelectPreset(|c00FFFF"..selectedPreset.."|r):")

    -- @see ../../SavedVariables/GreymindQuickSlotBar.lua

    if string.match(selectedPreset, QSB.Settings.PresetName) then
        D("...|cFF00FF.SelectedPreset matches QSB.Settings.PresetName|r")
        return
    end

    -- currentPreset from default settings
    local currentPreset = QSB.Settings.PresetName
    QSB.Settings.Presets[currentPreset] = DeepCopy(QSB.SettingsDefaults)

    -- currentPreset with current settings
    local from, to
    from = QSB.Settings
    to   = QSB.Settings.Presets[currentPreset]
    CopyNotNilSettingsFromTo(from, to)
    to.PresetName = nil
    to.Presets    = nil

    if not QSB.Settings.Presets[selectedPreset].MainWindow then
        QSB.Settings.Presets[selectedPreset] = DeepCopy(QSB.SettingsDefaults)
    end
    from = QSB.Settings.Presets[selectedPreset]
    to   = QSB.Settings
    CopyNotNilSettingsFromTo(from, to)

    D("...+SAVED  PRESET "..QSB.Settings.PresetName)
    QSB.Settings.PresetName = selectedPreset
    D("...CURRENT PRESET "..QSB.Settings.PresetName)

    -- update dependencies
    ButtonSizeChanged()                 -- UI geometry
    GameActionButtonHideHandler(true)   -- Apply selected preset choice

    Rebuild_LibAddonMenu()

end --}}}
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
    if( orig.Visibility                               ~= nil) then dest.Visibility                               = orig.Visibility                               end

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
    dest.Visibility                               = QSB.SettingsDefaults.Visibility

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

-- UI (build)
function Refresh() --{{{
--D("Refresh()")

    if not QSB.Settings then return end
    if     QSB.Moving or QSB.Resizing then return end

    GameActionButtonHideHandler(false) -- Apply current user choice

    -- GEOMETRY --{{{
    GreymindQuickSlotBarUI:SetClampedToScreen(true)

    if(QSB.Buttons[1] == nil) then
        ButtonSizeChanged()
        BuildUIHandles()
    end

    if(QSB.Settings.MainWindow.X == 0) and (QSB.Settings.MainWindow.Y == 0) then
        QSB.Settings.MainWindow.X = math.floor(GuiRoot:GetWidth()  / 2)
        QSB.Settings.MainWindow.Y = math.floor(GuiRoot:GetHeight() / 2)

        if     QSB.Settings.PresetName == "P1" then
            QSB.Settings.MainWindow.X   = QSB.Settings.MainWindow.X - 32
        elseif QSB.Settings.PresetName == "P2" then
            QSB.Settings.MainWindow.X   = QSB.Settings.MainWindow.X - 64
        elseif QSB.Settings.PresetName == "P3" then
            QSB.Settings.MainWindow.X   = QSB.Settings.MainWindow.X - 96
        elseif QSB.Settings.PresetName == "P4" then
            QSB.Settings.MainWindow.X   = QSB.Settings.MainWindow.X - 128
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

    --}}}
    -- BACKGROUND --{{{
    if not QSB.Settings.LockUI then
        GreymindQuickSlotBarUIBackdrop:SetAlpha(1.0)
    elseif QSB.Settings.ShowBackground then
        GreymindQuickSlotBarUIBackdrop:SetAlpha(0.5)
    else
        GreymindQuickSlotBarUIBackdrop:SetAlpha(0.0)
    end --}}}

    -- QUICK SLOT BUTTONS
    local slot_settings = QSB.Settings.SlotItem
    local buttonSize    = QSB.Settings.ButtonSize

    local x, y, hAlign, vAlign, row, col, color, alpha
    row = 0
    col = 0
    local current_slotIndex = GetCurrentQuickslot()
    for bNum = 1, QSB.ButtonCountMax do
        local slotIndex  = Get_slotIndex_of_bNum( bNum )
        -- Buttons first build {{{
        if (QSB.Buttons[bNum] == nil) then
            QSB.Buttons[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButton" .. tostring(bNum), GreymindQuickSlotBarUI, CT_BUTTON)
            local button = QSB.Buttons[bNum]
            button:SetDimensions(buttonSize, buttonSize)
            button:SetState(BSTATE_NORMAL)
            button:SetNormalFontColor(1, 1, 1, 1)
            button:SetHidden(false)
            button:SetEnabled(true)
            button:SetVerticalAlignment(1)
            button:SetHandler("OnClicked"   , function() OnClicked_bNum(bNum) end)
            button:SetHandler("OnMouseEnter",            OnMouseEnter            )
            button:SetHandler("OnMouseExit" ,            OnMouseExit             )

            QSB.Basegrounds[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonBaseground" .. tostring(bNum), GreymindQuickSlotBarUI, CT_TEXTURE)
            local baseground = QSB.Basegrounds[bNum]
            baseground      :SetTexture(BASEBACKGROUNDTEXTURE)
            baseground      :SetAnchorFill(button)

            QSB.Backgrounds[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonBackground" .. tostring(bNum), GreymindQuickSlotBarUI, CT_TEXTURE)
            local background = QSB.Backgrounds[bNum]
            background      :SetTexture(BACKGROUNDTEXTURE)
            background      :SetAnchorFill(button)

            QSB.VisualCueBorders[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonVisualCue" .. tostring(bNum), GreymindQuickSlotBarUI, CT_TEXTURE)
            local visualCueBorder = QSB.VisualCueBorders[bNum]
            visualCueBorder :SetTexture(VISUALCUEBORDERTEXTURE)
            visualCueBorder :SetAnchorFill(button)

            QSB.Borders[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonBorder" .. tostring(bNum), GreymindQuickSlotBarUI, CT_TEXTURE)
            local border = QSB.Borders[bNum]
            border          :SetTexture(BORDERTEXTURE)
            border          :SetAnchorFill(button)

            QSB.Overgrounds[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonOverground" .. tostring(bNum), GreymindQuickSlotBarUI, CT_TEXTURE)
            local overground = QSB.Overgrounds[bNum]
            overground      :SetAnchorFill(button)
            overground      :SetColor(0.0,0.0,0.0)

            QSB.KeyLabels[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonKeyName" .. tostring(bNum), GreymindQuickSlotBarUI, CT_LABEL)
            local keyLabel = QSB.KeyLabels[bNum]
            keyLabel        :SetAnchor(CENTER, button, CENTER, 0, -(buttonSize / 2) - QSB.ButtonPadding)

            QSB.QuantityLabels[bNum] = WINDOW_MANAGER:CreateControl("QuickSlotBarButtonQuantityLabel" .. tostring(bNum), GreymindQuickSlotBarUI, CT_LABEL)
            local quantityLabel = QSB.QuantityLabels[bNum]
            quantityLabel   :SetAnchor(CENTER, button, CENTER, 0, -(buttonSize / 2) - QSB.ButtonPadding)

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
        --}}}
        -- ESOUI-vedarion --{{{
        if not slotItemCount then
            D("|cFF00FF-GQSB: [slotItemCount=nil] for [slotIndex="..tostring(slotIndex).."]");
            slotItemCount = 0;
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

        button          : SetDimensions(1, 1)   --FIXME - find out IF AND WHY this is required

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
            button:SetNormalTexture(buttonTexture)
            overground:SetTexture(buttonTexture)
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
            if emptySlot then
                color       = COLORNORMAL
            elseif(slotItemCount <= slot_settings.QuantityWarning) then
                if(slotItemCount <= slot_settings.QuantityAlert) then
                    color   = COLORALERT
                else
                    color   = COLORWARNING
                end
            else
                color   = COLORNORMAL
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
                    if(alpha < 0.5) then
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
            if(slotIndex == current_slotIndex) then
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
            button          : SetHidden(   (slot_settings.VisualCue == VISCUE_WAC) and (slotItemCount == 0))    -- hide consumed
            overground      : SetHidden(   (slot_settings.VisualCue == VISCUE_WAC) and (slotItemCount == 0))    -- hide consumed
            keyLabel        : SetHidden(not slot_settings.ShowKeyBindings)
            quantityLabel   : SetHidden(not slot_settings.ShowQuantityLabels)
            visualCueBorder : SetHidden(    slot_settings.VisualCue == VISCUE_OFF)

            -- empty slots
            if emptySlot then
                overground      : SetHidden(true)
            end

            -- unlocked layout
            if not QSB.Settings.LockUI then
                button:SetHidden(true)
                background:SetAlpha(1) -- so we can see what we are doing
            end

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
function GameActionButtonHideHandler(just_changed) --{{{
--D("GameActionButtonHideHandler(just_changed="..tostring(just_changed).."):")

    if     QSB.Settings.GameActionButtonHide then
        if not ActionButton9:IsHidden() then
            D("Settings: |c8800DD-HIDING Game Action Slot Button|r")
            ActionButton9:SetHidden(true)
        end

    else
        -- if asked not to handle button anymore, make it visible again in case it is hidden
        if just_changed then
            if ActionButton9:IsHidden() then
                D("Settings: |c8800DD- RESTORING Game Action Slot Button|r")
                ActionButton9:SetHidden(false)
            end
        end

    end

end --}}}

-- UI (display)
function Display() --{{{
--D("Display()")
    if not QSB.Settings then return end

    -- VIS_NEVER -- only show with ForceBarVisibility
    if QSB.Settings.Visibility == VIS_NEVER then
        Hide()
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

    -- VIS_RETICLE -- event handler provides

    -- VIS_COMBAT  -- combat state decides
    if QSB.Settings.Visibility == VIS_COMBAT then
        if IsUnitInCombat('player') then
            Show()
        else
            Hide()
        end
    end

end --}}}
function Show() --{{{
--D("Show()")

    if QSB.Settings.Visibility ~= VIS_NEVER then
        QSB.IsVisible = true
        GreymindQuickSlotBarUI:SetHidden(false)
    end

    OnMouseExit()

end --}}}
function Hide() --{{{
--D("Hide()")

    QSB.IsVisible = false
    GreymindQuickSlotBarUI:SetHidden(true)

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

function PlaySoundAlert(caller) --{{{
D("PlaySoundAlert(|cFF00FF"..caller.."|r)")
    PlaySound("General_Alert_Error")
end

--}}}
function PlaySoundSlotted(caller) --{{{
D("PlaySoundSlotted(|cFF00FF"..caller.."|r)")
    PlaySound(SOUNDS.ABILITY_SLOTTED)
end

--}}}

-- KEYBINDINGS
function BuildKeyBindingsMenu() --{{{
    for i = 1, #KEYBINDINGS do
        ZO_CreateStringId(KEYBINDINGS_PREFIX .. KEYBINDINGS[i].id , KEYBINDINGS[i].name)
    end
end

--}}}
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

            if    (kbi.mod1 == MOD_SHIFT_KEYCODE  ) then keyName = "+"
            elseif(kbi.mod1 == MOD_CONTROL_KEYCODE) then keyName = "^"
            elseif(kbi.mod1 == MOD_ALT_KEYCODE    ) then keyName = "!"
            end

            keyName = keyName .. GetKeyName( kbi.keyCode )

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

end --}}}
-- QSB.Item1() .. QSB.Item8() {{{
function QSB_Item1() SelectButton(1) end
function QSB_Item2() SelectButton(2) end
function QSB_Item3() SelectButton(3) end
function QSB_Item4() SelectButton(4) end
function QSB_Item5() SelectButton(5) end
function QSB_Item6() SelectButton(6) end
function QSB_Item7() SelectButton(7) end
function QSB_Item8() SelectButton(8) end
--}}}
function QSB_NextItem() --{{{
D("NextItem()")
    local slotIndex = GetCurrentQuickslot()
    local bNum      = Get_bNum_of_slotIndex( slotIndex )

    -- select next not empty slot
    local step = 0
    repeat
        step = step + 1
        bNum = bNum + 1
        if QSB.Settings.NextPrevWrap then
            bNum  = math.fmod(bNum, QSB.Settings.ButtonsDisplayed+1)
        elseif bNum > QSB.Settings.ButtonsDisplayed then
            Show()
            PlaySoundAlert("NextItem")
            break
        end
        slotIndex = Get_slotIndex_of_bNum( bNum )
    until not IsEmptySlot(slotIndex) or (step > QSB.Settings.ButtonsDisplayed+1)

    if (bNum > 0) and (bNum <= QSB.Settings.ButtonsDisplayed) then
        PlaySoundSlotted("NextItem")
        SetCurrentQuickslot( Get_slotIndex_of_bNum(bNum) )
    end
end --}}}
function QSB_PreviousItem() --{{{
D("PreviousItem()")
    local slotIndex = GetCurrentQuickslot()
    local bNum      = Get_bNum_of_slotIndex( slotIndex )

    -- select previous not empty slot
    local step = 0
    repeat
        step = step + 1
        bNum = bNum - 1
        if QSB.Settings.NextPrevWrap then
            bNum = math.fmod(bNum+ QSB.Settings.ButtonsDisplayed+1, QSB.Settings.ButtonsDisplayed+1) -- cares for negative values
        elseif bNum < 1 then
            Show()
            PlaySoundAlert("PreviousItem")
            break
        end
    slotIndex = Get_slotIndex_of_bNum( bNum )
    until not IsEmptySlot(slotIndex) or (step > QSB.Settings.ButtonsDisplayed+1)

    if (bNum > 0) and (bNum <= QSB.Settings.ButtonsDisplayed) then
        PlaySoundSlotted("PreviousItem")
        SetCurrentQuickslot( Get_slotIndex_of_bNum(bNum) )
    end
end --}}}
function QSB_ForceBarVisibility() --{{{
D("QSB_ForceBarVisibility()")

    if not QSB.IsVisible then
        QSB.IsVisible = true
        GreymindQuickSlotBarUI:SetHidden(false)
    else
        Hide()
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
function Get_bNum_of_slotIndex(slotIndex) --{{{
    for bNum = 1, #WHEEL_LOOKUPTABLE do
    if WHEEL_LOOKUPTABLE[bNum] == slotIndex then
        return bNum
    end
    end
end

function Get_slotIndex_of_bNum(bNum)
    return WHEEL_LOOKUPTABLE[ bNum ]
end
--}}}
function SelectButton(bNum) --{{{
D("SelectButton(bNum=["..tostring(bNum).."])")

    local slotIndex = Get_slotIndex_of_bNum( bNum )

    if IsEmptySlot(slotIndex) then
        PlaySoundAlert("SelectButton")
    else
        PlaySoundSlotted("SelectButton")
        SetCurrentQuickslot( slotIndex )
    end

end --}}}
function IsEmptySlot(slotIndex) --{{{
    return (GetSlotTexture( slotIndex ) == "") or (GetSlotItemCount(slotIndex) < 1)
end --}}}

-- LOGGING
function D(msg) --{{{
    if DEBUG then
        d("|cFF00FF.QSB.DEBUG:|r "..msg)
    end
end
--}}}
function D_EVENT(eventName) --{{{
    if DEBUG then
        d("|cFF00FF.QSB.DEBUG: |c00FFFF"..eventName)
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

    -- LOAD SAVED SETTINGS
    QSB.Settings = ZO_SavedVars:NewAccountWide(
    "GreymindQuickSlotBarSettings"
    , QSB.SettingsVersion
    , nil
    , QSB.SettingsDefaults
    , "Default"
    )
    BuildSettingsMenu()

    -- EVENT HANDLERS
    zo_callLater(RegisterEventHandlers, 500)

end --}}}
function QSB.Update(...) --{{{
D("Update()")
    --if not QSB.Settings then return end

    -- Updates on each frame are not required:
    -- ...all changes are handled by RegisterEventHandlers synchronized handlers
    GreymindQuickSlotBarUI:SetHandler("OnUpdate", nil)
    D("Removed \"OnUpdate\" Event Handler")

end --}}}

function SelectNextAuto() --{{{
D("SelectNextAuto()")

    if not QSB.Settings.NextAuto              then return end
    if not IsEmptySlot(GetCurrentQuickslot()) then return end

    local slotIndex = GetCurrentQuickslot()
    local bNum      = Get_bNum_of_slotIndex( slotIndex )
    D("...bNum=["..bNum.."]")

    -- select next not empty slot
    local step     = 0
    local step_max = QSB.Settings.ButtonsDisplayed+1
    repeat
        step = step + 1
        bNum = bNum + 1
        bNum = math.fmod(bNum, step_max)

        slotIndex = Get_slotIndex_of_bNum( bNum )

    until not IsEmptySlot(slotIndex) or (step > step_max)

    D("...bNum=["..bNum.."] slotIndex=["..tostring(slotIndex).."]")

    if(bNum > 0) or (bNum <= QSB.Settings.ButtonsDisplayed) then
        PlaySoundSlotted("SelectNextAuto")
        SetCurrentQuickslot( Get_slotIndex_of_bNum(bNum) )
    else
        PlaySoundAlert("SelectNextAuto")
    end

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
        displayName         = SETTINGSPANELNAME,
        author              = "ivanwfr",
        version             = QSB.version,
        slashCommand        = nil,              --(optional) will register a keybind to open to this panel
        registerForRefresh  = true,             --boolean (optional) (will refresh all options controls when a setting is changed and when the panel is shown)
        registerForDefaults = true,             --boolean (optional) (will set all options controls back to default values)
	resetFunc           = Load_Defaults,	--(optional) custom function to run after settings are reset to defaults
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

    -- LockUI (Checkbox) --{{{
    control = {
        type        = "checkbox",
        reference   = "QSB_LockUI",
        name        = "Lock|r on screen",
        tooltip     = "Whether to allow moving and resizing Quick Slot Bar\n"
        ..COLOR4.."You can also Lock or Unlock with a mouse click on the UI's pin handle",
        getFunc     = function()
            return QSB.Settings.LockUI
        end,
        setFunc     = function(value)
            QSB.Settings.LockUI = value
            Refresh()
            Show()
        end,
        width       = "full",
        warning     = "Disabling the lock will "..COLOR2.."force UI visibility|r and the background to show so you can reposition it with guidance",
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
            --d("|c00FF00.GET:|r "..QSB.Settings.PresetName.." Visibility       =["..QSB.Settings.Visibility.."]") --FIXME_backfiring_issue
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
        warning     = "Will need to reload the UI.",	--(optional)
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep1", "")
    local KW_Button = COLOR1.."Button:|r "
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
    local KW_Visual_Cues = COLOR2.."Visual Cue:|r "
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
        warning     = "",
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
            if(value <= QSB.Settings.SlotItem.QuantityAlert) then
                value   = QSB.Settings.SlotItem.QuantityAlert+1
                clamped = not QSB.Panel:IsHidden()
            end
            QSB.Settings.SlotItem.QuantityWarning = value
            Refresh()
            Show()
            if clamped then Rebuild_LibAddonMenu() end
        end,
        width       = "full",
        warning     = "* must be higher than "..COLOR2.."Alert Quantity|r"
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
            if(value >= QSB.Settings.SlotItem.QuantityWarning) then
                value   = QSB.Settings.SlotItem.QuantityWarning-1
                clamped = not QSB.Panel:IsHidden()
            end
            QSB.Settings.SlotItem.QuantityAlert = value
            Refresh()
            Show()
            if clamped then Rebuild_LibAddonMenu() end
        end,
        width       = "full",
        warning     = "* must be lower than "..COLOR2.."Warning Quantity|r",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    --LAM:AddHeader(panel, "QSB_Sep4", "")
    local KW_Key_Bindings = COLOR3.."Key Bindings:|r "
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

    --LAM:AddHeader(panel, "QSB_Sep3", "")
    local KW_Label = COLOR4.."Label:|r "
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
    -- ALIGNH (Dropdown) --{{{

    control = {
        type        = "dropdown",
        reference   = "QSB_SlotItem_QuantityLabelPositionHorizontal",
        name        = KW_Label.."Quantity Position (Vertical)",
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
    -- Presets (Slider) --{{{

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
            D("getFunc |cFF0000.QSB_Presets|r: return "..value)
            return value
        end,
        setFunc     = function(value)
            value = tostring(value)
            D("setFunc |cFF0000.QSB_Presets|r: value="..value)
            for k, v in pairs(PRESETNAMES) do
                if string.match(v, tostring(value)) then
                    value = v
                    break
                end
            end
            SelectPreset(value)
            Refresh();
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Keybindings modifiers --{{{

    control = {
        type        = "button",
        reference   = "QSB_ModBingingsButton",
        name        = "Prepare Key Modifiers",
        tooltip     = "This is a 2 steps operation:\n"
        .."\n"
        .."1. This button will PREPARE this addon's  "..COLOR1.."EMPTY KEYBINDINGS|r"
        .." with "..COLOR2.."VIRTUAL KEY COMBINATIONS|r\n"
        .."\n"
        .."2. Then, you have to open the\n"
        ..COLOR3.."CONTROLS-Keybindings|r window"
        .."\nthat will let you select any "..COLOR4.."Shift|r"
        ..", "                             ..COLOR5.."Control|r"
        .." and "                          ..COLOR6.."Alt|r"
        .." key combinations.\n",
        func        = function()
            ApplyKeyBindingsModifier()
        end,
        width       = "full",
        warning     = COLOR1.."Brace yourself!|r This is not a friendly procedure, but it works!\n"
        .."\n"
        .."First you will have to click on "..COLOR2.."Not Bound|r keys"
        .." in the "..COLOR3.."CONTROLS-Keybinds|r window"
        .." which eventually show up as "..COLOR4.."SHIFT-F12 - F24|r you must redefine.\n"
        .."\n"
        .." Just another quest that could cost you a few calls to /reloadUI ... "
        .."Good luck!\n",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- GameActionButtonHide (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_DisableQuickSlotActionButton",
        name        = "Disable Default Quick Slot",
        tooltip     = "Whether to disable the game's default quick slot action button.\n"
        ..COLOR4.."When OFF, no hiding or showing this button will interfere.",
        getFunc     = function()
            return QSB.Settings.GameActionButtonHide;
        end,
        setFunc     = function(value)
            QSB.Settings.GameActionButtonHide = value;
            -- Apply new user choice
            GameActionButtonHideHandler(true)
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- NextAuto (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_NextAuto",
        name        = "Auto-select next not empty slot",
        tooltip     = "Whether the "..COLOR1.."next not empty slot|r should be automatically selected when current gets empty.\n"
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
        width       = "full",
    }


    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- NextPrevWrap (Checkbox) --{{{

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
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}

    -- ShowNumbers (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_ShowNumbers",
        name        = "Show Numbers On Slots",
        tooltip     = "Whether to show buttons number over the images in Quick Slot Bar",
        getFunc     = function()
            return QSB.Settings.SlotItem.ShowNumbers
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.ShowNumbers = value
            Refresh()
            Show()
        end,
        width       = "full",
    }


    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- ShowBackground (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_ShowBackground",
        name        = "Show Quick Bar Background",
        tooltip     = "Whether to show Quick Slot Bar background",
        getFunc     = function()
            return QSB.Settings.ShowBackground
        end,
        setFunc     = function(value)
            QSB.Settings.ShowBackground = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- SlotItem.HideSlotBackground (Checkbox) --{{{

    control = {
        type        = "checkbox",
        reference   = "QSB_SlotItem_ShowBackground",
        name        = "Hide buttons background",
        tooltip     = "Controls buttons background texture",
        getFunc     = function()
            return QSB.Settings.SlotItem.HideSlotBackground
        end,
        setFunc     = function(value)
            QSB.Settings.SlotItem.HideSlotBackground = value
            Refresh()
            Show()
        end,
        width       = "full",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
    --}}}
    -- Reset (Button) --{{{

--[[
    control = {
        type        = "button",
        reference   = "QSB_ResetButton",
        name        = "|CFF0000Reset|r",
        tooltip     = "Load default settings into|cFF0000 all Presets|r.",
        func        = function()
            Load_Defaults()
        end,
        width       = "full",
        warning     = "|cFF0000 NO CONFIRMATION ASKED!|r\nThis will also reload the UI",
    }

    QSB.SettingsControls[#QSB.SettingsControls+1] = control
--]]
    --}}}

    --}}}
    LAM:RegisterOptionControls(QSB.Name, QSB.SettingsControls)

end --}}}
function Are_Settings_Locked(option, value) --FIXME_backfiring_issue {{{
    if Settings_Locked then
        --d("|cAA0000.SET:|r "..tostring(QSB.Settings.PresetName)..": "..tostring(option).."=["..tostring(value).."] |cFF0000.REJECTED")
        return true
    else
        --d("|cFF0000.SET:|r "..tostring(QSB.Settings.PresetName)..": "..tostring(option).."=["..tostring(value).."]")
    end
end --}}}
function Release_Settings_Locked() --{{{
    Settings_Locked = false
--d("|c00AAAA.^^^^ SETTINGS UNLOCKED|r")  --FIXME_backfiring_issue
end

--}}}
function Rebuild_LibAddonMenu() --{{{
D("Rebuild_LibAddonMenu()")
    if not QSB.Panel:IsHidden() then
        ZO_OptionsWindow:SetHidden(true)
        LAM:OpenToPanel( QSB.Panel )
        ZO_OptionsWindow:SetHidden(false)
    end
end
--}}}

-- EVENT HANDLERS (gaming move resize)
function RegisterEventHandlers() --{{{
D("RegisterEventHandlers()")

    -- EVENT_ACTION_SLOT_UPDATED --{{{ (slotNum)
    -- update from quickslot wheel
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTION_SLOT_UPDATED"
    , EVENT_ACTION_SLOT_UPDATED
    , function(eventCode, slotNum)
        D("slotNum "..tostring(slotNum).." - ACTION_SLOT_UPDATED")
        SelectNextAuto()
        Refresh()
        Show()
    end)

    --}}}
    -- EVENT_ACTIVE_QUICKSLOT_CHANGED --{{{
    -- current quickslot selection changed (either from keybinds or wheel)
    EVENT_MANAGER:RegisterForEvent("GQSB.ACTIVE_QUICKSLOT_CHANGED"
    , EVENT_ACTIVE_QUICKSLOT_CHANGED
    , function(self)
        D("ACTIVE_QUICKSLOT_CHANGED")
        SelectNextAuto()
        Refresh()
        Show()
    end)

    --}}}
    -- EVENT_RETICLE_HIDDEN_UPDATE --{{{
    -- hide or show in sync with VIS_RETICLE
    EVENT_MANAGER:RegisterForEvent("GQSB.RETICLE_HIDDEN_UPDATE"
    , EVENT_RETICLE_HIDDEN_UPDATE
    , function(...)
        local isHidden = select(2,...)
        D_EVENT("RETICLE_HIDDEN_UPDATE: isHidden="..tostring(isHidden))
        ZO_OptionsWindow:SetHidden(true) -- may have been opened by handle
               QSB.Panel:SetHidden(true)

        if not QSB.Settings then return end

        -- always show when unlocked
        if not QSB.Settings.LockUI then
            Show()
            return
        end

        -- done with UI settings, get back to normal opacity
        if QSB.SomeSlotItemChanged then
            QSB.SomeSlotItemChanged = false
            Refresh()
        end

        -- Show / Hide

        if     QSB.Settings.Visibility == VIS_ALWAYS   then
            Show()

        elseif QSB.Settings.Visibility == VIS_COMBAT  then
            if not isHidden then Hide() end -- done with UI settings

        elseif QSB.Settings.Visibility == VIS_NEVER   then
            if not isHidden then Hide() end -- done with UI settings

        elseif QSB.Settings.Visibility == VIS_RETICLE then
            if(isHidden) then
                Hide()
            else
                Show()
            end
        end

        GameActionButtonHideHandler(false) -- Apply current user choice

    end)

    --}}}

    -- EVENT_PLAYER_COMBAT_STATE --{{{
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
                Hide()
            end
        end

        GameActionButtonHideHandler(false) -- Apply current user choice

    end)

    --}}}
    -- EVENT_KEYBINDING_SET --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.KEYBINDING_SET"
    , EVENT_KEYBINDING_SET
    , function(self)
        D_EVENT("KEYBINDING_SET")
        Refresh()
        Show()
    end)

    --}}}
    -- EVENT_KEYBINDING_CLEARED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.KEYBINDING_CLEARED"
    , EVENT_KEYBINDING_CLEARED
    , function(self)
        D_EVENT("KEYBINDING_CLEARED")
        Refresh()
        Show()
    end)

    --}}}

    -- EVENT_INVENTORY_SINGLE_SLOT_UPDATE --{{{ (bagId, slotId, isNewItem, itemSoundCategory)
    EVENT_MANAGER:RegisterForEvent("GQSB.INVENTORY_SINGLE_SLOT_UPDATE"
    , EVENT_INVENTORY_SINGLE_SLOT_UPDATE
    , function(event, bagId, slotId)
        D("bag "..bagId.." - slot "..slotId.." - INVENTORY_SINGLE_SLOT_UPDATE")
        if not bagId == 1 then return end
        SelectNextAuto()
        Refresh()
        GameActionButtonHideHandler(false) -- Apply current user choice
    end)

    --}}}
    -- EVENT_END_FAST_TRAVEL_INTERACTION --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.END_FAST_TRAVEL_INTERACTION"
    , EVENT_END_FAST_TRAVEL_INTERACTION
    , function(self)
        D_EVENT("END_FAST_TRAVEL_INTERACTION")
        Refresh()
    end)

    --}}}
    -- EVENT_END_FAST_TRAVEL_KEEP_INTERACTION --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.END_FAST_TRAVEL_KEEP_INTERACTION"
    , EVENT_END_FAST_TRAVEL_KEEP_INTERACTION
    , function(self)
        D_EVENT("END_FAST_TRAVEL_KEEP_INTERACTION")
        Refresh()
    end)

    --}}}
    -- EVENT_PLAYER_ACTIVATED --{{{
    EVENT_MANAGER:RegisterForEvent("GQSB.PLAYER_ACTIVATED"
    , EVENT_PLAYER_ACTIVATED
    , function(self)
        D_EVENT("PLAYER_ACTIVATED")
        Refresh()
    end)

    --}}}

    -- DELAYED UI DISPLAY
    Refresh()
    D(string.format("Version %s loaded", QSB.Version))

end --}}}
function OnMoveStart() --{{{
D("OnMoveStart")
    QSB.Moving = true
end --}}}
function OnMoveStop() --{{{
D("OnMoveStop")
    QSB.Moving = false

    UIWindowChanged()
    --Refresh()
end --}}}
function OnResizeStart() --{{{
D("OnResizeStart")
    QSB.Resizing = true
end --}}}
function OnResizeStop() --{{{
D("OnResizeStop")
    QSB.Resizing = false

    UIWindowChanged()
    Refresh()
end --}}}

-- LOCAL
function OnClicked_handle( handleName ) --{{{
D("OnClicked_handle("..tostring(handleName)..")")

    local arg
    if handleName == "L" then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
        Rebuild_LibAddonMenu()
        Refresh()
        Show()

    elseif handleName == "S" then
        local is_hidden = ZO_OptionsWindow:IsHidden()

        ZO_GameMenu_InGame:SetHidden( not is_hidden )
        ZO_OptionsWindow  :SetHidden( not is_hidden )

        if is_hidden then
            LAM:OpenToPanel( QSB.Panel )
        else
            QSB.Panel     :SetHidden( not is_hidden )
        end

    elseif    string.match(handleName, "P([1-5])") then
        arg = string.match(handleName, "P([1-5])")

        SelectPreset( PRESETNAMES[ tonumber(arg) ] )
        Refresh();
        Show()

    end

end --}}}

function OnMouseEnter() --{{{
--D("OnMouseEnter")
    if not QSB.UIHandles then return end

    if QSB.Settings.LockUI then
        QSB.UIHandles.L:SetColor(0,1,0) -- green = may unlock
    else
        QSB.UIHandles.L:SetColor(1,0,0) -- red   = should lock
    end
    ShowUIHandles()

end --}}}
function OnMouseExit() --{{{
--D("OnMouseExit")
    if not QSB.UIHandles then return end

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
local o
function OnSlashCommand(arg)
d("GQSB("..arg..") |c00FFFF["..QSB.Version.." + LibAddonMenu-2.0-r17]|r Update 6 (API 100011)")

    local presetName = ""
    local lua_expr

    -- help --{{{
    if (arg ==       "")
    or (arg ==   "help")
    or (arg ==  "-help")
    or (arg ==  "-h"   )
    or (arg == "--h"   )
    then
        d(QSB_SLASH_COMMAND..    " p1-p5 ... select Presets "..PRESETNAMES[1].." to "..PRESETNAMES[5].." (current = "..QSB.Settings.PresetName..")")
        d(QSB_SLASH_COMMAND.. " settings ... toggle Settings Panel")
        d(QSB_SLASH_COMMAND..     " lock ... toggle UI lock")
        d(QSB_SLASH_COMMAND.." clearchat ... clears all chat windows")
        d(QSB_SLASH_COMMAND..  " refresh ... rebuild and redisplay UI")
        d(QSB_SLASH_COMMAND..    " reset ... RESETS ALL SETTINGS TO DEFAULT")
        d(QSB_SLASH_COMMAND..    " debug")
        d(QSB_SLASH_COMMAND..  " _G[...] ... dumps global variable")
        --d(QSB_SLASH_COMMAND.." kbclr ... Clear all KeyBindings (protected, wont work)")
        --d(QSB_SLASH_COMMAND.." kbmod ... Apply KeyBindings Modifier")

    --}}}
    -- hide show refresh reset p1-5 kbclr kbmod {{{
    elseif(arg == "hide"   ) then Hide()
    elseif(arg == "show"   ) then Show()
    elseif(arg == "debug"  ) then DEBUG = not DEBUG; d("...DEBUG=[" .. tostring(DEBUG) .. "]")
    elseif(arg == "refresh") then Refresh()
    elseif(arg == "reset"  ) then Load_Defaults()

    elseif(arg == "p1") then presetName = PRESETNAMES[1]
    elseif(arg == "p2") then presetName = PRESETNAMES[2]
    elseif(arg == "p3") then presetName = PRESETNAMES[3]
    elseif(arg == "p4") then presetName = PRESETNAMES[4]
    elseif(arg == "p5") then presetName = PRESETNAMES[5]

    elseif(arg == "kbclr"  ) then ClearKeyBindings()
    elseif(arg == "kbmod"  ) then ApplyKeyBindingsModifier()
    --}}}
    -- lock {{{
    elseif(arg == "lock"  ) then
        QSB.Settings.LockUI = not QSB.Settings.LockUI
        Rebuild_LibAddonMenu()
        Refresh()
        Show()

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
    -- LUA -- (/script-like commands) --{{{
    else
        local f, e, r
        -- _G[...] --{{{
        lua_expr = string.match(arg, "_G%[(.*)%]")
        if lua_expr then
            o = _G[lua_expr]

            if(type( o ) == 'table') then
                for k,v in pairs( o ) do
                    d("...|CFFFFFF"..k..'|r=|CFF0000'..tostring(v)..'|r (|CC000FFFF'..type(v)..'|r)')
                end
            end

            d("o=_G[|c00FF00"..             lua_expr   .."|r]"
            ..    "=|C00FFFF".. tostring(_G[lua_expr]) .."|r")
        end
        --}}}
        -- o=... --{{{
        lua_expr = string.match(arg, "^o%s*=%s*(.*)")
        if lua_expr then

            f = assert( zo_loadstring("o="..lua_expr.."; return o;") )
            if f then
                local r = f(lua_expr)
                if(r) then d("...f()=[|C00FF00"..tostring(r).."|r]") end
            end

        end
        --}}}
        -- lua... --{{{
        lua_expr = string.match(arg, "^lua(.*)")
        if lua_expr then

            if(lua_expr ~= "") then lua_expr = lua_expr.."; " end
            d(      "...zo_loadstring( |cFFFFFF\""..lua_expr.."|r)")
            lua_expr = lua_expr.."return type(o or nil)..':'..tostring(o or nil)"
            f = assert( zo_loadstring(              lua_expr     ) )
            if f then
                local r = f(o)
                d("...f()=[|C00FF00"..tostring( r ).."|r]")
            end

        end
        --}}}
    end --}}}

    -- CHANGE PRESET {{{
    if presetName ~= "" then
        SelectPreset( presetName )
        Refresh();
        Show()
    end
    --}}}

end --}}}

GreymindQuickSlotBar = QSB
EVENT_MANAGER:RegisterForEvent(GreymindQuickSlotBar.Name, EVENT_ADD_ON_LOADED, Initialize)

