return {
  {

    "lervag/vimtex",
    -- VimTeX should load immediately rather than waiting for an event.
    -- The plugin author recommends avoiding lazy-loading because VimTeX
    -- relies on filetype initialization and several autocommands.
    lazy = false,

    init = function()
      ------------------------------------------------------------------------
      -- General
      ------------------------------------------------------------------------

      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-lualatex",
      }
      -- VimTeX mappings begin with <localleader>.
      --
      -- With this setting:
      --   \ll becomes ,ll
      --   \lv becomes ,lv
      --   \le becomes ,le
      --
      -- Remove this line if you prefer the default backslash prefix.
      vim.g.maplocalleader = "\\"

      -- Keep VimTeX's default mappings enabled.
      vim.g.vimtex_mappings_enabled = 1

      -- Keep VimTeX's syntax highlighting enabled.
      vim.g.vimtex_syntax_enabled = 1

      -- Let VimTeX perform LaTeX-aware indentation.
      vim.g.vimtex_indent_enabled = 1

      ------------------------------------------------------------------------
      -- PDF viewer: Skim
      ------------------------------------------------------------------------

      vim.g.vimtex_view_method = "skim"

      --Forward SyncTeX:
      -- Jump from the cursor position in Neovim to the corresponding
      -- location in the PDF when running :VimtexView or ,lv.
      vim.g.vimtex_view_skim_sync = 1

      -- Bring Skim to the foreground during forward search.
      --
      -- Set this to 0 if you want the PDF to update without Skim taking
      -- keyboard focus away from Neovim.
      vim.g.vimtex_view_skim_activate = 1

      ------------------------------------------------------------------------
      -- Compiler
      ------------------------------------------------------------------------

      -- latexmk is the recommended and default VimTeX compiler backend.
      -- It handles repeated compilation, references, citations and indexes.
      vim.g.vimtex_compiler_method = "latexmk"

      vim.g.vimtex_compiler_latexmk = {
        -- Use continuous compilation.
        --
        -- After starting compilation once with ,ll, latexmk watches the
        -- project and recompiles after the source files are saved.
        continuous = 1,

        -- Allow VimTeX to receive success/failure callbacks from latexmk.
        callback = 1,

        -- Show compilation output when VimTeX needs it.
        build_dir = "",

        -- The latexmk executable installed by MacTeX or Homebrew.
        executable = "latexmk",

        -- These are reliable general-purpose latexmk options.
        options = {
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      ------------------------------------------------------------------------
      -- LaTeX engine selection
      ------------------------------------------------------------------------

      -- The default engine is pdfLaTeX.
      --
      -- You can override it per project by putting one of these near the
      -- beginning of the main .tex file:
      --
      --   %! TeX program = lualatex
      --   %! TeX program = xelatex
      --   %! TeX program = pdflatex
      --
      -- LuaLaTeX is often preferable for modern Unicode and font handling.
      vim.g.vimtex_compiler_latexmk_engines = {
        ["_"] = "-pdf",
        pdflatex = "-pdf",
        lualatex = "-lualatex",
        xelatex = "-xelatex",
      }

      ------------------------------------------------------------------------
      -- Errors and warnings
      ------------------------------------------------------------------------

      -- Open the quickfix window automatically when compilation reports
      -- errors. A value of 0 disables automatic opening.
      vim.g.vimtex_quickfix_mode = 2

      -- Filter noisy warnings that are usually not immediately actionable.
      -- Remove an entry if you want VimTeX to report that warning.
      vim.g.vimtex_quickfix_ignore_filters = {
        "Underfull \\\\hbox",
        "Overfull \\\\hbox",
        "Underfull \\\\vbox",
        "Overfull \\\\vbox",
        "Package hyperref Warning: Token not allowed in a PDF string",
        "Package typearea Warning: Bad type area settings",
      }

      ------------------------------------------------------------------------
      -- Table of contents
      ------------------------------------------------------------------------

      vim.g.vimtex_toc_config = {
        -- Show the TOC in a vertical split.
        split_pos = "leftabove",
        split_width = 35,

        -- Display useful LaTeX structures.
        show_help = 0,
        show_numbers = 1,
        mode = 1,

        -- Automatically refresh as the document changes.
        refresh_always = 1,

        -- Include these types of entries.
        tocdepth = 3,
        fold_enable = 1,
      }

      ------------------------------------------------------------------------
      -- Folding
      ------------------------------------------------------------------------

      -- Enable VimTeX's LaTeX-aware folding.
      --
      -- Sections, environments and other structures can then be folded.
      vim.g.vimtex_fold_enabled = 1

      ------------------------------------------------------------------------
      -- Concealment
      ------------------------------------------------------------------------

      -- Display selected LaTeX commands as their visual symbols.
      --
      -- Examples:
      --   \alpha      may appear as α
      --   \times      may appear as ×
      --   \mathbb{R}  may appear as ℝ
      --
      -- The underlying text is not modified.
      vim.opt.conceallevel = 2

      -- Show concealed markup normally on the line containing the cursor.
      vim.opt.concealcursor = ""

      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 1,
        styles = 1,
      }

      ------------------------------------------------------------------------
      -- Formatting
      ------------------------------------------------------------------------

      -- Enable VimTeX's LaTeX-aware formatting through `gq`.
      --
      -- Examples:
      --   gqap    format the current paragraph
      --   gggqG   format the entire file
      vim.g.vimtex_format_enabled = 1

      ------------------------------------------------------------------------
      -- Completion
      ------------------------------------------------------------------------

      -- Keep VimTeX omnifunc completion enabled.
      --
      -- This can coexist with nvim-cmp. VimTeX provides context-aware
      -- completion data for commands, labels, citations and environments.
      vim.g.vimtex_complete_enabled = 1

      ------------------------------------------------------------------------
      -- Custom convenient mappings
      ------------------------------------------------------------------------

      local function tex_map(lhs, rhs, description)
        vim.keymap.set("n", lhs, rhs, {
          silent = true,
          desc = description,
        })
      end

      -- These mappings duplicate important VimTeX commands with names that
      -- are easier to discover through which-key or :map.
      tex_map("<localleader>lc", "<cmd>VimtexCompile<cr>", "LaTeX: start/stop continuous compilation")

      tex_map("<localleader>lv", "<cmd>VimtexView<cr>", "LaTeX: open PDF and forward-search in Skim")

      tex_map("<localleader>le", "<cmd>VimtexErrors<cr>", "LaTeX: show compilation errors")

      tex_map("<localleader>lo", "<cmd>VimtexCompileOutput<cr>", "LaTeX: show compiler output")

      tex_map("<localleader>lt", "<cmd>VimtexTocOpen<cr>", "LaTeX: open table of contents")

      tex_map("<localleader>li", "<cmd>VimtexInfo<cr>", "LaTeX: show project information")

      tex_map("<localleader>lq", "<cmd>VimtexStop<cr>", "LaTeX: stop compiler")

      tex_map("<localleader>lx", "<cmd>VimtexClean<cr>", "LaTeX: remove auxiliary files")

      tex_map("<localleader>lX", "<cmd>VimtexClean!<cr>", "LaTeX: remove auxiliary files and output")

      ------------------------------------------------------------------------
      -- File-local editing settings
      ------------------------------------------------------------------------

      local latex_group = vim.api.nvim_create_augroup("LatexEditingSettings", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = latex_group,
        pattern = { "tex", "plaintex", "bib" },
        callback = function()
          -- Use two-space indentation for LaTeX.
          vim.opt_local.shiftwidth = 2
          vim.opt_local.tabstop = 2
          vim.opt_local.softtabstop = 2
          vim.opt_local.expandtab = true

          -- Wrap long prose visually without inserting line breaks.
          vim.opt_local.wrap = true
          vim.opt_local.linebreak = true
          vim.opt_local.breakindent = true

          -- Move through visually wrapped lines using j and k.
          vim.keymap.set({ "n", "x" }, "j", "gj", { buffer = true, silent = true })

          vim.keymap.set({ "n", "x" }, "k", "gk", { buffer = true, silent = true })

          -- Spell checking is useful for papers, comments and prose.
          -- Technical commands are mostly handled by VimTeX syntax regions.
          vim.opt_local.spell = true
          vim.opt_local.spelllang = "en_us"
        end,
      })
    end,
  },
}
