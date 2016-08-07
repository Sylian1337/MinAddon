AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("sv_NetworkVars.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_c17/TrapPropeller_Lever.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DrawShadow(false)
	self:SetHealth(5000)
	self:SetMaxHealth(5000)
end


function ENT:Touch (e) --The "e" is the Entity/other Entity i am touching with this Entity.
	if(e:GetClass() == "item_1") then
		if(e:Health() <= e:GetMaxHealth() ) then
			e:SetHealth( e:Health() + 1)
			self:SetHealth(self:Health() - 1)
			PrintMessage(HUD_PRINTTALK,"The item you are healing have " ..e:Health().. " HP!")
			else
			PrintMessage(HUD_PRINTTALK,"You cannot heal anymore before you use whats in the tank!")

		end
	end
end