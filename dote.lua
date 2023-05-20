#!/usr/bin/env lua

-- {{{ License
 -- Copyright (C) 2023 Spider Forrest & Allie Zhao
 -- contact: dote@spood.org
 --
 -- This program is free software: you can redistribute it and/or modify
 -- it under the terms of the GNU Affero General Public License as published
 -- by the Free Software Foundation, either version 3 of the License, or
 -- (at your option) any later version.
 --
 -- This program is distributed in the hope that it will be useful,
 -- but WITHOUT ANY WARRANTY; without even the implied warranty of
 -- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 -- GNU Affero General Public License for more details.
 --
 -- You should have received a copy of the GNU Affero General Public License
 -- along with this program, at /LICENSE. If not, see <https://www.gnu.org/licenses/>.
 -- }}}
 --
local function demo() -- {{{ demo code
    local tbl = { key = "value", 2 }
    io.write("basic echo, will say whatever back in red\n")
    local input = io.read("*line")
    io.write('\27[31m' .. json.stringify(tbl) ..'\n')
    io.write('\27[31m' .. input ..'\n')
    io.write('\27[31m' .. arg[1] ..'\n')
end --}}}

-- {{{ spec
--[[
dote [action] [target...] [data...]

actions:
create
done
delete
modify

target:
(for modify:) entity field

data:
<field char>data
: for body?
-- ]]

-- special arg check for -c (to change config dir)
-- load configs (lua obvs)
-- parse args
-- load datafile(check with user if none)
-- do the action
-- save/output
-- }}}

local json = require("json") -- import json lib
local config_lib = require("config_lib")



-- {{{ find/load config
-- set default config location
local function load_config()
    local config_location = os.getenv("HOME") .. "/.config/dote/config.lua"
    -- iterate thru args and check if the config location is specified
    for i, v in ipairs(arg) do
        if v == "-c" then
            if arg[i+1] == nil then -- if -c flag passed by itself
                io.write("The flag -c requires a path\n")
                os.exit()
            end
            config_location = arg[i + 1]
            table.remove(arg,i)
            table.remove(arg,i) -- removing both "-c" and the path specified after it so we remove twice
        end
    end

    print(config_location)
    -- load configs, error out if no config file found
    local config_module
    if not pcall(function () config_module = dofile(config_location) end) then
        io.write("Config file not found! Default location is ~/.config/dote/init.lua\n")
        os.exit()
    end
end
-- }}}

-- load user data from json file
local function load_data_file()
    local data_json = io.open(config_lib.data_file_location, "r"):read("*all")
    return json.parse(data_json)
end


load_config()

-- {{{ parse action arguments
-- check that the arg is a match for accepted args
if config_lib.action_commands[arg[1]] == nil then
    -- if called with no args
    if arg[1] == nil then
        config_lib.output()
    else
        print(tostring(config_lib.action_commands['todo']))
        config_lib.action_commands[config_lib.default_action]()
    end
else
    -- execute correlated function
    config_lib.action_commands[arg[1]]()
end


-- }}}


-- vim:foldmethod=marker
