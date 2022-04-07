local _, LFGAnnouncements = ...

local function optionsTemplate()
	local db = LFGAnnouncements.DB
	local args = {
		header = {
			order = 1,
			type = "header",
			width = "full",
			name = "General",
		},

		minimap = {
			type = "group",
			name = "Minimap",
			order = 2,
			inline = true,
			args = {
				visible = {
					type = "toggle",
					width = "full",
					order = 1,
					name = "Show minimap button",
					get = function(info)
						return not db:GetProfileData("minimap", "hide")
					end,
					set = function(info, newValue)
						db:SetProfileData("hide", not newValue, "minimap")
						LFGAnnouncements.MinimapButton:SetVisibility(newValue)
					end,
				},
				locked = {
					type = "toggle",
					width = "full",
					order = 2,
					name = "Lock minimap button",
					get = function(info)
						return db:GetProfileData("minimap", "lock")
					end,
					set = function(info, newValue)
						db:SetProfileData("lock", newValue, "minimap")
						LFGAnnouncements.MinimapButton:SetPositionLocked(newValue)
					end,
				},
			}
		},

		notifications = {
			type = "group",
			name = "Notifications",
			order = 3,
			inline = true,
			args = {
				sound = {
					type = "toggle",
					width = "full",
					order = 1,
					name = "Play sound on new request",
					get = function(info)
						return db:GetProfileData("announcements", "sound")
					end,
					set = function(info, newValue)
						db:SetProfileData("sound", newValue, "announcements")
					end,
				},
				-- message = {
				-- 	type = "toggle",
				-- 	width = "full",
				-- 	order = 2,
				-- 	name = "Write a chat message on new request",
				-- 	get = function(info)
				-- 		return db:GetProfileData("announcements", "chat")
				-- 	end,
				-- 	set = function(info, newValue)
				-- 		db:SetProfileData("chat", newValue, "announcements")
				-- 	end,
				-- },
				toast = {
					type = "toggle",
					width = "full",
					order = 3,
					name = "Show a toast window on new request",
					get = function(info)
						return db:GetProfileData("announcements", "toaster")
					end,
					set = function(info, newValue)
						db:SetProfileData("toaster", newValue, "announcements")
					end,
				},
			}
		},
	}

	return {
		type = "group",
		name = "General",
		order = 1,
		args = args
	}
end

LFGAnnouncements.Options.AddOptionTemplate("general", optionsTemplate)