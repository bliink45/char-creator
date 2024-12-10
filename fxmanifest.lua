fx_version 'cerulean'
game 'gta5'

name 'Character Creator'
description 'A script using RageUI'

client_scripts {
    -- Core
    '@RageUI/RMenu.lua',

    -- Components
    '@RageUI/components/Audio.lua',
    '@RageUI/components/Enum.lua',
    '@RageUI/components/Keys.lua',
    '@RageUI/components/Rectangle.lua',
    '@RageUI/components/Sprite.lua',
    '@RageUI/components/Text.lua',
    '@RageUI/components/Visual.lua',

    -- Core Menu
    '@RageUI/menu/RageUI.lua',
    '@RageUI/menu/Menu.lua',
    '@RageUI/menu/MenuController.lua',

    -- Elements
    '@RageUI/menu/elements/ItemsBadge.lua',
    '@RageUI/menu/elements/ItemsColour.lua',
    '@RageUI/menu/elements/PanelColour.lua',

    -- Items
    '@RageUI/menu/items/UIButton.lua',
    '@RageUI/menu/items/UICheckBox.lua',
    '@RageUI/menu/items/UIInfo.lua',
    '@RageUI/menu/items/UILine.lua',
    '@RageUI/menu/items/UIList.lua',
    '@RageUI/menu/items/UISeparator.lua',
    '@RageUI/menu/items/UISlider.lua',
    '@RageUI/menu/items/UISliderHeritage.lua',
    '@RageUI/menu/items/UISliderProgress.lua',

    -- Panels
    '@RageUI/menu/panels/UIColourPanel.lua',
    '@RageUI/menu/panels/UIGridPanel.lua',
    '@RageUI/menu/panels/UIPercentagePanel.lua',
    '@RageUI/menu/panels/UISliderPanel.lua',
    '@RageUI/menu/panels/UISpritPanel.lua',
    '@RageUI/menu/panels/UIStatisticsPanel.lua',

    -- Windows
    '@RageUI/menu/windows/UIHeritage.lua',

    'client/menus/main-menu.lua',
    'client/menus/components/*.lua',
    'client/display-menu.lua',
    'client/client.lua'
}

server_scripts {
    'server/**/*.lua'
}

dependencies {
    'RageUI'
}
