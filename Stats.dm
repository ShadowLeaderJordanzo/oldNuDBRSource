mob/proc/GetAssess()
	var/PowerDisplay
	var/IntimDisplay
	var/BaseDisplay
	var/GodKiDisplay
	var/StatAverage=round((src.GetStr()+src.GetEnd()+src.GetSpd()+src.GetFor()+src.GetOff()+src.GetDef())/6, 0.05)
	var/EffectiveAnger=Anger
	var/PDam=src.HasPureDamage()
	var/PRed=src.HasPureReduction()
	if(src.Anger)
		if(src.AngerMult>1)
			var/ang=EffectiveAnger-1//Usable anger
			var/mult=ang*src.AngerMult
			EffectiveAnger=mult+1
		if(src.AngerThreshold)
			if(EffectiveAnger<src.AngerThreshold)
				EffectiveAnger=src.AngerThreshold
		if(src.DefianceCounter>0&&!src.Oozaru)
			EffectiveAnger+=src.DefianceCounter*0.05
		if(src.CyberCancel>0)
			var/ang=EffectiveAnger-1//Usable anger.
			var/cancel=ang*src.CyberCancel//1 Cyber Cancel = all of usable anger.
			EffectiveAnger-=cancel//take the anger away.
			if(EffectiveAnger<1)//Only nerf anger.
				EffectiveAnger=1
		if(src.PhylacteryNerf)
			EffectiveAnger-=(EffectiveAnger*src.PhylacteryNerf)

	PowerDisplay=Get_Scouter_Reading(src)
	if(src.HasPowerReplacement())
		BaseDisplay=src.GetPowerReplacement()*src.PowerBoost*src.RPPower
	else
		BaseDisplay=src.potential_power_mult*src.PowerBoost*src.RPPower
	if(src.HasIntimidation())
		IntimDisplay=src.GetIntimidation()
	else
		IntimDisplay=1
	if(src.HasGodKi())
		GodKiDisplay=src.GetGodKi()
	else
		GodKiDisplay=0
	var/blahh={"

			<html>
	<style type="text/css">
	<!--
	body {
	     color:#449999;
	     background-color:black;
	     font-size:12;
	 }
	table {
	     font-size:12;
	 }
	//-->
	</style>
	<body>
	[src.name]<br><br>
	Current Anger:	[EffectiveAnger*100]%<br>
	<table cellspacing="6%" cellpadding="1%">
	<tr><td>Base:</td><td>[BaseDisplay]/([src.PowerBoost*src.RPPower*round(src.potential_power_mult, 0.05)])</td></tr>
	<tr><td>Intimidation:</td><td>x[IntimDisplay]</td></tr>
	<tr><td>Damage Boost:</td><td>x[1+(PDam/10)]</td></tr>
	<tr><td>Damage Reduction:</td><td>x[1+(PRed/10)]</td></tr>
	<tr><td>God Ki:</td><td>x[GodKiDisplay]</td></tr>
	<tr><td>Current BP:</td><td>[Commas(PowerDisplay)]</td></tr>
	<tr><td>Energy:</td><td>[Commas(round(src.EnergyMax))] (1)</td></tr>
	<tr><td>Buffed Stat/True Stat (Mod)</td></tr>
	<tr><td>Strength:</td><td> [round(src.GetStr(), 0.01)] ([src.BaseStr()])</td></tr>
	<tr><td>Endurance:</td><td> [round(src.GetEnd(), 0.01)] ([src.BaseEnd()])</td></tr>
	<tr><td>Speed:</td><td> [round(src.GetSpd(), 0.01)] ([src.BaseSpd()])</td></tr>
	<tr><td>Force:</td><td> [round(src.GetFor(), 0.01)] ([src.BaseFor()])</td></tr>
	<tr><td>Offense:</td><td> [round(src.GetOff(), 0.01)] ([src.BaseOff()])</td></tr>
	<tr><td>Defense:</td><td> [round(src.GetDef(), 0.01)] ([src.BaseDef()])</td></tr>
	<tr><td>Recovery:</td><td> [round(src.GetRecov(), 0.01)] ([src.BaseRecov()])</td></tr>
	<tr><td>Anger:</td><td>[src.AngerMax*100]%</td></tr>
	<tr><td>Potential Power:</td><td>[round(src.potential_power_mult, 0.05)]/(x[src.RPPower*src.PowerBoost])</td></tr>
	<tr><td>Potential:</td><td>[round(src.Potential/src.PotentialCap*100, 0.05)]% ([round(src.Potential)] / [round(src.PotentialCap)])</td></tr>
	<tr><td>Transformation Potential:</td><td>[src.potential_trans]%</td></tr>
	<tr><td>Average Stats: [StatAverage]</td></tr>
			</table>"}

	return blahh

mob
	proc
		GetHealthBPMult()
			var/Return=0
			Return=min(src.TotalInjury/100,0.25)*(-1)
			if(Return>0)
				Return=0
			return Return
		GetEnergyBPMult()
			var/Return=0
			Return=min(src.TotalFatigue/100,0.5)*(-1)
			if(Return>0)
				Return=0
			if(src.Anaerobic)
				Return=min(src.TotalFatigue-20/100,0.5)
			return Return


proc/SenseDetect(atom/A,Range)
	var/list/Mobs=new
	for(var/mob/P in world)
		if(P.client)
			if(P.z==A.z)
				var/t=abs(A.x-P.x)+abs(A.y-P.y)
				if(t<Range)
					Mobs+=P
	return Mobs

mob/var/list/Tabz=list("Science"="Hide","Build"="Hide","Enchantment"="Hide","Inventory"="Show")

mob/Players/Stat()
	if(client.show_verb_panel&&!Tabs)
		if(istext(Health))
			Health=100
			usr<<"Your health was somehow a text variable and reset to 100. o.o"

		if(Health<=src.AngerPoint*(1-src.HealthCut))
			src.Anger()
		if(src.Health<=0)
			if(!src.KO&&!src.Stasis)
				src.Unconscious(null,"low health!")
		if(Energy<0)
			Energy=1
		if(1)
			statpanel("Statistics")
			StunCheck(src)
			StunImmuneCheck(src)
			if(statpanel("Statistics"))
				if(src.Mapper)
					stat("Location", "[src.x], [src.y], [src.z]")
				if(src.EraBody&&!src.Timeless)
					stat("Age Class: ", "[src.EraBody]")
				if(src.EraDeathClock)
					stat("Death Timer: ", "[round((src.EraDeathClock-world.realtime)/Hour(1), 0.1)] hours")

				if(src.BPPoison<=0.5)
					stat("Health Status: ", "<font color='red'>Grieviously Wounded ([round(src.BPPoisonTimer/RawHours(1), 0.1)] hours)</font color>")
				else if(src.BPPoison<=0.7&&src.BPPoison>0.5)
					stat("Health Status: ", "<font color='orange'>Heavily Wounded ([round(src.BPPoisonTimer/RawHours(1), 0.1)] hours)</font color>")
				else if(src.BPPoison<=0.9&&src.BPPoison>0.7)
					stat("Health Status: ", "<font color='yellow'>Lightly Wounded ([round(src.BPPoisonTimer/RawHours(1), 0.1)] hours)</font color>")
				else if(src.BPPoison>1)
					stat("Health Status: ", "<font color='green'>Boosted ([round(src.BPPoisonTimer/RawMinutes(1), 0.1)] minutes)</font color>")

				if(src.OverClockNerf<=0.5&&src.OverClockNerf>0)
					stat("Fatigue Status: ", "<font color='yellow'>Exhausted ([round(src.OverClockTime/RawHours(1), 0.1)] hours)</font color>")
				else if(src.OverClockNerf<=0.7&&src.OverClockNerf>0.5)
					stat("Fatigue Status: ", "<font color='orange'>Heavily Exhausted ([round(src.OverClockTime/RawHours(1), 0.1)] hours)</font color>")
				else if(src.OverClockNerf<=0.99&&src.OverClockNerf>0.7)
					stat("Fatigue Status: ", "<font color='red'>Helplessly Exhausted ([round(src.OverClockTime/RawHours(1), 0.1)] hours)</font color>")

				if(src.Satiated)
					stat("Satiation: ", "Well Fed")
					if(src.Drunk)
						stat("Inebriation: ", "Drunk")
				if(src.Maimed)
					stat("Maims: ", "[src.Maimed]")

				if(!src.StrTax&&!src.StrCut)
					stat("Strength","[round(src.BaseStr(), 0.05)]")
				else
					stat("Strength","[round(BaseStr(), 0.05)] (Tax: [round((src.StrTax+src.StrCut)*100)]%)")
				if(!src.EndTax&&!src.EndCut)
					stat("Endurance","[round(src.BaseEnd(), 0.05)]")
				else
					stat("Endurance","[round(src.BaseEnd(), 0.05)] (Tax: [round((src.EndTax+src.EndCut)*100)]%)")
				if(!src.SpdTax&&!src.SpdCut)
					stat("Speed","[round(src.BaseSpd(), 0.05)]")
				else
					stat("Speed","[round(src.BaseSpd(), 0.05)] (Tax: [round((src.SpdTax+src.SpdCut)*100)]%)")
				if(!src.ForTax&&!src.ForCut)
					stat("Force","[round(src.BaseFor(), 0.05)]")
				else
					stat("Force","[round(src.BaseFor(), 0.05)] (Tax: [round((src.ForTax+src.ForCut)*100)]%)")
				if(!src.OffTax&&!src.OffCut)
					stat("Offense","[round(src.BaseOff(), 0.05)]")
				else
					stat("Offense","[round(src.BaseOff(), 0.05)] (Tax: [round((src.OffTax+src.OffCut)*100)]%)")
				if(!src.DefTax&&!src.DefCut)
					stat("Defense","[round(src.BaseDef(), 0.05)]")
				else
					stat("Defense","[round(src.BaseDef(), 0.05)] (Tax: [round((src.DefTax+src.DefCut)*100)]%)")
				if(!src.RecovTax&&!src.RecovCut)
					stat("Recovery","[round(src.BaseRecov(), 0.05)]")
				else
					stat("Recovery","[round(src.BaseRecov(), 0.05)] (Tax: [round((src.RecovTax+src.RecovCut)*100)]%)")
				if(!(src.Class in list("Dance", "Potara")))
					stat("Potential:","[round(src.Potential, 0.005)]")
				stat("----","----")
				stat("Reward Points:","[round(usr.RPPSpendable)]")
				stat("Reward Points Used:","[round(usr.RPPSpent)]")
				stat("Extra Credit Points:","[round(usr.RPPSpendableEvent)]")
				stat("Extra Credit Points Used:","[round(usr.RPPSpentEvent)] / [round(usr.RPPSpendableEvent+usr.RPPSpentEvent)]")
				if(usr.RPPDonate)
					stat("Donate RPP:", "[round(usr.RPPDonate)]")
				if(usr.PotentialRate>0)
					switch(usr.PotentialStatus)
						if("Distracted")
							stat("Focus Status: ", "<font color='red'>[usr.PotentialStatus]</font color>")
						if("Average")
							stat("Focus Status: ", "<font color='yellow'>[usr.PotentialStatus]</font color>")
						if("Focused")
							stat("Focus Status: ", "<font color='green'>[usr.PotentialStatus]</font color>")

				if(src.StyleActive||src.ActiveBuff||src.SpecialBuff||src.SlotlessBuffs.len>0)
					stat("")
					stat("--BUFFS--")
					stat("")
				if(src.StyleActive)
					stat("Style: ", "[usr.StyleActive]")
				if(src.StanceActive)
					stat("Stance: ", "[usr.StanceActive]")
				if(src.ActiveBuff)
					stat("Active Buff: ","[usr.ActiveBuff.name]")
				if(src.SpecialBuff)
					stat("Special Buff: ","[usr.SpecialBuff.name]")
				if(src.SlotlessBuffs.len>0)
					var/Remaining=src.SlotlessBuffs.len
					var/Buffs=""
					for(var/obj/Skills/Buffs/SlotlessBuffs/SB in src.SlotlessBuffs)
						if(SB.SlotlessOn)
							if(Remaining>1)
								Buffs+="[SB.name], "
							else
								Buffs+="[SB.name]"
							Remaining--
					stat("Augments: ", "[Buffs]")

				if(src.SummonReturnTimer)
					stat("Contract Status: ", "<font color='green'>Active</font color>")
				if(locate(/obj/Skills/Soul_Contract, src)||locate(/obj/Skills/Utility/Contractor, src))
					if(src.ContractPowered<1)
						stat("Contract Power: ", "<font color='red'>Depowered</font color>")
					if(src.ContractPowered==1)
						stat("Contract Power: ", "<font color='yellow'>Stable</font color>")
					if(src.ContractPowered>1)
						stat("Contract Power: ", "<font color='green'>Empowered ([src.ContractPowered])")


		if(Admin&&usr.Overview==1 && usr.AFKTimer)
			statpanel("Overview")
			if(statpanel("Overview"))
				stat("Coordinates","[usr.x],[usr.y],[usr.z]")
				stat("CPU","[world.cpu]")
				stat("Era","[global.Era]")
				stat("Days of Wipe:", "[global.DaysOfWipe]")
				stat("Potential Daily:", "[global.PotentialDaily]")
				stat("Dead Spawn:", "([global.DeadX], [global.DeadY], [global.DeadZ])")
				stat("Void Spawn:", "([global.NearDeadX], [global.NearDeadY], [global.NearDeadZ])")
				stat("KO Get Up Speed","[GetUpVar]x")
				stat("Voids On?", "[global.VoidsAllowed]")
				stat("Void Chance", "[global.VoidChance]%")
				stat("Base Power: ", "[Commas(global.WorldBaseAmount)]")
				stat("World Damage Multiplier", "x[global.WorldDamageMult]")
				stat("World Accuracy Rate", "[global.WorldDefaultAcc]%")
				stat("World Whiff Rate", "[global.WorldWhiffRate]% hits will not whiff")
				stat("RPP Routine", "[Commas(global.RPPDaily)]")
				stat("RPP Starting / RPP Starting Days", "[Commas(global.RPPStarting)] / [Commas(global.RPPStartingDays)]")
				stat("RPP Highest", "[Commas(global.RPPHighest)]")
				stat("Economy Rates", "[Commas(global.EconomyCost)] [MoneyName] Cost / [Commas(global.EconomyIncome)] Income / [Commas(global.EconomyMana)] Mana Cost")


		if(usr.Tabz["Inventory"]=="Show" && usr.AFKTimer)
			statpanel("Inventory")
			if(statpanel("Inventory"))
				for(var/obj/Money/M in usr)
					M.name="[Commas(round(M.Level))] [global.MoneyName]"
					stat(M)
				//Swords
				for(var/obj/Items/Sword/S in usr)
					if(S.Conjured)
						continue
					stat(S)
				for(var/obj/Items/Enchantment/Staff/S in usr)
					if(S.Conjured)
						continue
					stat(S)
				for(var/obj/Items/Armor/A in usr)
					if(A.Conjured)
						continue
					stat(A)
				//Equipped gear
				for(var/obj/Items/Gear/G in usr)
					if(!(G.PermEquip&&G.suffix&&!G.Stealable)&&!istype(G,/obj/Items/Gear/Mobile_Suit))
						G.icon_state="Inventory"
						stat(G)
						if(!G.InfiniteUses)
							if(G.Techniques.len>=2)
								stat("[G.Uses] / [G.MaxUses] | Int: [G.IntegratedUses] / [G.IntegratedMaxUses]")
							else if(G.Techniques.len==1&&!(istype(G, /obj/Items/Gear/Prosthetic_Limb)))
								stat("[G.Uses] / [G.MaxUses]")
							else if(G.Techniques.len==1&&(istype(G, /obj/Items/Gear/Prosthetic_Limb)))
								stat("Int: [G.IntegratedUses] / [G.IntegratedMaxUses]")
							else
								stat("[G.Uses] / [G.MaxUses]")
				//Equipped tome
				for(var/obj/Items/Enchantment/Magic_Crest/MC in usr)
					stat(MC)
				for(var/obj/Items/Enchantment/Tome/T in usr)
					T.icon_state="Inventory"
					stat(T)
				for(var/obj/Items/A in usr)
					if(!(A.PermEquip&&A.suffix&&!A.Stealable))
						if(istype(A, /obj/Items/Enchantment/Magic_Crest))
							continue
						if(istype(A, /obj/Items/Sword))
							continue//skip SORDS; they've already been displayed
						if(istype(A, /obj/Items/Armor))
							continue
						if(istype(A, /obj/Items/Enchantment/Staff))
							continue
						if(istype(A, /obj/Items/Gear))
							continue//skip gears; they've already been displayed
						if(istype(A, /obj/Items/Enchantment/Tome))
							continue//skip tomes; they've already been displayed
						if(A.Stackable)
							A.suffix="[A.TotalStack]"
						stat(A)

		if(usr.Target)
			if(istype(usr.Target, /mob/Players) || istype(usr.Target, /mob/Player))
				statpanel("Current Target")
				if(statpanel("Current Target"))
					stat("Focused:",Target)
					if(usr.EnhancedSmell&&!usr.Target.HasVoid())
						var/Scent=0
						if(!usr.Target.HasVoid())
							switch(usr.Target.Race)
								if("Human")
									Scent="Sweat"
								if("Namekian")
									Scent="Grass"
								if("Saiyan")
									Scent="Musk"
								if("Makyo")
									Scent="Garlic"
								if("Tuffle")
									Scent="Oil"
								if("Alien")
									if(usr.Target.Class=="Brutality"||usr.Target.Class=="Tenacity")
										Scent="Musk"
									if(usr.Target.Class=="Harmony"||usr.Target.Class=="Equanimity")
										Scent="Incense"
									else
										Scent="Exotic"
								if("Monster")
									if(usr.Target.Class=="Yokai")
										Scent="Incense"
									else if(usr.Target.Class=="Eldritch")
										Scent="Ocean"
									else
										Scent="Musk"
								if("Android")
									Scent="Metal"
								if("Changeling")
									Scent="Acrid"
								if("Shinjin")
									Scent="Fruit"
								if("Demon")
									Scent="Brimstone"
								if("Djinn")
									Scent="Gum"
								if("Dragon")
									Scent="Ozone"
							if(Scent!="Overwhelming")
								if(usr.Target.HasHellPower()||usr.Target.HasJagan())
									Scent="Brimstone"
								if(usr.Target.HasMechanized())
									Scent="Metal"
								if(usr.Target.Secret=="Ripple"||usr.Target.Secret=="Senjutsu")
									Scent="Grass"
								if(usr.Target.Secret=="Vampire"||usr.Target.Secret=="Werewolf")
									Scent="Blood"
								if(usr.Target.Secret=="Necromancer"||usr.Target.Secret=="Zombie")
									Scent="Decay"
						if(Scent)
							if(usr.Target.custom_scent)
								Scent=usr.Target.custom_scent
							stat("Scent: ", Scent)


					var/WoundIntent
					var/KillingIntent
					var/Status
					var/RPIntent
					var/HiddenPotential

					if(usr.Target.HasFakePeace()||(usr.Target.WoundIntent==0&&!usr.Target.SwordWounds()&&!usr.Target.CursedWounds()&&!(usr.IsEvil()&&usr.Target.HasPurity())))
						WoundIntent="<font color='green'>None</font color>"
					else
						WoundIntent="<font color='red'>Strong</font color>"

					if(usr.Target.HasFakePeace()||(usr.Target.Lethal==0&&!usr.Target.CursedWounds()&&!(usr.IsEvil()&&usr.Target.HasPurity())))
						KillingIntent="<font color='green'>None</font color>"
					else
						KillingIntent="<font color='red'>Strong</font color>"

					if(usr.Target.BPPoison>=1)
						Status="<font color='green'>Healthy</font color>"
					else
						Status="<font color='red'>Wounded</font color>"

					if(usr.Target.Potential==usr.Target.PotentialCap)
						HiddenPotential="<font color='red'>They have reached their full potential.</font color>"
					else
						HiddenPotential="<font color='green'>They seem to hold power still untapped within.</font color>"

					if(usr.Target.PureRPMode==0)
						RPIntent="<font color='green'>RP Mode Off</font color>"
					else if(usr.Target.PureRPMode==1)
						RPIntent="<font color='red'>RP Mode On</font color>"

					if(usr.Target.HasImitate())
						WoundIntent="<font color='green'>None</font color>"
						KillingIntent="<font color='green'>None</font color>"

					stat("Injury Intent: ", WoundIntent)
					stat("Killing Intent: ", KillingIntent)
					if(usr.MedicineUnlocked+usr.ImprovedMedicalTechnologyUnlocked>=2&&!usr.Target.HasVoid()&&!usr.Target.HasMechanized())
						stat("Status:", Status)
					if(usr.Target.Maimed)
						stat("<font color='red'>They are maimed.</font color>")
					if(usr.Target.MortallyWounded)
						stat("<font color='red'>They are bleeding heavily.</font color>")

					if(locate(/obj/Skills/Utility/Unlock_Potential, usr))
						stat(HiddenPotential)

					if(usr.HasScouter()||locate(/obj/Skills/Utility/Sense, usr))
						if(!usr.Target.HasGodKi()&&!usr.Target.HasVoid()&&!usr.Target.HasMechanized()&&usr.Target.SenseUnlocked<7)
							if(usr.HasScouter())
								var/distancecalc=abs(usr.Target.x-usr.x)+abs(usr.Target.y-usr.y)
								if(usr.Target.z==usr.z)
									stat("Direction - [distancecalc] tiles away","[src.CheckDirection(Target)]")
									stat("Location - X: [usr.Target.x], Y: [usr.Target.y]")
								stat("Power:","[Commas(Get_Scouter_Reading(Target))]")
							else
								if(usr.HasClarity())
									var/distancecalc=abs(usr.Target.x-usr.x)+abs(usr.Target.y-usr.y)
									stat("Direction - [distancecalc] tiles away","[src.CheckDirection(Target)]")
								stat("Power:","[Get_Sense_Reading(Target)]")
							stat("Health: ","[Target.Health]%")
							stat("Energy: ","[(Target.Energy/Target.EnergyMax)*100]%")
						else
							stat("Power: ", "Incomprehensible")
							if(usr.HasClarity())
								var/distancecalc=abs(usr.Target.x-usr.x)+abs(usr.Target.y-usr.y)
								stat("Direction - [distancecalc] tiles away","[src.CheckDirection(Target)]")
								stat("Health: ","[round(Target.Health)]%")

					stat("Roleplay Mode: ", RPIntent)

					if(usr.Admin)
						stat(viewmobcontents)
						if(AdminContentsView)
							for(var/obj/Z in Target.contents)
								if(!Z.AdminInviso)
									stat(Z)



atom/proc/CheckDirection(var/mob/M)
	if(M)
		if(M.z==src.z)
			if(M.x > src.x)
				if(M.y>src.y)
					return "North East"
				if(M.y<src.y)
					return "South East"
				if(M.y==src.y)
					return "East"
			if(M.x < src.x)
				if(M.y>src.y)
					return "North West"
				if(M.y<src.y)
					return "South West"
				if(M.y==src.y)
					return "West"
			if(M.x == src.x)
				if(M.y>src.y)
					return "North"
				if(M.y<src.y)
					return "South"
				if(M.y==src.y)
					return "-"
		else
			return "???"



mob/proc/GetPowerUpRatio()
	var/Ratio=1
	var/PowerUp=max(((PowerControl-100)/100),-0.5)
	if(src.HasPUSpike())
		PowerUp+=(src.GetPUSpike()/100)
	if(src.FusionPowered)
		if(src.CheckSpecial("Overdrive"))
			if(src.Race=="Android")
				PowerUp+=0.5
			else
				PowerUp+=1
		else
			if(src.Race!="Android")
				PowerUp-=PowerUp*src.CyberCancel
	if(src.HasMovementMastery()&&PowerUp>0)
		Ratio=1+(PowerUp*(1+(src.GetMovementMastery()/10)))
	else
		Ratio=1+PowerUp
	if(!src.HasKiControl()&&!src.PoweringUp)
		if(Ratio>1)
			Ratio=1
	if(src.HasPULimited()&&Ratio>src.GetPULimited())
		Ratio=src.GetPULimited()
	if(Ratio<=0)
		Ratio=0.01
	return Ratio

mob/proc/GetPowerUpRatioVisble()
	var/Ratio=1
	var/PowerUp=(PowerControl-100)/100
	if(src.HasPUSpike())
		PowerUp+=(src.GetPUSpike()/100)
	if(src.FusionPowered)
		if(src.CheckSpecial("Overdrive"))
			if(src.Race=="Android")
				PowerUp+=0.5
			else
				PowerUp+=1
		else
			if(src.Race!="Android")
				PowerUp-=PowerUp*src.CyberCancel
	if(src.HasMovementMastery()&&PowerUp>0)
		Ratio=1+(PowerUp*(1+(src.GetMovementMastery()/10)))
	else
		Ratio=1+PowerUp
	if(!src.HasKiControl()&&!src.PoweringUp)
		if(Ratio>1)
			Ratio=1
	if(src.HasPULimited()&&Ratio>src.GetPULimited())
		Ratio=src.GetPULimited()
	if(Ratio<=0)
		Ratio=0.01
	return Ratio

mob/proc/Recover(var/blah,Amount=1)
	switch(blah)
		if("Health")
			if(PureRPMode)
				return
			if(src.Transfering)
				return
			if(src.LastBreath)
				return
			if(src.Oxygen<=10)
				return
			if(SenseRobbed>=2&&(src.SenseUnlocked<=src.SenseRobbed&&src.SenseUnlocked>5))
				Amount/=src.SenseRobbed
			if(src.MeditateModule)
				Amount*=2
			if(Swim&&Fishman)
				Amount*=2
			src.HealHealth(Amount*(25/max(Health,1)))
			if(Health==100&&src.BioArmor<src.BioArmorMax)
				src.BioArmor+=Amount
				if(src.BioArmor>=src.BioArmorMax)
					src.BioArmor=src.BioArmorMax
			if(src.StrStolen)
				src.StrStolen-=0.1
				if(src.StrStolen<0)
					src.StrStolen=0
			if(src.EndStolen)
				src.EndStolen-=0.1
				if(src.EndStolen<0)
					src.EndStolen=0
			if(src.SpdStolen)
				src.SpdStolen-=0.1
				if(src.SpdStolen<0)
					src.SpdStolen=0
			if(src.ForStolen)
				src.ForStolen-=0.1
				if(src.ForStolen<0)
					src.ForStolen=0
			if(src.OffStolen)
				src.OffStolen-=0.1
				if(src.OffStolen<0)
					src.OffStolen=0
			if(src.DefStolen)
				src.DefStolen-=0.1
				if(src.DefStolen<0)
					src.DefStolen=0
			if(src.PowerEroded>0)
				src.PowerEroded-=0.02
				if(src.PowerEroded<0)
					src.PowerEroded=0
			if(src.StrEroded>0)
				src.StrEroded-=0.02
				if(src.StrEroded<0)
					src.StrEroded=0
			if(src.EndEroded>0)
				src.EndEroded-=0.02
				if(src.EndEroded<0)
					src.EndEroded=0
			if(src.SpdEroded>0)
				src.SpdEroded-=0.02
				if(src.SpdEroded<0)
					src.SpdEroded=0
			if(src.ForEroded>0)
				src.ForEroded-=0.02
				if(src.ForEroded<0)
					src.ForEroded=0
			if(src.OffEroded>0)
				src.OffEroded-=0.02
				if(src.OffEroded<0)
					src.OffEroded=0
			if(src.DefEroded>0)
				src.DefEroded-=0.02
				if(src.DefEroded<0)
					src.DefEroded=0
			if(src.RecovEroded>0)
				src.RecovEroded-=0.02
				if(src.RecovEroded<0)
					src.RecovEroded=0
			if(Health>10*(1-src.HealthCut)&&src.HealthAnnounce10)
				src.HealthAnnounce10=0
			if(Health>25*(1-src.HealthCut)&&src.HealthAnnounce25)
				src.HealthAnnounce25=0
			if(Health>50*(1-src.HealthCut)&&src.MeltyMessage)
				src.MeltyMessage=0
			if(Health>50*(1-src.HealthCut)&&src.VenomMessage)
				src.VenomMessage=0
			if(src.NanoBoost)
				if(src.Health>=75*(1-src.HealthCut)&&src.NanoAnnounce)
					src.NanoAnnounce=0
		if("Injury")
			if(PureRPMode)
				return
			if(src.Transfering)
				return
			if(src.SummonReturnTimer)
				return
			if(src.Oxygen<=10)
				return
			if(SenseRobbed>=2&&(src.SenseUnlocked<=src.SenseRobbed&&src.SenseUnlocked>5))
				Amount/=src.SenseRobbed
			if(src.MeditateModule)
				Amount*=10
			if(Swim&&Fishman)
				Amount*=2
			if(TotalInjury>0)
				var/InjuryRecov
				if(src.icon_state == "Meditate")
					InjuryRecov=0.003*(max(2,src.GetRecov())**2)*Amount*(max(0.1,Health/100))
				else
					InjuryRecov=0.002*(src.GetRecov()**4)*Amount*(max(0.1,Health/100))
				src.HealWounds(InjuryRecov)//Injuries last longer for good reason
			if(TotalInjury<50&&src.InjuryAnnounce)
				src.InjuryAnnounce=0
		if("Energy")
			if(PureRPMode)
				return
			if(src.Transfering)
				return
			if(src.LastBreath)
				return
			if(src.Oxygen<=10)
				return
			if(src.Race=="Changeling")
				Amount*=7.5
			if(SenseRobbed>=2&&(src.SenseUnlocked<=src.SenseRobbed&&src.SenseUnlocked>5))
				Amount/=src.SenseRobbed
			if(Swim&&Fishman)
				Amount*=2
			var/KiControl=src.GetKiControlMastery()
			if(KiControl>0)
				Amount*=1+KiControl
			if(src.Secret=="Ripple")
				Amount*=2
			Amount*=sqrt(max(1,GetRecov()))
			src.HealEnergy(Amount*(100/max(Health,1)))
		if("Fatigue")
			if(PureRPMode)
				return
			if(src.Transfering)
				return
			if(src.SummonReturnTimer)
				return
			if(src.Oxygen<=10)
				return
			if(src.TransActive()&&!src.HasMystic())
				if(src.masteries["[src.TransActive()]mastery"]>=10&&src.masteries["[src.TransActive()]mastery"]<100||(src.Race=="Saiyan"&&src.HasGodKi()&&masteries["4mastery"]!=100))
					return
			if(Swim&&Fishman)
				Amount*=2
			if(src.Secret=="Ripple")
				Amount*=2
			if(TotalFatigue>0)
				var/FatigueRecov=0.001*Amount
				src.HealFatigue(FatigueRecov)
		if("Mana")
			if(PureRPMode)
				return
			if(src.Transfering)
				return
			if(src.SummonReturnTimer)
				return
			if(UsingAnsatsuken())
				return
			if(Oxygen<=10)
				return
			if(SenseRobbed>=2&&(src.SenseUnlocked<=src.SenseRobbed&&src.SenseUnlocked>5))
				Amount/=src.SenseRobbed
			if(Swim&&Fishman)
				Amount*=2
			if(CheckSpecial("Bond Keeper"))
				Amount*=max(2,2*(1-(ManaAmount/(100*ManaCapMult))))
			src.HealMana(Amount)
		if("Capacity")
			if(PureRPMode)
				return
			if(src.SummonReturnTimer)
				return
			if(src.Transfering)
				return
			if(Oxygen<=10)
				return
			if(SenseRobbed>=2&&(src.SenseUnlocked<=src.SenseRobbed&&src.SenseUnlocked>5))
				Amount/=src.SenseRobbed
			if(Swim&&Fishman)
				Amount*=2
			if(TotalCapacity>0)
				var/CapacityRecov=((0.0001*(src.GetRecov()+src.GetRecov()))*Amount)
				src.HealCapacity(CapacityRecov)
			for(var/obj/Items/Enchantment/PhilosopherStone/PS in src)
				if(istype(PS, /obj/Items/Enchantment/PhilosopherStone/Magicite)) continue
				if(PS.CurrentCapacity<PS.MaxCapacity)
					PS.CurrentCapacity+=(0.0001*PS.SoulStrength*Amount)
				if(PS.CurrentCapacity>PS.MaxCapacity)
					PS.CurrentCapacity=PS.MaxCapacity




mob/proc/
	Available_Power()
//Kaiokek
		if(src.Kaioken)
			switch(src.Kaioken)
				if(1)
					src.PowerControl=150
					src.KaiokenBP=4/3
				if(2)
					src.PowerControl=150
					src.KaiokenBP=2
				if(3)
					src.PowerControl=200
					src.KaiokenBP=2
				if(4)
					src.PowerControl=250
					src.KaiokenBP=4
				if(5)
					src.PowerControl=300
					src.KaiokenBP=(20/3)
		else
			src.KaiokenBP=1
//EPM modifications
		var/EPM=src.Power_Multiplier

		if(src.HasMovementMastery())
			if(src.ActiveBuff && src.ActiveBuff.PowerMult > 1 && (GetPowerUpRatio()<=1))
				EPM+=((src.ActiveBuff.PowerMult-1) * (1+(src.GetMovementMastery()/10)))-(src.ActiveBuff.PowerMult-1)

		if(src.PowerEroded)
			EPM-=src.PowerEroded
		if(src.NanoBoost&&src.Health<25)
			EPM+=0.25
		if(src.Race in list("Saiyan","Half Saiyan","Alien","Changeling"))
			if(src.Race in list("Saiyan", "Half Saiyan") && !src.TransActive() && !src.HasTransMimic())//unlocked, but not active
				var/unlok=src.TransUnlocked()
				if(src.fake_unlock>unlok)
					unlok=src.fake_unlock
				switch(unlok)
					if(1)
						EPM+=0.25
					if(2)
						EPM+=0.5
					if(3)
						EPM+=0.75
					if(4)
						EPM+=1
			else if(src.TransActive() || src.HasTransMimic() || (src.Race=="Alien"&&src.AscensionsAcquired>=5))
				var/trans=src.TransActive()
				if(src.Race=="Alien")
					trans=src.AscensionsAcquired
				switch(trans)
					if(1)
						EPM+=0.5
					if(2)
						EPM+=1
					if(3)
						EPM+=1.5
					if(4)
						EPM+=2
			if(src.Race=="Changeling"&&src.AscensionsAcquired)
				EPM+=(0.25*src.AscensionsAcquired*src.TransActive())

		if(src.DemonicPower())
			var/pot=src.get_potential()
			EPM+=pot/100
		else
			if(src.Race=="Djinn")
				if(src.AscensionsAcquired>0 && src.AscensionsAcquired < 3)
					EPM*=(1+(src.AscensionsAcquired*0.5))
			if(src.Race=="Namekian" && src.TransActive())
				EPM*=2
			if(src.Race=="Makyo")
				if(src.ActiveBuff&&!src.HasMechanized())
					if(src.AscensionsAcquired)
						EPM+=(0.4*src.AscensionsAcquired)

		if(EPM<=0)
			EPM=0.1
//Ratio
		var/Ratio=1
		Ratio*=EPM
		if(src.HasHellPower())
			Ratio*=src.GetHellScaling()
		Ratio*=src.Base()
		potential_power(src)//get them potential powers
		Ratio*=src.potential_power_mult


		//BODY CONDITION INFLUENCES
		if(!src.HasPiloting())
			if(!src.HasPossessive())
				if(!src.Timeless&&!src.Dead)
					var/AgeRate=1

					if((src.EraBody=="Child"||src.EraBody=="Youth")&&src.Aged)
						AgeRate=1
					else if(src.EraBody=="Child"||src.EraBody=="Senile")
						if(src.ParasiteCrest())
							AgeRate=0.5
						else
							AgeRate=0.4
					else if(src.EraBody=="Youth"||src.EraBody=="Elder")
						if(src.ParasiteCrest())
							AgeRate=0.5
						else
							AgeRate=0.8
					else
						AgeRate=1

					if(src.Race=="Monster"&&src.Class=="Yokai")
						if(src.EraBody=="Elder"||(src.EraBody=="Adult"&&src.Aged))
							AgeRate=1.25
					if(src.Race=="Half Saiyan"&&src.Anger)
						AgeRate=1
					Ratio*=AgeRate
				if(locate(/obj/Seal/Power_Seal, src))
					Ratio*=0.5
				if(src.CanLoseVitalBP()||src.Anaerobic)
					Ratio*=1+(src.GetHealthBPMult()+src.GetEnergyBPMult())
				if(src.JaganPowerNerf)
					Ratio*=src.JaganPowerNerf
				if(src.BPPoison)
					if((src.Secret=="Zombie"||src.Doped||(src.SagaLevel>=7&&src.AnsatsukenAscension=="Chikara"))&&src.BPPoison<1)
						Ratio*=1
					else
						Ratio*=src.BPPoison
				if(src.Maimed)
					var/Ignore=src.HasMaimMastery()
					if(Ignore)
						Ratio*=1
					else
						src.MaimsOutstanding=max(src.Maimed-(0.5*src.GetProsthetics()), 0)
						Ratio*=(1-(0.2*src.MaimsOutstanding))
				if(src.HasWeights()&&src.Saga!="Eight Gates")
					Ratio*=0.8
				if(src.PotionCD)
					Ratio*=0.8
				if(src.Roided)
					Ratio*=1.25
				if(src.OverClockNerf)
					Ratio*=max(1-src.OverClockNerf,0.1)
				if(src.GatesNerfPerc)
					Ratio*=((100-src.GatesNerfPerc)/100)
				if(src.AngerMax)
					var/a=1
					if(src.HasCalmAnger())
						a=src.AngerMax
						if(src.Race=="Half Saiyan"||(src.AnsatsukenAscension=="Chikara"&&src.StyleActive=="Ansatsuken"))
							a=max(src.AngerMax,2)
						if(src.AngerMult>1)
							var/ang=a-1//Usable anger
							var/mult=ang*src.AngerMult
							a=mult+1
					else if(Anger&&!src.HasNoAnger())
						a=Anger
						if(src.Race=="Half Saiyan")
							a=max(src.AngerMax,2)
						if(src.AngerMult>1)
							var/ang=a-1//Usable anger
							var/mult=ang*src.AngerMult
							a=mult+1
						if(src.HasAngerThreshold())
							if(a<src.GetAngerThreshold())
								a=src.GetAngerThreshold()
						if(src.DefianceCounter)
							a+=src.DefianceCounter*0.05
					if(src.CyberCancel>0)
						var/ang=a-1//Usable anger.
						var/cancel=ang*src.CyberCancel//1 Cyber Cancel = all of usable anger.
						a-=cancel//take the anger away.
						if(a<1)//Only nerf anger.
							a=1
					if(src.PhylacteryNerf)
						a-=(a*src.PhylacteryNerf)
					if(a<=0)
						a=0.01
					Ratio*=a

			//sneaky
			if(src.PowerInvisible)
				Ratio*=src.PowerInvisible
			if(src.PowerBoost)
				Ratio*=src.PowerBoost
				if(src.ssj["active"]&&src.CheckActive("Ki Control"))
					if(src.masteries["[src.ssj["active"]]mastery"]==100)
						Ratio*=1.2
			if(src.RPPower)
				Ratio*=RPPower
			if(src.TarotFate=="The Sun")
				Ratio*=1.5

			if(src.Target)
				if(ismob(src.Target))
					if(src.CheckSlotless("Saiyan Soul")&&!src.Target.CheckSlotless("Saiyan Soul"))
						if(Power<src.Target.Power)
							Ratio=src.Target.Power/src.Target.GetPowerUpRatio()
					if(src.HasMirrorStats()&&!src.Target.HasMirrorStats()&&!src.Target.CheckSlotless("Saiyan Soul"))
						Ratio=src.Target.Power/src.Target.GetPowerUpRatio()

		Power=Ratio*GetPowerUpRatio()

		//HIGH LEVEL FUCKERY
		if(locate(/obj/Skills/Soul_Contract, src)&&src.ContractPowered>0)
			Ratio*=1+(0.1*src.ContractPowered)
		else if(locate(/obj/Skills/Soul_Contract, src)&&src.ContractPowered<=0)
			Ratio*=0.5
		if(src.Dead&&!src.KeepBody)
			Ratio*=0.5
		else if(src.z==global.DeadZ&&!src.CheckSpecial("Cancer Cloth")&&src.SenseUnlocked<8&&!src.SpiritPower)
			Ratio*=0.5

		if(src.KO)
			Power*=0.05

		if(prob(99))//Health/Energy Recovery
			if(GetPowerUpRatio()<=1)
				if(icon_state=="Meditate")
					if(TotalInjury<50&&src.InjuryAnnounce)
						src.InjuryAnnounce=0
					if(Health>10*(1-src.HealthCut)&&src.HealthAnnounce10)
						src.HealthAnnounce10=0
					if(Health>25*(1-src.HealthCut)&&src.HealthAnnounce25)
						src.HealthAnnounce25=0
					if(Health<(100*(1-src.HealthCut))||src.BioArmor<src.BioArmorMax)
						var/Boosted=1
						if(src.Race=="Djinn")
							Boosted*=2.5
							if(src.AscensionsAcquired<3&&src.AscensionsAcquired>0)
								Boosted/=(src.AscensionsAcquired+0.5)
						Recover("Health",1*Boosted)
						Recover("Injury",1*Boosted)
						if(src.Restoration||src.Secret=="Zombie")
							Recover("Health",1)
							Recover("Injury",1)
							BPPoisonTimer-=15
						if(src.Race=="Djinn")
							src.BPPoisonTimer=1
					if(src.Energy<src.EnergyMax)
						Recover("Energy",2)
						Recover("Fatigue",2)
						if(src.Restoration)
							Recover("Energy",1)
							Recover("Fatigue",1)
					if(ManaAmount<((src.ManaMax-src.TotalCapacity)*src.GetManaCapMult())||src.Secret=="Senjutsu"&&src.CheckSlotless("Senjutsu Focus"))
						if(!src.HasMechanized())
							Recover("Mana",1)
							if(src.Restoration)
								Recover("Mana",1)
					Recover("Capacity",2)
					if(locate(/obj/Regenerate, src))
						if(!src.Regenerating)
							for(var/obj/Regenerate/A in src)
								if(A.Level<1)
									A.Level+=0.1
									if(A.Level>=1)
										A.Level=1
				else
					Recover("Energy",1)

			if(src.PowerControl<=25)
				Recover("Fatigue",1)
				if(src.ManaDeath)
					ManaAmount-=5*src.ManaCapMult
				else if(src.is_arcane_beast || (src.Race=="Monster" && src.Class=="Yokai" && src.AscensionsAcquired>0 && !src.Mechanized && !src.ActiveBuff))
					if(src.Race=="Monster")
						Recover("Mana", 1*src.ManaCapMult)
					else
						Recover("Mana",1)

			if(src.FusionPowered)
				Recover("Energy",1)

			if(src.FusionPowered&&!src.SpecialBuff||src.is_arcane_beast)
				Recover("Mana",1)

			if(src.TotalCapacity>0)
				Recover("Capacity", 1)

		if(prob(100))//PC System
			if(src.PoweringUp==1 && !PureRPMode && src.icon_state!="Meditate")

				var/PUGain=src.PUSpeedModifier
				if(src.HasPULock())
					PUGain=0
				if(!src.HasHealthPU())
					PUGain*=src.GetRecov(10)
				else
					PUGain*=src.GetRecov(10)
				if(src.ChakraFreeze)
					if(!src.PURestrictionRemove)//You can't freeze the limitless
						PUGain*=0
					src.ChakraFreeze--
					if(src.ChakraFreeze<=0)
						src.ChakraFreeze=0
				if(src.Kaioken)
					PUGain=0
					src.PoweringUp=0
				if(src.HasKiControlMastery())
					if(src.TransActive())
						if(src.masteries["[src.TransActive()]mastery"]<10&&src.masteries["[src.TransActive()]mastery"]>=100&&!(src.Race=="Saiyan"&&src.HasGodKi()&&masteries["4mastery"]!=100))
							PUGain*=1+(src.GetKiControlMastery())
					else
						PUGain*=1+(src.GetKiControlMastery())
				src.PowerControl+=PUGain
				var/PUThreshold=150
				if(src.Race=="Changeling"&&src.TransActive()==4)
					PUThreshold+=50
				if(src.PowerControl>=PUThreshold)
					if(!src.ActiveBuff)
						src.Auraz("Remove")
						if(src.Race!="Changeling"||(src.Race=="Changeling"&&src.TransActive()==4))
							for(var/obj/Skills/Buffs/ActiveBuffs/Ki_Control/KC in src)
								if(!src.BuffOn(KC))
									src.UseBuff(KC)
									break
						else
							if(src.TransActive()==3)
								if(src.Class=="Prodigy")
									for(var/obj/Skills/Buffs/SpecialBuffs/OneHundredPercentPower/FF in src)
										if(!src.BuffOn(FF))
											src.UseBuff(FF)
											break
								else if(src.Class=="Experience")
									for(var/obj/Skills/Buffs/SpecialBuffs/FifthForm/FF in src)
										if(!src.BuffOn(FF))
											src.UseBuff(FF)
											break
					src.PowerControl=PUThreshold
					src.PoweringUp=0
				if(src.Energy<=30&&!src.PUUnlimited)
					src.Auraz("Remove")
					src<<"You are too tired to power up."
					src.PoweringUp=0
					if(Race=="Saiyan"||Race=="Half Saiyan")
						if(src.TransActive()>0)
							var/TransActive=src.ssj["active"]
							var/Skip=0
							if(src.ssj["[TransActive]mastery"]>=100||src.ssj["[TransActive]mastery"]<10)
								Skip=1
							if(src.HasNoRevert())
								Skip=1
							if(!Skip)
								Revert()
					src.PowerControl=100
					src.LoseEnergy(30)

			//Beyond 100% Drain
			if(!KO && src.PowerControl>=100 && src.PoweringUp && !src.PureRPMode)
				if(src.Energy<=30&&!src.PUUnlimited)
					src.PoweringUp=0
					src.Auraz("Remove")
					src<<"You are too tired to power up."
					if(Race=="Saiyan"|Race=="Half Saiyan")
						if(src.TransActive()>0)
							var/TransActive=src.ssj["active"]
							var/Skip=0
							if(src.ssj["[TransActive]mastery"]>=100||src.ssj["[TransActive]mastery"]<10)
								Skip=1
							if(src.HasNoRevert())
								Skip=1
							if(!Skip)
								Revert()
					src.PowerControl=100
					src.LoseEnergy(30)


				var/PowerDrain=1
				PowerDrain/=src.PUDrainReduction
				if(src.PowerControl<=src.PUEffortless)
					PowerDrain*=0
				if(src.Race=="Changeling")
					PowerDrain/=7.5
				if(!PureRPMode)
					if(!src.PUUnlimited)
						if(src.HasManaPU())
							src.LoseMana(1*PowerDrain*WorldPUDrain)
						else
							src.LoseEnergy(2*PowerDrain*WorldPUDrain)


mob/proc/Update_Stat_Labels()
	set waitfor=0
	if(!src.ha)
		if(src)
			var/ManaMessage="%"
			if(round(TotalInjury))
				src<<output("Health: [round(Health)+round(BioArmor)] (Injuries:[round(TotalInjury)]%)", "BarHealth")
			else
				src<<output("Health: [round(Health)+round(BioArmor)]%", "BarHealth")
			if(round(TotalFatigue))
				src<<output("Energy: [round((Energy/EnergyMax)*100)] (Fatigue:[round(TotalFatigue)]%)","BarEnergy")
			else
				src<<output("Energy: [round((Energy/EnergyMax)*100)]%","BarEnergy")
			if(round(TotalCapacity))
				ManaMessage=" (Capacity:[100-round(TotalCapacity)]%)"

			if(src.Saga=="Ansatsuken"&&src.UsingAnsatsuken())
				src<<output("SUPER: [round(ManaAmount/ManaMax*100)]","BarMana")
			else if(src.HasMechanized())
				src<<output("Battery: [round(ManaAmount/ManaMax*100)]","BarMana")
			else
				src<<output("Mana: [round(ManaAmount/ManaMax*100)][ManaMessage]","BarMana")
			if(!src.Anger&&!src.Kaioken)
				if(src.PoweringUp)
					src<<output("Power: [round((Energy/EnergyMax)*Health)*round(src.GetPowerUpRatioVisble(), 0.01)]% (+)","BarPower")
				else if(src.PowerControl<100)
					src<<output("Power: [round((Energy/EnergyMax)*Health)*round(src.GetPowerUpRatioVisble(), 0.01)]% (-)","BarPower")
				else
					src<<output("Power: [round((Energy/EnergyMax)*Health)*round(src.GetPowerUpRatioVisble(), 0.01)]%","BarPower")
			else
				if(src.PoweringUp)
					src<<output("Power: [round((100/EnergyMax)*100)*round(src.GetPowerUpRatioVisble(), 0.01)*src.KaiokenBP]% (+)","BarPower")
				else if(src.PowerControl<100)
					src<<output("Power: [round((100/EnergyMax)*100)*round(src.GetPowerUpRatioVisble(), 0.01)*src.KaiokenBP]% (-)","BarPower")
				else
					src<<output("Power: [round((100/EnergyMax)*100)*round(src.GetPowerUpRatioVisble(), 0.01)*src.KaiokenBP]%","BarPower")
			if(src.Poison>0)
				winshow(src, "BarPoison",1)
				src<<output("POI: [round(Poison, 1)]","BarPoison")
			else
				winshow(src, "BarPoison",0)
			if(src.Burn>0)
				winshow(src, "BarBurning",1)
				src<<output("BUR: [round(Burn, 1)]","BarBurning")
			else
				winshow(src, "BarBurning",0)
			if(src.Shatter>0)
				winshow(src, "BarBreak",1)
				src<<output("SHT: [round(Shatter, 1)]","BarBreak")
			else
				winshow(src, "BarBreak",0)
			if(src.Shock>0)
				winshow(src, "BarShock",1)
				src<<output("SHK: [round(Shock, 1)]","BarShock")
			else
				winshow(src, "BarShock",0)
			if(src.Slow>0)
				winshow(src, "BarSlow",1)
				src<<output("CHL: [round(Slow, 1)]","BarSlow")
			else
				winshow(src, "BarSlow",0)
			if(src.Sheared>0)
				winshow(src, "BarPotion",1)
				src<<output("SHR: [round(Sheared, 1)]","BarPotion")
			else
				winshow(src, "BarPotion",0)
			if(src.PureRPMode==1)
				winshow(src, "BarRP",1)
				src<<output("RP MODE","BarRP")
			else
				winshow(src, "BarRP",0)
			if(src.WoundIntent==1||src.Lethal>=1)
				if(src.Lethal==1)
					winshow(src, "BarWound",1)
					src<<output("LETHAL","BarWound")
				else
					winshow(src, "BarWound",1)
					src<<output("INJURE","BarWound")
			else
				winshow(src, "BarWound",0)
			if(src.StyleActive)
				winshow(src, "StyleLabel",1)
				winshow(src, "StanceLabel",1)
				src<<output("[src.StyleActive]","StyleLabel")
				src<<output("[src.StanceActive]","StanceLabel")
				if(src.StyleBuff.Mastery>=4)
					winshow(src, "TensionLabel",1)
					winshow(src, "TensionBar",1)
					winset(src, "TensionBar", "value=[src.Tension]")
					if(src.Tension>=100)
						winset(src, "TensionBar", "bar-color='#F00'")
						winset(src, "TensionLabel", "text-color='#F00'")
						src << output("FINISHER!!!", "TensionLabel")
					else
						winset(src, "TensionBar", "bar-color='#F0F'")
						winset(src, "TensionLabel", "text-color='#F0F'")
						src << output("TENSION", "TensionLabel")
				if(locate(/obj/Skills/Zanzoken, src))
					winshow(src, "MovementBar", 1)
					winshow(src, "MovementLabel", 1)
					if(src.MovementCharges<1)
						winset(src, "MovementBar", "bar-color=#666")
						winset(src, "MovementLabel", "text-color=#666")
					else if(src.MovementCharges<2)
						winset(src, "MovementBar", "bar-color=#0F0")
						winset(src, "MovementLabel","text-color=#0F0")
					else if(src.MovementCharges<3)
						winset(src, "MovementBar", "bar-color=#F00")
						winset(src, "MovementLabel", "text-color=#F00")
					else
						winset(src, "MovementBar", "bar-color=#FF0")
						winset(src, "MovementLabel", "text-color=#FF0")
					winset(src, "MovementBar", "value=[(src.MovementCharges-round(src.MovementCharges))*100]")
					winset(src, "MovementLabel", "text=[round(src.MovementCharges)]")
			else
				winshow(src, "StyleLabel",0)
				winshow(src, "StanceLabel",0)
				winshow(src, "TensionLabel",0)
				winshow(src, "TensionBar",0)
				winshow(src, "MovementBar", 0)
				winshow(src, "MovementLabel", 0)

	if(!(src.Race in list("Android","Changeling","Djinn","Dragon")))
		if(src.Oxygen!=(src.OxygenMax/max(src.SenseRobbed,1)))
			winshow(src, "BarOxygen",1)
			src<<output("OXY: [round(Oxygen, 1)]","BarOxygen")
		else
			winshow(src, "BarOxygen",0)

mob/var/tmp/ha=0

mob/verb/SwitchShit()
	set hidden=1
	usr.ha=0
	for(var/e in list("Health","Energy","Mana","Power"))
		winset(src,"Bar[e]","is-visible=true")

mob/proc/Get_Sense_Reading(mob/A)
	var/One=src.Get_Scouter_Reading(A)
	var/Two=src.Get_Scouter_Reading(src)
	if(One<1)
		One=1
	if(Two<1)
		Two=1
	var/Power=100*(One/Two)
	var/SenseDebugger=Power
	Power=round(Power)
	if(Power<10)
		Power="Inconsequential"
	else if(Power<50)
		Power="Much Weaker"
	else if(Power>=50&&Power<90)
		Power="Weaker"
	else if(Power>=90&&Power<110)
		Power="Equal"
	else if(Power>=110&&Power<200)
		Power="Stronger"
	else if(Power>=200&&Power<500)
		Power="Much Stronger"
	else if(Power>=500)
		Power="Massively Stronger"
	else
		Power="It's derping! Power %[SenseDebugger]"
	Power="[Power]"
	if(A.Health<=25)
		Power+=" (Disturbed)"
	else if(A.KO&&A.MortallyWounded)
		Power+=" (Fading)"
	return Power

mob/proc/Get_Scouter_Reading(mob/B)
	var/Ratio=B.EnergyUniqueness
//EPM mods
	var/EPM=B.Power_Multiplier//effective power multiplier
	if(B.PowerEroded)
		EPM-=B.PowerEroded
	if(B.NanoBoost&&B.Health<25)
		EPM+=0.25
	if(B.Race=="Makyo")
		if((B.ActiveBuff||B.CheckSlotless("AntiForm"))&&!B.HasMechanized())
			EPM*=1+(0.5*B.AscensionsAcquired)
	if(EPM<=0)
		EPM=0.1
//Ratio
	Ratio*=EPM
	if(B.HasLegendaryPower())
		Ratio*=1 + (0.5*B.HasLegendaryPower())
	if(B.HasHellPower())
		Ratio*=B.GetHellScaling()
	Ratio*=B.Base()
	potential_power(B)//get them potential powers
	Ratio*=B.potential_power_mult

	//BODY CONDITION ADJUSTMENTS
	if(!B.HasPiloting())
		if(!B.HasPossessive())
			if(!B.Timeless)
				var/AgeRate=1

				if((B.EraBody=="Child"||B.EraBody=="Youth")&&B.Aged)
					AgeRate=1
				else if(B.EraBody=="Child"||B.EraBody=="Senile")
					if(B.ParasiteCrest())
						AgeRate=0.5
					else
						AgeRate=0.4
				else if(B.EraBody=="Youth"||B.EraBody=="Elder")
					if(B.ParasiteCrest())
						AgeRate=0.5
					else
						AgeRate=0.8
				else
					AgeRate=1

				if(B.Race=="Monster"&&B.Class=="Yokai")
					if(B.EraBody=="Elder"||(B.EraBody=="Adult"&&B.Aged))
						AgeRate=1.25
				if(B.Race=="Half Saiyan"&&B.Anger)
					AgeRate=1
				Ratio*=AgeRate
			if(locate(/obj/Seal/Power_Seal, B))
				Ratio*=0.5
			if(B.CanLoseVitalBP()||B.Anaerobic)
				Ratio*=1+(B.GetHealthBPMult()+B.GetEnergyBPMult())
			if(B.JaganPowerNerf)
				Ratio*=B.JaganPowerNerf
			if(B.BPPoison)
				if((B.Secret=="Zombie"||B.Doped||(B.SagaLevel>=7&&B.AnsatsukenAscension=="Chikara"))&&B.BPPoison<1)
					Ratio*=1
				else
					Ratio*=B.BPPoison
			if(B.Maimed)
				var/Ignore=B.HasMaimMastery()
				if(Ignore)
					Ratio*=1
				else
					B.MaimsOutstanding=max(B.Maimed-(0.5*B.GetProsthetics()), 0)
					Ratio*=(1-(0.2*B.MaimsOutstanding))
			if(B.HasWeights())
				Ratio*=0.8
			if(B.Roided)
				Ratio*=1.25
			if(B.OverClockNerf)
				Ratio*=(1-B.OverClockNerf)
			if(B.GatesNerfPerc)
				Ratio*=((100-B.GatesNerfPerc)/100)
			if(B.AngerMax)
				var/a=1
				if(B.HasCalmAnger())
					a=B.AngerMax
					if(B.AngerMult>1)
						var/ang=a-1//Usable anger
						var/mult=ang*B.AngerMult
						a=mult+1
				else if(B.Anger&&!B.HasNoAnger()&&!B.HiddenAnger)
					a=B.Anger
					if(B.Race=="Half Saiyan"&&a<2)
						a=2
					if(B.AngerMult>1)
						var/ang=a-1//Usable anger
						var/mult=ang*B.AngerMult
						a=mult+1
					if(B.HasAngerThreshold())
						if(a<B.GetAngerThreshold())
							a=B.GetAngerThreshold()
					if(B.DefianceCounter)
						a+=B.DefianceCounter*0.05
				if(B.CyberCancel>0)
					var/ang=a-1//Usable anger.
					var/cancel=ang*B.CyberCancel//1 Cyber Cancel = all of usable anger.
					a-=cancel//take the anger away.
					if(a<1)//Only nerf anger.
						a=1
				if(B.PhylacteryNerf)
					a-=(a*B.PhylacteryNerf)
				if(a<=0)
					a=0.01
				Ratio*=a

		if(B.HasIntimidation()&&B.PowerControl>25)
			Ratio*=B.GetIntimidation()
		if(B.PowerBoost)
			Ratio*=B.PowerBoost
			if(B.ssj["active"]&&B.CheckActive("Ki Control"))
				if(B.masteries["[B.ssj["active"]]mastery"]==100)
					Ratio*=1.2
		if(B.RPPower)
			Ratio*=B.RPPower
		if(B.TarotFate=="The Sun")
			Ratio*=1.5

	Ratio*=B.GetPowerUpRatioVisble()

	//HIGH LEVEL FUCKERY
	if(locate(/obj/Skills/Soul_Contract, B)&&B.ContractPowered>0)
		Ratio*=1+(0.1*B.ContractPowered)
	else if(locate(/obj/Skills/Soul_Contract, B)&&B.ContractPowered<=0)
		Ratio*=0.5
	if(B.Dead&&!B.KeepBody)
		Ratio*=0.5
	else if(B.z==global.DeadZ&&!B.CheckActive("Cancer Cloth")&&B.SenseUnlocked<8&&!B.SpiritPower)
		Ratio*=0.5

	var/Reading=Ratio

	if(B.KO)
		Reading*=0.05
	if(Reading<1)
		Reading=1
	return Reading

/*var/obj/stats_object/stats_object = new
obj/stats_object
	name = "View Players"
	Click()
		..()
		var/mob/Players/p = usr
		if(istype(p))
			p.Who()*/