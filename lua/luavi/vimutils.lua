vimutils = {}

vimutils.constant = "hello"

function table.has_key(table, key)
    for key, value in pairs(table) do
        if key == key then
            return true
        end
    end
    return false
end

local is_nvim = table.has_key(vim, 'api')

function vimutils.command(cmd)
    if is_nvim then
        vim.api.nvim_command(cmd)
    else
        vim.command(cmd)
    end
end


function vimutils.eval(expr)
    if is_nvim then
        return vim.api.nvim_eval(expr)
    else
        return vim.eval(expr)
    end
end


function vimutils.get_current_line()
    if is_nvim then
        return vim.api.nvim_get_current_line()
    else
        return vim.window().line
    end
end


function vimutils.current_buffer()
    if is_nvim then
        return vim.api.nvim_buf_get_lines(vim.api.nvim_get_current_buf(), 0, -1, 0)
    else
        return vim.window().buffer
    end
end

function vimutils.current_linenr()
    return vimutils.eval('line(".")')
end

return vimutils
