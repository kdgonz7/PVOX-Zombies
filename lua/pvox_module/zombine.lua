AddCSLuaFile()

-- Simple docs
--
-- PVox:GenerateSimilarNames
--	Allows you to generate similar names, as opposed
--	to writing all of them out in a list.
--	Parameters:
--		@num: amount to generate
--		@base: base name
--		@ext: extension
--		@zero: should the numbers start with 0? default is true
--		@sep: the separator between the name and number, default is "_"
--
-- PVox:ImplementModule
--	Allows you to implement a new module, with voice files
--	and actions.
--	Parameters:
--		@name: name of the module
--		@data: module data, should be A FUNCTION that returns a table.
--
-- PVox:RegisterPlayerModel
--	Allows you to register a playermodel with a module. This will not be used if pm binds are off.
--	Parameters:
--		@mdl_name : name of the model
--		@module_name : name of the module to bind it to.
--
--* Zombie Module *--

--* there are 11 actions built-in:
--* on_ready
--* pickup_weapon
--* reload
--* enemy_spotted
--* enemy_killed
--* confirm_kill
--* death
--* frag_out
--* switchtaunt
--* no_ammo
--* take_damage
if ! PVox then return Derma_Message("PVOX Zombies Requires PVOX to work correctly!", "Error", "OK") end

local function ZVoxPack (ply)
	return {
		["print_name"] = "Zombie VOX",
		["description"] = "zombie playermodel and sfx support",
		["actions"] = {
			["on_ready"] = "pickup_weapon",

			["reload"] = {
				"pvox/zombie_s/zombine_readygrenade1.wav",
				"pvox/zombie_s/zombine_readygrenade2.wav",
			},

			["pickup_weapon"] = 		PVox:GenerateSimilarNames(5, "pvox/zombie_s/zombine_pain", "wav", false, ""),

			["enemy_spotted"] = 		PVox:GenerateSimilarNames(7, "pvox/zombie_s/zombine_alert", "wav", false, ""),

			["enemy_killed"] = 			PVox:GenerateSimilarNames(3, "pvox/zombie_s/zombie_alert", "wav", false, ""),

			["death"] = 						PVox:GenerateSimilarNames(2, "pvox/zombie_s/zombine_die", "wav", false, ""),

			["frag_out"] = 					PVox:GenerateSimilarNames(2, "pvox/zombie_s/zombine_readygrenade", "wav", false, ""),

			["switchtaunt"] = 			PVox:GenerateSimilarNames(4, "pvox/zombie_s/zombine_pain", "wav", false, ""),

			["confirm_kill"] = 			PVox:GenerateSimilarNames(2, "pvox/zombie_s/zombine_die", "wav", false, ""),
			["no_ammo"] = 					PVox:GenerateSimilarNames(2, "pvox/zombie_s/zombine_die", "wav", false, ""),

			["take_damage"] = 			PVox:GenerateSimilarNames(4, "pvox/zombie_s/zombie_pain", "wav", false, ""),
		}
	}
end

PVox:ImplementModule("zombine", ZVoxPack)
PVox:RegisterPlayerModel("models/player/zombie_soldier.mdl", "zombine")
