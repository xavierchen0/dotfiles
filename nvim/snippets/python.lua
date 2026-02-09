return {
  marimo_cells = {
    prefix = "'cc",
    body = "@app.cell(${1|,hidden_code=True|})\ndef ${2:_}():\n$0",
    desc = "Create marimo app cells with choice of hidden_code",
  },
}
