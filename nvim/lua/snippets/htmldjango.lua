local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {

  s(
    -- context
    {
      trig = "jjb",
      name = "Jinja block",
      desc = "Jinja block",
    },
    -- nodes
    fmta(
      -- string
      [[
      {% block <name> %}<content>{% endblock %}
      ]],
      -- nodes
      {
        name = i(1),
        content = i(2),
      }
    )
  ),

  s(
    -- context
    {
      trig = "jje",
      name = "Jinja expression",
      desc = "Jinja expression",
    },
    -- nodes
    fmta(
      -- string
      [[
      {{ <content> }}
      ]],
      -- nodes
      {
        content = i(1),
      }
    )
  ),

  s(
    -- context
    {
      trig = "jjf",
      name = "Jinja for",
      desc = "Jinja for",
    },
    -- nodes
    fmta(
      -- string
      [[
      {% for <iteratorVar> in <iterable> %}
        <content>
      {% endfor %}
      ]],
      -- nodes
      {
        iteratorVar = i(1),
        iterable = i(2),
        content = i(3),
      }
    )
  ),

  s(
    -- context
    {
      trig = "jji",
      name = "Jinja if",
      desc = "Jinja if",
    },
    -- nodes
    c(1, {
      fmta(
        -- string
        [[
        {% if <conditional> %}
          <ifBlock>
        {% else %}
          <elseBlock>
        {% endif %}
      ]],
        -- nodes
        {
          conditional = i(1),
          ifBlock = i(2),
          elseBlock = i(3),
        }
      ),
      fmta(
        -- string
        [[
        {% if <conditional1> %}
          <ifBlock>
        {% elif <conditional2> %}
          <elifBlock>
        {% else %}
          <elseBlock>
        {% endif %}
      ]],
        -- nodes
        {
          conditional1 = i(1),
          ifBlock = i(2),
          conditional2 = i(3),
          elifBlock = i(4),
          elseBlock = i(5),
        }
      ),
    })
  ),
}
