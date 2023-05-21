local colorizer_status_ok, colorizer = pcall(require, "colorizer")
if not colorizer_status_ok then
  return
end

colorizer.setup {
  "*"; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
}
