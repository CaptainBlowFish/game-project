pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
--menu system
--Jacob Milham

function _init()
    menu = make_start_menu()
    frame = 0
    selected_menu_item = 1
    toggle_hover_menu_item(menu,selected_menu_item)
end

function _update()
    
    if btnp(⬇️) then
        toggle_hover_menu_item(menu,selected_menu_item)
        if (selected_menu_item<#menu) selected_menu_item+=1
        toggle_hover_menu_item(menu,selected_menu_item)
    end 
    if btnp(⬆️) then
        toggle_hover_menu_item(menu,selected_menu_item)
        if (selected_menu_item>1) selected_menu_item-=1
        toggle_hover_menu_item(menu,selected_menu_item)
    end 
    if btnp(❎) or btnp(🅾️) then 
        menu[selected_menu_item].function_call()
    end
end

function _draw()
    
    show_menu(menu)
end
-->8
--start menu
function show_menu(menu)
    --displays the passed menu
    for item=1,#menu do
        rectfill(menu[item].x,menu[item].y,menu[item].x+menu[item].width,menu[item].y+menu[item].height,menu[item].background_color)
        rect(menu[item].x,menu[item].y,menu[item].x+menu[item].width,menu[item].y+menu[item].height,menu[item].highlight_color)
        print(menu[item].text,menu[item].text_x, menu[item].text_y,menu[item].color)
    end
end 
function toggle_hover_menu_item(menu,index)
    --shows that a menu item is being hovered over graphically
    local old_item = menu[index]
    menu[index].highlight_color, menu[index].background_color =old_item.background_color, old_item.highlight_color
end

function make_start_menu(start_x,start_y,spacing,item_height)
    --returns a list of all the start menu items
    local start_x = start_x or 36
    local start_y = start_y or 8
    local spacing = spacing or 16
    item_height = item_height or 8
    local menu = {}
    local menu_item_names = {"sTART","2 pLAYERS","cREDDITS"} --lower and upper case are swapped inside pico-8
    local menu_item_functions = {load_other_game,}
    
    add(menu,make_menu_item(menu_item_names[1] ,start_x, start_y, menu_item_functions[1])) --initial loop
    for item=1,#menu_item_names -1 do
        add(menu,make_menu_item(menu_item_names[item+1], start_x, start_y+item_height*item+spacing*item, menu_item_functions[item+1]))
    end
    return menu
end

function make_menu_item(text,x,y,function_to_call,color,background_color,highlight_color,width,height)
    local button = {
        text = text or "tEST",
        x = x or 8,
        y = y or 8,
        width = width or 56,
        height = height or 12,
        color = color or 7,
        background_color = background_color or 6,
        highlight_color = highlight_color or 5,
        text_x = x or 8,
        text_y = y or 8,
        function_call = function_to_call
    }
    button.text_x += button.width/2--moves it to the center of the button
    button.text_x -= (#button.text)*2--offsets it so the center of the text when displayed will be in the center. each character is ~4px 
    button.text_y += button.height/2
    button.text_y -= 3 --each charater is ~5px tall so half of that

    return button
end
-->8
--other game
function load_other_game() 
    load('platformer',"back to menu",true)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
