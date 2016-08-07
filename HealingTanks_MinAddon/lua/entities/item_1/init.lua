AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("sv_NetworkVars.lua")
include("shared.lua")

function ENT:Initialize()
	self:SetModel("models/props_junk/gascan001a.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)
	self:DrawShadow(false)
	self:SetHealth(10)
	self:SetMaxHealth(200)
end

dostuff = false
amount = 2
local saidRegenerate = false

function ENT:Touch (e) --The "e" is the Entity/other Entity i am touching with this Entity.
		for i = 1,3 do 
			if(e:GetClass() == HealAbleItems[i]) then
				if(self:Health() != 0 ) then
					if(dostuff == false) then
						dostuff = true
						e:SetHealth( e:Health() + 1)
						self:SetHealth(self:Health() - 1)
						PrintMessage(HUD_PRINTTALK,"The item you are healing have " ..e:Health().. " HP!")
						timer.Simple(1, function() dostuff = false end)
					end

					else

					if(saidRegenerate == false and self:Health() == 0) then
						PrintMessage(HUD_PRINTTALK,"Please connect the tank to a healing place to regenerate hp!")
						saidRegenerate = true
						timer.Simple(5,function() saidRegenerate = false end)
					end
					--break;
				end
			--elseif(e:GetClass() != HealAbleItems[i]) then
				--print("I was not touched by the right ent!")
			end
		end
	--end
end

/*function saidRegenerate (ent)
	if(ent:Health() <= amount) then
		if(ent:Health() >= ent:GetMaxHealth()) then
			PrintMessage(HUD_PRINTTALK,"Already at full health!")
		else
			timer.Simple(1,function() ent:SetHealth( ent:Health() +1 )end)
			PrintMessage(HUD_PRINTTALK,"Healing now!")
		end	
	end
end

function ENT:Think() 
	saidRegenerate(self)
end

