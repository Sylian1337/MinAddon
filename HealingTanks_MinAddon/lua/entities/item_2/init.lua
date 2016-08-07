AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


function ENT:Initialize()
	self:SetModel("models/props_junk/metalgascan.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DrawShadow(false)
	self.isTouching = false
	self:SetHealth(10)
	self:SetMaxHealth(100)
end

ämount = 50
anyheal = true
function ENT:Touch(ply) 
	if(ply:IsPlayer() and ply:IsValid() and  anyheal == true) then
		if(self:Health() == 0) then
			PrintMessage(HUD_PRINTTALK,"This tank does not have any heal left to give you!")
			anyheal = false
		else
			ply:SetHealth( ply:Health() + amount)
			self:SetHealth( ply:Health() - amount)
		end
	end
end



