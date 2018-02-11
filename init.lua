cubeColor = "ffff00"

minetest.register_node("housemod:cubec", {
    description = "Nodevoxel cube Controller " .. cubeColor,
    tiles = {
        "nodevoxel_cube_up_c.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_down_c.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_right_c.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_left_c.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_back_c.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_front_c.png^[colorize:#" .. cubeColor .. "50"
},
    is_ground_content = true,

    groups = {
        cracky = 3
    },
    
    on_punch = function(pos, node, player, pointed_thing)
 
		local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
        local errorposcube = 1
       
        print(" " .. tostring(pos.x) .. " " .. tostring(pos.y) .. " " .. tostring(pos.z) .. " " )  

        local player_name = player:get_player_name()

        -- Same opposite cube
		if minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z}):get_string("type") == "X" and
		   minetest.get_meta({x = pos.x - 1, y = pos.y, z = pos.z}):get_string("type") == "X" then
		        print("Same opposite cube : X")
                minetest.chat_send_player(player_name, "Same opposite cube : X")
		        errorposcube = 0
		        return false
		end
		       
		if minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}):get_string("type") == "Y" and
		   minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}):get_string("type") == "Y" then
		        print("Same opposite cube : Y")
                minetest.chat_send_player(player_name, "Same opposite cube : Y")
		        errorposcube = 0
		        return false		        
		end		       


  
		if minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1}):get_string("type") == "Z" and
		   minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1}):get_string("type") == "Z" then
		        print("Same opposite cube : Z")
                minetest.chat_send_player(player_name, "Same opposite cube : Z")
		        errorposcube = 0
		        return false		        
		end	

		-- Bad position cube       
		       
		if minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z}):get_string("type") == "Y" or
		   minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z}):get_string("type") == "Z" then
		        print("Bad position cube : (Y | Z) instead of X")
                minetest.chat_send_player(player_name, "Bad position cube : (Y | Z) instead of X")
		        errorposcube = 0
		        return false		        
		end			       

		if minetest.get_meta({x = pos.x - 1, y = pos.y, z = pos.z}):get_string("type") == "Y" or
		   minetest.get_meta({x = pos.x - 1, y = pos.y, z = pos.z}):get_string("type") == "Z" then
		        print("Bad position cube : (Y | Z ) instead of X")
                minetest.chat_send_player(player_name, "Bad position cube : (Y | Z ) instead of X")
		        errorposcube = 0
		        return false		        
		end	

		if minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}):get_string("type") == "X" or
		   minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}):get_string("type") == "Z" then
		        print("Bad position cube : (X | Z ) instead of Y")
                minetest.chat_send_player(player_name, "Bad position cube : (X | Z ) instead of Y")
		        errorposcube = 0
		        return false		        
		end			       

		if minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}):get_string("type") == "X" or
		   minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}):get_string("type") == "Z" then
		        print("Bad position cube : (X | Z ) instead of Y")
                minetest.chat_send_player(player_name, "Bad position cube : (X | Z ) instead of Y")
		        errorposcube = 0
		        return false		        
		end	


		if minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1}):get_string("type") == "X" or
		   minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1}):get_string("type") == "Y" then
		        print("Bad position cube : (X | Y) instead of Z")
                minetest.chat_send_player(player_name, "Bad position cube : (X | Y) instead of Z")
		        errorposcube = 0
		        return false
		end			       

		if minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1}):get_string("type") == "X" or
		   minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1}):get_string("type") == "Y" then
		        print("Bad position cube : (X | Y) instead of Z")
                minetest.chat_send_player(player_name, "Bad position cube : (X | Y) instead of Z")
		        errorposcube = 0
		        return false
		end	

        -- Compute direction
        local directionx = 0
        local directiony = 0
        local directionz = 0

        if minetest.get_meta({x = pos.x - 1, y = pos.y, z = pos.z}):get_string("type") == "X" then 
            directionx = -1
        end

        if minetest.get_meta({x = pos.x + 1, y = pos.y, z = pos.z}):get_string("type") == "X" then 
            directionx = 1
        end

        if minetest.get_meta({x = pos.x, y = pos.y - 1, z = pos.z}):get_string("type") == "Y" then 
            directiony = -1
        end

        if minetest.get_meta({x = pos.x, y = pos.y + 1, z = pos.z}):get_string("type") == "Y" then 
            directiony = 1
        end

        if minetest.get_meta({x = pos.x, y = pos.y, z = pos.z - 1}):get_string("type") == "Z" then 
            directionz = -1
        end

        if minetest.get_meta({x = pos.x, y = pos.y, z = pos.z + 1}):get_string("type") == "Z" then 
            directionz = 1
        end

        --print("DirectionX: " .. directionx .. " DirectionY: " .. directiony .. " DirectionZ: " .. directionz)
        
        if errorposcube == 1 then
            

            minetest.show_formspec(player:get_player_name(),"fs",
                "size[6,7;]"..
                "background[-0.5,-0.5;7,8;mysoundblocks_bg.png]"..
               
                "field[1,1;2,1;sizex;X;1]" ..
                "field[1,2;2,1;sizey;Y;1]" ..
                "field[1,3;2,1;sizez;Z;1]" ..
                "button_exit[0.75,6.25;1.5,1;ent;Validate]"
            )
        end


         minetest.register_on_player_receive_fields(function(player, formname, fields)

                    local meta = minetest.get_meta(pos)
                    local inv = meta:get_inventory()
                    local sizex = fields["sizex"]
                    local sizey = fields["sizey"]
                    local sizez = fields["sizez"]

                    print("DirectionX: " .. directionx .. " DirectionY: " .. directiony .. " DirectionZ: " .. directionz)

                    if fields["ent"] or fields["sizex"] or fields["sizey"] or fields["sizez"] then

                         if fields["ent"] and fields["sizex"] ~= "" and fields["sizey"] ~= "" and fields["sizez"] ~= "" then
                            print("sizex " .. sizex .. " sizey " .. sizey .. " sizez " .. sizez)

                            print("Build wall")                

                            for i = 0, (sizex - 1) do
                            
                                if directionx == -1 then
                                    i = 0 - i
                                end
    
                                for j = 0, (sizey - 1) do
                                
                                    if directiony == -1 then
                                        j = 0 - j
                                    end                                       
                            
                                    for k = 0, (sizez - 1) do

                                        
                                        if directionz == -1 then
                                            k = 0 - k
                                        end 
                                              
                                        print("dx: " .. directionx .. " i: " .. i .. " j: " .. j .. " k:" .. k)                                        
                                        minetest.set_node({x=pos.x + i, y=pos.y + j , z=pos.z + k}, {name="default:wood"}   )   

                                    end
                                end
                            end

                            return true
                        end
                    else
                        return
                    end

        end)




   end,      
    

   
   on_construct = function(pos)
        local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)   
        meta:set_string("type", "C"); 
        print(" " .. tostring(pos.x) .. " " .. tostring(pos.y) .. " " .. tostring(pos.z) .. " " )    
   end
})

minetest.register_node("housemod:cubex", {
    description = "Nodevoxel cube X " .. cubeColor,
    tiles = {
        "nodevoxel_cube_up_x.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_down_x.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_right_x.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_left_x.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_back_x.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_front_x.png^[colorize:#" .. cubeColor .. "50"
},
    is_ground_content = true,

    groups = {
        cracky = 3
    },
    

   on_construct = function(pos)
        local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)   
        meta:set_string("type", "X"); 
        print(" " .. tostring(pos.x) .. " " .. tostring(pos.y) .. " " .. tostring(pos.z) .. " " )  
   end
   
})


minetest.register_node("housemod:cubey", {
    description = "Nodevoxel cube Y " .. cubeColor,
    tiles = {
        "nodevoxel_cube_up_y.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_down_y.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_right_y.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_left_y.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_back_y.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_front_y.png^[colorize:#" .. cubeColor .. "50"
},
    is_ground_content = true,

    groups = {
        cracky = 3
    },
    
    

   on_construct = function(pos)
        local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)
        meta:set_string("type", "Y"); 
        print(" " .. tostring(pos.x) .. " " .. tostring(pos.y) .. " " .. tostring(pos.z) .. " " )          
   end
   
})

minetest.register_node("housemod:cubez", {
    description = "Nodevoxel cube Z " .. cubeColor,
    tiles = {
        "nodevoxel_cube_up_z.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_down_z.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_right_z.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_left_z.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_back_z.png^[colorize:#" .. cubeColor .. "50",
        "nodevoxel_cube_front_z.png^[colorize:#" .. cubeColor .. "50"
},
    is_ground_content = true,

    groups = {
        cracky = 3
    },

   on_construct = function(pos)
        local node = minetest.get_node(pos)
		local meta = minetest.get_meta(pos)   
         meta:set_string("type", "Z"); 
        print(" " .. tostring(pos.x) .. " " .. tostring(pos.y) .. " " .. tostring(pos.z) .. " " )           
   end      
})

