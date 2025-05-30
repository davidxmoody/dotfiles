local function uppercaseFirstLetter(input)
  return input:gsub("^%l", string.upper)
end

local function abbrev(lhs, rhs)
  vim.cmd({cmd = "inoreabbrev", args = {"<buffer>", lhs, rhs}})
end

local function upperAbbrev(lhs, rhs)
  abbrev(lhs, rhs)
  abbrev(uppercaseFirstLetter(lhs), uppercaseFirstLetter(rhs))
end

local function defineCustomAbbreviations()
  upperAbbrev("i", "I")
  upperAbbrev("id", "I'd")
  upperAbbrev("im", "I'm")
  upperAbbrev("iv", "I've")
  upperAbbrev("il", "I'll")
  upperAbbrev("hev", "however")
  upperAbbrev("cant", "can't")
  upperAbbrev("dont", "don't")
  upperAbbrev("didnt", "didn't")
  upperAbbrev("isnt", "isn't")
  upperAbbrev("wont", "won't")
  upperAbbrev("havent", "haven't")
  upperAbbrev("hasnt", "hasn't")
  upperAbbrev("hadnt", "hadn't")
  upperAbbrev("arent", "aren't")
  upperAbbrev("wasnt", "wasn't")
  upperAbbrev("werent", "weren't")
  upperAbbrev("doesnt", "doesn't")
  upperAbbrev("couldnt", "couldn't")
  upperAbbrev("wouldnt", "wouldn't")
  upperAbbrev("shouldnt", "shouldn't")
end

local function setupAutoCapitalization()
  vim.api.nvim_create_augroup("auto_capitalize", {clear = true})
  vim.api.nvim_create_autocmd("InsertCharPre", {
    group = "auto_capitalize",
    buffer = 0,
    callback = function()
      if vim.fn.search("\\v^%#|^\\s*-\\s+%#|^#+\\s+%#|[.!?]\\s+%#", "bcnW",
        vim.fn.line(".")) ~= 0 then
        vim.v.char = string.upper(vim.v.char)
      end
    end,
  })
end

local function setupHeaderTimes()
  vim.cmd({cmd = "inoreabbrev", args = {"##", "<C-R>=strftime('## %H:%M')<CR>"}})
end

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "diary-*.md",
  callback = function()
    defineCustomAbbreviations()
    setupAutoCapitalization()
    setupHeaderTimes()
  end,
})
