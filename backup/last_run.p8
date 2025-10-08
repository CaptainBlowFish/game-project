pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
--menu system
--Jacob Milham

function _init()
    cls()
    thing= function() return print("menu item chosen",0,0) end
    menu = make_menu({"test","test 2"},{thing,thing })
    frame = 0
    selected_menu_item = 1
    toggle_hover_menu_item(menu,selected_menu_item)
end

function _update()
    
    if btnp(⬇️) then
        cls()
        toggle_hover_menu_item(menu,selected_menu_item)
        if (selected_menu_item<#menu) selected_menu_item+=1
        toggle_hover_menu_item(menu,selected_menu_item)
    end 
    if btnp(⬆️) then
        cls()
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

function make_menu(menu_item_names,menu_item_functions,start_x,start_y,spacing,item_height,color,background_color,highlight_color)
    --returns a list of all the start menu items
    local start_x = start_x or 36
    local start_y = start_y or 8
    local spacing = spacing or 16
    local item_height = item_height or 8
    local color = color or 7
    local background_color = background_color or 6
    local highlight_color = highlight_color or 5
    local menu = {}
    
    add(menu,make_menu_item(menu_item_names[1] ,start_x, start_y, menu_item_functions[1],color,background_color,highlight_color)) --initial loop
    for item=1,#menu_item_names -1 do
        add(menu,make_menu_item(menu_item_names[item+1], start_x, start_y+item_height*item+spacing*item, menu_item_functions[item+1],color,background_color,highlight_color))
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
        color = color,
        background_color = background_color,
        highlight_color = highlight_color,
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

exit_start_menu = function() 
    main_menu = false
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
