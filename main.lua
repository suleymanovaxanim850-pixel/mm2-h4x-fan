local function loadExternalUI()
   local githubRawUrl = "https://githubusercontent.com"
   
   local success, result = pcall(function()
       return game:HttpGet(githubRawUrl)
   end)
   
   if success and result then
       local runScript, err = loadstring(result)
       if runScript then
           task.spawn(runScript)
       else
           warn("Compile error: " .. tostring(err))
       end
   else
       warn("Connection error to GitHub")
   end
end

loadExternalUI()
