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

local store = require("store")
local output = require("output")
local fields = require("fields")

local M = {}
local function create (type, args, config) -- {{{
    local item = {} -- create new item
    item.type = type

    fields.dispatch(args, config, item) -- hand it off to get it populated

    store.save_item(item, config.datafile_path) -- add to the tree
end
-- }}}

M.create_todo = function (args, config) -- {{{
    create('todo', args, config)
end
-- }}}

M.create_note = function (args, config) -- {{{
    create('note', args, config)
end
-- }}}

M.create_tag = function (args, config) -- {{{
    create('tag', args, config)
end
-- }}}

M.done = function () -- {{{
    print("done")
end
-- }}}

M.delete = function () -- {{{
    print("delete")
end
-- }}}

M.modify = function () -- {{{
    print("modify")
end
-- }}}

M.output = function (_, config) -- {{{
    local data = store.load(config.datafile_path)
    output.print_all(data, config.indentation)
end
-- }}}


return M

-- vim:foldmethod=marker