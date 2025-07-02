return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local sn = ls.snippet_node
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local c = ls.choice_node
      local d = ls.dynamic_node
      local r = ls.restore_node

      -- MDX-specific snippets
      ls.add_snippets("mdx", {
        -- Frontmatter
        s("fm", {
          t("---"),
          t({"", "title: "}), i(1, "Title"),
          t({"", "description: "}), i(2, "Description"),
          t({"", "date: "}), f(function()
            return os.date("%Y-%m-%d")
          end),
          t({"", "tags: ["}), i(3, "tag1, tag2"), t("]"),
          t({"", "---", "", ""}), i(0)
        }),

        -- Import statement
        s("imp", {
          t("import "), i(1, "Component"), t(" from '"), i(2, "./Component"), t("'"),
          t({"", ""}), i(0)
        }),

        -- Export statement
        s("exp", {
          t("export "), c(1, {
            t("default "),
            t("const "),
            t("{ "),
          }), i(2, "Component"), i(0)
        }),

        -- React component
        s("comp", {
          t("const "), i(1, "Component"), t(" = ("), i(2, ""), t(") => {"),
          t({"", "  return ("}),
          t({"", "    <div>"}),
          t({"", "      "}), i(3, "Component content"),
          t({"", "    </div>"}),
          t({"", "  )"}),
          t({"", "}"}),
          t({"", ""}), i(0)
        }),

        -- JSX block
        s("jsx", {
          t("{"), i(1, "javascript code"), t("}"), i(0)
        }),

        -- Code block with language
        s("code", {
          t("```"), i(1, "javascript"),
          t({"", ""}), i(2, "code here"),
          t({"", "```"}), i(0)
        }),

        -- Callout/Alert component
        s("alert", {
          t("<Alert type=\""), c(1, {
            t("info"),
            t("warning"),
            t("error"),
            t("success")
          }), t("\">"),
          t({"", "  "}), i(2, "Alert content"),
          t({"", "</Alert>"}), i(0)
        }),

        -- Image with alt text
        s("img", {
          t("!["), i(1, "alt text"), t("]("), i(2, "image-url"), t(")"), i(0)
        }),

        -- Link
        s("link", {
          t("["), i(1, "link text"), t("]("), i(2, "url"), t(")"), i(0)
        }),

        -- Table
        s("table", {
          t("| "), i(1, "Header 1"), t(" | "), i(2, "Header 2"), t(" |"),
          t({"", "|----------|----------|"}),
          t({"", "| "}), i(3, "Cell 1"), t(" | "), i(4, "Cell 2"), t(" |"), i(0)
        }),

        -- Div with class
        s("div", {
          t("<div className=\""), i(1, "class-name"), t("\">"),
          t({"", "  "}), i(2, "content"),
          t({"", "</div>"}), i(0)
        }),

        -- React fragment
        s("frag", {
          t("<>"),
          t({"", "  "}), i(1, "content"),
          t({"", "</>"}), i(0)
        }),

        -- MDX meta export
        s("meta", {
          t("export const meta = {"),
          t({"", "  title: '"}), i(1, "Page Title"), t("',"),
          t({"", "  description: '"}), i(2, "Page Description"), t("',"),
          t({"", "}"}), i(0)
        }),

        -- Comment
        s("comment", {
          t("{/* "), i(1, "comment"), t(" */}"), i(0)
        }),

        -- Props destructuring
        s("props", {
          t("const { "), i(1, "prop1, prop2"), t(" } = props"), i(0)
        }),
      })

      -- Also add some general markdown snippets for MDX
      ls.add_snippets("markdown", {
        -- Frontmatter (also for markdown files)
        s("fm", {
          t("---"),
          t({"", "title: "}), i(1, "Title"),
          t({"", "description: "}), i(2, "Description"),
          t({"", "date: "}), f(function()
            return os.date("%Y-%m-%d")
          end),
          t({"", "---", "", ""}), i(0)
        }),
      })
    end,
  },
}
