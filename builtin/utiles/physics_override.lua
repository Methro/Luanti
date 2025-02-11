-- Credits to Lizzy Fleckenstein
-- lgpl license

local legit_override

core.register_globalstep(function()
    if not legit_override then return end
    if not core.localplayer then return end

    if core.settings:get_bool("overrides") then
        local override = core.localplayer:get_physics_override()
        override.sneak_glitch = core.settings:get_bool("overrides.sneak_glitch")
        override.new_move = not core.settings:get_bool("overrides.old_movement")
        core.localplayer:set_physics_override(override)
    else

        local override = core.localplayer:get_physics_override()
        override.sneak_glitch = legit_override.sneak_glitch
        override.new_move = legit_override.new_move
        core.localplayer:set_physics_override(override)
    end

    if core.settings:get_bool("overrides.old_movement") then
        core.settings:set_bool("overrides.sneak_glitch", true)
    end
end)


core.register_on_recieve_physics_override(function(override)
    legit_override = override
    return true
end)
