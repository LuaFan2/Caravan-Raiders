viewer = {
  __init = false,
  actualScene = 1,
  scenes = {}
}
function viewer:addScene(scene)
  --[[ Test if is a string or a table as support to both entries
      * First entry form => addScene('myScene')
      * Second entry form => addScene({'FirstScene','SecondScene'})
  ]]--
  if type(scene) == 'string' then
    local file = assert(loadfile('scene/' .. scene .. '.lua'))()
    table.insert(self.scenes, {scene,file})
  elseif type(scene) == 'table' and #scene then
    for key,value in pairs(scene) do
      local file = assert(loadfile('scene/' .. value .. '.lua'))()
      table.insert(self.scenes, {value,file})
    end
  else
    error('Error: Invalid scene value.')
  end
  -- Flag to first time occurrence of code to call load() function from scene table. 
  if not __init then
    self.scenes[self.actualScene][2]:load()
    __init = true
  end
end

function viewer:openScene(sceneToGo)
  --[[ Test if is a number or string to support both entry forms
       * First entry form => openScene(1)
       * Second entry form => openScene('mySceneName')
  ]]--
  if type(sceneToGo) == 'number' and (sceneToGo > 0 and sceneToGo <= #self.scenes) then
    self.actualScene = sceneToGo
  elseif type(sceneToGo) == 'string' then
    -- This flag throws an error if a non existent(in scenes table) scene is called.
    local find = false
    for key,value in pairs(self.scenes) do
      if sceneToGo == self.scenes[key][1] then
        self.actualScene = key
        find = true
      end
    end
    if not find then
      error('Tried to open `' .. sceneToGo .. '` but it does not exists in scenes table.')
    end
  else
    error('Scene value out of range. Actual range is [1..' .. #self.scenes .. '].')
  end
  self.scenes[self.actualScene][2]:load()
end

function viewer:previousScene()
  if self.actualScene > 1 then
    viewer:openScene(self.actualScene - 1)
  end
end

function viewer:nextScene()
  if self.actualScene < #self.scenes then
    viewer:openScene(self.actualScene + 1)
  end
end

function viewer:keypressed(key)
    self.scenes[self.actualScene][2]:keypressed(key)
end

function viewer:update(dt)
  self.scenes[self.actualScene][2]:update(dt)
end

function viewer:draw()
  self.scenes[self.actualScene][2]:draw()
end

return viewer