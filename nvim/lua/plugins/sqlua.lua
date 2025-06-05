return {
    'xemptuous/sqlua.nvim',
    -- enabled = false,
    lazy = true,
    cmd = 'SQLua',
    config = function() require('sqlua').setup() end
}
