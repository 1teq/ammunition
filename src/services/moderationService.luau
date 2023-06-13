local settings = {
    databaseName = 'TemplateDatabase'; -- Change this to something random
    dataFormat = ''; -- how data is formatted. user id will ALWAYS be in the end. for example if the data format is $ then it'll be $userid.
}

-- Define service
local modService = {};

-- Define rblx services
local PlayerService = game:GetService("Players");
local DatastoreService = game:GetService("DataStoreService");

-- Define datastore
local datastore = DatastoreService:GetDataStore(settings.databaseName);

-- function Ban()
function modService.banUserAsync(id : number, reason : string)
    local success, alternativeFeedback = pcall(function()
        datastore:SetAsync(settings.dataFormat..id, reason)
    end)
    if success then
        return "Player banned successfully. They will not be automatically kicked though."
    else
        return "An error occured: "..alternativeFeedback
    end
end

-- return service
return modService