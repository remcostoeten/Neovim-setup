return {
  "David-Kunz/gen.nvim",
  event = "VeryLazy",
  config = function()
    require("gen").setup({
      model = "codellama:7b-instruct-q4_K_M", -- The model to use (you can change this)
      host = "localhost", -- The host running the Ollama service
      port = "11434", -- The port on which the Ollama service is listening
      quit_map = "q", -- set keymap to close the response window
      retry_map = "<c-r>", -- set keymap to re-send the current prompt
      init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
      -- Function to initialize Ollama
      command = function(options)
        local body = {model = options.model, stream = true}
        return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
      end,
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped)
      -- This can also be a command string.
      -- The executed command must return a JSON object with { response, context }
      -- (context is optional).
      -- list_models = '<omitted lua function>', -- Retrieves a list of model names
      display_mode = "float", -- The display mode. Can be "float" or "split" or "horizontal-split".
      show_prompt = false, -- Shows the prompt submitted to Ollama.
      show_model = false, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      debug = false, -- Prints errors and the command which is run.
    })

    -- Custom prompts
    require("gen").prompts["Fix_Code"] = {
      prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    require("gen").prompts["Explain_Code"] = {
      prompt = "Explain the following $filetype code:\n```$filetype\n$text\n```",
      replace = false
    }

    require("gen").prompts["Optimize_Code"] = {
      prompt = "Optimize the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    require("gen").prompts["Add_Comments"] = {
      prompt = "Add helpful comments to the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      replace = true,
      extract = "```$filetype\n(.-)```"
    }

    require("gen").prompts["Generate_Tests"] = {
      prompt = "Generate unit tests for the following $filetype code:\n```$filetype\n$text\n```",
      replace = false
    }
  end,
  keys = {
    { "<leader>gg", ":Gen<CR>", mode = { "n", "v" }, desc = "Gen AI prompt" },
    { "<leader>gf", ":Gen Fix_Code<CR>", mode = { "n", "v" }, desc = "Fix code with AI" },
    { "<leader>ge", ":Gen Explain_Code<CR>", mode = { "n", "v" }, desc = "Explain code with AI" },
    { "<leader>go", ":Gen Optimize_Code<CR>", mode = { "n", "v" }, desc = "Optimize code with AI" },
    { "<leader>gc", ":Gen Add_Comments<CR>", mode = { "n", "v" }, desc = "Add comments with AI" },
    { "<leader>gt", ":Gen Generate_Tests<CR>", mode = { "n", "v" }, desc = "Generate tests with AI" },
  },
}
