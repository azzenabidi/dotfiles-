local p = plugin.register({
  name = "save-queue",
  type = "hook",
  description = "Keep YouTube-fetched tracks in the Music Library playlist",
})

local PLAYLIST = (os.getenv("HOME") or "") .. "/.config/cliamp/playlists/Music Library.toml"

local function esc(s)
  s = s:gsub("\\", "\\\\")
  s = s:gsub('"', '\\"')
  s = s:gsub("\n", "\\n")
  s = s:gsub("\r", "\\r")
  s = s:gsub("\t", "\\t")
  return s
end

local function already_saved(content, url)
  return content:find('path = "' .. url .. '"', 1, true) ~= nil
end

p:on("queue.change", function()
  local existing = cliamp.fs.read(PLAYLIST) or ""
  local buf = {}
  for _, track in ipairs(cliamp.queue.list()) do
    local path = track.path or ""
    if path:find("^https?://") and not already_saved(existing, path) then
      table.insert(buf, "[[track]]")
      table.insert(buf, 'path = "' .. esc(path) .. '"')
      table.insert(buf, 'title = "' .. esc(track.title or path) .. '"')
      if track.artist and track.artist ~= "" then
        table.insert(buf, 'artist = "' .. esc(track.artist) .. '"')
      end
      if track.album and track.album ~= "" then
        table.insert(buf, 'album = "' .. esc(track.album) .. '"')
      end
      table.insert(buf, "")
    end
  end
  if #buf > 0 then
    cliamp.fs.write(PLAYLIST, existing .. "\n" .. table.concat(buf, "\n"))
  end
end)
