local Terminal = require('toggleterm.terminal').Terminal

-- Custom terminal that auto-activates .venv if it exists
local function get_python_terminal()
    local activate_script = '.venv/bin/activate'
    local cmd = ''

    -- Check if the .venv activate file exists
    if vim.fn.filereadable(activate_script) == 1 then
        cmd = 'source ' .. activate_script .. ' && exec $SHELL'
    else
        cmd = 'exec $SHELL'
    end

    return Terminal:new({
        cmd = cmd,
        direction = 'horizontal',
        close_on_exit = true,
        hidden = true,
    })
end

-- Map it to <leader>t
vim.keymap.set('n', '<leader>t', function()
    get_python_terminal():toggle()
end, { desc = 'Toggle Terminal' })

local function get_tab_terminal()
    local activate_script = '.venv/bin/activate'
    local cmd = ''

    -- Check if the .venv activate file exists
    if vim.fn.filereadable(activate_script) == 1 then
        cmd = 'source ' .. activate_script .. ' && exec $SHELL'
    else
        cmd = 'exec $SHELL'
    end

    local file = vim.fn.expand('%')
    return Terminal:new({
        cmd = cmd,
        direction = 'tab',
        close_on_exit = true,
        hidden = true,
        on_open = function(term)
            local term_chan = term.job_id
            local run_cmd = 'python ' .. file
            -- Send it to the terminal
            vim.fn.chansend(term_chan, run_cmd .. '\n')
        end,
    })
end

vim.keymap.set('n', '<leader>r', function()
    get_tab_terminal():toggle()
end, { desc = 'Run the current file' })
