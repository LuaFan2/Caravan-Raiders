local io = {}

function io.createFolder(folder)
    if type(folder) ~= 'string' then return false end
    
    return love.filesystem.createDirectory(folder)
end

function io.createFile(file)
    if type(file) ~= 'string' then return false end
    
    return love.filesystem.newFile(file)
end

function io.exists(file)
    if type(file) ~= 'string' then return false end
    
    return love.filesystem.getInfo(file) and true or false
end

return io