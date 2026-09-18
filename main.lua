local function loadExternalUI()
   local githubRawUrl = "https://githubusercontent.com"
   
   local success, result = pcall(function()
       return game:HttpGet(githubRawUrl)
   end)
   
   if success and result then
       local runScript = loadstring(result)
       if runScript then
           runScript()
       else
           warn("Compile error")
       end
   else
       warn("Connection error")
   end
end

loadExternalUI()
