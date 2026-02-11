local lsp = require('lsp-zero')

-- Function to evaluate a mathematical expression from a string
function evaluate_expression(expr)
  local success, result = pcall(load("return " .. expr))  -- using pcall to safely evaluate the expression
  if success then
    return result
  else
    return nil, "Invalid expression"
  end
end

-- Custom handler to check for CALC: expressions in comments
function custom_diagnostics_handler(_, diagnostics, ctx, config)
  local new_diagnostics = {}

  for _, diagnostic in ipairs(diagnostics) do
    -- Only process diagnostics that are in comments
    local line = vim.api.nvim_buf_get_lines(ctx.bufnr, diagnostic.lnum, diagnostic.lnum + 1, false)[1]
    
    -- Check if the line contains the CALC: keyword
    if line and line:match("// CALC:") then
      -- Extract the arithmetic expression after "// CALC:"
      local expr = line:match("// CALC:%s*(.*)")

      if expr then
        -- Evaluate the expression
        local calc_result, error = evaluate_expression(expr)
        if calc_result then
          -- Create a custom diagnostic with the result of the calculation
          table.insert(new_diagnostics, {
            lnum = diagnostic.lnum,
            col = diagnostic.col,
            severity = vim.diagnostic.severity.WARN,
            message = string.format("Calculation result: %s", calc_result),
            source = "custom-lsp-rule",
          })
        else
          -- Create a diagnostic for invalid expression
          table.insert(new_diagnostics, {
            lnum = diagnostic.lnum,
            col = diagnostic.col,
            severity = vim.diagnostic.severity.ERROR,
            message = string.format("Invalid calculation: %s", error),
            source = "custom-lsp-rule",
          })
        end
      end
    end
  end

  -- Ensure `ctx.bufnr` is valid before calling vim.diagnostic.set
  if ctx.bufnr then
    -- Call vim.diagnostic.set to update diagnostics with the new ones
    vim.diagnostic.set(ctx.client_id, ctx.bufnr, new_diagnostics)
  else
    print("Error: Invalid buffer number (bufnr is nil).")
  end
end


require'lspconfig'.clangd.setup{
  handlers = {
    ["textDocument/publishDiagnostics"] = custom_diagnostics_handler,
  },
}

