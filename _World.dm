var/list/PermaKeys=list("Dadafas1", "Miscreated", "Toefiejin", "StrangeBanana", "Cool pro", "Drileyx", "Ss4toby", "Uwuesketit", "Bigd123", "Sarutabaruta", "Pigepic", "Shadeofwar", "WarHorse76", "Earo123456", "George Bush Did 911", "Syeburn", "Xaithyl", "Yoshima Monomyth", "Naviel", "Greg76", "Sekots", "CaelumZ", "Earo12345", "TienShenhan", "WhatIsOriginality", "Solobb-", "Xerif", "MikaNX", "Tusk Act 4", "Vaina", "ProtoZSX", "Revelution", "Higashikata Josuke", "BDSMLover92", "Justbroli", "Hellz Raze", "Takakashi z")
var/list/PermaIPs=list("73.132.147.113", "77.175.168.164", "74.105.35.124", "81.132.77.65", "64.130.69.214", "65.185.161.235", "108.61.39.115", "75.65.2.4", "24.50.233.176", "50.39.120.226", "135.180.40.74", "86.181.159.231", "45.36.32.84", "198.85.212.230", "74.88.65.98", "76.23.208.95", "66.172.248.64", "185.156.175.35", "136.62.42.182", "68.8.92.94", "109.246.123.195", "24.36.113.151", "67.198.127.237", "82.34.152.124", "121.223.199.102", "174.108.20.140", "179.43.133.139", "174.108.20.140", "73.47.207.244", "71.64.147.189", "70.35.179.6", "69.10.118.103", "86.19.157.156")
var/list/PermaComps=list("3488379531", "1990235738", "1662279420", "835666311", "3995897142", "3272450259", "1395820860", "1629772640", "3856341027", "938246607", "975079193", "1526134833", "4102036161", "3446557113", "3878049361", "2311757843", "3649180149", "991955925", "2016627605", "3836126501", "4003197390", "4145629418", "1476716854", "4229503323", "1353023831", "348890025", "308161406", "729772691", "1049091416", "2196626777", "2781360184", "3770567560", "961693842")

var/MakyoStar=0

world
	name="Roleplay Rebirth: Under Magic Afterbirth"
	status="DBR: Whisk Biscuit"
	turf=/turf/Special/Blank
	mob= /mob/Creation
	hub="AmatsuDarkfyre.RoleplayRebirth"
	hub_password="silverion"
	tick_lag=1
	fps=20
	cache_lifespan=2
	loop_checks=0
	view=12
	OpenPort()
		..()
		world<<"World Link: byond://[address]:[port]."
	New()
		..()

		LOGscheduler.start()

		WorldLoading=1
		spawn(100)GlobalSave()
		Stars()
		GenerateWorldInstances()
		log=file("Saves/Errors.log")
		spawn(10)

			BootWorld("Load")
			for(var/obj/Special/Teleporter2/q in world)
				if(q.invisibility>100)
					q.invisibility=100
			for(var/obj/Items/Sword/Light/Legendary/ws in world)
				if(!ws.TrueLegend)
					del ws
			for(var/obj/Items/Sword/Medium/Legendary/ws in world)
				if(!ws.TrueLegend)
					del ws
			for(var/obj/Items/Sword/Heavy/Legendary/ws in world)
				if(!ws.TrueLegend)
					del ws
			for(var/obj/Items/Enchantment/Staff/NonElemental/Wand/Legendary/ws in world)
				if(!ws.TrueLegend)
					del ws
			for(var/obj/Items/Enchantment/Staff/NonElemental/Rod/Legendary/ws in world)
				if(!ws.TrueLegend)
					del ws
			for(var/obj/Items/Enchantment/Staff/NonElemental/Staff/Legendary/ws in world)
				if(!ws.TrueLegend)
					del ws
		BuildGeneralMagicDatabase()
		BuildGeneralWeaponryDatabase()
		GeneratePlayActionDatabase()
		world.SetConfig("APP/admin", "Kokutou", "role=admin")
		world.SetConfig("APP/admin", "KokoroWatari", "role=admin")
		world.SetConfig("APP/admin", "Galion", "role=admin")

	Del()
		..()




proc/GlobalSave()
	set background=1
	sleep(216000)
	world<< "<b><HTML><FONT COLOR=#FF0000>T</FONT><FONT COLOR=#FF2900>h</FONT><FONT COLOR=#FF5200>e</FONT><FONT COLOR=#FF7B00> </FONT><FONT COLOR=#FFA400>w</FONT><FONT COLOR=#FFCD00>o</FONT><FONT COLOR=#FFF600>r</FONT><FONT COLOR=#FFff00>l</FONT><FONT COLOR=#D6ff00>d</FONT><FONT COLOR=#ADff00> </FONT><FONT COLOR=#84ff00>i</FONT><FONT COLOR=#5Bff00>s</FONT><FONT COLOR=#32ff00> </FONT><FONT COLOR=#09ff00>s</FONT><FONT COLOR=#00ff00>a</FONT><FONT COLOR=#00ff29>v</FONT><FONT COLOR=#00ff52>i</FONT><FONT COLOR=#00ff7B>n</FONT><FONT COLOR=#00ffA4>g</FONT><FONT COLOR=#00ffCD>.</FONT><FONT COLOR=#00ffF6> </FONT><FONT COLOR=#00ffff>P</FONT><FONT COLOR=#00F6ff>r</FONT><FONT COLOR=#00CDff>e</FONT><FONT COLOR=#00A4ff>p</FONT><FONT COLOR=#007Bff>a</FONT><FONT COLOR=#0052ff>r</FONT><FONT COLOR=#0029ff>e</FONT><FONT COLOR=#0000ff> </FONT><FONT COLOR=#0900ff>y</FONT><FONT COLOR=#3200ff>o</FONT><FONT COLOR=#5B00ff>u</FONT><FONT COLOR=#8400ff>r</FONT><FONT COLOR=#AD00ff>s</FONT><FONT COLOR=#D600ff>e</FONT><FONT COLOR=#FF00ff>l</FONT><FONT COLOR=#FF00F6>f</FONT><FONT COLOR=#FF00CD>!</FONT></HTML></b>"
	for(var/mob/Players/Q)
		if(Q.Savable&&Q.client!=null)
			Q.client.SaveChar()
	BootWorld("Save")
	.()



var/Updates={"
<font face="calibri">
<b>07 / 28 / 2020<br>
the last, for real this time</b><br>
<ul>
<font size=+1>Buffs</font size>
<li>Golden Form drains half as much.</li>
<li>Hiten Mitsurugi Tier 8 removes all fatigue costs from its techniques.</li>
<li>changeling</li>
<br>
<font size=+1>Fixes</font size>
<li>Cure, Curaga, Esuna, and Esunaga should turn off even if you don't have a captured target, which should bulletproof some buggy behavior.</li>
</ul>
<br><br>
<b>07 / 26 / 2020<br>
the last, unless it's not</b><br>
<ul>
<font size=+1>Fixes</font size>
<li>Buster behaviors unstickified further ... hopefully. These are actually kinda fun.</li>
<li>Various fixes to screen colors getting stuck. If this happens to you, ask for admins to set "TsukiyomiTime to 1" and then turn RP mode off.</li>
<li>Purity influenced projectiles will no longer heal, which is bringing it in line to updated purity behavior.</li>
<br>
<font size=+1>Nerfs</font size>
<li>Magicite economy shot in the head. Kidding, it's just division by 2.5.</li>
<li>Judgment nerfed.</li>
<li>Makyo intimidation ignore scales with their ascension now.</li>
<br>
<font size=+1>Buffs</font size>
<li>Hack n Slash receives ComboMaster, a logical thing for it to have since it begs to be used after a launcher.</li>
</ul>
<br><br>
<b>07 / 23 / 2020<br>
spirit hand machine broke</b><br>
<ul>
<font size=+1>Nerfs</font size>
<li>Spirit Hand is now included in the please-don't-stack-Spirit-Sword schema.</li>
<li>Namekian Fusion removed from automation as you guys are literally incapable of not being dumbasses with it.</li>
<li>Soul Calibur's Noble Phantasm now operates under TurfShift effects, so it will eventually fade away. It also does a fuckton of damage to evil shit now, instead of just putting it in time out.</li>
<li>Nerfed a bug's ability to prevent someone from picking Titan Form. >:(</li>
<li>Evil Purity is no longer a feature. haha</li>
<li>Kai Shinjin can no longer get T3 skills through automation. Makai totally can though.</li>
</ul>
<br><br>
<b>07 / 22 / 2020<br>
health drain machine broke</b><br>
<ul>
<font size=+1>Nerfs...?</font size>
<li>Phylacteries will no longer leave you bleeding out.</li>
<li>Health Drain is no longer an aspect of finisher debuffs. In most cases it has been replaced with bleedhit on the afflicted.</li>
<li>Denjin Renki mana cost decreases as Ansatsuken level goes above 6.</li>
<li>Cure and Curaga are now once-a-fight spells.</li>
<li>Heal is also once a fight.</li>
<li>Spells that can only be used once a fight cannot be crested anymore.</li>
<li>Spells that are flagged as not being able to be implanted into a crest do not show up on the list anymore, rather than just denying them if they are attempted.</li>
<li>Magic Crests should automatically update with these changes and allow you to carve spells in them once again if some of them were removed.</li>
<li>Event Credit no longer gives you double the daily reward...??? i have brain damage</li>
<li>Event Credit will now properly go into economy charges once again, probably for quite some time, because of the aforementioned double event gains.</li>
<li>Enchanter Humans no longer get Grimoire Arcana for free.</li>
<li>Enchanter Namekians no longer get Grimoire Arcana for free.</li>
<li>Everyone lost their Grimoires because people cannot resist muling for Grimoires. It will be sorted out by admins if you have your grimoire returned to you. Nox Nyctores are exempt, mostly because they are cool.</li>
<li>Grimoire Arcana has no limits on the amount of grimoires it can make.</li>
<li>The number of Grimoires made this wipe has been reset, again with the exception of the Nox Nyctores.</li>
<br>
<font size=+1>Buffs</font size>
<li>Butcher's Finisher technique no longer does turf destruction, that was funny for like one wipe but I must protect the map.</li>
<li>Drunken Fist and Golden Kirin now have FluidForm attached to the style rather than the buff.</li>
<li>Drunken Fist gets erosion on the style rather than the finisher buff.</li>
<li>Golden Kirin gets a charge of flicker on the style rather than the finisher buff.</li>
<li>Butcher Style regains 2.5 slayer mod.</li>
<li>Five Rings Style inherits Butcher's 2.5 slayer mod.</li>
<li>Event Credit will bolster teacher's teach RPP as well.</li>
<li>Enchanter Humans do get x2 imagination mod, ask an admin to update you.</li>
<li>Enchanter Namekains get an additional +0.5 mana cap mult.</li>
</ul>
<br><br>
<b>07 / 21 / 2020<br>
saiyan machine broke</b><br>
<ul>
<font size=+1>Nerfs</font size>
<li>Saiyan auto-SSj moved back to 40 potential for SSj and 80 potential for SSj2. SSj3 will never be acquired automatically.</li>
<li>Trance Form now counts as a magic focus so that you can go into it without needing a focus. Knight Trance still disables your magic, though.</li>
<li>SSj2 intimidation scaled back from 50 to 30, SSj3 intimidation scaled from 70 to 50. SSj4 still gives 100 intimidation because it's cool.</li>
<li>SSj Grades automatically acquired at 60 potential. Saiyans don't have the capacity to get special slotters.</li>
<li>Legend of Black Heaven removed from the signature 3 selection pool. It is cool and an outlier and therefore shall not be available to the public.</li>
<li>Unbound Mode now properly occupies a Special Slot position. Its cooldown has been nerfed (it is no longer once a fight), and its lack of stat boosts has also been nerfed (meaning it gives boosts). The mana leak is higher.</li>
<li>Sparking Blast now provides a stable length of time that it is up for, stat boosts, and more sure-fire usefulness. It lasts for 25 seconds, and can only be triggered below 25% health. It is also a proper special slotter. It can also be only used once a battle!!</li>
<li>Saiyans lose access to special buffs that they can't use.</li>
<li>Everyone who picked Unbound Mode, Sparking Blast, or Legend of Black Heaven had it removed.</li>
<li>consent is important</li>
<li>SSj grades now adapt to your highest level of unlocked transformation.</li>
<li>Crystals of Reversal now return your saiyan tails if you've lost them.</li>
<li>Military Frame Special Slotters no longer have cooldowns.</li>
<li>Azure, True Azure, and Time Alter Grimoires are now counted as T3s.</li>
<li>Military Frames are now counted as T3s.</li>
<li>Buster techs that are interupted should no longer lock up the character until an admin fixes them. This is still technically a nerf maybe?!</li>
<li>Maybe-fix for the bug that locks people up after using a suplex-style grab technique to kill NPCs.</li>
</ul>
<br><br>
<b>07 / 19 / 2020<br>
did you say nerf everything?</b><br>
<ul>
<font size=+1>Nerfs</font size>
<li>Darkness Flame no longer forces debuffs to trigger on every attack. Only Ultima forces debuffs.</li>
<li>Styles that would amplify the amount of debuff stacks no longer do so. Attunement and elemental defenses are still taken into account.</li>
<li>Only Dragon Dash will proc Dragon Clashes. Grab no longer will do this.</li>
<li>Curaga no longer heals you for half your fucking health jesus christ.</li>
<li>All Hiten Mitsurugi techniques gain scaling cooldown. This is meant to represent the hypersonic attacks making the user's body weary as the battle goes on.</li>
<li>They also all accumulate fatigue, except Ryumeisen. Which one is that?</li>
<li>Traditional Hiten Mitsurugi no longer gets free BP and intimidation or recovery either. Why?</li>
<li>Battousai loses nowhiff and noforcedwhiff. Also intimidation.</li>
<li>Hiten Mitsurugi and Ansatsuken can no longer overcap on the style's Mastery in the higher tiers.</li>
<li>Denjin Renki loses nowhiff and noforcedwhiff. Mana cost increases to 100, timer limit decreases to 60 seconds, cooldown shortens to 120 seconds, loses CounterMaster but gains SoftStyle.</li>
<li>Satsui no Hado loses nowhiff and noforcedwhiff. Loses anger mult. Loses Abyssmod. Gains an extra charge of pursuer, and hardstyle.</li>
<li>Satsui no Hado no longer gives vaizard health when it has been mastered.</li>
<li>NPCs made weaker, unless they're epic. Those boys are still super dense.</li>
<li>Epic NPCs won't fight you on sight...hopefully.</li>
<li>Epic NPCs stat boosts are even beefier.</li>
<li>NPC drops refactored, again.</li>
<li>Fate of Blood's text is larger, so if you see it used in a spar, you can be like "hey, what the fuck?" and also possibly flick lethal on the person who used it under such circumstances.</li>
<li>Everything that had noforcedwhiff no longer has it, except Five Rings Style and Haki Armament.</li>
<li>Ray Gear no longer homes.</li>
<br>
<font size=+1>Buffs</font size>
<li>Five Rings Style now cripples and shears. It gains NoForcedWhiff. It gains another tick of triple strike. It's a spicy boy.</li>
<li>Battousai has a once a fight cooldown instead of 10 hours.</li>
<li>Battousai gives more flicker and instinct; contrast with Dance of the Full Moon which gives godspeed and deflection.</li>
<li>Hiten Mitsurugi ignores its scaling cooldowns when you hit Tier 8.</li>
<li>Parties can now share RPP gains!!!</li>
<li>West Star Style gains Water elemental class.</li>
<li>South Star Style gains Fire elemental class.</li>
<li>Fate of Blood only takes 10% health cut to trigger.</li>
<li>Fate of Blood won't take your life if you don't have weapon soul active ... Though you are still a retard if you attempt to use it under such circumstances. Flex tape can't fix that..</li>
<li>Event Credits will accumulate donate RPP as well!</li>
<li>New boss monsters!</li>
<li>Affect-other buffs now look for your target's icon state rather than your own.</li>
<br>
<font size=+1>Additionally</font size>
<li>Arcana.</li>
<li>Weapon Soul skill tree development has been uncapped (they can buy multiple upgrades of the same skill), and they get an upgraded T1/T2/T3/T4 skill at the respective saga level.</li>
<br>
<font size=+1>Even More Additionally</font size>
<li>Money economy tapped back, whoops.</li>
<li>Signature users are pulled in line with Saga users.</li>
<li>Special Strikes have delay once again.</li>
<li>Spirit Bow gains Radius 1. Ray Gear already had it so whatever.</li>
<li>Beastmen acquire enhanced smell and hearing at creation, Eldritch lose enhanced hearing but gain invisi-sight, Yokai pretty much remain the same.</li>
<li>Flicker contributes to how fast zanzoken charges return. Hiten go BRRRRRR.</li>
<li>Lesser levels of Soul Edge will not maintain BleedHit from the true form.</li>
</ul>
<br><br>
<b>07 / 15 / 2020<br>
basically the snakers + niezan update</b><br>
<ul>
<font size=+1>General</font size>
<li>Jinchuuriki removed as a signature option on account of the pole bankrolling the game. It still exists for the rest of the wipe, but you'll have to haggle with the admins to get it.</li>
<li>AI with higher potential can potentially give better gains! But there is a minimum as well.</li>
<li>Tomes and Magic Crests can see what spells are included in them by using the Examine verb on them.</li>
<li>White and Defensive magics no longer have absurdly large cooldowns.</li>
<li>Magic costs tapped back slightly for some of the more expensive shit.</li>
<li>A variety of autohits gained Hiten-like properties, allowing the launcher autohits to ... Actually be used to set up combos!!</li>
<li>Teleports are no longer usable when one is under the effects of movement seals.</li>
<li>Teleporters cannot ferry grabbed victims with them unless their version of teleporting is specifically flagged as one which supports passengers.</li>
<li>Summoners unlock telepathy with their summons one level earlier.</li>
<li>It locks up 75% of a summoner's capacity to draw a summon forth. It returns this capacity when the summon is dismissed. This is to prevent abrupt 1v3 situations while still maintaining the summoner's ability to get backup.</li>
<li>Eldritch will no longer gain Z-warping ability naturally, even though it was a really funny thing.</li>
<li>Empty Grimoire now unlocks Observe for free!</li>
<li>Tomes and Crests will factor into the logic of if you have enough mana to cast a spell.</li>
<li>Debuffs wear off more slowly.</li>
<li>Teleport Necklaces and Amulets really really fixed.</li>
</ul>
<br><br>
<b>07 / 12 / 2020<br>
unstealth update</b><br>
<ul>
<font size=+1>General</font size>
<li>Teleport Amulets and Teleport Pads granted more Z plane range.</li>
<li>Parasite Crests now kill you if they are stolen off of you, or transplanted. Sorry but you guys fucked the RPP economy and so drastic measures must be taken!!</li>
</ul>
<br><br>
<b>07 / 12 / 2020<br>
stealth update</b><br>
<ul>
<font size=+1>I forgot to write change logs.</font color>
</ul>
<br><br>
<b>07 / 07 / 2020<br>
un-party time</b><br>
<ul>
<font size=+1>General</font size>
<li>Life Generation only heals wounds when health is topped off for the current level of wounds.</li>
<li>Life Steal gains wound regeneration (if topped off).</li>
<li>Great Divide doesn't continue for 25 fucking tiles. Now it only goes for 10 fucking tiles. Might increase the number of fucking tiles if this doesn't look huge enough.</li>
<li>Durendal moved from 0.3 life gen to 0.2, though I may opt to change the life generation formula entirely shortly.</li>
<li>Prodigy is no longer selectable as an alien racial. Brrrr.</li>
<li>Humans now rise in potential rate from each ascension.</li>
<li>Human learning scaled back to x1.5 RPP instead of x2 with respect to above change.</li>
<li>Half saiyan learning scaled from 1.5x to 1.25x with respect to above.</li>
<li>Potential Rate adjustments across the racial board.</li>
<li>Makyojins gain strength and force on ascension, cementing them as the muscle wizards of the universe.</li>
<li>Warrior nameks gain speed, offense and recovery on ascension.</li>
<li>Dragon nameks gain force, defense and recovery on ascension.</li>
<li>Namekians gain namekian fusion on ascension 3. Remember that the one that continues to exist afterwards is the one who pushes the verb!!</li>
<li>Makyos no longer gain recovery on ascension.</li>
<li>Ignoring one's own intimidation no longer happens. It's for the best.</li>
</ul>
<br><br>
<b>07 / 06 / 2020<br>
party time</b><br>
<ul>
<font size=+1>General</font size>
<li>Djinns now get scaling pure reduction depending on their potential!</li>
<li>Djinns have access to Void Defense.</li>
<li>Djinns are treated as having a magic style mastered.</li>
<li>Djinns have innate adaptation.</li>
<li>Empty Grimoire now has location sense.</li>
<li>Mafuba now grants the wielder Spirit Power.</li>
<li>Nox Nyctores regain calm anger attribute.</li>
<li>Demon, Djinn, and Majin Form intimidation is now based on potential level rather than any particular ascension.</li>
<li>Djinn ascensions no longer lower anger value, though they do lower anger points.</li>
<li>Spirit Power observe can see through scrying wards so King Kai can voyeur on Goku I guess.</li>
<li>Blade Charge finisher buff no longer crazy powerful.</li>
<li>Poison and Burn buffed.</li>
<li>Staff Devil Arms no longer slightly shafted.</li>
<li>Killing a Demon now earns you its Devil Arm.</li>
<li>Demons and Djinns intimidation-from-potential halved, until their final ascs.</li>
<li>Ghouls can heal health cuts by killing NPCs.</li>
<li>Crash Fixes.</li>
</ul>
<br><br>
<b>07 / 04 / 2020<br>
off the rails</b><br>
<ul>
<font size=+1>General</font size>
<li>RPP Uncapped.</li>
<li>Teachers cannot grant more than 50 RPP in a single session.</li>
<li>Negative RPP set to 0.</li>
<li>No RPP Mult is less than 1 now.</li>
<li>Rewards will bounce RPP values back up to the wipe's cumulative RPP count if they are less than it and you've gone through your three start up days.</li>
</ul>
<br><br>
<b>07 / 01 / 2020<br>
the end is never the end</b><br>
<ul>
<font size=+1>Rengal</font size>
<li>Non-epics take full damage, my crocodiles were backwards.</li>
<li>Changeling special forms now have 600 seconds CD instead of once-per-fight.</li>
</ul>
<br><br>
<b>06 / 29 / 2020<br>
wait that's the last update?!</b><br>
<ul>
<font size=+1>Gen Rall</font size>
<li>Ansatsuken now has an anger threshold once the user reaches Tier 5. Chikara's CalmAnger accounts for this.</li>
<li>Philosopher Stones are worth even more mana.</li>
<li>Sharingan copies half as many techniques for now. The copy aspect will be reworked further in the future.</li>
<li>0 value magicite won't spawn anymore.</li>
<li>Demonic NPCs will attack on sight, probably.</li>
<li>Hellrising doesn't happen, outside of Mazoku Humans. Because no.</li>
<li>Any amount of cyberization makes you become mechanized. The exception is the entire Tuffle race (for now).</li>
<li>One Hundred Percent Power now only gives 1.5 strength / force.</li>
<li>Fifth Form now gives 1.5 end / defense.</li>
<li>Yokai now gain manastats gradually over their ascensions.</li>
<li>Soul Calibur now provides 2 pure reduction just for wielding it... Its previous passive was pretty underwhelming.</li>
</ul>
<br><br>
<b>06 / 23 / 2020<br>
date</b><br>
<ul>
<font size=+1>gen gralr</font size>
<li>Bug fixed with Crackhead Knife style.</li>
<li>Android progression was altered to be more simple, and probably less effective.</li>
<li>Androids will not drain from using cyberization special slotters, but they cannot use them before 50% health to maintain the current schema of special buffs.</li>
<li>1 pip of Instinct granted to Hadokens in response to polite request.</li>
<li>SSj4's transformation potential has been bumped up to genuinely rival SSjG.</li>
<li>The more obscure elemental classes (creation, destruction, pure, space) were reworked into more elementally appropriate ones.</li>
<li>Transmute will now succeed 100% of the time, but if the person would have voided from the Transmutation, the user of the Transmutation will be maimed instead.</li>
<li>Saiyans and Half Saiyans automatically acquire their transformations once they'd gain no transformation potential from using them. Automatically acquiring a transformation in this way means that there will not be a first time transformation heal.</li>
<li>Further refinements to Crackhead Knife style in terms of when punches and knives actually trigger.</li>
<font size=+1>skadishionlaly</font size>
<li>Magicite can now be obtained from NPCs properly. There was a bug preventing it from ever being properly collected. It is automatically stuck together with magicite in your inventory.</li>
<li>Aliens now obtain Alien Transformation automatically at potential 30.</li>
<li>Hell- Legend- Spirit-powered NPCs no longer gain extra potential for having extra power.</li>
<li>NPCs can have different chances of spawning as Epics.</li>
<li>Cooking / Brewing should no longer allow you to go into debt.</li>
<li>The Tower has been expanded to contain more monsters.</li>
<li>You cannot regenerate maims by dying.</li>
<li>You will not be mortally wounded if you die!</li>
<li>NPCs drop less money now.</li>
<li>Mythic NPCs drop multiplied money rather than money with static adds.</li>
<li>Mythics will be slightly easier to kill.</li>
</ul>
<br><br>
<b>06 / 20 / 2020<br>
up</b><br>
<ul>
<font size=+1>gongerlele</font size>
<li>Brewing now has a non alcoholic option.</li>
<li>Brewing and Cooking now has a monetary cost.</li>
<li>Might have fixed Metal Coat NPC crashing the server (sometimes).</li>
<li>Mastery of Cooking / Brewing will impact the lowest eat nutrition that can be assigned (so your worst meal becomes better).</li>
<font size=+1>Afishonally</font size>
<li>Jiren Ascension yeeted</li>
<li>Dempsey Roll and Cockscrew Blow no longer have launcher property.</li>
<li>Showstopper now properly has launcher.</li>
<li>Tatsumaki launcher time reduced, except for EX Tatsumaki.</li>
<li>Made Cooking / Brewing cost slightly less.</li>
<li>The government has relaxed the massive taxes on food. Some idiot is going to misinterpret this changelong as stat taxes being easier to get rid of. I would recommend banning that guy.</li>
<li>Debuffs have a standardized rate that most of them tick down by. Half of recovery and half of endurance is factored in.</li>
<li>Poison only ticks down in accordance with half of recovery.</li>
<li>Shear ticks down at a stable rate, including when not meditating now.</li>
<li>Burn and poison should do more damage now.</li>
<li>Dunking is now a purely visual effect.</li>
<li>Parasite Crests now kill the user when the era is higher than when the crest was made.</li>
<li>Epic enemies temporarily do not get buffs. They just have boring extra stats for now.</li>
</ul>
<br><br>
<b>06 / 16 / 2020<br>
ubprprpabiinns.</b><br>
<ul>
<font size=+1>Gengeral</font size>
<li>All styles were refunded.</li>
<li>Signature styles are now acquired under a new format: Signature Tier 1 styles can only be acquired after Potential 25. Signature Tier 2 styles can only be acquired after Potential 50. Signature Tier 3 styles can be apped for after Potential 75 has passed.</li>
<li>Saga tier ups are now acquired under a new format: Tier 1+2 can be acquired before Potential 25, Tier 3+4 can be acquired before Potential 50, Tier 5+6 can be acquired before Potential 75, and Tier 7+8 are application only, and can only be acquired after Potential 75.</li>
<li>Non-mythic AI are now exempt from the global damage multiplier. This means they take much more damage.</li>
<li>All AI have cursed wounds, which means all of their damage is taken as wounds. The generic mob won't kill you if it knocks you out, but you likely will be bleeding out, so hunt cautiously.</li>
<li>A boss monster has been placed within The Tower. It has very high power and will always be hell-powered. Hunt it with a party!</li>
<li>Scientists can now implant other people's brains into androids!</li>
<li>Kobolds are now stronger than Fishmen.</li>
<li>Technology focused Humans were given enough Cyberize Mod to actually mechanize themselves.</li>
<li>Intimidation Ignore on projectiles further tapped on.</li>
</ul>
<br><bb>
<b>06 / 15 / 2020<br>
upbabpin</b><br>
<ul>
<font size=+1>General</font size>
<li>Ki Armor was removed because of (Insert Reasoning Here). If you had Ki Armor, it will be replaced with Ki Shield on login.</li>
<li>Ki Shield and Ki Blade no longer have energy leak associated with them, but only last for 10 seconds each.</li>
<li>Humans do not become regeneration gods. They do gain more ki control mastery with ascensions though.</li>
<li>Humans stat mult based on ascension was reduced to half effectiveness.</li>
<li>Half Saiyans gain a bit more ki control mastery with each ascension as well.</li>
</ul>
<br><br>
<b>06 / 14 / 2020<br>
updating</b><br>
<ul>
<font size=+1>General</font size>
<li>Changeling ascensions factor into recovery and BP, even outside of transformations.</li>
<li>Makyo active-buffs made more notably strong.</li>
<li>Changelings acquire ascensions naturally at potential 20, 40, and 60. The final ascension is given out via admin power.</li>
<li>Changeling Ascension 4 grants Golden Form, on top of other ascension boons.</li>
<li>Half Saiyans now get ascensions naturally at potential 10, 20, 30, 40.</li>
<li>Half Saiyans get slightly reduced stat ascensions in exchange for more anger across their ascensions, rather than at the end only.</li>
<li>Half Saiyans do not gain more recovery.</li>
<li>Saiyan Zenkai EXP will not be gained multiple times from a single KO.</li>
<li>Timeless RPP mechanics lightly debugged.</li>
</ul>
<br><br>
<b>06 / 12 / 2020<br>
mmmmmm not updating</b><br>
<ul>
<font size=+1>General</font size>
<li>I stopped pretending I wasn't coding.</li>
<li>Regeneration is phased out as a stat. Recovery will take over for it entirely.</li>
<li>Almost all recovery has been set at 2 now. Humans are at 1 though.</li>
<li>Energy mod has been phased out. Ki Control Mastery takes its place as "thing that divides energy costs".</li>
<li>Recovery no longer impacts cooldown speeds.</li>
<li>Autocollection from dropped money / magicite from AI.</li>
<li>Signature Styles no longer have RPP/Potential requirements; you will acquire them when you have the prerequisite styles mastered and meditate.</li>
</ul>
<br><br>
<b>06 / 10 / 2020<br>
mmmm lack of updates</b><br>
<ul>
<font size=+1>General</font size>
<li>Didn't add in functionality to allow admins to set saiyan tail underlays.</li>
<li>Didn't add in functionality to adjust hair x/y, as well as provide hair underlays.</li>
<li>But if I did, they would probably be highly bugged and made in a sleepy state of mind.</li>
</ul>
<br><br>
<b>06 / 09 / 2020<br>
surprise</b><br>
<ul>
<font size=+1>General</font size>
<li>Not shit was changed about the game, and not shit will be changed about it across this wipe. Have fun.</li>
<br><br>
<font size=+1>Additionally</font size>
<li>I didn't take pity on people and reduce AI stats depending on potential.</li>
<li>Demon maim strike dividing values by zero was not fixed.</li>
</ul>
<br><br>
<b>05 / 09 / 2020<br>
the renerfening</b><br>
<ul>
<font size=+1>nerfs</font size>
<li>Dragons nerfed.</li>
<li>Jiren nerfed.</li>
<li>Golden Oozaru nerfed (debugged).</li>
<li>Poison nerfed.</li>
<li>Burn nerfed.</li>
</ul>
<br><br>
<b>05 / 05 / 2020<br>
the unnerfening</b><br>
<ul>
<font size=+1>General</font size>
<li>Kamui Junketsu's forms are less taxing to use.</li>
<li>Resolve gains traits from the Kamui form because we all know shoulder pauldrons aren't actually sexy.</li>
<li>Djinn gain power multipliers to make up for not having base increases in their ascensions. These are still lost at ascension 3, and ascension 3 is still a tremendous buff.</li>
<li>Autoacquired SSj+SSj2 works properly.</li>
<li>Jiren Ascension pretends to be in transformation.</li>
</ul>
<br><br>
<b>05/4/2020<br>
<ul>
<li>Ascension 5 is no longer auto unlocked at 90 potential and is now application based. It is an incredibly large powerspike, so this is intended to make it a lot more special.</li>
<li>Mortal blow has been reworked to deal 15% of a person's current health instead of 15 damage period.</li>
<li>Kamui now carries sword punching while active.</li>
<li>Healing now always occurs through shear, though for non Hellpowered individuals, it is severely reduced.</li>
<li>Having Holy Mod and Abyss Mod both at once neutralizes each other. You can still be classified as 'good' through other means.</li>
<li>Offense has a bit more weight over defense in the accuracy calculation.</li>
<li>God Ki's impact on hit/dodge rate bonuses have been reduced dramatically.</li>
<li>Hitting opponents from behind is more relevant now. Yes, those are a thing still!!</li>
<li>Parties now have a limit of 3 participants. This means that the maximum default fight is 3v3, without waiving rights.</li>
<li>Observant Saiyans made less crappy.</li>
<li>Fusion Powered battery / energy regen made much slower.</li>
</ul>
<br><br>
<b>04 / 30 / 2020<br>
ugh</b><br>
<ul>
<font size=+1>Bug Fixes</font size>
<li>Android Frames can now be inhabited without sending you to the shadow realm.</li>
<li>UI no longer takes up special buff slot and style buff; just special buff.</li>
<li>Omega Blaster, Big Bang Attack, Deathball and Supernova gained instinct.</li>
<li>Vaizard Mask, Jinchuuriki and Jagan Eye costs brought to a standard.</li>
<li>Aphotic Shield should recognize Stop properly now.</li>
<li>NoSoul will put people at 0,0,0 instead of booting them outright. RIP Tumaro.</li>
<li>Sword Saint (and Prana Burst) are now properly selectable from the automated signature list.</li>
<li>Anger CD time lessened to 30 seconds rather than 120.</li>
<li>Vaizard Mastery 1 probably triggers at anger now.</li>
<li>Magic Focus buffs act as magic focuses...</li>
<font size=+1>>Additional</font size>
<li>Desperation toned down to stack in a much more sane manner with other damage/reduction sources.</li>
<li>Kamui + Decapitation Mode = Apparel Boom! <b>LETS GET NAKED</b></li>
<li>Injury Healing toned down.</li>
<li>Venomblood Anger boost has been halved.</li>
<li>High Tension should be properly functional now.</li>
<font size=+1>Even more additionally</font size>
<li>Crystals of Reversal significantly nerfed.</li>
<li>Maim Mastery is finally a Thing. It allows one to ignore maim BP reduction and also provides benefits depending on how maimed you are.</li>
<li>Keyblade Tier 8 now removes the chance of going AntiForm at all for the Light path.</li>
<li>SSj2 will now be unlocked automatically at 80 potential. This will also set super saiyan 1 mastery to 100%. Entering SSj2 from an autounlock will not grant the first time transformation heal.</li>

</ul>
<br><br>
<b>04/29/2020<br>
no title 2.0</b><br>
<ul>
<font size=+1>General</font size>
<li>Gates can now use skills even while out of energy.</li>
<li>Reinforce Self Reworked. It costs mana to activate and has manaleak in return for duration. Also, its pure damage & reduction have been reduced.</li>
<li>Humans now anger at 50% hp. This is to compensate for the desperation nerf. Humans were kinda wrapped around it.</li>
<li>Vaizard no longer 'shatters' on running out of Vaizard health. This is an enormous buff. It's vaizard hp has been lowered in recognition to this.</li>
<li>You lose tension whenever you gain health.</li>
<li>Shin Kikoho fires 5 times then goes on a long cd.</li>
<li>Injuries from meditating now recover dramatically faster.</li>
<li>Regenerate has an easier time healing through injuries now.</li>
<li>Some Movement Mastery has been returned to Senketsu.</li>
<li>Soul Edge now has extend.</li>
<li>A lot of things have had their damage mults/reductions lowered.</li>
<li>Damage now softcaps based on the global damage multiplier. This is in an attempt to prevent people from getitng nuked into non-existance. Damage reduces more the lower your HP is past the softcap. This will probably need a lot of tuning to make relevant.</li>
<li>Wiretaps are no longer concealed. You can still plant them on people, but they can see it on them.</li>
<li>Oversoul now carries TransMimic passive, meaning the aliens won't lose out on their spicy trans passives anymore.</li>
<li>Most special slotters have lost their hp requirements. In turn, most of them have also been nerfed.</li>
<li>Spirit Hand & Spirit Flow cap now. Probably won't really impact anyone though.</li>
<li>Tier 8 Satsui is redesigned. Shun Goku Satsu is now the style finisher and Satsui no Hado grants the user most of the Demon Race's passives."
</ul>
<font face="calibri"><b>04/25/2020<br>
no title</b><br>
<ul>
<font size=+1>General</font size>
<li>Legendary Power toned down. It no longer carries Infusion innately (debuff resistance).</li>
<li>Natural Monsters lose their racial Slayer Mod. If you're Ansatsuken or Hiten natural monster, please A-Help to be tapped down manually.</li>
<li>Desperation no longer obtains early anger. This is partially intended to level it out with other monster types, which are extremely suboptimal picks in comparison.</li>
<li>Status effect rate lowers the higher the status is now, making is harder to push a person to 99.</li>
<li>Sunlight Spear less nuclear...</li>
<li>Vaizard should also work better now and also has a lower CD ceiling. (It scales based on remaining vaihp when turned off)</li>
<li>On the note of Vaizard Health. Vai HP no longer provides stun immunity, but instead reduces stuns. (Vaizard, Saiyan Grit, Desperation Getups, etc)</li>
<br><b>Additional</b>
<li>Initmidation modified again to be linearly scaling. It is still dramatically more tame then it used to be, but should be impactful for intimidation heavy things. It also softcaps.</li>
<li>No Name keyblade is no longer garbage. Keyblades are Light</li>
</ul>
<b>04 / 24 / 2020<br>
thanks for the memeries</b><br>
<ul>
<font size=+1>General</font size>
<li>Super Saiyan Grades, as well as alternative saiyan forms, now register as tier 3 signature techniques.</li>
<li>Fluid Form no longer grants forced whiffs. Instead, it alters hit/dodge rate.</li>
<li>Vampire no longer grants increased intimidation to the vampire in base.</li>
<li>God Ki no longer involves exponents. gross.</li>
<li>Booze now acquires an icon if you don't set one!!</li>
<li>Grapple AutoHits and Grapple Queues now can grab fishmen and giants.</li>
<li>Potions should function properly now. They were burning off too quickly to have the effects.</li>
<li>Devil Leg now has Fire Offense, Poison Defense instead of Poison Offense, Fire Defense.</li>
<font size=+1>Additionally</font size>
<li>Intimidation scales more similarly to armor now. It's boons have been reduced greatly.</li>
<li>Spirit Power now triggers earlier, depending on injury.</li>
<li>Humans and Tuffles don't ignore their own (lack of) intimidation.</li>
<font size=+1>Even More Additionally</font size>
<li>Only demons have maimstrike instead of anything with cursed wounds. Y'all wild.</li>
<li>Holy Trance Form works again.</li>
<li>Regenerate can heal maims again!!</li>
</ul>
<br><br>
<b>04/22/2020<br>
LES GIT IT</b>
<br>
<ul>
<li><b>WE NOW HAS DISCO BALLS</b> do not ask admins to spawn them for you they will be featured in events</li>
<li>Elemental Projectiles were dealing dramatically more damage then they were supposed to be.</li>
<li>Slayer, Holy, and Abyss mod were all not functional on melee attacks. Now they are, god help us all.</li>
<li>Giant Form passive nerfed significantly. It reduces damage rolls instead of outright negating them.</li>
<li>Ultima Offense and Defense have been nerfed significantly. Debuff Reversal has been removed, status effects reduced, and true mults lowered. Despite this, it is still absolutely the strongest 'element' in the game.</li>
<li>Combo Master added to the follow skills: Overhead Divide, Focus Punch Line, Hyper Tornado, Lariat, Nova Strike, Drill Spin, Roundhouse Kick, Spinning Clothesline</li>
<li>Grabs become much weaker overtime, making it harder to maintain a hold on someone.</li>
<li>Genome Enhance Serums<strike> now have a cap.</strike> are removed from the game.</li>
</ul>
<b>04 / 21 / 2020<br>
The Un-Update</b>
<br>
<ul>
<li>Removed alignment sensing for now. It might prevent crashes???</li>
<li>Projectiles that lose track of their target may deonate instantly, preventing them from lingering around???</li>

</ul>
<br><br>
<b>04/18/2020<br>
</b></br>
<ul>
<font size=+1>General</font size>
<li>Characters with Purity may now detect alignment and likewise, people with Evil label may detect opposition.</li>
<li>T3 Styles are no longer obtainable through natural progression.</li>
<li>In context to the above, Style Refunds are now functional.</li>
<li>Dragons now naturally ascend at 30, 50, and 70. I don't know why I did increments of 25.</li>
<li>Earth Spirit NPCs have been made.</li>
<li>Flayers got upgraded back to "oh god" levels of strong.</li>
<li>Saint techniques tapped lightly.</li>
<li>Projectiles with elemental effects could have their damage reduced to 0 by multipliers. That is infact not supposed to happen.</li>
<li>Commonly available Special Slotters nerfed. If they do not drain a resource, you must be below 50% health to trigger them. They will shut off if you go above 75% health.</li>
<li>Aphotic Shield requires mastery of the Magnet/Gravity/Stop line. It also requires access to magic.</li>
<li>Titan Form requires mastery of the Mage Armor/Warrior Trance/Golem Form line. It also requires access to magic.</li>
</ul>
<br><br>
<b>04/18/2020<br>
</b></br>
<ul>
<font size=+1>General</font size>
<li>Large piercing projectiles with large sizes no longer hit a person more then once. Haha...*sweats*</li>
<li>AIs give twice as much money.</li>
<li>Epic monsters are ten times as likely to spawn!!!</li>
<li>Some monsters that didn't have attack states now do.</li>
<li>Monsters can now spawn with spirit-, legendary- or hell-power templates.</li>
<li>Techniques with lower than 1 damage mults will no longer exponentially nerf damage.</li>
<li>Spirit Power tapped down so that they only get half of the celestial power if they have seventh sense. This meta choice is now slightly less meta.</li>
<li>Saint's Trump Techniques are now once-a-fight.</li>
<li>Some projectiles were not properly deleting, which will generate lag overtime. This should no longer be an issue.</li>
<li>The above also seems to apply with AI. Haha.</li>
<li>You can only inflict Mortal Blow damage once.</li>
<li>Saiyans are locked out of most Special Slotters. Sorry to those of you that had plans, its the trade off for having big BP.</li>
<li>The "crackhead" line of styles will no longer hit the user with about the same frequency as the target. They will also hopefully not delete on walls.</li>
<li>Dire Empowerment no longer has cursed wounds.</li>
<li>Hostile AI will smack you off your flying device if they think you're tasty enough to attack.</li>
<li>Taking damage also knocks you off your flying device!</li>
<li>You also cannot use flying devices when below 75% health, or in the presence of hostile mobs!<li>
</ul>
<br><br>
<b>04 / 17 / 2020<br>
t3 stylin on you.</b></br>
<ul>
<font size=+1>General</font size>
<li>North Star Style gains 5 CounterMaster, which allows it to do pretty much instant counters. That is its thing. Might tap it down to 4, we'll see.</li>
<li>Imperial Devil Style has its style swaps switched to be more offensive inclined to benefit from its spirithand passive.</li>
<li>East Star Style gains an innate erosion effect, gets its stats brought more in line to synergize with its Soft Style, and gains what might be an absurd amount of Death Field and Void Field.</li>
<li>Ultima Defense loses some pure reduction so that it effectively reduces damage by 1.5 instead of 2.</li>
<li>Rhythm of War now has a gimmick. It does Bladesinging stuff. But better. :)</li>
<li>Crackhead knives and rocks should no longer eat your queues. This fix may also prevent crackhead knives from going full crackhead mode.</li>
<li>Pisces Cloth will now glow golden. Yeah boy.</li>
<li>Arcane Bladework's finisher debuff now works.</li>
<li>SNJ is simpler now; instead of modifying energy expenditure, it just sets recovery to 3 before calculating taxes and gives x2 hidden BP mod.</li>
<li>Moved Gates fatigue and bleedhit around. Maybe they will not drain as much now.</li>
<li>Calm Anger now ignores Wounds and Fatigue lowering BP, like normal anger.</li>
<li>Nameks ignore some intimidation depending on their ascension level.</li>
<li>Tuffle intimidation ignore is now based around their intelligence and imagination rather than ascension level.</li>
<br><font size=+1>Additional</font size>
<li>DBR needs some big optimizations. Hopefully this one in particular will impact lag problems greatly!</li>
</ul>
<br><br>
<b>04/16/2020<br>
suffering prevention program</b><br>
<ul>
<font size=+1>General</font size>
<li>In an effort to make beams sane again, beam charge now diminishes overtime as they're fired.</li>
<li>Boss Form has lost its intimidation boon.</li>
<li>Meteor homing duration has boosted greatly.</li>
<li>Saiyan grades now increase the drain on PU.</li>
<li>Super Saiyan Grade 3 stats reduced greatly.</li>
<li>Gravity should be a lot more impactful now, doing all its damage at once instead of over multiple rounds.</li>
<li>You should no longer be able to counter counters, and counter while beaming or use any queueables for that matter.</li>
<li>Activating AIS now reduces the duration of any ongoing stuns.</li>
<li>Infernal Monsters have notably more Hellpower off of Asc 1.</li>
<li>Heretic Namekians now gain Hellpower by their ascensions. We really Demon King Piccolo out here.</li>
<li>Hell Getups are only experienced by: Demons, Hellpowered Humans, and Majin Form Dudes.</li>
<li>Additional refinements to Majin Form.</li>
</ul>
<br><br>
<b>04/14/2020<br>
hahaha oops</b><br>
<ul>
<font size=+1>General</font size>
<li>Light attacks no longer occur from normal attacking launched/stunned opponents, making Dragon Clash and skills with Hot Hundred trait the only ones that can light attack. Autohit and Projectile time!!</li>
<li>Introduces Combo Master trait for autohits, which bypasses damage reduction of Launch & Stun status. Pending cool and stylish effects.</li>
<li>Demons gain dramatically less base power for just existing. In turn, their hellpower bp scaling is increased, making them get stronker the lower their hp is.</li>
<li>Attempt made at taming attack speed a little.</li>
<li>Random projectile buffs.</li>
<li>Symbiotes are no longer OP.</li>
<li>God Ki no longer makes you ignore your own intimidation, period.</li>
<li>Makyos cannot have their intimidation ignored by other people! THEY'RE TOO SPICY!!</li>
<li>Ascended Mechs should now have better intimidation, properly.</li>
<li>Another check added to teach verb to not allow it to overcap. (Though it wouldn't have allowed much of an overcap already.)</li>
<li>Eight Gates shouldn't bug out when it closes due to the timer.</li>
<li>Beams finally nerfed. Why did I let this go on for so long?</li>
<li>Finisher debuffs tapped back.</li>
<li>Stun immunity window lengthened, but not to the old extent.</li>
<li>Projectile damage mods re-nerfed, but not to the same extent.</li>
</ul>
<br><br>
<b>04/13/2020<br>
SCREEEEEEEEE dragons op :)</b><br>
<ul>
<font size=+1>General</font size>
<li>Passively gained taxes on some buffs reduced.</li>
<li>In consideration to Attack Cooldown fixes, delays between attacks have been reduced significantly. There is a cap also, so don't try to speed dump for memes!!</li>
<li>Dragon Dash resets attack CD.</li>
<li>Second & Third attacks on Double/Triple strikes have had their damage reduced further during light attacks.</li>
<li>Erupting God Finger and Lightning Stake should be properly usable with swords now.</li>
<li>Amaterasu gained a bit of damage, but lost some scorching and toxicity.</li>
<li>Susanoo has lost a bit of Vaizard Health too.</li>
<li>Buffs that automatically trigger off are forced now. This should prevent some particular bugs involving permanently active cure, hopefully.</li>
<li>Eldritch monsters should be able to warp <strike>into erp scenes</strike> now.</li>
<li>Dragon Rush got the Shining Sword Slash treatment. Should be reasonable to use now.</li>
<li>All skills in the Get Dunked line with Dunker trait have been scaled back a bit.</li>
<li>Debuff Crash <b>COMPLETE OVERPOWEREDNESS</b> Removed. 100% poison will now do 5% damage. 100% burn will also do 5% damage. This is still EXTREMELY powerful as one of the only sources of unmitigated damage in the game.</li>
<li>Debuff Crash doesn't trigger wounds for Fire Debuff Crash anymore.</li>
<li>A few techniques with less than 1 damage mult got moved to 1 damage mult. Notably Morning Peacock.</li>
<li>Dragons now spawn with all of their natural RPP. This moves them a bit closer to kaios in functionality.</li>
<li>Dragons do not ignore their own intimidation regardless of god ki amount.</li>
<li>Rage Form deactivation threshold lowered.</li>
<li>Anesthetics stack now.</li>
<li>EC RPP might carry over automatically now!</li>
<li>Flash Fist Crush now has a 1-time-per-fight cooldown.</li>
<li>Battle Mage should trigger staff boons on physical hits.</li>
</ul>
<br><br>
<b>04 / 12 / 2020<br>
Prep time</b><br>
<ul>
<font size=+1>General</font size>
<li>Changelings that have Golden Form unlocked can now transform into Golden Form with One Hundred Percent Power or Fifth Form active. This is a significant buff.</li>
<li>Changelings in Golden Form can still use Power Control to enter Ki Control state, even with the above special slotters on. I repeat. This is a significant buff.</li>
<li>Shunko loses some weapon breaker, flicker, and pursuer. It also loses Martial Magic trait and has its HybridStrike moved to 0.75.</li>
<li>Spirit Style also loses Martial Magic trait.</li>
<li>Soul Crushing Style loses technique mastery.</li>
<li>South Star Style HybridStrike moved to 1.</li>
<li>Five Rings Style loses a Triple Strike, gains a Double Strike, and also gains SweepingStrikes.</li>
<li>Five Rings loses Slayer Mod.</li>
<li>Five Rings Style can now decide if it wants to use one, two, or three swords with the Toggle Sword Count verb in the Other tab.</li>
<li>Arcane Bladework loses its Moving Charge passive.</li>
<li>Butcher Style no longer carries slayer mod. It has increased shearing.</li>
<li>Trinity Style does not actually do three attacks anymore, but it does do more double strikes. It carries the Sweeping Strike passive.</li>
<li>Secret Knife Style doesn't need a sword, but it doesn't require you to be unarmed anymore either.</li>
<li>Imperial Style loses its enrage / pacify mechanic because it was very terrible.</li>
<li>Ryumeisen now has a much smaller range, and also moves you behind your opponent.</li>
<li>North Star Style now changes your hit spark icon.</li>
<li>Another level of Finishers standardized. I don't even know if these are nerfs anymore.</li>
<li>Customize: Color has been removed.</li>
<li>Shunko Style regains martial magic, and loses weapon breaker.</li>
</ul>
<br><br>
<b>04 / 10 / 2020<br>
We out here killin an shit.</b><br>
<ul>
<font size=+1>General</font size>
<li>Demons now anger at 50%.</li>
<li>Demons can now use sword or unarmed techniques freely as a racial. Shapeshifting demon hands!</li>
<li>Demons gain inherent dark element.</li>
<li>Demons ignore light element.</li>
<li>Hellpower now runs off of health missing, exclusively. Injury, shear, cripple and senses robbed do not matter.</li>
<li>Hellpower returns reduced from 2 to 1.35 at max.</li>
<li>Cursed wounds more likely to inflict maims.</li>
<li>Chikara Ansatsuken progressively ignores the maim chance of cursed wounds. They ignore 25% more chance every Saga level over 4.</li>
<li>Chikara level 7 or more also ignores BP Poison as well as maim nerfs.</li>
<li>Devil Arms register as Signature 3 Techniques. Further tuning will probably be delayed...</li>
<li>Zantetsuken can now only be used once per fight.</li>
<li>Intimidation ignore also contributes to ignoring your own intimidation. The only exception to this is Tuffles and Humans.</li>
<li>Hiten Mitsurugi cooldowns are reduced by 1.5x instead of x2 at Tier 5.</li>
<li>Hiten Mitsurugi only gains a maximum of 5 movement mastery. This occurs at T5. From henceforth to be referred to as "shitty passive tier" Hiten.</li>
<li>Battosai only gains 5 movement mastery, as opposed to 10. This means that the highest movement mastery Hiten will get is 10.</li>
<li>Speed Strike passive on Hiten Mitsurugi queues slashed in half. Except for on the ultimate technique ... that one can stay OP.</li>
<li>Hiten Mitsurugi's Soryusen and Ryumeisen gain the scaling cooldown property, meaning that the cooldown goes higher the more they are used in a fight.</li>
<li>First time SSj no longer sets intimidation to 20.</li>
<li>SSj stuff gently tapped on.</li>
<li>CounterMaster passive is no longer a matter of RNG.</li>
<li>Attack cooldown code reworked. Please report any funky behaviors! TO GALION!!!</li>
</ul>
<br><br>
<b>04 / 09 / 2020
ROBUST</b><br>
<ul>
<font size=+1>General</font size>
<li>Intimidation now displays in the assess sheet.</li>
<li>Pure Damage and Pure Reduction now display in the assess sheet.</li>
<li>Saiyans now gain greater benefit in base form from having transformations unlocked.</li>
<li>Saiyans that are in a transformed state or have a "fake" transformation now get more BP as well.</li>
<li>Alien transformations become worth more BP as they ascend.</li>
<li>Alien pure damage / reduction boons scale with ascensions now.</li>
<li>Logic errors with flicker corrected. Now transformed people will gain more flicker.</li>
<li>Pursuer logic errors corrected. Some things that weren't benefiting from pursuer will now.</li>
<li>Autohits will now face your character east or west if you are facing diagonally. I have grown tired of seeing diagonal autohits...</li>
<li>Infernal Monster stat "set" bonus changed; since Hellpower was already giving them regen, they will now have a threshold of BASE strength / force depending on their hellpower. It can dip below this threshold by mults and stances still.</li>
<li>Revival protocol chance nerfed according to Potential, just like real voids!</li>
<li>Majin Form reworked. It is no longer used by Demons or Makaios. Instead, it locks out the special slot buff and replaces Potential / Intimidation levels what they would be if the user was part of the Demon race. It also makes them Hellpowered if they weren't already.</li>
<li>Makaio shinjin gain constant calm anger.</li>
<li>Makaio/shin shinjin gain intimidation equal to their god ki value * 50.</li>
<li>Autonomous buffs no longer spam you with the style they need. (hopefully)</li>
<li>Recovery now impacts natural energy regeneration.</li>
<br>
<font size=+1>Skills</font size>
<li>Tatsumaki and Hadoken + upgrades have been reduced in damage. They were pretty nutty.</li>
<li>Celestial Monsters ascension 3 Purity + Beyond Purity is now bound to a skill, Celestial Ascension. Please Ahelp to have your values adjusted and be granted the skill if you're a Celestial.</li>
<li>SSj Grade 2 & 3 have been modified so that they do not interrupt PU. The states are kinda weak right, although still an overall boon. They'll be tapped up soon.</li>
</ul>
<br><br>
<b>04 / 08 / 2020
update machine go brrrrrr</b><br>
<ul>
<font size=+1>General</font size>
<li>Magic Show and Magic Act have separate verbs now.</li>
<li>Saiyans can now have SSjs unlocked that AREN'T only SSj1.</li>
<li>Saiyan Super Saiyan forms generally improved.</li>
<li>Light Rush is no longer half-Unarmed Only! :zany:</li>
<li>Ultima element only provides 1.5 damage multiplication instead of x2.</li>
<li>Makyo racial PU buffed. It was a bit limp-dick for being their only racial feature...</li>
<li>Demon base form becomes stronger, Majin Form is worth less universally.</li>
<li>Imitate now HIDES wound / lethal intent.</li>
<li>Cursed Wounds provide a tiny bit of maim strike, which scales as ascensions go higher.</li>
<li>Teleports work better than before.</li>
<li>All grimoires are even MORE expensive.</li>
<li>Giga Slave nerfed to only be a local railgun instead of an orbital cannon.</li>
<li>Nox Nyctores lose CalmAnger attribute.</li>
<li>Resolve is now usable once again.</li>
<li>Weapon Soul now has Martial Mastery with the base sword styles starting at T2. They get enhanced martial mastery with the base sword styles at T6.</li>
<li>Another Tier of Finishers reworked. Why am I like this.</li>
<li>Debuff Crash passive reworked. No longer do you poke someone to crash the debuffs; instead, it is attached to a Debuff object which activates when it is removed.</li>
<li>Nox Nyctores skills no longer drain mana.</li>
<li>Nox Nyctores skills can be used more frequently.</li>
<li>Ultima enchantment made many times more expensive.</li>
<li>Chaos enchantment also made more expensive.</li>
<li>Grimoires and Grimoire Skills can no longer be put into Crests. This is not retroactive.</li>
</ul>
<br><br>
<b>04/07/2020<br>
me like coding</b><br>
<ul>
<font size=+1>General</font size>
<li>Several Grimoire costs doubled.</li>
<li>Global Grimoires limits are now properly saved and loaded.</li>
<li>Scaling Launch times are now functional, meaning that skills with launch values greater then one launch people for longer.</li>
<li>In regards to the above, lower tier skills that have long launch times are now reduced.</li>
<li>Anaerobic is no longer selectable as an alien racial for now. This change is not retroactive.</li>
<li>Prana Burst buffed. Spirit Hand on it has stronger scaling now, so it should be more onpar with its rival, Sword Saint.</li>
<li>Potential power spikes that occur every 10 potential are now capped along with the wipes progression, which should help eliviate existing potential related power gaps. Bonus potential still means more overall power, and obtaining new techniques sooner.</li>
<li>Many bug fixes.</li>
</ul>
<br><br>
<b>04 / 07 / 2020<br>
i hate coding</b><br>
<ul>
<font size=+1>General</font size>
<li>Dragons can now progress through 3 of their 6 ascensions without giving in to their inherent vore fetish. These are at 25 / 50 / 75 potential.</li>
<li>Dragon Ascension 1 now gives Adaptation benefits.</li>
<li>Dragon Ascension 2 now gives Yin Yang benefits.</li>
<li>Dragon Ascension 3 now gives Mastered Magic Style benefits ... Without even using a style!</li>
<li>Dragon Ascensions 4 - 6 can only be obtained by fusing with other dragons. They enhance the elemental traits of what dragon elements you've combined.</li>
<li>The Magic Trick line now deletes its off message so you can't pretend to become uninvisible when you aren't even invisible.</li>
<li>The Magic Trick line also tells what effect it has forced on someone. Now you can know your success as well as your failure!</li>
<li>Keyblade users using Keyblades now take reduced damage from Heartless and also do increased damage. This value depends on their saga level.</li>
<li>Androids burn some of their increased battery capacity when they strike others or are struck. This value is enhanced by ascensions.</li>
<li>Androids gain increased effectiveness from what enhanced chips they install.</li>
<li>Saiyans will now automatically acquire SSj and Zenkai 4 at 40+ potential.</li>
<li>Hell-risen power now operates as an add rather than a mult.</li>
<li>Battosai and Dance of the Full Moon lock one out from Special Slotters.</li>
<li>Traditional Hiten Mitsurugi now confers an add to BP rather than a mult as well.</li>
<li>Battosai made closer to Satsui Urge.</li>
<li>God Ki only ignores holy/abyssal/slayer damage when it is at or over 1.</li>
<li>Intimidation Ignore should calculate properly now.</li>
<li>Debuff Immunity has become only partial immunity; it will divide the debuff rate.</li>
<li>Intimidation can be ignored while calculating debuff rate.</li>
<li>Ultima forces debuffs.</li>
</ul>
<br><br>
<b>04 / 05 / 2020<br>
New Era New Deathclock</b><br>
<ul>
<font size=+1>General</font size>
<li>Magicite no longer can be refilled.</li>
<li>Sword Skill Tree autohits buffed. They weren't very good.</li>
<li>Mafuba can only be used 2 times by a specific person before they enter a dying state. This change is not retroactive.</li>
<li>Mafuba won't trigger if you move out of range of it while it is casting.</li>
</ul>
<br><br>
<b>04/03/2020</b><br>
<ul>
<font size=+1>General</font size>
<li>Juggernauts and Legendaries no longer resist KB against multihits.</li>
<li>Mana leaks work now.</li>
</ul>
<br><br>
<b>04 / 02 / 2020<br>
The April Fool's Joke Was To Put Your AdminHelps In OOC, But We Didn't Update, So It Didn't Happeng. Be Grateful.</b><br>
<ul>
<font size=+1>General</font size>
<li>Spirit Bow is now generally selectable from the T2 signature list.</li>
<li>Eight Gates will now turn off after 10 minutes to avoid people being in it eternally.</li>
<li>Heal, Send Energy, and Give Power that have been obtained naturally by Dragon Nameks are protected from being removed from Sagas. They also don't count towards the signature limit.</li>
<li>Kamuis moved to be based upon BleedHit rather than passive drains. Using the special forms raises this value.</li>
<li>Kamui Saga Level reduces the value of BleedHit.</li>
<li>Death Ball, Super Nova, Omega Blaster, and Sekiha Tenkyoken damage buffed.</li>
<li>Spirit Gun Mega damage nerfed.</li>
<li>Health PU is no longer a passive drain and instead factors into BleedHit.</li>
<li>Senzu Beans now heal Gates Nerfs as well as Overclock Nerfs.</li>
<li>Senzu Beans also heal stat taxes (but not stat cuts). Gotta draw the line somewhere.</li>
<li>Flash Fist Crush can now be selected from the signature menu.</li>
<li>Extra Credit RPP is now listed separately from normal RPP so that people stop getting confused on when automated skills should trigger.</li>
<li>Sparking Blast, Unbound Mode, and Legend of Black Heaven can be obtained by automation. They are slotless buffs, but are acquired when you would pick your Special Slot buff.</li>
<li>Tension gain rate placed later in the dodamage formula. Expect much slower gains.</li>
<li>Same for the various stat-Leaks. Less killing yourself!</li>
<li>Antagonist (Djinn, Dragon, Makai Shinjin, Demon, Changeling) now have increased potential rates to keep them spicy and full bodied.</li>
<li>Saiyan Observant / Talented made not random. In short: Talented will have more BP. Observant will develop techniques faster.</li>
<li>Slaying God now has a cooldown.</li>
<br>
<font size=+1>Additionally</font size>
<li>Resistant coating (and other conversion kits) now has(have) a dummy check.</li>
<li>Toxic Blood no longer double taps giving poison when you suck it out.</li>
<li>Majin Form nerfed.</li>
<li>Tension gain rate buffed.</li>
<li>Demons hungry.</li>
<li>Finishers being standardized. T0 styles are a bit more sparkly now.</li>
<li>AIs now register as evil, unless they have spirit power.</li>
<li>Number of AI per spot scaled back.</li>
</ul>
<br><br>
<b>03 / 31 / 2020
Hoho, You're Updating Me?</b><br>
<ul>
<font size=+1>General</font size>
<li>Credits now have commas again, yay.</li>
<li>Money now rests on the highest layer that isn't customly made by default.</li>
<li>Finisher Queues now do not do KB, unless they specifically note doing KB.</li>
<li>Monsters now gain their alignment power in fractions, as all of these variables scale.</li>
<li>Majin Form effectiveness tied to HellPower rating. Trust me, this is a nerf.</li>
<li>Juggernaut and Legendary Power now increase the duration of stun immunity, as well as their old effect of cutting the length of stuns.</li>
<br>
<font size=+1>Skills</font size>
<li>Killer Shine can now be purchased. It's an upgrade of Dodompa.</li>
<li>Arcane Bladework now lets you use a staff properly.</li>
<li>What Must Be Done nerfed a little bit more on its final cap.</li>
<li>Murder Music can now be reiconed.</li>
<br>
<font size=+1>Additionally</font size>
<li>Legendary Monsters get to get SWOLE on ascension 3.</li>
<li>Tatsumaki damage now scales depending on Tier S level. It also gains a controlled rush property.</li>
<li>Shinku Tatsumaki has an extended controlled rush property and also cripples.</li>
<li>Hadoken damage scales with the Tier S level. It gains the ability to shoot through walls.</li>
<li>Shinku Hadoken tilts you towards your target when it fires and also shears.</li>
<li>Hadoken techniques only force-set you to Satsui Hadoken if the icon currently being used is Hadoken. So now you can do custom stuff if you're too prissy for being a raw satsui throwin mongoloid.</li>
<li>Shoryuken primarily nerfed, it was really strong in utility and power in comparison to the other two...</li>
<li>Hiten Mitsurugi technique cooldowns lower at Tier 5.</li>
<li>Hiten Mitsurugi and Ansatsuken will force their slayermod to proc even on inhuman enemies when they are above Tier 7. The only exception to this is the Power of Nothingness.</li>
<li>Ansatsuken's Chikara path ignores intimidation by greater amounts each Saga level.</li>
<li>Dark Keyblades no longer have to draw on sissy Forms to be effective. And also cannot do so. Instead they get Rage Form, which triggers at low health. It upgrades as they advance their Saga.</li>
<li>Amaterasu CD increased dramatically.</li>
<li>Kamui Senketsu no longer provides absurd levels of movement mastery.</li>
<font size=+1>Even More Additionally</font size>
<li>Azure Grimoire(s) don't fix maims so that they can be worn as prosthetics properly.</li>
</ul>
<br><br>
<b>03/29/2020</b><br>
<b>haha i got to the update logs first succ it</b><br>
<ul>
<font size=+1>General</font size>
<li>Double/Triple strikes no longer bug out on queueables. In consequence, they long longer apply off queueables either.</li>
<font size=+1>Skills</font size>
<li>(Shin) Kikoho values have been toned down.</li>
<li>Access to Limitless Magic now allows mechanized things to access the magic that allows them to access magic. Mmmhm.</li>
<li>Crimson Grimoire (the buff) now acts as a spell focus.</li>
<li>Void Traverse no longer is free.</li>
<li>Many projectile damage mods buffed! Specifically the ones that were <0.5.</li>
<font size=+1>Additionally</font size>
<li>Double/Triple strikes actually fixed. Imagine accidently discarding your changes, haha.</li>
<li>Second/Third strikes on light attacks will remain nerfed also.</li>
<li><b>Some fixes in hopes to fix server lag and potentially client clashes aswell! Please report continued problems in bug reports with locations.</b></li>
</ul>
<br><br>
<b>03 / 28 / 2020</b><br>
<ul>
<font size=+1>General</font size>
<li>Blade Charge finisher queue no longer knocks back.</li>
<li>Energy Drain grapple attack now drains more energy.</li>
<li>Mafuba now only requires 75% health/wounds to cast and only takes 5 seconds to cast.</li>
<li>Hell Power only confers scaling BP and intimidation to races that naturally have transformations, and therefore can't access Majin Form.</li>
<li>Mecha now update their PowerReplacement when you enter them. Staying competitive with a giant robot has never been easier.</li>
<li>Monsters are hungrier.</li>
<li>Money spawns on the highest layer.</li>
<li>Zombies should be able to devour players properly now.</li>
<li>Android ascensions confer additional stats to attributes that have a cyberize module installed for them. (I.e. enhanced strength increases strength further.)</li>
<li>God Ki's intimidation ignore has been changed to work off a percent. You need 1 full God Ki to fully ignore intimidation.</li>
<li>Androids will never get intimidation, and so they ignore it from others as well.</li>
<br>
<font size=+1>Additionally</font size>
<li>Stackable items stack properly when you don't have a stack of them.</li>
<li>Dragon Dash, Zanzo, Double and Triple attack speed breaks fixed.</li>
<li>Double and Triple Wield no longer break on queue usage.</li>
</ul>
<br><br>
<b>03 / 26 / 2020</b><br>
<ul>
<li>(Shin) Kikoho stuns and launches once more.</li>
<li>Plasma Gatling and its various derivatives shoot for 100 blasts again.</li>
<li>You can now cook/brew up to 9 of the same item at a time.</li>
<li>Energy cuts now calculate properly.</li>
<li>Androids no longer get anger.</li>
<li>Humans have multipliers to stats depending on ascension level.</li>
<li>Cybernetic warriors are now less intimidating, rather than penetrate through intimidation...</li>
<li>Fixed the attack-rate break bugs with zanzoken and dragon dash ... maybe.</li>
<li>Fixed a bug where calculations would result in beastmen berserk always triggering at 5 instead of scaling with ascension. :( </li>
<br>
<font size=+1>Additionally</font size>
<li>Hacksaw and Eviscerate can now be purchased.</li>
<li>Some refinements on stackable behavior.</li>
<li>Food can no longer be blank named.</li>
<li>Eight Gates no longer passively receives a 1.5x strength and 1.5x speed boost. The fix to instantly stacking injuries was fixed, meaning this assumed quick fix is no longer necessary.</li>
<li>Humans and Tuffles learn how to get around intimidation as they ascend, but only if they have no intimidation themselves.</li>
<li>Ki Control Mastery 1 is now gained at 50 potential. Ki Control Mastery 2 is gained at 100 potential. This is to continue to cut down on apps.</li>
</ul>
<br><br>
<b>03 / 25 / 2020</b><br>
<ul>
<font size=+1>General</font size>
<li>The power obtained from having a transformation as a saiyan has been dialed back.</li>
<li>Fake Transformations count as transformation levels for the above.</li>
<li>Symbiote has been removed as an option for alien. Existing Symbiotes will not face particular consequences for their choices until now.</li>
<li>Kaioken now has notable downsides to use. Called injuring yourself.</li>
<li>Gates (and other things with bleedhit) no longer instantly set you to 99% wounds. Wow, great content.</li>
<li>Aliens no longer get stats while they get stats. Ya. (Aliens no longer gain stats in trans because they get perm asc from using it the first time)</li>
<li>Aliens will no longer automatically unlock Jiren ascension, it must be admin unlocked, god damn apps.</li>
<li>Extra Credit values have been standardized and now will not look at RPP mult / intelligence / economy mult.</li>
</ul>
<br><br>
<b>03/24/2020</b><br>
<ul>
<font size=+1>General</font>
<li>Offline regeneration should no longer break the timer on full heal.</li>
<li>You can bang (knock) on reinforced doors now.</li>
<li>New levels of AI! Including a mini boss.</li>
<li>Sea critters now drop coins! I was failing to call their magic magic. So it broke.</li>
<li>Flash Cry changed to be DPS centered rather than ... Bug centered. :^)</li>
<li>Majin Form now synergizes with all ascension races. Trans races get a stronger anger buff. Only Shinjin and Trans races can use it before 50%.</li>
<li>Symbiote lost its SweepingStrike tag.</li>
<li>Finisher buff length reduced to 15 seconds.</li>
<li>What Must Be Done moved to a 0.25 increment per usage.</li>
<li>Trinity Style's Finishing Buff only lasts for 18 strikes (6 attacks that triple strike).</li>
<li>Dire Wolf no longer forces the enemy into fruitless anger on every strike. It also no longer multiplies anger from its finisher.</li>
<li>Saiyan Zenkai EXP requirements lowered to 1 per level. Light wounds can trigger the first ascension, Heavy wounds can trigger the second, and the third and fourth require Mortal.</li>
<li>Saints above Tier 5 can acquire their god ki once again, but only while under 15% health or over 50% wounds. It does not stick around if they become too healthy.</li>
<li>Saints who have attained the ninth sense actually get a whole ass charge of god ki.</li>
<br>
<font size=+1>Technology</font>
<li>Several single use items can now be used with "Apply mob" and "Apply-Self" verbs. This applies to Steroids, Focus Stabalizers, Sealing Spray, Cooling Spray, and Antivenoms.</li>
<br>
<font size=+1>Combat/Skills</font>
<li>Launch durations have been reduced dramatically in an attempt to create healthier gameplay!!! This change is experimental and will likely receive additional changes.</li>
<li>Multihits will now burn 75% of their remaining damage on collision with obstacles, making them much easier to use in tight areas. Brace yourselves for potentially strange behaviors!</li>
<li>Cripple Effect has been nerfed greatly.</li>
<li>Spirit Ball only rehomes once instead of three times now.</li>
<li>Several smaller balance changes across the board for skills.</li>
<li>Double/Triple Strike passives work with Attack Queues. Not sure how long they weren't, but they are supposed to and now they do.</li>
<li>In regards to the above, Second and Third strikes from Double/Triple Strike have reduced damage against stunned & launched opponents.</li>
<br>
<font size=+1>Additionally</font size>
<li>Made potential reduction only affect NPC potential gains. RPP gains should remain even throughout the wipe.</li>
<li>Made NPC gains much faster.</li>
<li>If you are not the highest potential in a party, you will not suffer from having your potential gain divided by the number of party members. I.E. Mentoring is more effective now.</li>
</ul>
<br><br>
<b>03/21/2020</b><br>
<ul>
<font size=+1>General</font>
<li>Offline regeneration should be functional now!</li>
<li>Potential Rate now allows you to slightly overcap. Or undercap, if it's bad enough!</li>
<li>Fixed some alien racials.</li>
<li>Global Devastation now lasts for longer than two rocks.</li>
<li>Adding Queues to your character no longer removes charges of Zanzoken over 3.</li>
<li>Stun Immunity window reduced sharply.</li>
<li>After Image Strike now properly procs its cooldown ... </li>
<li>Increased duration on all Finishers.</li>
<li>Keyblade T4 styles have finishers now. They're kinda nutty.</li>
<li>Queue followups only deploy if you actually hit the opponent. Fact check me, Hill!</li>
<li>Darkness Flames now operate more viciously when in the hands of an Evil person.</li>
<li>Necromancers can now heavy strike again.</li>
<font size=+1>Skills</font>
<li>Dancing Lights accuracy multiplier ramped it. It shouldn't miss every first hit now.</li>
<li>Overdrive works now.</li>
<li>All Military Modules now cancel out battery regeneration gained from Fusion Core while active.</li>
</ul>
<br><br>

<b>03 / 18 / 2020</b><br>
<ul>
<font size=+1>General</font size>
<li>You can now eat / drink without sitting down!</li>
<li>You can carry food and drink in your inventory!!!</li>
<li>Added a check on log in to see if you have not-unlocked signature styles available to be unlocked. Hopefully this doesn't horribly bug things.</li>
<li>Made sure that no styles carry the confusing debuff. Holy shit that would be awful. On the upside people would get really good at fighting while confused, but... no.</li>
<li>T2 Sig Style Finishers added in.</li>
<li>Shining Sword Slash now hits as a circle.</li>
<li>Corkscrew Blow now has x4 the duration to allow for actual ki attack setups with the knockback.</li>
</ul>
<br><br>
<b>03 / 15 / 2020<br>
wit</b>
<ul>
<font size=+1>General</font size>
<li>Cyberization no longer provides a power bonus.</li>
<li>Speed and Sweep Strike damage enhancement no longer stacks with sword damage enhancement. Maybe this will make queues less overbearing. Maybe not.</li>
<li>Androids should now proc daily rewards.</li>
<li>Makai Shinjin can now grant Jagan Eyes at the cost of a maim and disabling their ability to regenerate maims. Other sufficiently naughty boys can also app to receive the same skill.</li>
<li>Toppuken altered. No longer provides CalmAnger, loses half of its erosion potential, gains DeathField, Soulfire, loses SoftStyle, gains additional weapon breaker.</li>
<li>Divide no longer occurs naturally. Preserve the map...</li>
<li>Gates now acquires all stances immediately for their T3 martial arts styles, as other Saga styles do. They are flagged as Saga signatures and should not delete themselves.</li>
<br>
<font size=+1>Additionally</font size>
<li>One Inch Punch damage nerfed.</li>
<li>Void Tiger Fist damage buffed.</li>
<li>Faction doors cannot be lockpicked anymore.</li>
<li>Queue damage really DID get nerfed this time!</li>
<li>Cyberize Mod has been reworked. Tuffles will have full cyberizemod, which will cancel all debuffs from cyberization. Humans will have halved cyberize mod, which will cancel half of the drawbacks of cyberization.</li>
<li>Blade Mode no longer makes the person invisible, or blinds them. It can only be used every 10 seconds, with the usual activation method.</li>
<li>You can no longer defeat mechas with a single punch, if they are unpiloted.</li>
<li>Styles respositioned to be direct upgrades universally, instead of dropping functionality. (with some exceptions, like Secret Knife being the only knife throwing style)</li>
<li>Updated the martial, mastered martial, and mastered magical style checks.</li>
<li>Eight Gates using one of its signature styles will pretend that those styles are mastered martial styles.</li>
<li>Keyblade users above tier six are treated as if they are using mastered magical styles.</li>
<li>Ansatsuken and Hiten Mitsurugi users above tier six are treated as if they are using mastered martial styles.</li>
<li>Lethal only remains on for 60 seconds.</li>
<br>
<font size=+1>Even more additionally</font size>
<li>Androids now don't lose BP from entering Ki Control.</li>
<li>Combo finishers no longer proc the finishing buff multiple times.</li>
<li>You can no longer select the Elder option at creation. It was just being used to train friends with little to no RP...</li>
<li>Gwych Dymystl made much less damaging per blow. It still lasts forever basically.</li>
<li>Great Deluge damage tapped back slightly.</li>
<li>Void Tiger Fist re-nerfed. I did not see the instant strikes. This skill is cursed.</li>
<li>Upgrade Android module yeeted. Androids now gain potential the same way as anyone else, but accrue HealthCuts while gaining potential. This necessitates using the Repair verb on them to necessitate the idea of "maintenance" as well as regular upgrades to their system, without bogging down the actual gameplay.</li>
<li>Some finishers now have unique text if you didn't already fuck them up!!!</li>
</ul>
<br><br>
<b>03 / 14 / 2020<br>
You Can Tell Who Wrote The Changelogs By How The Date Is Formatted</b>
<ul>
<font size=+1>Saga</font size>
<li>Kamui Senketsu no longer deals absurd wounds to itself when they poke anything. Instead, lower levels of Kamui Senketsu are dealt flat wound+health costs, in exchange for some super armor, upon activation. The cooldown of Kamui Senketsu has been raised to prevent abuse of this mechanic. Kamui Junketsu remains unchanged.</li>
<br>
<font size=+1>General</font size>
<li>Greater Tarot Decks are now unobtainable for the time being. This wipe will be unstable enough without introducing the heart of the cards to it. Those who have already drawn a Tarot Fate will just have to live with the IC consequences...</li>
<li>Fishmen should now get an actual boost in water. Ripple was cucking them. Damn sunny bastards.</li>
<li>Infinite Straight Siege bug fixed (probably).</li>
<li>Tension is now built from any direct damage attack. Expect much slower gain since intimidation is no longer factored in.</li>
</ul>
<br><br>
<b>3/13/2020<br>
Ooga Booga</b>
<ul>
<font size=+1>General</font size>
<li>Inflicting elemental effects should now cause a character to flash a corresponding color.</li>
<li>Screen Size settings now save.<li>
<li>Wound Status, Injury %, Capacity %, and Fatigue % all now regenerate while offline.</li>
<br>
<font size=+1>Skills</font size>
<li>Fire now functions like Blast and fires off up to four times.</li>
<li>Fira and Firaga now KB.</li>
<li>Thundaga received a visual upgrade!</li>
<li>Many balance shifts across numerous skills, mostly in balancing damage to the new pacing of combat.</li>
<li>Projectiles and Autohits now build up tension! Hooray for forcies!</li>
<br>
<font size=+1>Technology</font size>
<li>Combat Scanning is now unbroke!!!</li>
<li>You can now recharge gears will meditating.</li>
</ul>
<br><br>
<b>03 / 11 / 2020<br>
Peaceful Times</b>
<ul>
<font size=+1>General</font size>
<li>Change icon ordering so that hair rests on top of the clothes by default.</li>
<li>Nerfed Nox Nyctores skills so that their damage is less overwhelming.</li>
<li>Shunkou Style now requires Soul Crushing and Spirit Style to be mastered.</li>
<li>Items can now have underlays that appear on the wearer assigned to them.</li>
<li>Ceramic Plating that is broken should no longer give effects.</li>
<li>Unwieldy items drop your tension when you equip them. No more preserving Tension by hopping on a cloud.</li>
<li>Many grimoires were moved to have a once per meditation cooldown.</li>
<li>Fierce God now cuts cooldowns by half for its duration rather than...a lot more than half.</li>
<li>Ki Armor will now default to the glowy icon if it is not provided with an icon and you attempt to change it.</li>
<li>There are less Magi-Wasps per AI spot.</li>
<li>Magi Wasps are not automatically aggressive (unless hungry).</li>
<li>Tranquil Dove is no longer Wind defense. Oops...It's Earth defense.</li>
<li>Queue Finisher spam finally fixed?!</li>
<li>RPP Mult no longer lowers the potential requirement for thresholds.</li>
</ul>
<br><br>
<b>03 / 10 / 2020<br>
Attack On Gajalaka</b>
<ul>
<font size=+1>General</font size>
<li>Added some checks to AI to make them not blow each other up. At least the AI found out in the world won't.</li>
<li>Heartless invaders nerfed significantly.</li>
<li>Gates drains less fatigue. This Saga still kinda sucks...</li>
<li>Grab triggering queues now perform properly.</li>
<li>Aliens can now revert from transformation. Yay.</li>
<li>Made continuous attacks able to be limited by the number of blasts they've shot. No more infinite Straight Siege.</li>
</ul>
<br><br>
<b>03 / 09 / 2020<br>
Gajalaka Rebellion</b>
<ul>
<font size=+1>General</font size>
<li>Yokai now default to 2 regeneration.</li>
<li>Erupting Burning Finger and Lightning Stake are now selectable on the signatures list.</li>
<li>Secret Knife's knives now properly home.</li>
<li>Dual Wield can now be properly unlocked.</li>
<li>Secret Knife can be properly unlocked regardless of what order styles are mastered in.</li>
<li>Hero Spin upgrades can now be properly obtained. I don't wanna talk about that one.</li>
<li>Spirit Sword is now selectable as a Tier 2 Signature.</li>
<li>Revised catchup reward code. I expect it will operate fine today...</li>
<li>Added MartialMagic back to Spirit Style.</li>
<li>Added MovingCharge to Soul Crushing Style.</li>
<li>Shunko Style adopts both of these traits.</li>
<li>Fixed Alien Transformation revert.</li>
<li>Zanzoken now gains a pip of Instinct for its attack.</li>
<li>After Image Strike now makes the user when it is activated. After Image Strike has a 10 second cooldown.</li>
<li>Scaled back cyberization mod across the board. People who lost cybermod will be granted event credits for the inconvenience.</li>
<br><br>
<font size=+1>AI</font size>
<li>The crystal cave has overflowed with heartless. Now Dark Eyes and Dark Gajalaka can be found roaming the plains. They are very dangerous, necessitating dealing with the source of cursed energy!</li>
<li>Fish beasts have risen from the nearby waters and menace those going for a quick swim. Dire Penguins accompany these fish creatures.</li>
<li>Magi-Wasps have been reported within the jungle. These insects are extremely venomous!</li>
<li>Deeper inside the caves, reports come about a potent and violent cactus entity...</li>
</ul>
<br><br>
<b>03 / 08 / 2020<br>
Lightning Round Pt. 2</b>
<ul>
<font size=+1>NO TIME FOR CATEGORIES WE NEED FIXES NOW</font size>
<li>Potential 'rubberbanding' fixed by applying superglue to the higher end of things. (Days of wipe can go up, but it can't go down.)</li>
<li>Fusion potential display bug removed by ... Making fusion unable to see potential. It is just a display. Your power is still added together.</li>
<li>Slain NPCs will now drop money 100% of the time. It's very small amounts of money, but it's still money. Grind away.</li>
</ul>
<br><br>
<b>03 / 08 / 2020<br>
Refunding Refunds</b>
<ul>
<font size=+1>General</font size>
<li>Stats tab now shows potential rather than base power. This will be more useful for everyone.</li>
<li>Partial values of SuperDash would break Dragon Dash functionality entirely. This is fixed.</li>
<li>Spending RPP in the Training tab no longer grants absurd gains.</li>
<li>Potential is now hard capped depending on the day of the wipe.</li>
<li>Daily RPP was moved to set you to the total daily RPP, after many complaints. The steady buildup of RPP over the first 3 days remains.</li>
<li>Hamstring should now properly launch on the offshoots.</li>
<li>Players that log out should leave parties on logout properly.</li>
<li>Yokai were likely to get to 0% anger and become IMMUNE TO ALL SUFFERING. It was very Zen. Unfortunately, it has been removed since it's also a bug.</li>
<br><br>
<font size=+1>Sagas</font size>
<li>Hiten Mitsurugi now has a finisher.</li>
<li>Ansatsuken now has distinct finishers once you choose if you specialize in Hadoken, Shoryuken, or Tatsumaki.</li>
<br><br>
<font size=+1>Signatures</font size>
<li>Kendo Style can now be obtained. You will have to refund one of the prerequisite styles and then master it again.</li>
<li>Signatures can be selected by more than one person ever, maybe.</li>
<li>Black Leg can use its finisher now.</li>
<br><br>
<font size=+1>Races</font size>
<li>Aliens now have 5 ascensions, and gain them at normal ascension times. Racials have been uncapped in the number of times that you can pick them, and they occasionally give different benefits.</li>
<li>In relation to above, there are still some racials that can only be picked at chargen.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Camera learning no longer provides upgraded skills. However, Sharingan retains this behavior.</li>
<li>The above will not be retroactively removed from characters.</li>
<li>Styles can no longer be copied, period.</li>
<br><br>
</ul>
<br><br>
<b>03 / 06 / 2020<br>
<s>Today's menu</s> FUCK SAIYANS</b>
<ul>
<font size=+1>General</font size>
<li>Void chance now scales down based on your Potential achieved. Admins can still set the base rate, but only people with no Potential will actually roll with that value.</li>
<li>After Image Strike now consumes charges to use... Foolish samurai warriors.</li>
<li>Teleports that allow you to return to the casting spot no longer forget to clear the Return location.</li>
<li>Saiyan Zenkai, which previously gave a bonus of +2.5 potential, now does not offer this bonus. Saiyans who had already acquired Zenkai have had this potential removed. They have been given 7 days of extra RPP for the inconvenience.</li>
<li>Saiyan Zenkai is now based upon wound statuses received rather than injury percent. Higher levels of Zenkai require more grievous wounds. Zenkai ascensions can only happen when a saiyan is fully healed.</li>
<li>Using Heal or Refresh on a saiyan with Zenkai EXP will clear the Zenkai EXP and give the saiyan a message to signal that they've lost the built up Zenkai EXP. Hop in a tank or meditate if you want Zenkai.</li>
<li>Ki Armor now has a 60 second cooldown.</li>
</ul>
<br><br>
<b>03 / 05 / 2020<br>
Back to little fucky wuckys.</b>
<ul>
<font size=+1>General</font size>
<li>Creation now asks you for a name again. Yay?</li>
<li>Dash Master now allows you to ignore Dragon Dash (and other dashes) already being on cooldown properly.</li>
<li>Movement charges no longer build when you have an After Image Strike queued. Flicker no longer increases charge rate of movement charges. (But movement mastery does)</li>
<li>Zanzoken is no longer stupid.</li>
<li>Niezan reported a bug which allowed one to sneak a human out of their spawn box. Thematically, it mostly involved dying a lot. Voids now force you to release whoever you are holding when you go back to your body.</li>
<li>Movement mastery will now be recognized even if it isn't from a buff.</li>
<li>Honestly I don't know if the potential bug is fixed but if it's not at least now it has more debug messages...</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fusion Dance was scaled back in passives. These passives can still be obtained with greater mastery. It might even have accurate power now.</li>
<li>Some crucial code was re-added to Fusion Dance. Hopefully the 'passenger' can hear and see once again.</li>
<li>The Sword T3 line was made obtainable.</li>
<li>Ki Armor no longer buffs end and defense. Why did I ever put that in?</li>
<li>Overhead Divide and Cross Slash REALLY traded places now.</li>
<li>Cross Slash is now a circle autohit because crosses are really awkward.</li>
<br><br>
<font size=+1>AI</font size>
<li>The Gajalaka threat has been pacified and they will no longer start with a chance to be MURDEROUS.</li>
<li>Added code to make it variable how likely an AI is to be starving.</li>
<li>In relation with above, Scorpions and Spiders have a 25% chance to be hungry.</li>
<br><br>
<font size=+1>Party</font size>
<li>Parties should now reprimand the leader for trying to add AIs to the party. Likely.</li>
<li>Queueing multiple invites and then accepting them in a surge no longer works. Perhaps.</li>
<li>Logging out while in a party will automatically remove you from the party, without breaking the party. Probably.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Laser doors now have durability so they can't be slapped open.</li>
<br><br>
<font size=+1>Races</font size>
<li>Yokai monsters were changed to regenerate mana when they do not have an active buff on. This increases with their max mana amount.</li>
<li>The final ascension for Yokai monsters grants them ManaStats passive, but only while they have an active buff on.</li>
<li>In relation to the above two changes: these bonuses only apply when the Yokai is not mechanized.</li>
<li>Beastmen monsters now start at 150%. They do not ascend their maximum anger value anymore. The threshold of health needed to enter an anger state still rises, for a value of 50% at final ascension.</li>
<li>Beastmen Berserk grants 5% of super armor now.</li>
<li>Eldritch monsters should now be teachable.</li>
<li>"Celestial" monsters now gain twice as much MovementMastery per ascension, from 1 to 2.</li>
<li>"Natural" monsters now only gain 0.6 BuffMastery per ascension, down from 1.</li>
<li>"Infernal" monsters now only gain 10% anger max per ascension, down from 20%.</li>
<li>Saiyans can now gain Zenkai ascensions without voiding. Starting from 5 potential, and every 5 potential afterwards until 20, they will start gaining Zenkai EXP for injury that they heal off.</li>
<br><br>
</ul>
<br><br>
<b>03 / 03 / 2020<br>
LIGHTNING LIGHTNING UPDATE JESUS CHRIST</b>
<ul>
<font size=+1>LIGHTNIIING</font size>
<li>Doors that are unlocked now open. They refused to for a bit.</li>
<li>Fusion characters no longer get rolled back and given RPP. Shut the FUCK UP NIEZAN.</li>
<li>Fusion characters can no longer interact with partying.</li>
<li>0 potential people can now acquire potential. They couldn't for a moment there. It involved dividing by zero.</li>
<li>God doors are no longer grabbable by default.</li>
<li>Fixed a bug where style Finishers would bug out tension by dropping the queue and replacing it with a heavy strike.</li>
<li>REALLY fixed the bug with Eldritch monsters not being able to breathe in water. Really.</li>
</ul>
<br><br>
<b>03 / 03 / 2020b<br>
LIGHTNING UPDATE ROUND!</b>
<ul>
<font size=+1>LIGHTNING ROUND!!!!!</font size>
<li>Party EXP gain works. Probably.</li>
<li>Doors now work. Probably.</li>
<li>People can be flagged as Anti God Door, which allows them to penetrate deep into the spawn doors. For sure.</li>
</ul>
<br><br>
<b>03 / 03 / 2020<br>
Immediate Bug Revelations</b>
<ul>
<font size=+1>General</font size>
<li>Potential gains from slaughtering innocent NPCs has become more normalized. This is in hopes of making it feel like less of a waste to kill NPCs, for those who do not have murder genes in their blood.</li>
<li>Tweaked the Potential acquiring formula to compensate for the buy where you go over your soft cap.</li>
<li>Added some additional scaling reductions on Potential gain.</li>
<li>Scaled back potential on some of the people who were stacked as a result of above oversights; they will automatically be granted 7 days of EC RPP, which does stack with the below bonus for saiyans.</li>
<li>Money and items dropped by NPCs are set to have a very large amount of health. Hopefully this will prevent breaking them in a fit of lethal outrage.</li>
<li>Spawns can easily be swapped by admins. By using the Spawn-Swap verb. Incredible.</li>
<li>There are new types of doors that can only be opened by a person from a specific Spawn region. They must be set up by admins.</li>
<li>RPP-Refund will now also refund your daily potential soft cap. Thanks Niezan.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Reorganized Cross Slash and Overhead Divide to better represent their category swap.</li>
<li>Added SwordOnly flag to Overhead Divide, whoops.</li>
<li>The Yes/No options are being unified to be No/Yes. So less people are confused on where they go to accept or deny a decision. Reading is dead.</li>
<li>Style Finishers now set your tension to -1 for the duration of the finisher buff, preventing you from gaining Tension while already in the finisher buff.</li>
<br><br>
<font size=+1>Party</font size>
<li>Parties are now a part of the game. Parties cannot hit each other with basic melee attacks, removing a large part of friendly fire. They can still hit one another with projectiles and autohits.</li>
<li>Parties now share in the Potential gain from killing NPCs. This value is divided by the number of players in the party. Weaker players will get a larger portion than stronger ones. Help your weak friends.</li>
<br><br>
<font size=+1>Races</font size>
<li>The variations on Saiyan PotentialRate have been moved back. Originally they ranged from x1.5 to x3. This has been closed to x1 to x2. Those affected by this change will receive a week's worth of RPP for the inconvenience, granted automatically.</li>
</ul>
<br><br>
<b>03 / 02 / 2020<br>
New Day New Update</b>
<ul>
<font size=+1>AI</font size>
<li>AI will now think to use Wide Wave style autohits.</li>
<br><br>
<font size=+1>Races</font size>
<li>Yokai can now have base profiles that actually appear! A change to Spirit Form made it so that they would never display their base profile, only their Spirit Form one.</li>
<li>Saiyans can now get an admin to edit their tail icon as well as their tail wrapped icon. Just in case you don't like brown.</li>
<li>Races that don't need to breathe in space don't care about drowning either.</li>
<li>Shinjin now naturally acquire Grimoire Arcana to prep for future changes to their racial techniques.</li>
<li>Ingenuity Monsters will no longer grow a companion later on in their development. The verb may be repurposed for other uses.</li>
<li>Alien progression has been altered. They now gain ascensions by default (They have 3 of them, with 1 locked behind a condition). Their transformation imparts permanent buffs when it is acquired and first used, but has some functionality that is only used while the transformation is active as well.</li>
<li>Changelings no longer have their Potential gain reduced for the 3 "transformations" that they have unlocked by default.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fusions no longer put you in the void, which should let the passenger be able to hear things...</li>
<li>Unlock Potential has been updated. It now gives you approximately twice the power you had before it was used on you, unlocks an ascension (if possible), and fatigues the user much more.</li>
</ul>
<br><br>
<b>03 / 01 / 2020<br>
A Bad Touch Beyond A Bad Touch</b>
<ul>
<font size=+1>General</font size>
<li>Fixed a bug with spawns where it wouldn't let you spawn if someone was sitting on the spawn. Very fun! Welcome, new players. This is the typical DBR experience.</li>
<li>Fixed a bug where Makyo would bug out their powered form setup if they picked speed.</li>
<li>Made sure that money updates properly after spending it on tech, as well as updating after it is stolen.</li>
</ul>
<b>03 / 01 / 2020<br>
Final Bad Touches</b>
<ul>
<font size=+1>Skills</font size>
<li>Straight Siege had its knockback removed, and gained a limit of 100 blasts similar to Plasma Gatling.</li>
<li>Crash Burst has improved accuracy by x2 as well as gaining x2 more blasts, while lowering the damage of each individual blast by half. This is to give it some utility as a debuff-stacker and differentiate it from Spirit Ball.</li>
<li>Flare Wave damage decreased from 2.5 to 1 while also gaining 2 more shots to manually fire to make it distinct as a blast skill rather than a charge skill.</li>
<li>Stone Skin line has been changed from Pure magic class to Earth magic class, giving Earth specialists a skill that is in their class at all.</li>
<li>Golem Form now adds sweeping strikes.</li>
<li>Flare gains GuardBreak property. In addition, it now properly destroys things by ignoring 66% of endurance of its targets.</li>
<li>Magic attacks in T4 have been standardized to have a 10/15/20 mana cost. Meanwhile, Magic buffs in T4 are now 20/30/40 mana cost.</li>
<li>Magic buffs in T3 have a standardized mana cost of 10/20/30.</li>
<li>Magic attacks in T2 have a standardized mana cost of 10/20/30.</li>
<li>Magic buffs in T1 have a standardized mana cost of 5/10/15.</li>
<li>Overhead Divide has been moved to be a part of Tipper's line. No other changes made.</li>
<li>Cross Slash has been moved to be a part of Arc Slash's line. It gains 1 controlled tile of rush, had its energy cost moved to 3, and caught a 0.5 damage buff. It's still a very awkward skill.</li>
<br><br>
<font size=+1>Mapping</font size>
<li>Mappers can now toggle Binoculars without the object.</li>
<br><br>
<font size=+1>Signature</font size>
<li>Fixed bug that allowed double tapping of signature obtains.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Tapped Saga skills to fall in line with new signature standardization.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Overdrive now properly impacts Power Up percent.</li>
<br><br>
<font size=+1>Races</font size>
<li>Changelings no longer lose BP from unmastered forms.</li>
<li>Changeling, Dragon, Demon, Djinn, and Makai Shinjin now get their potential set to the amount of days the wipe has been going on for. They do not gain a backlog of potential that can easily be gained.</li>
<li>Kai Shinjin now get to pick their initial stance from their style.</li>
<br><br>
</ul>
<b>02 / 28 / 2020<br>
Fake Sound of Progress</b>
<ul>
<font size=+1>General</font size>
<li>The prompt that appears when you attempt to overwrite a new character will note which character is associated with the key. Ostensibly this will prevent people from making over key characters.</li>
<li>Spawns now have learning rates, economy mults, intelligence, and enchantment values associated with them that are added into a race's default values.</li>
<li>The ages selectable for new characters are now Youth and Elder, as opposed to Youth and Child. Children can only be made via harmonious consentual union in the missionary position between opposite sexes.</li>
<li>Rewards are now automated and will happen every 24 hours, counting from when the server perceives midnight to be. Multiple days of rewards will be accounted for.</li>
<li>The amount of potential that one can gain from fighting AI opponents has a cumulative daily limit. Exceeding this limit results in diminished gains which are alleviated depending on how long the wipe has run.</li>
<li>Base mod has been removed as a primary source of BP. Instead, BP is determined by the fighting Potential a character has realized, which is scaled throughout the wipe.</li>
<li>Ascension-based races unlock ascensions at Potential 10, 30, 50, 70, and 90. These ascensions do not carry a power boost anymore.</li>
<li>Zanzoken, Sense, Power Control now are obtained over the course of cultivating your fighting potential. They do not need to be purchased with RPP.</li>
<li>A choice is made at a certain level of potential to select Ki Blade, Ki Shield, or Ki Armor. These skills do not cost RPP to obtain, and you can usually only obtain one.</li>
<li>Skill Tree 'upgrades' on base skills now replace the base skill, cutting down number of verbs by nearly half.</li>
<li>In case of above, some magic skills gained additional functionality that would have been erased; generally speaking an upgrade really is an upgrade.</li>
<li>Voids no longer announce that you are voiding. You must wait out the void timer to learn if you died or not.</li>
<li>Event credit has been changed so that one credit will provide bonus RPP during daily checks for 7 daily checks. Up to 7 'charges' can be stored, and excess charges will be converted into economy charges.</li>
<li>Every race that focuses on ascensions now has 5 ascensions.</li>
<br><br>
<font size=+1>Optimization</font size>
<li>Lists of objects containing verbs are now filed away separately; the game only needs to look through 'Buffs' instead of through all of a person's contents to find what buffs are on, for example.</li>
<li>Lists of items are distinct from a mob's contents, which allows for some shorter checks as well.</li>
<li>Fixed up creation code a bit.</li>
<li>Teleport moves now have a framework.</li>
<li>Grapple moves now have a framework.</li>
<br><br>
<font size=+1>Skills</font size><br>
<li>The Skill Tree was overhauled. T1 techniques now cost 40 RPP, Tier 2 techniques now cost 80, Tier 3 techniques now cost 120, Tier 4 techniques now cost 160. Upgrades do not scale up this cost.</li>
<li>Styles have standardized costs as well. Skill tree styles cost 20 to gain as well as advance in mastery. The cost associated with Tier 1 Signature Styles is 40. Tier 2 Signature Styles is 80. Tier 3 Signature Styles is 160.</li>
<li>Having a fully mastered style (Mastery 4) allows you to build up Tension which will be displayed in the top left corner. Building a full meter of tension by fighting and then pressing Heavy Strike will unleash a style-dependent finisher, which will also trigger a buff for a short while.</li>
<li>Having an active style will also display your zanzoken charges in the bottom left corner. It only appears there when using a style because I don't like it just sitting there all alone. Looks cluttered.</li>
<li>New T3 Special Slotter: <b>Ghost Install</b>. It adds double-strike (or even triple strike) at the cost of your existing mana, while allowing you to build it back up over the duration. It is best suited to one-on-one fights.</li>
<li>Soul Illusion and Phantom Array styles have been removed. Dual Wield and Triple Wield still exist as styles, increasing the difference between unarmed and armed martial arts.</li>
<li>Martial Styles (any unarmed-only style that is not mystical in nature) now enjoy greater boons and reduced banes from using stances.</li>
<li>All styles have a unified total stat boost, regardless of if they are martial, mystical, universal or armed.</li>
<li>Style Complexity has been removed and no longer increases the stat boosts of a style.</li>
<li>'Basic' Stance no longer exists. Buying a style allows you to obtain one stance essentially for free, and setting a style will automatically set a stance as well with priority on Advancing -> Striking -> Defensive -> Evasive. You can always use a \n macro to immediately set a different stance. (e.g. Turtle-Style\nEvasive-Stance)</li>
<li>Magical Styles now act as spell focii for their related element classes.</li>
<li>The style list has been significantly slimmed down to account for the new Style Development system.</li>
<li>Jinchuuriki now has 4 classes instead of 9 - Tyrant, Catastrophe, Dominator and Juggernaut. Each focuses on a single stat to emphasize differences with Vaizard Mask which boosts at least two.</li>
<li>Jagan Eye now has a prototype for its final tier special, and also offers higher strength and force boons in exchange for taking away endurance.</li>
<li>Shunkan Ido and Blink used to be capable of teleporting while launching a beam. Now, only Shunkan Ido can teleport while CHARGING a beam, and Blink can only be used when not charging or firing.</li>
<li>Ultra Instinct is no longer a style, and is instead a T4 Special Slot buff.</li>
<li>Skills can now act as Spell Focuses.</li>
<br><br>
<font size=+1>Sagas</font size>
<li>Sagas that provide stat boosts to a character directly now do this across the whole Saga, rather than just at specific levels..</li>
<li>Sagas must have the SAGA INVEST option in the Skill Tree used to acquire an automated level up, as well as have the character fulfill a Potential threshold. Only levels T2-T6 can be obtained in this method.</li>
<li>Saga T7 and T8 can only be obtained via admin approval.</li>
<li>Admins can still flag a person individually to receive a Saga Tier up, which ignores all requirements.</li>
<br><br>
<font size=+1>Signatures</font size>
<li>Signatures are obtained every Potential evenly divisible by 10, with 200 additional RPP (spent or unspent) needed to acquire it. Event Credit does not count towards this RPP threshold.</li>
<li>Style Signatures, which can only be obtained by mastering two styles of the same tier, are obtained at Potential 5, 15, 25, 35, 45, 55, and 65. Potential 65 is a Tier 3 Signature Style, Potentials 25 and 55 are Tier 2 Signature Styles, and the rest are Tier 1. Each follows the same 200 RPP threshold scheme as above.</li>
<li>Special Slot Signatures are obtained at 75 Potential and 1500 RPP.</li>
<li>All of the above are thresholds; if you have apped and approved a relevant skill beforehand, you will not obtain another one once passing the threshold.</li>
<br><br>
<font size=+1>Races</font size>
<li>Dragons: now enjoy increased boons and reduced banes when using stances. This stacks with the benefit received by martial styles and some other unique styles. Each also contains small amounts of God Ki.</li>
<li>Yokai: Yokai are now more powerful in their Elder stage. Like fine wine, they ripen with time.</li>
<li>Shinjin: now only have one ascension, which is Ma/Kaioshin tier. They start with their elemental techniques (if Kai), removing the necessity for development in characters that operate best while out of the limelight.</li>
<li>Aliens: have a new racial that can only be chosen at creation to opt to be Spiritual, which increases their imagination. As well as making them spiritual. Obviously.</li>
<li>Also Aliens: Prodigy has been changed so that it doubles the rate that potential is gained, rather than increasing RPP amounts.</li>
<li>Monsters: now choose all of their ascension choices at creation rather than throughout their lifespan. They gain bits and pieces from each option on every ascension, with some capstones acquired only at ascension 3 or 5.</li>
<li>Saiyans: Elite class is no longer a class choice. Instead, every saiyan picks between being Observant or Talented. Talented will immediately reward the saiyan with more Potential, but they gain potential slower. Observant saiyans will start with Potential similar to any other race, but they gain it much faster.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Ships now announce to the Z plane they are leaving from that they are leaving.</li>
<li>Technology and Enchantment have been dummy proofed from accidental clicking by giving a pop up which allows you to choose to buy an item or examine it. Report any items missing a description.</li>
<li>Knowledge costs have been standardized, with entry level knowledge costing 40 / relevant modifiers, and advanced level knowledge costing 80 / relevant modifiers.</li>
</ul>
<br><br>
<b>11/30/2019<br>
Month's Closing.</b>
<ul>
<font size=+1>General</font size>
<li>Fixes, mainly!</li>
<li>An obligation was fulfilled to Key.</li>
<li>Alt-Form profiles now get referenced directly by Examine; notify #bug-reports of any odd behavior.</li>
</ul>
<b>11/27/2019<br>
Back to the usul - vol.2.</b>
<ul>
<font size=+1>General</font size>
<li>Small tap on how sword injuries calculate that makes them a bit less close to cursed wounds.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Aerial Recovery: if used properly, it now produces additionally stabilizes your footing against launchers (like reverse dashing out of one).</li>
<li>Meteor: Spell reworked, will probably be slightly less reliable for a while.</li>
<br><br>
<font size=+1>Races</font size>
<li>Djinn: Slight tap on second ascension's power output.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Grimoire Arcana: Fixes to a number of Grimoires.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Sharingan: Couple extra touch-ups and fixes on Rinnegan.</li>
</ul>
<b>11/24/2019<br>
Back to the usul.</b>
<ul>
<font size=+1>General</font size>
<li>Transformation overlay locking should no longer interfere as strongly with classic aura locks.</li>
<li>Folks going over the global RPP limit (mainly humans, half-humans, tuffles and djinn) can develop extra signatures.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Consecutive Blast: slightly upped energy cost, it should no longer be retrigerrable while being used.</li>
<br><br>
<font size=+1>Races</font size>
<li>Djinn: Absorb should now have a tiny cute graphical effect before nomming someone.</li>
<li>Djinn: Less bummed about injury and fatigue even post-ascension.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Surgery: Now scales better with Advanced Medical Technology than it does with basic medicine when it comes to healing BP injuries, but the overall cap out point is lower.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Sharingan: Asura Path now functional.</li>
<li>Cosmo: Set up a pseudo-location for effects of Rikudou Rinne.</li>
</ul>
<b>11/23/2019<br>
This is the longest pause in updates in a while.</b>
<ul>
<font size=+1>General</font size>
<li>More animation work, more dynamic Zanzoken clashes.</li>
<li>Sense removal is now affected by all sources that can affect wounds (not injuries, wounds).</li>
<li>Longer transformation animations will be now skipped outside of the first ones, but one can force them by using Pose state before transforming.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Consecutive Blast: reworked to behave more like the Plasma Gatling.</li>
<br><br>
<font size=+1>Races</font size>
<li>Hellspawns: Corrected the resistance integration against Fate Finalization.</li>
<li>Half-Demons: Shin Majin Form / Sin Devil Trigger now can activate under proper conditions.</li>
<li>Shinjin: Majin Form applies to them correctly now.</li>
<li>Changelings: No longer affected negatively (regarding energy recovery and power up cots) by their transformation multipliers before Golden Form.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Sharingan: Initial integration of Rinnegan and Six Paths (Asura and Beast Paths require taps from Galgal).</li>
<li>King of Braves: Broken/Genesic Brave mode low health buffs adjusted to work while piloting.</li>
<li>Cosmo: Tenbu Horin stole one sense more than it was meant to, corrected.</li>
</ul>
<b>11/20/2019<br>
Autism</b>
<ul>
<font size=+1>General</font size>
<li>Graphical corrections, bug fixes.</li>
<br><br>
<font size=+1>Races</font size>
<li>Half Saiyans: Max Anger now properly replaced by 2 rather than x2.</li>
<br><br>
<font size=+1>Saga</font size>
<li>King of Braves: Genesic Mode now halves the stat and passive gain of every mode it is composed of.</li>
<li>Sharingan: New icons and passive setups for Perfected Susanoo; Full-Body Susanoo icons will be adjusted with time.</li>
</ul>
<b>11/18/2019<br>
Aesthedicks</b>
<ul>
<font size=+1>General</font size>
<li>Small tops on how sword/armor conjuring buffs visually interact with being inside a mobile suit.</li>
<li>Ultima element no longer poisons, leaving that quality unique to poison and hellfire attacks.</li>
<li>The above means Ultima weapons and styles do no longer qualify you for getting auto-bopped, and makes a more direct relation with Chaos weapons.</li>
<li>Grab ignores CD lock on RP Mode.</li>
<br><br>
<font size=+1>Races</font size>
<li>Changelings: Ascensions a bit more drastic of a change, will need some manual adjustments; contact Galion/KKT.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Corrective taps to auto-signature learning; no retrigger this time around since the changes aren't big.</li>
<li>Blink: Now requires greater investment in space magic to obtain; this will retroactively pull it back from people below the threshold.</li>
</ul>
<b>11/17/2019<br>
DIE ALREADY</b>
<ul>
<font size=+1>General</font size>
<li>AIs can once again be deleted.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fatigue costs on buffs no longer ignore fatigue immunity.</li>
<li>Blast type attacks which have temporary homing now turn the user towards their target before firing off to make them seem a lil less awkward visually.</li>
<li>Added a property to cooldowns that can have them scale the length of the cooldown with usage of skills; for now applied to regeneration skills to avoid the possibility of literally neverending fights.</li>
<li>Resilient Sphere: Reduces damage output in the duration of the sphere, main role is now shielding for Power Up or securing lengthier attack wind-ups and beam charges.</li>
<li>Soft/Hard Style skills: Reduced scaling on damage increase/damage resillience by a third.</li>
<li>New general signature: <b>Brewing</b> - yes, you can now make booze.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Movement Mastery snipped away from Super Saiyan Two and up, Power Up speed reduced, replaced with some backend upgrades.</li>
<li>Changelings: One Hundred Percent Form made significantly tankier to better rival Fifth Form's health restoration.</li>
<li>Changelings: Their special slotters now add a trait that allows all skills to be treated as all-out skills for energy (they ignore not having sufficient energy when utilizing them).</li>
<li>Hellspawns/Werewolves: Corrected a calculation oversight that caused their normal regeneration value to be included in all formulas using Regeneration Mod, even if the formula applied a negative/positive multiplier on it.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Cybernetics: Stat enhancer effects increased.</li>
<li>Cybernetics: Stat enhancer effects now displayed in base stat display.</li>
<li>Cybernetics: Internal Scouters can now locate AIs.</li>
</ul>
<b>11/16/2019<br>
Gee Bill! How Come Your Mom Lets You Have Two Updates?</b></br>
<ul>
<font size=+1>General</font size>
<li>Saga/Secret now mechanically lock from using Dance/Potara type fusions, considering the latter don't translate their mechanics well at all.</li>
<li>More control over AI setups.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Rekkaken: Now reduces regeneration and endurance to prevent healing off the burns too quickly while buff is active.</li>
<li>Rekkaken: Buffs reworked somewhat.</li>
<li>Rekkaken: Appearance update.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Saiyan Soul deactivation threshold tripled, some adaptation functions backended for consistency.</li>
<li>Djinn: Closer tie-in between absorbtion and ascension mechanics.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Full mastery of the Seventh Sense moved to Tier 8 to make Tier 7 less of an enormous leap in functionaly and fill out the rather empty final one.</li>
<li>Weapon Soul: Oversoul issues corrected.</li>
</ul>
<b>11/16/2019<br>
I nerfed myself today... to see if I have skill... - ft. Johnny Cash</b></br>
<ul>
<font size=+1>General</font size>
<li>Two people in counter state will now perform a cross-counter on eachother rather than flapping ineffectively.</li>
<li>Maiming attacks now calculate their maim rate before the global damage multiplier is accounted for.</li>
<li>Animation taps.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fatigue/Wounds inflicted by Soft/Hard styles no longer scale with the trait, only the damage scaling does.</li>
<li>Sense: Pulse cooldown reduced.</li>
<li>Dancing Lights line: Reworked wholly due to super unhealthy interaction with Counter Master trait; thankfully discovered in an NPC fight.</li>
<li>Mage Armor line: Now should be usable by Saiyans (for real).</li>
<li>Kendo Style: Reduces damage to wooden swords.</li>
<li>Holy/Pearl: Fused into one skill, so whoever has both can enjoy a slightly more powerful (and costly) Holy and free signature slot, while we will toil away at fixing Crests.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans, Half Saiyans and Dragons now have (mechanically) larger appetites.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Wooden Swords: Base durability doubled.</li>
<li>Radar Tech: A tad more range.</li>
<li>Scouters: Scanning cooldown reduced.</li>
<li>Scouters: Once again show coordinates of targets.</li>
<li>Tomes/Crests: Reduction on cooldowns reduced, reduction on mana costs increased.</li>
</ul>
<b>11/14/2019<br>
One Piece (of code).</b></br>
<ul>
<font size=+1>General</font size>
<li><font color='#FFCC00'>Oro</font color> is free.</li>
<li>Other, significantly less important stuff.</li>
</ul>
<b>11/13/2019<br>
Po' boy.</b></br>
<ul>
<font size=+1>General</font size>
<li>Objects can now be thrown.</li>
<li>Overview tab no longer contains a player display to reduce server impact.</li>
<li>Buffs will not disable on KO for a while; not exactly intended so be mindful of it yourselves until the mechanic is reimplemented in updated form.</li>
<br><br>
<font size=+1>Skills</font size>
<li>New prototype T1 Queue Signature: <b>Aura Punch</b>. It builds a higher damage mult the longer it is queued.</li>
<li>Upped cooldowns on a lot of queue moves, notably signatures, to raise the value of skillshots without ramping/nerfing the overall damage output in fights.</li>
<li>Shin Kikoho: Still had old health/wound cost values from the time before the mechanical adjustment to interactions with global damage mult; corrected.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Flying Devices can now set the rider into an icon state of their choosing.</li>
<li>Vessels for capacity can now be refilled at a cauldron, as you would your own magic capacity.</li>
</ul>
<b>11/12/2019<br>
Late by day for a cute date.</b><br>
<ul>
<font size=+1>General</font size>
<li>Corrected the ability to set up overlay lists for NPC squads.</li>
<li>Fatigue recovery again a bit slower.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Mage Armor line: Back to being a Special Slot lock, but still not stackable - enjoy it, monkeys.</li>
<li>Purity-type skills: Wound recovery potential reduced.</li>
<li>Tranquil/Dire Fist: Redesigned style passives for more consistent returns regardless of Anger stats.</li>
<li>Unlock Potential: Now users of the ability gain an indicator in Sense tab, telling them if their target's potential is maxed.</li>
<br><br>
<font size=+1>Races</font size>
<li>Djinn: Updated Absorb behavior somewhat, now a targetted skill.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Armament Enchantment: Ultima-type enchants limited to staves and swords.</li>
<li>Armament Enchantment: Enchant discount for Wooden swords yeeted.</li>
<li>Android Inibition: Should be fixed.</li>
<li>Mecha: Fixed couple issues.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Weapon Soul: Fixed small icon interaction issues.</li>
<li>Libra Armory quickswaps now properly terminate the buff and swap to the new one.</li>
<li>An exception has been made for Libra Armory which allows it to ignore the cooldown of styles. This allows for \n macros to swap Libra weapons as well as styles.</li>
</ul>
<b>11/09/2019<br>
Like Nine-Eleven for normal people.</b><br>
<ul>
<font size=+1>General</font size>
<li>Skill CDs do not recover over relog, period.</li>
<li>Select Turf now finally grabs information from custom turfs/objects.</li>
<li>Creating a warper now provides a warper back automagically.</li>
<li>Dashing should once again ignore edges.</li>
<li>Death now breaks targetting/observation.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Recovery: No longer a verb - most functions are handled by either posing (for secrets/alternate transformations) or powering down.</li>
<li>Astral Style: Getting hit also restores injury.</li>
<li>Unlock Potential: Now slightly bumps up potential cap before applying its bonus.</li>
<li>Unlock Potential: Now unlocks ascensions if one's below their second one.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Super Saiyan 2+ less reliant on full mastery, slightly tweaked Grades.</li>
<li>Saiyans: Active taxes upped slightly.</li>
<li>Aliens: Recent auto-mastery changes reverted due to issues in tracking the permament BP gain.</li>
<li>Djinn: Corrected on-spawn anger threshold, added multiple unique/shared mechanics for health recovery and anger behavior.</li>
<li>Demons: Evolving a Devil Arm now properly scales the ascension level (admin help for chance at re-evolving the weapon) and also applies special slotter-like statistical boost depending on its type.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Advanced Medicine: Various serums are now slightly more affordable.</li>
<li>Advanced Medicine: Revitalization Serum now more effecitve in treating permament cuts and with less cooldown between uses, but no longer regenerates missing limbs.</li>
<li>Radars: Better range, especially when upgraded.</li>
<li>Internal Suite: Should now have resource scanning capability.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Weapon Soul: Dainsleif now demands more of the user.</li>
<li>Weapon Soul: Dainsleif's Fate of Blood now makes sure user won't dodge (moved from Over Soul).</li>
<li>Weapon Soul: Dainsleif Over Soul's tweaked slightly.</li>
</ul>
<b>11/06/2019<br>
Stylish.</b><br>
<ul>
<font size=+1>Skills</font size>
<li>Astral Style: Health recovery/damage negation removed, removed the RNG aspect of the style so all damage is converted to recovery, fixed the elemental aspect so it reduces damage consistently in place of the old RNG setup.</li>
<li>Golden Kirin: Style Damage modifier for unarmed attacks boosted.</li>
<li>Universal Styles: Natural Fighter now inherits Pursuer trait from Blitz; Spirit Style and Circulation Style gain Technique/Movement mastery respectively.</li>
<li>Flash Cry Style: Now gains Hybrid Strikes trait (combines Strength and Force with a set effectivness)</li>
<li>Yin Yang Style: Loses Reversal trait for East Star Style, gains innate Weapon Breaker from Natural Fighter and inherits Flicker from Blitz.</li>
<li>Kaio Styles: Boosted complexity.</li>
<br><br>
<font size=+1>Races</font size>
<li>Aliens: Automatic transformation unlocks now also master your previous transformation.</li>
<li>Aliens: Fixed Fishman passive granting space-breathing instead of water-breathing.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tarot Decks: Effects of The Star and The World fates altered; please report to Galion/KKT.</li>
<li>Tarot Decks: Now have a limited amount of draws (7) before vanishing.</li>
</ul>
<b>11/04/2019<br>
Let's play a gay.</b><br>
<ul>
<font size=+1>General</font size>
<li>Specific autonomous buffs applied through sources like queues, projectiles or autohits can now be customized.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Cooldowns for Mystic tree aligned more with tier placement, change will be replicated on other trees.</li>
<li>Autohit/Queue signatures aligned a bit more in energy costs with Projectile ones.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makyo: With amount of added/projected interactions and extra skills reliant on their Ki Control, they are shifting towards Saga-barred race.</li>
<li>Saiyans: Zeal adapts to sword-wielding opponents correctly now.</li>
<li>Aliens: Anaerobic racial now provides an innate PU spike for faster fatigue gain.</li>
<li>Aliens: Anaerobic racial now provides the ability to heal energy slightly over the fatigue threshold.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tarot Decks: Now they announce the card you drew.</li>
<li>Tarot Decks: Draw cooldown scales with deck potency.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Keyblades: Extra mana capacity is now provided starting from Wisdom Form.</li>
<li>Keyblades: Wisdom, Master and Final Form now cast all spells as if they were under effects of Tome and Magic Crest integration.</li>
<li>Ansatsuken: Jury riggedly, but does not interfere with being summoned as much.</li>
</ul>
<b>11/02/2019<br>
In summary: <a href="https://i.imgflip.com/3f2z27.jpg">Memes</a></b><br>
<ul>
<font size=+1>General</font size>
<li>Extra work on structure of buff/debuff applying skills.</li>
<li>Corrected starting potential of many races not applying 100% well.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Corrected prerequirements on Curse and Barrier lines. If you have only one of them and it isn't the bottom one, please a-help for refunding.</li>
<li>Protect and Barrier swapped in order of learning/requirements, if you have either one but not both, please a-help for refunding.</li>
<li>Resilient Sphere: Aligned a bit with Bubble Shield, still overall better.</li>
<br><br>
<font size=+1>Races</font size>
<li>Corrected starting potential of many races not applying as it should.</li>
<li>Aliens: Swingier starting potential, potential gain and potential cap - differences aren't enormous and just make them even weirder.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Prison Cubes: Now apply a last used check on all cubes held in inventory as a means of introducing more effective cooldown; as an additional security check, dropping and picking one up will also apply its cooldown period.</li>
<li>Crystal Balls: Above change replicated.</li>
<li>Tomes: Learning spells from Tomes now checks requirements.</li>
<li>Tarot Deck: Expanded; standard rolls representing 56 minor arcana now can also affect regeneration and recovery, and trade away health for energy max amount and vice versa.</li>
<li>Greater Tarot Deck: An upgrade to above, it adds 22 Major Arcana special affects which can only effect anyone once + increases the deck potency notably which might lead to completelty crippling your build or even death if used recklessly.</li>
<li>Mecha: Special slotters once again restricted from use inside.</li>
<li>Mecha: Non-Infinity Drive based military frames allowed to enter.</li>
<li>Mecha: Now hackable (I think).</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Phoenix Demon Illusion Fist effect adjusted to current cooldown.</li>
<li>Cosmo: Tier 6 now permanently adds the Gold signature technique to prevent cooldown resets.</li>
<li>Sharingan: Amaterasu cooldown increased, current version is simply too heavy on the server.</li>
<li>King of Braves: Having the Saga now removed mech special buff lock on piloting.</li>
</ul>
<b>10/31/2019<br>
Happy Samhein</b><br>
<ul>
<font size=+1>General</font size>
<li>Balancing and bugfixes.</li>
<li>New AI category, representing a bit more 'natural' enemies.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Sense: Some performance improvements + cooldown.</li>
<font size=+1>Races</font size>
<li>Demons: Now choose a True Name on login, if one is not assigned. This name cannot be changed, and does not need to match with your IC name. It is a unique name that you can be summoned by using Summon Absurdity. Strive to keep it hidden.</li>
<li>Namekians: Fusions now retain knowledge; non-retroactive.</li>
<li>Dragons: As above.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Summon Spirit: Now actually has a 1 hour cooldown between summons, as intended.</li>
<li>Summon Spirit: Skilled enough summoners can attempt summoning a demon through their True Name; the ability has one day cooldown.</li>
</ul>
<b>10/30/2019<br>
magic is all miracles</b><br>
<ul>
<font size=+1>General</font size>
<li>Less massive number of calculation fixes.</li>
<li>Lots of AI work.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Sense: Some performance improvements + cooldown.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Magic Crests: Now provide their spells to the transplantee / thief of the crest. They previously registered as being equipped before being equipped, so the spells did not pass on.</li>
<li>Ships: Should now allow talking during the long flights.</li>
<li>Ships: Beacons can now hold passwords which will restrict the vessels capable of arriving to one.</li>
<li>Scouters: Sense changes replicated.</li>
</ul>
<b>10/28/2019<br>
A new age.</b><br>
<ul>
<font size=+1>General</font size>
<li>Massive number of calculation fixes.</li>
<li>Special companion type AI classification added for future projects.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fusion: New fusion-signature - Galic Kamehameha, combination of two Tier 1 signatures rivaling Tier 2 beams.</li>
<li>Fusion: New fusion-signature - Big Bang Kamehameha, combination of two types of projectile attacks with completely novel properties.</li>
<li>Arcane Beasts: Nympharum Companions less oppressive - they no longer fire projectiles outside of certain interactions / their transformation being active.</li>
<br><br>
<font size=+1>Races</font size>
<li>Monsters: Domination path for third ascension adjusted in light of calculation fixes; please report to Galion/KKT.</li>
<li>Saiyans: Passive issues in Super Saiyan transformation corrected, please report to Galion/KKT.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Weights: Duration of buff reduced sharply, adjustment effect removed.</li>
<li>Magic Foci: Bugfix to spells requiring foci to cast - will now require an equipped one used to cast them to stay equipped for the buff duration.</li>
</ul>
<b>10/25/2019<br>
A rapid throwdown.</b><br>
<ul>
<font size=+1>General</font size>
<li>Max attack speed possible (aka. the light attack speed) halved to reduce visual noise, damage scaling adjusted to compensate.</li>
<li>Aerial Recovery and Aerial Payback come off cooldown now! In short: misuse of the Using variable led to them never actually going on cooldown.</li>
<li>Aerial Recovery now triggers off of using Reverse Dash while being knocked back. They maintain separate cooldowns. (Thanks to Jerodak for idea)</li>
<li>Aerial Payback now triggers off of using Dragon Dash while being knocked back. They maintain separate cooldowns. (Thanks to Jerodak for idea)</li>
<li>Zanzoken charges are only used up if you actually executed a Zanzoken. Keyboard mashers rejoice!</li>
<li>Zanzoken charges clear on relog and meditate.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Mage Armor spell line: Longer cooldown, shorter duration.</li>
<li>New prototype Style: <b>Circuit Breaker</b>. A T2 style that does battery(mana) damage to cyborgs/mechanized people. It does increased damage depending on how much battery(mana) the opponent is missing.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Grade 2 buffed slightly, Full-Power state nerfed, neither provides a heightened energy pool anymore.</li>
<li>Saiyans: Mastering Grades can now enable them to work with multiple Super Saiyan levels.</li>
<li>Demons: More intimidating in their true form.</li>
<li>Yokai: Spirit Form will now use the profile set in Customize: Forms if you have set one. It previously had this option, but the variable was never changed.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Ceramic Plating: Broken plating reduces its recycle gain.</li>
<li>Refractive Plating: Deflection rate nerfed.</li>
<li>Plated Weights: Deflection rate nerfed, injury reduction nerfed but the internal plating no longer breaks.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Keyblade: Anti Form Ki Blade property removed.</li>
<li>Cosmo: Pisces Saint joins the fray.</li>
<li>King of Braves: Now allows Desperation mechanics to be triggered while the King of Braves has been cyberized.</li>
</ul>
<b>10/24/2019<br>
A hwile.</b><br>
<ul>
<font size=+1>General</font size>
<li>Cooldowns do not tick down in RP Mode; system in testing, might wonk.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Mage Armor spell line: Now properly takes the special slot, each spell in the line stacks the effects of the previous one.</li>
<li>Mage Armor spell line: Prerequisites fixed, if I find someone with Golem Form or Perfect Warrior without having previous spells in the line, paddlings will occur.</li>
<li>Golem Form: less giant-y, more robot-y.</li>
<li>Sense: Now gives small hints on health status of sensed people at certain points.</li>
<li>Fusion Dance: Power and failure chance bugs fixed.</li>
<li>Trance Form: Wiseman Trance now heals passively rather than actively.</li>
<li>Trance Form: Cooldown increased.</li>
<li>High Tension: Cooldown increased.</li>
<br><br>
<font size=+1>Races</font size>
<li>Demons/Half Demons/Makai Shinjin: Pain empowerment slightly more effective in comparision to generic.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Smelting: The upgrade cost of gear should now add to its overall cost rather than replacing it; non-retroactive.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Weapon Soul: Death Killer interaction with Philosopher Stones corrected.</li>
<li>Cosmo: Bronze Cloths should now only provide their verbs to Cosmo holders.</li>
<li>Cosmo: Retaining a gold cloth more reliant on active sense and being a Cosmo user.</li>
</ul>
<b>10/20/2019<br>
It's Monday here.</b><br>
<ul>
<font size=+1>General</font size>
<li>Combat watch can now not be used on people who toggled it off, even if targetted.</li>
<li>Combat watch (or Observe of any type) no longer displays whispers.</li>
<li>Setting expanded bases should cause less issues, but it'll only really work with 32x32 icons as of current.</li>
<li>Fixed AI reactions to self-healing buffs.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Rolled back the new behavior between Instinct and Flow, left it only for its effect upon Afterimage Strike (which was the biggest point of the change).</li>
<li>Butcher Style: Should only trigger crippling blows on skills (queues and skillshots, no projectiles) rather than all attacks now.</li>
<br><br>
<font size=+1>Races</font size>
<li>Zombified people: Fixed issue with their conditional immortality not detecting properly.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Alchemy: Energizing and Mana herbs are now more effective.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Weapon Soul: Cloud of Heaven skill deprecated, replaced with Totsuka's Blade, a skill that creates a secondary, Soulfire-damage dealing weapon for the wielder to use.</li>
<li>Weapon Soul: Corrected the health costs on Dainsleif not dealing wounds as they should.</li>
</ul>
<b>10/19/2019<br>
Last update of the... week.</b><br>
<ul>
<font size=+1>General</font size>
<li>Added the combat watch verb that lets you observe someone during combat; the person must have spectators toggled on and they can toggle it off to break/prevent any observations of this type.</li>
<li>Skills now can be set as 'once per battle' type of cooldown, which doesn't have a set length and only restores upon meditation.</li>
<li>Instinct triggers for normal attacks now invoke a counter-After Image Strike rather than just lack of any visible effect; for skillshots and projectiles, a different visual is used.</li>
<li>Buffs granted by other ones should now properly terminate when the source buff stops.</li>
<li>Corrected skills materializing second weapon.</li>
<li>Stunning strike passive now also extends any stun landed with normal stun skills.</li>
<li>World saves now should happen every 12 hours in place of every 3.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Firaga: Now composed of 3 smaller fireballs in place of single huge one.</li>
<li>Symbiote Evolution: a special slotter for Symbiote carriers, which allows them to activate the symbiote at will, in empowered form and granting user health regeneration at a high injury cost.</li>
<li>High Tension: The cooldown between Psych-Up uses the static CD formula now.</li>
<li>Trance Form: The duration is slightly shorter.</li>
<li>Sparking Blast: Added to the 'single use' cooldown pool.</li>
<li>Unbound Mode: Added to the 'single use' cooldown pool.</li>
<li>Fusion skills: Added to the 'single use' cooldown pool.</li>
<li>New Signature: <b>East Star Style</b> - East Kaio finally receive their style, an universal one focused on deflection of skillshots and projectiles.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Grades now act as a power multiplier type buff rather than a power-up based one which should make them easier to retain.</li>
<li>Demons: Regeneration should now properly gain limb restoration trait after entering a transformation.</li>
<br><br>
<font size=+1>Saga</font size>
<li>A number of skills were added to one per battle use - more probably to be sorted out in time.</li>
<li>Cosmo: Zodiac Invocation of the before-Gold era now restores fatigue and energy to full.</li>
<li>Cosmo: Cloth buffs added to once-per battle pool - if they get busted up in battle, you need to do the rest raw.<li>
<li>Hiten: Battosai Mode tapped down a bit, made more technical, regained cursed wounds; slight reworks on the Tradition path.</li>
</ul>
<b>10/18/2019<br>
Gotta go slightly less fast.</b><br>
<ul>
<font size=+1>General</font size>
<li>Ki Control Mastery energy refund reworked completely into faster recovery below certain energy threshold, dependent on Ki Control Mastery level.</li>
<li>Death now clears the Zombie condition.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Broken Phantasm/Reinforce Self: Corrected on the skill tree.</li>
<li>Crippling Skillshots: Now calculate properly.</li>
<li>Throws: Apply forced knockback so you can throw Juggernauts.</li>
<li>Fusion Dance: The non-controlling person should be allowed to hear/talk now.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Espionage Technology: Planting a wiretap on someone now has innate discovery chance independent of tech levels (5%, 10% with Sense).</li>
<li>Espionage Technology: Scanning for wiretaps now makes the bug harder to find on another go in case of failure.</li>
<li>Espionage Technology: Both abilities (attempt detection/scanning) scale with both Comms and Advanced Transmission unlocks.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Refactored how some effects (flicker gain, etc.) apply on sixth Sense attainment, rolling them back a bit to previous design.</li>
</ul>
<b>10/16/2019<br>
Hormonal imbalance.</b><br>
<ul>
<font size=+1>General</font size>
<li>Power Up mechanics for transformed people now affect the energy cost of the procedure directly rather than extending the time.</li>
<li>Lessened the effects of scaling on stacking energy/fatigue/mana leaks, so people can consider powering up more of an option for burst.</li>
<li>Couple bigger and smaller bug fixes.</li>
<li>Re-scaling some Desperation bonuses once again.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Slight rework on Super Saiyan Grades behavior (working as pseudo form of Powered Up forms currently) and Full-Power Super Saiyan (no longer reinforcing Power Up, providing a smaller permament boon in turn).</li>
<li>Saiyans (Half): Anger now allows Half-Saiyans to fight at their prime power.</li>
<li>Majin Form: Return of old effect for most non-Makai-attuned races.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Fast-Acting Medicine: Removed Epinephrine Shot from tech menu, functionality deprecated.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Fixed the issues with Gold Cloth not properly abandoning users.</li>
</ul>
<b>10/13/2019<br>
CBT: Changing Balance Turbo.</b><br>
<ul>
<font size=+1>General</font size>
<li>Fixed the Ki Control Mastery drain-out refund mechanic, as it was not functional after recent changes.</li>
<li>Reverted/adjusted aspects of Desperation scaling, as after fixing it to actually work (a lot of the passives were written with wrong target references) new facts have surfaced (thanks to Shelpies/Galion for having eyes open).</li>
<br><br>
<font size=+1>Skills</font size>
<li>Flash Fist Crush: Mortal chance reduced, though still slightly higher than Chidori/Zantetsuken.</li>
<li>Zantetsuken/Chidori: Range increased.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Altered the way Full Powered Super Saiyan adds anger so it shares more vulnerabilities with other Super Saiyan states.</li>
<li>Aliens: Unascended / Lower ascension aliens cop more buffs out of transforming in their Super form, aligning the branches better past second alien transformation.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Fast-Acting Medicine: Added Epinephrine Shot that allows forcing a knocked out person into standing up, granting them extra movement speed and knocking them out after 15 seconds.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Hiten: Battosai Mode no longer provides desperation scaling; otherwise unchanged.</li>
<li>Sharingan: Small changes to Susanoo, appearance should now adjust slightly to your Sharingan evolution.</li>
<li>Sharingan: Hatred evolution now grants Enton: Kagutsuchi, an automatically activating buff that adds the dark flame to user's attack and wounds opponent who strike with melee attacks.</li>
</ul>
<b>10/12/2019<br>
Corrective efforts.</b><br>
<ul>
<font size=+1>General</font size>
<li>Generalized Ki Control Mastery drain-out refund mechanic to affect energy in more general manner.</li>
<li>Flow passive scaled in same way as Counter Master.</li>
<li>Stabbing Giants no longer causes them to deflate.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Reinforce Self: Corrected cost.</li>
<li>Reinforce Self: Switched spell tiers with Broken Phantasm, if it made you unable to cast either please contact staff for refunds.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Weighted Clothing: Corrected description.</li>
<li>Weighted Clothing: Corrected effects not being represented in sense/scouter display.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Increased the impact of Seventh Sense.</li>
<li>Keyblade: Fixed and buffed Anti-Form.</li>
</ul>
<b>10/10/2019<br>
Ten out of ten update.</b><br>
<ul>
<font size=+1>General</font size>
<li>Killing NPCs with non-melee attacks should cause less lockups.</li>
<li>Killing NPCs with non-melee means should now trigger drops.</li>
<li>Increased the drop variance between arcane and hellish NPCs (arcane drop magicite more often but resources more rarely).</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fusion-type Skills: Admins can now set up a consistent fusion name and profile for user pairs.</li>
<li>Fusion-type Skills: Fusions can slightly overcap their potential power, depending on the constituent parts.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Pace at which Zeal Saiyans gain adaptation was halved.</li>
<li>Saiyans: Zeal Adaptation no longer scales up Power Up power, since that was busted with current Saiyan Soul.</li>
<li>Saiyans: Zeal Adaptation now grants scaling pseudo-Ki Control (up to one tier at full adaptation).</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Weighted Clothing: Can be removed at higher health threshold due to the nerf of Godspeed trait (no longer affecting attack speed).</li>
<li>Malformed Crests: Now also affect areas where your learning multiplier is involved in calculations (learning from records/tomes).</li>
<li>Phylacteries: Breakthrough fused with Transmigration; Phylactery-specific breakthrough replaced with Temporal Rewinding.</li>
<li>Temporal Rewinding: Currently unlocks Crystal of Reversal, which can fully repair a maims and permanent stat cuts at the cost of 25% of current potential unlocked.</li>
<li>If the above two changes affected your existing unlocks, please contact KKT.</li>
<li>Transmutation: People transmuted into Philosopher Stones are sent to a separate zone upon 'death'.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Weapon Soul: Fixed Masamune unlocking its skill upon equip.</li>
<li>Weapon Soul: Death Killing a Philosopher Stone now possible in similar way as Death Killing a bodyless soul.</li>
</ul>
<b>10/08/2019<br>
An actual quick quickfix.</b><br>
<ul>
<font size=+1>General</font size>
<li>Reduced the scaling on stacked Counter Master trait.</li>
<li>Fixed a number of smaller reported issues.</li>
<li>Corrected Zanzoken images no longer being visible.</li>
<li>NPCs buffed with new skills and power ranges.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Void Dragon Fist: Slight rework to be more impressive looking.</li>
<li>Zantetsuken / Chidori: Lowered mortal strike chance, halved wind-up.</li>
</ul>
<b>10/07/2019<br>
Lack of consistency.</b><br>
<ul>
<font size=+1>General</font size>
<li>Being mortally injured now only drains health in knocked out state.</li>
<li>Unmastered transformations now slow down their energy recovery according to their overall power boost.</li>
<li>Corrected a couple of reported issues.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Mortal Blow-type skills: In light of the change, mortally wounding someone using such a skill now carries a static 20% damage/wound burst.</li>
<li>Mortal Blow-type skills: Cooldowns and basic damage increased across the board (with exception for Saga skills).</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans: Saiyan Soul aligned with other actives - no longer needs a secondary skill (Ki Control) active.</li>
<li>Saiyans: Graded forms are once again usable outside of Powered Up state.</li>
<li>Saiyans: Unmastered Super Saiyan form will now fail at higher energy threshold.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Ansatsuken: Shoryuken is now a true DP (they all gain the counter property).</li>
</ul>
<b>10/06/2019<br>
Broken symmetry.</b><br>
<ul>
<font size=+1>General</font size>
<li>More taps on AI stuff, including a couple new 'danger mode' buffs.</li>
<li>Pruned a number of AI icons for now to have them align to size and state count standard - probably will look slightly less varied in the transition period.</li>
<li>Creating first customizable frame for affecting others with a specific autonomous type debuffs.</li>
<li>Abilities that have Health/Wound costs now adjust their costs to the global damage lowering to avoid situation where the cost of the skill will always beat out its damage output.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Sense: Fixed a couple of issues.</li>
<li>Rekkaken: Health threshold requirement removed to inline with other Kaio racials.</li>
<br><br>
<font size=+1>Races</font size>
<li>Androids/Cyborgs: No longer enjoy the effects of food.</li>
<li>Djinns: No longer can ever become full on food.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Scouter/Radars: Restricted the detection range, making them more reliant on upgrades by skilled techies.</li>
<li>Cybernetic Enhancements: Now calculate their effects a bit differently - report to KKT if you have any installed for adjustments.</li>
<li>Overdrive: Now properly doubles the effects of stat enhancers.</li>
</ul>
<b>10/01/2019<br>
Symmetry.</b><br>
<ul>
<font size=+1>General</font size>
<li>Fatigue recovery slowed, especially the more fatigue you have.</li>
<li>Weapon Breaker passive was found not to align with the formula in the code; issue localized and removed.</li>
<li>Couple pesky edit locks were corrected.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fusion Dance: Now scales transformation merging through mastery of the skill.</li>
<li>Fusion Dance: Now gives a message on fusing improperly.</li>
<br><br>
<font size=+1>Races</font size>
<li>Hellspawns: Losing health outside of transformed states now regenerates mana.</li>
<li>Metamorean Aliens: They gain Fusion Dance mastery across their ascensions.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Cooking: Less tiring!</li>
<li>Surgery: Has additional message when you're starting to operate on someone.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Gold Cloths now only provide capes at Gold Saint tier.</li>
</ul>
<b>09/30/2019<br>
Can't wake up when September ends.</b><br>
<ul>
<font size=+1>General</font size>
<li>Couple small fixes to NPC behaviors.</li>
<li>Weapon Breaker passive is only half as effective in defense - also, weapon ascensions make them about 50% more resilient now.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Necromancy: Freshly raised Zombies start with lowered health and shear stacks.</li>
<li>Necromancy: Summoning spectres now restores their body.</li>
<li>New Signature: <b>Celestial Invocation</b> - allows activation of the Makyo Star effect upon the plane the user is present at.</li>
<br><br>
<font size=+1>Races</font size>
<li>Humans: Fixed couple of interactions with certain templates.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Weighted Clothing: Plated Weights buffed a little.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Gold Cloths will now abandon you upon normal deactivation at early tiers.</li>
</ul>
<b>09/28/2019<br>
How many movement bugs can you spawn in stopped time, Jojo.</b><br>
<ul>
<font size=+1>General</font size>
<li>Big overhaul to movement system aiming to deal with directional lockout issues - <b>reverted</b>.</li>
<li>Fighting in powered down/normal state is notably more efficient fatigue-wise.</li>
<li>Fatigue now takes energy mod into consideration; this might make fatigue considerably harder to amass from energy costs.</li>
<li>Some more small tweaks to Desperation mechanics.</li>
<li>Small fixes to reported issues.</li>
<li>Small tweaks to NPC combat abilities.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Sense: New sense note added for things that are 'run away' level.</li>
<li>Potara/Fusion Dance: Now enter a static 30 minute cooldown period after ending.</li>
<li>Potara/Fusion Dance: After fusion disconnects, fusees appear at lower health.</li>
<br><br>
<font size=+1>Races</font size>
<li>Aliens: New Symbiotic aliens will now be prompted to name their symbiote on pick.</li>
</ul>
<b>09/21-23/2019<br>
Area 51: Still Standing update + (slow) quickfix.</b><br>
<ul>
<font size=+1>General</font size>
<li>Power multiplier based powerups no longer stop regeneration of energy; in turn, they speed up how fast fatigue builds up.</li>
<li>Knockback distance reduced somewhat.</li>
<li>Fatigue recovers faster while meditating.</li>
<li>More fixes to logs and minor bug corrections.</li>
<li>Small animation taps.</li>
<li>A couple bigger signature additions/changes will trigger another signature repick.</li>
<li>Non-player enemies now have a chance to drop stuff (resources and magicite).</li>
<br><br>
<font size=+1>Skills</font size>
<li>New signature skill: <b>Blaster Shell</b> - a straight upgrade to standard blast, adds damage and knockback.</li>
<li>New signature skill: <b>Nova Strike</b> - a force-based alternative to Wolf Fang Fist with added graphical effects.</li>
<li>New signature skill: <b>Spirit Gun Mega</b> - a Tier 2 upgrade to Spirit Gun which increases its number of hits based on users fatigue level (the higher, the harder it hits).</li>
<li>New self-learned signature: <b>Send Energy</b> - added to Tier 1 list.</li>
<li>New self-learned signature: <b>Heal</b> - added to Tier 2 list.</li>
<li>New self-learned signature: <b>Death Ball</b> - added to Tier 2 list.</li>
<li>Magnetga/Graviga: Back to being a set.</li>
<li>Cure/Esuna lines: Back to being a set.</li>
<li>Blazing Storm: Wind-Up reduced, but range of explosion cut severly.</li>
<li>Helicopter Kick/Leg Sweep: Swapped around the movement preventing behavior.</li>
<li>Sweeping Kick: Damage buffed.</li>
<li>Phantom Strike: Damage buffed.</li>
<li>Lightning Legs: Damage buffed.</li>
<li>Force Palm: Area of effect widened.</li>
<li>Cast Fist: Shorter Wind-Up.</li>
<li>Volleyball Fist: Reduced knockback on finisher.</li>
<li>Erupting God Finger/Lightning Stake: Damage buffed.</li>
<li>Gale Strike: Damage buffed.</li>
<li>One Inch Punch: Vanish warps before striking instead of the usual dash-in, shorter Wind-Up.</li>
<li>Death Ball/Super Nova: Latter now does less hits with greater radius and extra explosion range, but lower total damage against solo target.</li>
<li>Stop line: Stun time extended.</li>
<br><br>
<font size=+1>Races</font size>
<li>New racial pick for aliens: <b>Anaerobic</b> - reverses the relation between fatigue and power, starts user under 100% power to compensate.</li>
<li>New racial pick for aliens: <b>Symbiotic</b> - a special racial which consumes all other racial picks, nerfs effective BPM and grants the picker a Symbiote; the Symbiote scales by ascending.</li>
<li>New racial pick for aliens: <b>Synergic</b> - a special racial which consumes all other racial picks, nerfs effective BPM and grants the picker Fusion Dance; the BPM can be restored by ascending.</li>
<li>Altered racial pick for aliens: <b>Hustle</b> - shortens the cooldown of skills that normally have static cooldowns (basic/gear skills).</li>
<li>Aliens: First transformations now permanently increase power; Alien players with unlocked transformations - report to Galion/KKT for adjustments.</li>
<li>Aliens: Cunning-class renamed to Ferocious-class.</li>
<li>Aliens: Sagacious-class added, increasing endurance and both strength and force upon transformation, in contrast to Ferocity class.</li>
<li>Aliens: Transformation levels for aliens grant extra passives when using/being struck by preferred type of strike for the class.</li>
<li>Aliens: The above bonuses scale inversely to the amount of obtained ascensions - so lower ascension aliens get more benefit from those specialization bonuses.</li>
<li>Giant Monsters: Small changes in ascension boons, to contact Galion/KKT.</li>
<li>Demons: Majin Form now properly adjusts hair.</li>
<li>Shinjin: West (Water) Shinjin receives <b>Refresh</b> in place of Heal - a long cooldown ability that applies a lesser Heal in a an Area of Effect, similar to old Aqua Ring.</li>
<li>Shinjin: South (Fire) Shinjin receives <b>Give Power</b> in place of Send Energy, the latter becoming a general ability for those ascending to Kaioshin level.</li>
<li>Shinjin: South (Fire) Shinjin unique style finalized - <b>South Star Style</b>, which behaves like a perfected Ki Blade, allowing the user to access three styles of combat at greatest efficiency.</li>
<li>Shinjin: Now magically produce a pair of Potara upon ascending.</li>
<li>Humans: Small change in scaling of desperation passives.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Mecha: Now properly boot out their pilots on KO.</li>
<li>Revival Protocol/Surgery: Prices adjusted.</li>
<li>Revival Protocol: Timer extended to 20 minutes, added some random swing on stat degeneration so it can roll lower for different stats.</li>
<li>Weapon Enchanting: Prices adjusted.</li>
<li>Weapon Enchanting/Reforging: Corrected the issue where staves were massively more expensive to enchant or repair due to cost of magic items being counted differently.</li>
<li>Weapon Silvering: Effectivnes now not reduced by Abyss Mod.</li>
</ul>
<b>09/14/2019<br>
KKT ver. 0.28</b><br>
<ul>
<font size=+1>General</font size>
<li>Fixed aspects of health recovery that weren't exactly performing up to expectation.</li>
<li>Correction to recent updates in log handling, take two.</li>
<li>Introduction of special plane type that makes communication and travel technology/magic work in a wonky fashion.</li>
<li>Reworked the Hellspawn template - now focused around violent fighting and gaining power from pain-related effects; for non-Demon races the effects will only be active under anger conditions.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Dire/Tranquil Fist-type effects: Now fade out when recovering.</li>
<br><br>
<font size=+1>Races</font size>
<li>Demons: B-Class Demons automatically gain access to their true demon forms (by obtaining he Majin buff).</li>
<li>Demons: In reflection of Shinjin, they are automatically granted Hellspawn template on creation.</li>
<li>Demons: Another ascension for Devil Arms implemented.</li>
<li>Makyojin: Hellspawn-template Makyojin gain the Star-empowered Ki Control state as their normal powered state.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Magic Crests: Now work closer to the source, auto-equipping on creation and remaining permamently equipped until specific conditions.</li>
<li>Magic Crests: Transplant procedure generalized for both willing and forceful attempts of passing the crest.</li>
<li>Magic Crests: Upon stealing attempt the crest will refer to transplant procedure on click.</li>
<li>Magic Crests: Spells counted as signatures do no longer add themselves to Saga users.</li>
<li>Command Seals: Empowering command now costs two seals, suicidal command costs three.</li>
<li>Command Seals: Fixed an issue where ordering someone with one with a contract would lock up the contract.</li>
<li>Command Seals: Hellspawn template beings have a 50% chance to resist any negative order fully.</li>
<li>Contracts: Hellspawn template beings have a 50% chance to resist the punishment command.</li>
<li>Cooking: Should now terminate properly on cancelling the first choice.</li>
<li>Anesthetics: Duration of effect now scales to anger amount of the affected.</li>
<li>Ships: They are back, along with pods, but they behave more similar to the latter in general - to prevent ships from becoming Pocket Dimesnions 2: Electric Boogaloo.</li>
<li>Ships: For current testing phase they'll be admin made, but if we don't have large losses in life after, they'll move back onto the general tree.</li>
<li>Regenerators: Now force the occupant into a meditate state.</li>
<li>Regenerators: Healing of lost senses now more gradual.</li>
</ul>
<b>09/08/2019<br>
Version Number: uhhhh...</b><br>
<ul>
<font size=+1>General</font size>
<li>Changed a bit how energy expenditure converts to fatigue.</li>
<li>Correction to recent updates in log handling.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Backlash Wave: Corrected icon.</li>
<li>Heal: No longer heals in piles?</li>
<li>Dire/Tranquil Fist-type effects: No more dependent on anger being active.</li>
<br><br>
<font size=+1>Races</font size>
<li>Demons: Devil Arms now automatically gain the primary effect of Dark-type weapons at higher ascensions (requires transfiguring your weapon to set the evolution level).</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Hacking Consoles: Now use a similar system to seal breaking.</li>
<li>Gear: Now all cooldowns on Gear skills are static.</li>
<li>Conservation Kits: Now cheaper.</li>
<li>Prosthetics: Now costlier.</li>
<li>Mechs: Now secure-er - you can password them and access by code or having a key.</li>
</ul>
<b>09/07/2019<br>
Small Fixes to Big Changes.</b><br>
<ul>
<font size=+1>General</font size>
<li>Corrected the fatigue regen rate.</li>
<li>Tweaked recovery/regeneration rates in general.</li>
<li>Tried to once again deal with the disappearing animation during zanzoken clashes, should be better about the disappearing thing now, but my ability to stress-test solo is limited.</li>
<li>Some efficiency improvements on warp combos.</li>
<li>Grab cooldown should now only occur when a mob was grabbed.</li>
<li>Improvements to de-fusion behaviors.</li>
<li>Improvements to handling age stage modifications.</li>
<li>Improvements in log handling for the sake of readability.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Signature Beams: General cooldown drop (around 33%).</li>
<li>Gravity line: Now cripples on hit.</li>
<li>Imitate: Now conceals intent correctly!</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Summoning: Added a tracker in Stat tab which marks if you're currently operating as an active summon (with all the downsides).</li>
<li>Food: Added a tracker in Stat tab that marks if you're satiated at the moment.</li>
<li>Revival Protocol: Now timed - after 10 minutes resuscitation is locked.</li>
<li>Revival Protocol: Stat cuts now scaling with the passage of time from death.</li>
<li>Revival Protocol: Improved Medicine pips now improves the chance better than standard medical knowledge.</li>
<li>Revival Protocol: Cost lowered slightly.</li>
</ul>
<b>09/04/2019<br>
No Rest for the Wicked.</b><br>
<ul>
<font size=+1>General</font size>
<li>Fusions no longer get stuck with clothing when defusing.</li>
<li>Fixed some stuff properly unequipping on death.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Beams: General damage scaledown (around 33%).</li>
<li>Imitate: Now conceals intent.</li>
<li>Imitate: Now broken when dealing damage.</li>
<li>Imitate: When targeting no one it can be used to enter a preset appearance.</li>
<li>Cooking: A general signature that lets you make food in exchange for some fatigue; fed people recover from wounds (not injuries!) and various overexertion taxes quicker.</li>
<br><br>
<font size=+1>Races</font size>
<li>Demons: Customizable Devil Arms implemented.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Mecha: Fixed the piloting issue.</li>
<li>Food: Exists.</li>
<li>Food: Senzu (re)added as a rare food item with wondrous healing abilities.</li>
</ul>
<b>08/28/2019<br>
Holiday's end.</b><br>
<ul>
<font size=+1>General</font size>
<li>Finalizing some implementations of small but important changes.</li>
<li>Fixed inconsistencies in behavior of purity heal effects; shouted at people who didn't inform of the inconsistency's existence.</li>
<li>Tried to correct some weird grab verb behavior, but it required treating grab as an actual skill and giving it a cooldown.</li>
<li>While doing this, introduced a static cooldown variable that prevents some basic skills from being affected by cooldown reduction abilities and recovery.</li>
<li>Small changes (which might be catastrophic) applied to clothing to allow some weird behavior with Potara.</li>
<li>Motivated by our betters, started to clean up admin pannel clutter some more.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Signature List: Expanded with more magic skills, people will get an opportunity to reset their choices again so they can adjust to the changes.</li>
<li>Jagan Eye: Nerfs increased, fatigue drain removed, Jagan Expert mode returns as a way to regain un-nerfed power for a limited time.</li>
<li>Kikoho line: Freezes target shortly while charging up - can be reverse dashed out of.</li>
<li>Gravity line: Fixed the visual bug related to change in functionality.</li>
<br><br>
<font size=+1>Races</font size>
<li>Transformations: Some cleanups performed on the general framework, pulling in skill-triggered transes into the common file.</li>
<li>Demons: Return of permament cursed wound effects due to repurposing of Majin into a transformation trigger buff.</li>
<li>Demons: Regeneration no longer restores limbs outside of transformed state.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Potara Earrings: They're here! For now not enabled for common creation, will most likely become a Grimoire or Kaioshin ascension gift down the line.</li>
<li>Lockpicks: No longer able of bending light.</li>
</ul>
<b>08/26/2019<br>
High performance.</b><br>
<ul>
<font size=+1>General</font size>
<li>CPU/memory usage fixes!</li>
<li>Fixed unreported issue where people with lower than 1 Power Multipliers only would be affected by recovery stoppage.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Golem Form: Lacked a timer for some reason - corrected.</li>
</ul>
<b>08/25/2019<br>
Nothing like freedom of education.</b><br>
<ul>
<font size=+1>General</font size>
<li>Hard/Soft Style passives secondary effects (damage reduction/increase) now also scale to their value.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spirit Summoning: Failure rate now scales down with summoning magic knowledge.</li>
<li>Soul Binding: As above.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tomes: Tome studying now gated in similar fashion as camera records study.</li>
</ul>
<b>08/23/2019<br>
Festival of glitches.</b><br>
<ul>
<font size=+1>General</font size>
<li>Corrected weird projectile behavior (again-er).</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spirit Summoning: No longer jumps straight to contracting if possible.</li>
<li>Makosen: Slightly lowered chargeup time, increased number of blasts for less damage to differentiate it visually from scatter shotgun more.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Contracts: Sealed contracts now can only be used by original signer, no matter who created the seal, meaning contractors would be very glad to talented sealers.</li>
<li>Contracts: Unsealed contracts can once again be used by anyone who gets their hands on them.</li>
<li>Contracts: Temporary summons can now be contracted.</li>
</ul>
<b>08/21/2019<br>
Let's get dangerous.</b><br>
<ul>
<font size=+1>General</font size>
<li>Corrected hitspark issues.</li>
<li>Corrected weird projectile behavior (again).</li>
<br><br>
<font size=+1>Skills</font size>
<li>Arcane Beast: Nympharum scaling progression introduced.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmos: Now receives its initial skill at Tier 1, only capable of donning Cloth from Tier 2 and up.</li>
<li>Ansatsuken: Charge-up on Hadoken slashed.</li>
</ul>
<b>08/17/2019<br>
Minorer corrections.</b><br>
<ul>
<font size=+1>General</font size>
<li>The Saga development trigger will now exist as its own verb with some additional ease of use.</li>
<li>The thresholds for developing new signatures was changed a bit and as such they'll be automatically erased from characters, which then will able to replace them with the verb.</li>
<li>The people who lose signatures due to the automated process that got them through application - please report to the staff, we have the apps themselves backlogged.</li>
<li>Tackled some issues with clustering projectiles.</li>
<li>Equipping/unequipping symbiotic equipment pieces should now require meditating, like with Gear and Tomes.</li>
<li>Corrected an issue where everyone benefited from an unintended extra energy ascension due to an internal calculation shift - expect skill usage to tire you out notably faster.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Arcane Beast: Nympharum skillsets and effects fleshed out, first work on scaling.</li>
<li>Spirit Gun: Corrected scaling.</li>
<li>Gravity line spells: Now Area-of-Effects centered on user.</li>
<li>Flare: Now an Area-around-Target type spell.</li>
<br><br>
<font size=+1>Races</font size>
<li>Half Saiyan Zenkai properly tier locked.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmos: Snipped an unintended functionally from Sense unlocking.</li>
</ul>
<b>08/14/2019<br>
Minor corrections.</b><br>
<ul>
<font size=+1>General</font size>
<li>Characters without Sagas automatically develop Signatures at various points of their RPP based development upon meditating.</li>
<li>Characters with Sagas who managed to develop signatures in this way will have them automatically removed as well.</li>
<li>Child characters, elders and senile individuals do not trigger the process.</li>
<li>Teach Signature option for people with Teach verb will follow in upcoming updates.</li>
<li>Teach Signature costs will be reduced when used on children to make up for their lack of innate learning early on.</li>
<li>Mentioned changes means that applications for T1/T2 skills outside of styles will no longer be handled by admin side.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Lots of Arcane Beast stuff. Welcome to DBR: Touhou Edition</li>
<li>Corrected the lack of prerequisites affecting Ark and Tornado upgrades to Spin Rave.</li>
<br><br>
<font size=+1>Races</font size>
<li>Saiyans/Half Saiyans can now automatically trigger Zenkai upon surviving a lethal strike (aka. voiding); this calculates the highest attainable Zenkai level based on current void rate and gives a prompt to admins in case someone wishes to spam remake to manipulate the RNG.</li>
<li>Unlocking Super Saiyan for the first time will max out Zenkai level if at all unlocked.</li>
<li>As above change, this means a lot of early Zenkai application will be handled by administrative side more rarely.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Bolted items no longer smeltable.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Deathbringer: A successful strike will now strip the immortality attribute from anyone affected.</li>
</ul>
<b>08/07/2019<br>
Most minor of alterations.</b><br>
<ul>
<font size=+1>General</font size>
<li>Handling of multiple object types changed in attempt to increase its efficiency.</li>
<li>A number of reported issues were corrected or the checks were tightened.</li>
<li>Couple trait/passive rebalances.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Melee knockbacks trigger only from knockback-type skills (legacy damage check snipped).</li>
<li>Buying styles is a more significant RPP investment.</li>
<li>Mastering styles is a more significant RPP investment.</li>
<li>Magic Tree altered and rearranged a bit.</li>
<br><br>
<font size=+1>Races</font size>
<li>Alien Elemental Attunments give a permanently active effect of chosen element.</li>
<li>Alien RPP boost snipped out of Genius trait.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Breakthrough costs increased.</li>
<li>Breakthrough influence on availability of certain verbs modified/increased.</li>
</ul>
<b>06/18/2019<br>
Sense of finality.</b><br>
<ul>
<font size=+1>General</font size>
<li>Small changes in appearance handling.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Curaga/Esunaga: Lenghtier casting time, more spaced effect.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Stardust revolution less turbo.</li>
</ul>
<b>06/15/2019<br>
Sometimes I feel I'm always walking too fast.</b><br>
<ul>
<font size=+1>General</font size>
<li>Changed the presentation on how Recovery appears to disconnect it from powering up.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Symbiotic Infection: No longer jury-rigged.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Kicked the dial back on Seventh Sense potency.</li>
<li>Cosmo: Aries Cloth properly integrated.</li>
<li>Ansatsuken: Corrected small error with Tier Up alerts going to the admin rather than player.</li>
</ul>
<b>06/11/2019<br>
Highly artifical intelligence.</b><br>
<ul>
<font size=+1>General</font size>
<li>Polishing the AI systems for upcoming events.</li>
<li>Reintegrating filters as they seem to have no impact on the crashes.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Removed the failure chance on Zodiac Invocation, as wearing the Gold Cloth before it has no failure chance already has its own fail procedure.</li>
<li>Cosmo: Small functional changes, please report to KKT for updates.</li>
<li>Cosmo: Pegasus Comet fist and Lightning Bolt no longer homing, but they come out basically instantly.</li>
<li>Arms Master: Corrected the passive adjustments if picked by the Weapon Soul activation menu; please cease using the qucik macro version until next update.</li>
</ul>
<b>06/09/2019<br>
Woops, forgot those last time....</b><br>
<ul>
<font size=+1>General</font size>
<li>Introduction of AI that more closely mimics player behavior thanks to Galion.</li>
<li>Lag caused by beam collisions should be reduced.</li>
<li>Disabling filter for the length of the update to check if they may be the source behind snap-crashes.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Crystals of Bilocation: Now trigger at anger point, meaning they should be specifically set before fights you expect to be dangerous/lethal rather than just set and forget.</li>
</ul>
<b>05/29/2019<br>
It's smaller than I thought, bigger than you'd think.</b><br>
<ul>
<font size=+1>General</font size>
<li>The natural speed of powering up increased slightly, upping the competency threshold for Ki Control Mastery.</li>
<li>Teaching people above the global RPP limit (but below their race-dependant RPP limit) corrected.</li>
<li>Lag caused by beams reduced (not yet eliminated though).</li>
<li>Experimentally, power multipliers also affect energy usage and recovery.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Lightning Kicks: The last patch for air juggling should actually affect it now.</li>
<li>Magnet Spells: Adjusted to the patch effects.</li>
<li>Consecutive Blasts: Now provide knockback.</li>
<li>Rapid Barrage: Now roots user in place.</li>
<li>Buster Barrage: Now provides knockback, but roots the user in place.</li>
<li>Sword Saint: Now has an activation threshold.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Armor: Wear damage adjusted (breaks faster in general).</li>
<li>Fusion Core: Eliminated as standalone implant, now attached to the military frames.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Activation threshold for boosted Sense now higher (50%).</li>
<li>Arms Master: Corrected legendary weapon icons persisting.</li>
<li>Kamui: Corrected scaling missing for certain levels.</li>
</ul>
<b>05/24/2019<br>
Drinking problem.</b><br>
<ul>
<font size=+1>General</font size>
<li>Removed the legacy x20 multiplier to power values since it doesn't have any practical presence.</li>
<li>Additional sanity checks added to power multipliers to prevent them ever hitting 0 or negative values.</li>
<li>Fixed some weird behaviours in power sensing/display.</li>
<li>Fixed the occurence of natural death (current code provided an extra era beyond senility).</li>
<li>Mana and Fatigue damage-tied drains aligned a bit more with Energy ones.</li>
<br><br>
<font size=+1>Races</font size>
<li>Humans: Technology ascension humans receive piloting prowess buffs that make them pilots close on par with Tuffles.</li>
<li>Humans: Enchantment type humans can complete research on more grimoires than others during their lifetime.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Aerial Recovery: Cooldown halved.</li>
<li>Super Armor: Amount of super armor granted by various skills no longer scales with current HP.</li>
<li>Vaizard Mask: Cooldown scales up the more the active mask was chipped up in its duration.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Potions: Distilled effects no longer count twice for timer increases.</li>
<li>Potions: More varied (and in generally lower) timer ranges for potion positive effects.</li>
<li>Potions: Potion Cooldown period now applies small penalties to performance.</li>
<li>Potions: Various small effect adjustments.</li>
<li>Tomes: Cannot use Tomes and non-prosthetic Gear at the same time.</li>
<li>Gear: Adjusted the max clip size of many Gears to make upkeep more notable.</li>
<li>Power Armor: Now all produce armor as part of their effect so you cannot stack normal armor with them and they can break in the course of combat.</li>
<br><br>
<font size=+1>Saga</font size>
<li>In the coming updates Sagas more focused on specific paths of combat will start becoming more restrictive on which skill trees they can use to the fullest effect.</li>
<li>Hiten Mitsurugi: Ryushosen now a Launcher.</li>
<li>Hiten Mitsurugi: Ryutsuisen now a Dunker.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Senjutsu: Pose alteration now producing the proper amount of mana.</li>
<li>Hamon: Scaled down the oxygen costs.</li>
</ul>
<b>05/22/2019<br>
Facing a new era.</b><br>
<ul>
<font size=+1>General</font size>
<li>Minor/major bugfixes.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spirit Burst/Flow: Refocused on fatigue threshold over energy.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Ansatsuken: Satsui no Hado fixed, maybe???.</li>
</ul>
<b>05/19/2019<br>
Minor touches ft. ProJared.</b><br>
<ul>
<font size=+1>General</font size>
<li>Knockback speed turned back down.</li>
<li>Air juggling reworked into a slightly less oppressive form.</li>
<li>Reworked knockback on multi-hit projectiles, should make them either a bit more reliable or absolutely busted, no middle ground.</li>
<br><br>
<font size=+1>Races</font size>
<li>Tweaked alien transformation effects slightly.</li>
<li>Zeal passive now scales Power Up % slightly according to adaptation level.</li>
<li>Zeal active now more focused on equalization, Power Up scaling aspect dropped.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Many non-Saga special slotters made bit more conditional regarding their activation/deactivation points.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Improved how Infinity Drive effects are handled, but comes with slight lowering of the effect count; report to staff if it was installed in you.</li>
<li>Mechs now come with some more Gear-replicating verbs in the Mecha tab.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Power multiplier based Sagas linearized a good bit, meaning an early stage buff and late stage nerf.</li>
<li>Cosmo: Small fixes to V2 Bronze Cloths.</li>
<li>Ansatsuken: Satsui no Hado no longer a special slotter, instead it reconditions Satsui autonomous buff to activate upon taking up the Ansatsuken Style; if you were T6+, report to staff.</li>
</ul>
<font face="calibri">
<b>05/14/2019<br>
Swept asides.</b><br>
<ul>
<font size=+1>General</font size>
<li>Special projectile triggers that check for you having a queued move now clear said queue after use.</li>
<li>Energy costs for dealing/taking damage in powered forms and similar buffs now take more energy for dealing damage than taking.</li>
<li>Booped up accuracy on many multi-hit type projectiles.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Natural Fighter Style: Now actually has a style name displayed.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Surgery: Cost increased.</li>
<li>Revival Protocol: Cost steeply increased.</li>
<li>Bubble Shield: Reduced the shield resilience and duration.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Upped the chance of successfully calling upon the Gold Cloth.</li>
<li>Cosmo: Clothless strength of techniques improved a bit.</li>
</ul>
<b>05/11/2019<br>
Bug spray day.</b><br>
<ul>
<font size=+1>General</font size>
<li>Hella minor bugfixes.</li>
</ul>
<b>05/10/2019<br>
Everyone's cooler than before.</b><br>
<ul>
<font size=+1>General</font size>
<li>A small (but potentially catastrophic) code adjustment should now make beams properly dashable through; what this breaks I can not tell.</li>
<li>Targetting people who have special intent modifiers (like using a sharpened sword, using purity while you're unholy, dealing cursed damage) should now reflect proper default intent.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Curse line: Corrected the lack of deactivation thresholds.</li>
<li>Styles: Reduced the complexity of all non-signature styles.</li>
<li>Styles: Reduced the scaling on style stats.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Swords: Sharp ones now back to doing their full injury count even without injury intent on.</li>
<li>Staves: Being silvered actually affects them now; you can make your silver bullet gunstaff now.</li>
<li>Surgery: Now has a small resource cost because as cool as robot surgeons are, it still shouldn't make injuries completely irrelevant.</li>
<li>Revival Protocol: Also has a small resource cost for consistency.</li>
<li>Mecha: You can not perform surgery inside one anymore; this might've been the funniest unintended thing I removed this wipe.</li>
<li>Blade Mode: Corrected colorblindness.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Vampire: Pose-triggered buff no longer adds itself to the overlay list.</li>
</ul>
<b>05/10/2019<br>
Medical professionals arise.</b><br>
<ul>
<font size=+1>General</font size>
<li>Couple of minor bugfixes.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Limit Breaker: Corrected the crash caused by turning the buff off.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Surgery: Lower fatigue cost, scales with medical knowhow, might be used more times than currently to reduce wounds.</li>
<li>Revival Protocol: Chance to revive now scales with medical knowhow (up to the old max chance).</li>
<li>Mecha: Piloting no longer clashes with cybernetics, but cybernetic BP buffs no longer affect mecha BP.</li>
<li>Mecha: Infinity Drive users can not pilot mecha.</li>
<li>Reconstructive Nanobots: Adjusted a bit due to current changes to Regeneration.</li>
<li>Weapon Enhancement / Android Upgrading: rescaled pricing advancements a bit.</li>
</ul>
<b>05/07/2019<br>
Bloody spottiness.</b><br>
<ul>
<font size=+1>General</font size>
<li>Multi Hits should once again be kosher.</li>
<li>Mortal Blow type skills should calculate their success rate correctly now.</li>
<li>Improved color-adjustment handling for animations a bit.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Automatic Buffs: Corrected a couple spammy prompts they could cause when activated in specific situations.</li>
<li>Lightning Kickboxing: Adjusted macroability.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Reforging: Cost multipliers actually apply now.</li>
<li>Blade Mode: Generalized the synergy with Ripper Mode, turned into a self-applying buff to reduce buggyness.</li>
<li>EM Projection: Added portable projectors; they cost more and charge longer but you can take them anywhere, need to be bolted to activate.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Made the delay on all Pose-triggered effects that are not immediate more punishing.</li>
<li>Lycan: Improved display for Pose-triggered mechanic.</li>
<li>Ripple: Turned Ripple purification into self-applying buff for more consistent behavior.</li>
<li>Vampire: Turned the Pose-tied buff into Release Restraint Level (x) type of thing to expand on higher-level vampirism.</li>
</ul>
<b>05/04/2019<br>
Troublesomer findings.</b><br>
<ul>
<font size=+1>General</font size>
<li>Tightened checks on Extend passive.</li>
<li>Deleted all pregenerated pocket dimension exits from the standard map so they should stop stacking on oneanother, allowing us to possibly fix pocket dimension more permamently for the wipe.</li>
<li>Implemented mechanics that handle dead people aging.</li>
<li>Readded the Keep Body skill to handle application of forced reincarnation upon era passage when the Underworld entry point becomes more structured.</li>
<li>Certain things cause people to be exempt from the standard reincarnation cycles (high tiers of Sharingan in relation to planned Rinegan implementation, Eight Sense, God Ki, Holy Powered individuals); will open suggestion later to scout out for more conditions, but they'll remain rare.</li>
<li>Corrected the dual check on swimming exhaustion, making sure that oxygen is the actual identifier - it appears that swim was still working off the old setup while space drain was correct.</li>
<li>Oxygen no longer goes below 0; suffocation effects happen when it hits below 10.</li>
<li>In clear imitation of our betters we tied global messages to the Discord channel automatically.</li>
<br><br>
<font size=+1>Races</font size>
<li>Giant Monsters: Reworked first ascension slightly to be more in line with the other monster types level of strength.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Reinforcement: Unarmed version effects reduced, focused defensively.</li>
<li>Super Dodompa: Instead of a powered-up version of Dodompa, it becomes an immediate version which has full power without the chargeup period.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Armors/Swords: Small value readjustments.</li>
<li>Crystals of Bilocation: Added security checks to prevent people from dying after crystal does its thing.</li>
<li>Mutagens: Corrected inconsistencies.</li>
<li>Air Masks: The return! (Engineering Tree Unlock)</li>
<br><br>
<font size=+1>Saga</font size>
<li>Eight Gates: Corrected ordering of boost adjustments so odd instances of gaining negative fatigue should be corrected.</li>
<li>Weapon Soul: Deathkiller can cut off halos from souls.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Ripple: Ripple techniques don't take Oxygen below 0.</li>
</ul>
<b>05/03/2019<br>
Troublesome findings.</b><br>
<ul>
<font size=+1>General</font size>
<li>Spirit Sword traits were accounted for a bit weirdly due to bad definition.</li>
<li>Spirit Sword traits should now affect sword attacks specifically, new Hybrid Strike passive introduced for more general instances.</li>
<li>Multiple odd death behaviours should be corrected.</li>
<li>Shearing no longer double-applies from buffs.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Vaizard Mask: Should no longer ignore its own mana threshold.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Blast Fists: Now account non-unarmed physical attacks as well.</li>
<li>Chainsaws: As above.</li>
<li>Mutagens: effect scale adjusted, duration upped.</li>
<li>Android Upgrade: lower pricing on first level but later levels scaling similarly to sword reinforcement.</li>
<li>Mecha: Lot of small adjustments to power calculation, ignoring a lot of physical traits of the pilot.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Eight Gates: Possibly corrected a rare issue that could occur upon KO with Gates active.</li>
<li>Eight Gates: Skills that require certain gate to be open now will automatically go to that level upon activation attempt if the Saga mastery is high enough.</li>
</ul>
<b>05/01/2019<br>
Second Best.</b><br>
<ul>
<font size=+1>General</font size>
<li>People frozen by delayed launchers cannot be hit by standard attacks before getting launched.</li>
<li>Extended stun immunity window slightly.</li>
<li>Instinct trait on projectiles reprioritizes automatic defenses.</li>
<li>Small rework on calculating deflection rates from various shield types.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Heal: Cooldown wasn't detected early enough, corrected.</li>
<li>Red Hot Hundred: lower duration of the attack but might cause calcs to get bit wonkier.</li>
<li>Jecht Shot: gained Instinct trait, curves slightly less before regaining homing.</li>
<li>Spirit Gun: gained Multi Hit trait.</li>
<li>Void Tiger Fist: Better damage, flashier.</li>
<li>Void Dragon Fist: Reworked into a 'distance punch' which can be used 4 times before going on cooldown, punches carry the stunner trait so can be used for damage or utility.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Mecha: Can now scale in power through application.</li>
<li>Smelting: Cannot affect indestructible objects (like Reinforced Doors).</li>
<br><br>
<font size=+1>Saga</font size>
<li>Eight Gates: Attempting a more complex fix, Close Gates now the only thing used to... well, close them.</li>
<li>Eight Gates: Part of Gates buffs integrated into base form in absence of special slotter.</li>
<li>Eight Gates: Using higher tier Gates substracts taxes from using lower tier Gates.</li>
</ul>
<b>04/28/2019<br>
Best Time To Quit.</b><br>
<ul>
<font size=+1>General</font size>
<li>Removed rounding on the Commas procedure so some values displayed by the game might change - do not panic.</li>
<li>Fatigue recovery more tied to Recovery stat in similar vein to Injury regeneration.</li>
<li>Fatigue recovery slightly more tied to current health and slightly slower in general.</li>
<li>Meditation and Recovery no longer stack effects.</li>
<li>Health and Energy healing <b>less</b> tied to Regeneration and Recovery, thus pushing the importance of those to extended fighting.</li>
<li>Corrected the influence movement mastery has on Power Up increasing energy/fatigue usage.</li>
<li>New passive: <B>Soulfire</B> - attack damage also burns away at targets mana capacity.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Minor graphical adjustments.</li>
<li>Recovery: No longer staggers for a second when triggered.</li>
<li>Power Down: Being powered down now prevents people from obtaining your energy signature.</li>
<li>Vaizard Mask: Buffs provided more consistent across mastery, main adjustment coming from drain, will have to manually correct some stat changes so please report.</li>
<li>Vaizard Mask: Constant drain changed to active drain in the vein of Power Up.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Summon Spirit: Only those with holy traits can use it to summon dead spirits.</li>
<li>Smelting: Conjured objects should no longer be smeltable.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Ripple: Ripple empowerment also affects accuracy multipliers on relevant skills.</li>
</ul>
<b>04/24/2019<br>
Post-Maintenance.</b><br>
<ul>
<font size=+1>General</font size>
<li>Timeless beings might now receive and utilize Teacher RPP if their age is above certain point.</li>
<li>Cash can be properly looted.</li>
<li>Wooden swords enhanced with silver can now properly apply evil superkill powers.</li>
<li>Streamlined behavior of voiding, but people might die (more) if I messed it up; take care.</li>
<li>Similarly streamlined behaviour of death regeneration; voiding after being killed as a Regenerator will refresh your Regeneration stacks.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Immediate beams have normalized damage.</li>
<li>Perfect Warrior: No longer applies the Recovery debuff but less buffs to other stats.</li>
<li>Blink: Doesn't happen anymore while observing.</li>
<li>Kaioken: Now additionally provides Instinct passive.</li>
<li>Kyoukaken: Now additional provides Flow passive.</li>
<li>Red Hot Hundred: Now a T2 Unarmed Queue combo attack.</li>
<li>Omega Blaster: Testing a new graphical effect where a projectile grows after firing until it reaches full size.</li>
<li>Sparking Blast: Activation launches and knockbacks people in short range from the user.</li>
<li>Vaizard Mask: Provides Regeneration in addition to Cero at capped mastery.</li>
<li>Natural Fighter Style: New T2, combining the aspects of Feral, Flow and Breaker styles while reinforcing all stances slightly.</li>
<li>Soul Crushing Style: Inherits Blitz Style Passives.</li>
<li>Flash Cry Style: T2 version renamed to Spirit Style; report to KKT to be granted the proper current version.</li>
<li>Tai Ji Style: Renamed to Flash Cry / Shunko Style, combines the passives of old Flash Cry and Soul Crushing, loses Instinct passive and stance reinforcement.</li>
<li>Yin Yang Style: gains Instinct passive.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Wiretaps behavior fixed.</li>
<li>Using comms now breaks concealment.</li>
<li>Binoculars can be made.</li>
<li>Phylacteries no longer kill you when dead.</li>
<li>Magic Crests only serve as foci <b>specifically</b> for spells stored inside of them; if you wish to swap out spells stored in yours with that knowledge, contact KKT.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Weapon Soul: Re-tiering of certain milestones: innate passives to T3, first buff augmentation and light/darkness choice to T4, Sword Saint/Prana Burst choice to T5, second buff augmentation and legendary weapon pick to T6 - please report for corrections.</li>
<li>Weapon Soul: Starting from T2, basic/combo sword style effects become slightly augmented.</li>
<li>Cosmo: Pre-Tier 7 usage of Zodiac Invocation now properly one-and-done.</li>
<li>Eight Gates: Should be possible to go directly to the wanted gate, going up gate per gate should no longer stack up taxes.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Ripple: Reverse dashing behavior corrected.</li>
<li>Senjutsu: Lengthened the amount of time required for molding sage chakra through Posing.</li>
</ul>
<b>04/22/2019<br>
Happy Bloody Easter.</b><br>
<ul>
<font size=+1>General</font size>
<li>Reversal passive no longer capable of reflecting attacks noted as special (so spells, various explosions etc.).</li>
<li>Functional change to Beams 1 - projectile speed aligned with normal ones.</li>
<li>Functional change to Beams 2 - dashing in/away with a beam charge causes a smaller movement but automatically discharges the beam at the end of it.</li>
<li>Moving Charge granting styles increase the distance traveled in case 2.</li>
<li>Functional change 2 also affects other charging Ki attacks, but without the addition of automatic discharge which is still time gated.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Magic: Timers/Countdowns for a decent number of spells fiddled around with; starting to work towards more consistent timer/cooldown setup across the skill tree.</li>
<li>Sparking Blast: Corrected the duration scaling, upped the health restored, shifted the damage boost formula, grants greater afterimage piercing and dragon dash CD reduction.</li>
<li>Kikoho / Shin Kikoho: Damage increased again.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Interactions with most Grimoires returned to disabled as most Saga kits were properly rounded off; it'd be best to unequip those types of items to test for weird behaviors with new locks.</li>
<li>Cosmo: Tier 6 danger activation of Cosmo now provides only a single signature Gold technique, usually the most famous one.</li>
<li>Hiten: Reduced the attack doubling rate on Dance of the Full Moon, improved projectile deflection replaced with reversal for more physical focus.</li>
<br><br>
<font size=+1>Secret</font size>
<li>Senjutsu: Doubled the mana leak on Sage Mode state.</li>
</ul>
<b>04/21/2019<br>
Missed the joke date cause of timezones and naps.</b><br>
<ul>
<font size=+1>General</font size>
<li>Corrected weird display settings of some resource spots.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makyojin have a scent now.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spirit Burst: Now carries a reduction of Power Up drain.</li>
<li>Martial Specials: Refocused the stat improvements provided around the dominant stats of the styles rather than filling out the gaps, as that was more tied to the old way styles worked.</li>
</ul>
<b>04/19/2019<br>
Mistakes were made (again).</b><br>
<ul>
<font size=+1>General</font size>
<li>Corrected weird behavior of armor/swords upon breaking.</li>
<li>Corrected the correction to issues with detection of Weapon Breaker passives, also made them always work in both defense and offense regardless of level now.</li>
<li>Corrected Dual Cast functionality.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Martial Special slotters: Reworked granted passives slightly, added Technique Mastery to all so they become more about heavy skill usage.</li>
</ul>
<b>04/17/2019<br>
Boring Lifetime Simulator.</b><br>
<ul>
<font size=+1>General</font size>
<li>Reduced the cripple infliction on most skills that could do that.</li>
<li>Corrected issues with detection of Weapon Breaker passives outside of swords, so we might end up seeing more equipment breakage.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Jagan Eye: Observe limitations disabled on same Z-plane as user.</li>
<li>Thunder: Reduced range since it was sorta more reliable than both of its 'upgrades'; in turn, increased their radius/range respectively.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cosmo: Seventh Sense no longer triggers if user isn't fighting seriously.</li>
<br><br>
<font size=+1>Secrets</font size>
<li>Senjutsu: Sage Mode now provides the endless mana trait so casting in it does not drain, but in turn Mana Leak mechanics that makes drain upon dealing/receiving damage ignore endless settings; this in in-advance of a more complex mechanics that'd improve spells used in Sage Mode since in current version the extra mana was never worth using on actual magic as you were directly trading off stats.</li>
<li>Senjutsu: In light of the above, the maximum capacity before you trigger Senjutsu power overload death lowered, nerfing he power ceiling of Sage Mode as whole.</li>
</ul>
<b>04/14/2019<br>
Time moves once again...</b><br>
<ul>
<font size=+1>General</font size>
<li>As a matter of experiment, energy, fatigue and mana leaks now apply when both dealing and taking damage - this is actually true now.</li>
<li>Corrected calcs on Juggernaut/forced Knockback activations as the current form would never be effective.</li>
<br><br>
<font size=+1>Races</font size>
<li>Lined up racial aging schemes into 3 main categories: 6-era (standard), 8-era (extended), 10-era (longlived).</li>
<li>Giants now are accounted in longlived category, with long child, youth and prime eras but no elder era.</li>
<li>Yokai now experience 3 additional elder stages, while Dragon Namekians have an additional Elder and Senile stage, making them the ultimate teachers.</li>
<br><br>
<font size=+1>Secrets</font size>
<li>Corrected scaling on Hamon improving your regeneration and recovery with higher Oxygen.</li>
</ul>
<b>04/13/2019<br>
Explosive Force.</b><br>
<ul>
<font size=+1>General</font size>
<li>Maims update properly now.</li>
<li>As a matter of experiment, energy, fatigue and mana leaks now apply when both dealing and taking damage.</li>
<br><br>
<font size=+1>Races</font size>
<li>Messed with racial aging schemes for increased diversity along some of the posted suggestions; if this breaks things, that's on suggesters obviously.</li>
<li>Changeling Power Up replacements require reaching a certain health threshold to be activated.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Recalculated Galaxian Explosion to accomodate for the recent multihit projectile changes.</li>
<li>Increased windup on Another Dimension.</li>
<li>Corrected some wording issues in Arms Master Saga progression.</li>
<li>Corrected Anti Form interactions with other Keyblade buffs.</li>
</ul>
<b>04/11/2019<br>
Draining...</b><br>
<ul>
<font size=+1>General</font size>
<li>Hard/Soft Style passives now cannot functionally deal more wounds than the damage that was being dealt by user was.</li>
<li>Mana Cap multipliers should work properly when it comes to regenerating it now.</li>
<br><br>
<font size=+1>Races</font size>
<li>Experimenting with extending Saiyan prime; they should now have 3 prime eras then go into senility/natural death era straight from that.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Inhibiting Android Frames should work correctly now.</li>
<li>Pocket Dimension should now be settable.</li>
<li>Mechanization threshold for being able to use batteries and charging stations readjusted.</li>
<li>Crest looting without necessary knowledge no longer possible.</li>
<li>Reworked the downsides of Parasitized Crests.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Tier 6 Hiten users now can choose between two ways of expressing their style: traditional or murderous, the difference being more subtle than that between Chikara and Satsui paths of Ansatsuken.</li>
<br><br>
<font size=+1>Secrets</font size>
<li>All non-evil Secrets now extend your prime to equalize them slightly with the evil secrets that all grant some form of age-negating immortality.</li>
</ul>
<font face="calibri">
<b>04/08/2019<br>
I took a day off... for THIS?</b><br>
<ul>
<font size=+1>General</font size>
<li>Elemental debuff stacks lowered by 20%.</li>
<li>Wound-counter and Fatigue-counter type passives now respond to unarmed/sword attacks and spiritual attacks only respectively.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Kyotouryuu scales up to Ascension 2 blade now, like Living Weapon.</li>
<li>Sunlight/Moonlight damage scaling improved.</li>
<li>Kikoho variants damage boosted.</li>
<li>Kikoho variants can now be used even if you lack the health/wounds required to use them.</li>
<li>Kikoho effect area increased notably; the squares make a circle now.</li>
<li>For MultiHit type projectiles - they now have scaled accuracy based on their remaining hit counter.</li>
<li>For Counter type queues - only half of their effective duration will carry their counter quality, requiring stricter timing.</li>
<li>Reinforcement icon can now be modded.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Lowered the threshold for being considered mechanized a good bit (being fully kitted in any single category now is enough), if it impacts your current build severly report to staff to snip out some metal bits.</li>
<li>Mechanized folks do not regain battery power naturally outside of Fusion Core being installed, upped the CDs for some active abilities so you don't run yourself out super fast.</li>
<li>Starting to lower the health levels on some manufactured items, but the process is long and ardous (and boring, most of all).</li>
<br><br>
<font size=+1>Saga</font size>
<li>Corrected the boost Saint Saga giving to debuff procs being 5x as high as it was supposed to be.</li>
<li>Keyblade Command Style innate mastery lowered.</li>
<li>Fixed inconsistencies in Ansatsuken meter generation, might be kind of hyper for a while.</li>
</ul>
<b>04/06/2019<br>
Not Acceptable Update.</b><br>
<ul>
<font size=+1>General</font size>
<li>Removed the legacy 10x cost adjustment from beams, no longer necessary once costs were normalized.</li>
<li>Since BYOND is a cunt with html in labels, being in Powering Up, Power Repressed or Power Recovery state is now indicated by symbols next to the Power Percent.</li>
<li>Power Recovery now recovers energy notable faster.</li>
<li>Powered Up forms no longer normalize their drain based on BP difference, meaning they are better against people stronger than you and worse against those weaker than you.</li>
<li>Power Multiplier based buffs have some effectivness taps so they create less of a steep early advantage.</li>
<li>Event Characters no longer can access Studies nor receive Teacher RPP.</li>
<li>Cripple drops off faster for a greater effect.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makyojin can now set up their Expand Base using Customize: Forms.</li>
<li>Aligned the effectivness of ascension effects between Makyos using Power Mults and Power Up, might have been unwise.</li>
<li>The buffs fade out if the Makyo is considered mechanized.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fixed Kiai stun proc.</li>
<li>Pimped out new, autohit based versions of Kikoho.</li>
<li>Mage Armor is customizable in appearance and class now.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Revival Protocol now inflicts stat cuts instead of permament modifications; not retroactive.</li>
<li>Nano Boost activation moved to the typical anger threshold.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Fixed certain weird behaviours for Soul Resonance buffs.</li>
<li>Dividing Driver no longer requires a King of Brave special to be active.</li>
<li>Tried to diddle it up so it no longer causes weird behaviours with targetting, but might need manual clearing of current targets - do not use before contacting KKT.</li>
<li>Cloths a bit less spicy, Cosmic Sense mechanics a bit more.</li>
<li>Cloth-ed Power Up a bit less sluggish.</li>
<li>Un-Clothed Saints no longer receive the Power Up buff, instead the Cosmo-related skills receive similar buff to their damage multiplier as Ripple provides.</li>
</ul>
<b>04/03/2019<br>
Didn't update on 1st since people wouldn't believe the notes.</b><br>
<ul>
<font size=+1>General</font size>
<li>Lots of planned rearrangements are now reflected by the signature skill list.</li>
<li>Disabled dodging during power up state, its presence was an accidental omission.</li>
<li>Admin list removed from topdown menu.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makyojin will now use their gigantification icon with every Main Buff.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Buffs can now create armor in similar way they create swords.</li>
<li>Mage Armor now actually creates armor.</li>
<li>Necromancy can now pick targets for soul binding.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Upgraded Gear no longer sets a retarded default cost for itself.</li>
<li>Pile Bunker cripple infliction reduced.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Cloths now create armor, this also means they can be broken during the fight.</li>
<li>Roped in some damage values for a number of skills in line with the general balancing outlines of recent.</li>
</ul>
<b>03/31/2019<br>
On-the-fly.</b><br>
<ul>
<font size=+1>General</font size>
<li>Cripple fall-off adjusted very slightly.</li>
<br><br>
<font size=+1>Races</font size>
<li>Shorter innate cooldown on Spirit Form, allowing Yokai to take advantage of their gimmick more fluidly.</li>
<li>Spirit Form icon setting should work correctly now.</li>
<li>Spirit Form no longer bugging out Tarot decks.</li>
<li>Fixed Changelings going down to 0 BP upon hitting negative health.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spirit Sword no longer pretends to be Spirit Bow.</li>
<li>Shunko Style moved to Tier 2 bracket for Universal Styles - allows you to be a punchy mage with moving charge.</li>
<li>Tier 3 counterparts for Battlemage / Shunko (possibly combining their effects) in works.</li>
<li>Gates users can pick one of the three: Strong Fist Style, Black Leg Style, Lightning Kickboxing Style at Tier 3; please report to staff to make your choice retroactively.</li>
<li>Red Hot Hundred buff implementation temporarily locked for reworks, probably will return as either Autohit or Queuable.</li>
<li>Unbound Mode buffed to be potentially competitive with Sparking Blast, making them pretty much the last and only pair of 'freestyle' (not tied to specific techniques/not producing weapons) slotless buffs remaining.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Upgraded Gear no longer sets a retarded default cost for itself.</li>
<li>Pile Bunker cripple infliction reduced.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Starting to correct some Command Style finishers, polishing command-style appearances.</li>
<li>Buffed Kamui Special Slotters slightly.</li>
</ul>
<b>03/30/2019<br>
We gonna ride down to Electric Avenue. And then we gonna fuck it.</b><br>
<ul>
<font size=+1>General</font size>
<li>Cyber BP now accounts as part of Effective Power Multiplier, making it so you cannot simply replace the Power Up loss with having a buff.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Mechs buffed a bit, changed around how piloting ability applies.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Kamui Senketsu gains movement mastery as you tier up, making the 'blood-fed' mode more effective.</li>
</ul>
<b>03/29/2019<br>
Favourite Saiyan food? Fruit loops.</b><br>
<ul>
<font size=+1>General</font size>
<li>Removed the cooldown on skill tree mentoring, kept it on student training but displaced it onto the student - this is actually true now.</li>
<br><br>
<font size=+1>Race</font size>
<li>Patched the infinite loops which were sparked by Zeal Saiyans clashing with eachother.</li>
</ul>
<b>03/28/2019<br>
The update cycle for this wipe is starting to freak me the fuck out.</b><br>
<ul>
<font size=+1>General</font size>
<li>Removed the cooldown on skill tree mentoring, kept it on student training but displaced it onto the student, added an overall RPP limit that can be passed onto a student in one training session.</li>
<li>Void timer lengthened slightly again; as an aside - don't camp corpses please, just have the scenic sense to toss them away or something.</li>
<li>Bodies are now lootable, but don't get too frisky with it, there are still weird behaviours if you do it too spastically.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Expanded the Necromancy kit, disconnected it from Awakening/Secret framework for now.</li>
<li>Emergency teleportation now exhausts the user.</li>
<li>Boundless Cut had longer range than Blast; not anymore.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Summons do recover health normally now, only injury recovery is locked.</li>
<li>Jet Packs don't provide true flight anymore but their skimming speed is notably faster and they can dash more often.</li>
<br><br>
<font size=+1>Secrets</font size>
<li>Vampires, Lycanthropes and Zombies only trigger their feasting Grab abilities if their lethal is flipped.</li>
</ul>
<b>03/27/2019<br>
Why is there a second update on same day, that's ridiculous.</b><br>
<ul>
<font size=+1>General</font size>
<li>Fatigue does not recover while standing outside of power recovery and power supressed mode.</li>
<br><br>
<font size=+1>Races</font size>
<li>Buffed Saiyan Dominance timer (it's now bigger).</li>
<li>Saiyan Dominance now provides Technique Mastery (skill cooldown down) instead of Flicker.</li>
<li>Buffed Saiyan Soul recovery nerf (it's now smaller).</li>
<li>Saiyan Soul now provides Movement Mastery (Power Up% effectivness up) instead of Power Up spike.</li>
<li>Saiyan Soul now will adjust dynamically to the power changes of user and opponent to keep them equalized.</li>
</ul>
<b>03/27/2019<br>
Time flies, prices rise.</b><br>
<ul>
<font size=+1>General</font size>
<li>Grabs have less low base chance of breaking them because I finally, after twenty-seven overly long years, learned to read.</li>
<br><br>
<font size=+1>Races</font size>
<li>Aliens no longer get the option to be spiritual since they're... meant to be aliens.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Magic prices rescaled, especially on permament or high end items.</li>
<li>Summoning costs scaled basing on distance between planes - prices scaled by Gal so point salty tears in his direction.</li>
<li>Spirit Summoning now grabs a random spirit.</li>
<li>Spirit Summoning has chance to fail when grabbing a spirit stronger than the caster.</li>
<li>Summoning magic provides a new contract copy at levels 1, 3 and 5 only as contract per level allows a fairly small number of players to monopolize nearly each contractable being.</li>
<li>Summons do not heal/recover fatigue or mana naturally now, they require lifelink support or spell support.</li>
<li>Parasitizing your Crest now requires fully researched Crest Creation.</li>
<li>Internal scanners can now scan for resources, but unlike normal versions they cannot be upgraded.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Adjusted cooldowns and damage output on many Cloth abilities so they can be more present in Saint fights.</li>
<li>Kamui Junketsu implemented with new icons from Luna.</li>
</ul>
<b>03/26/2019<br>
FLYYYYYYYYINGHHHH.</b><br>
<ul>
<font size=+1>General</font size>
<li>Flying fixed. Again.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makyo gigantification bonuses apply to all active buffs now besides power armor/mechs.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Magic items no longer smeltable because goddamit.</li>
<li>Having power armor active now considers you to be mechanized and as such disables magic effects/abilities.</li>
<li>Science special slotters increased in drains since their current ones were based on batteryless-world.</li>
<li>Power up downsides to cyberized folk recalculated slightly; power up speed also included in the downsidening.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Gold Cloths now come with a cape.</li>
</ul>
<b>03/23/2019<br>
Back to work - for a while.</b><br>
<ul>
<font size=+1>General</font size>
<li>Minor bugfixes.</li>
<li>Flying is a curse and a bane on my life, but possibly fixed.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Blink made a bit more usable for travel but no real combat purpose anymore (requires 80% mana + full health and energy to be used, but jumps cost less mana now).</li>
<li>Cyberization and weight training do not mesh.</li>
<li>Special exceptions added to certain pickable items that allows them to be bolted.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Gates users less strained by weight training.</li>
<li>Keybladers now get a passive bonus to their seal strength/breaking scaling with Tier of their Saga.</li>
</ul>
<b>03/22/2019<br>
More of the usual.</b><br>
<ul>
<font size=+1>General</font size>
<li>More bugfixes. This doesn't change.</li>
<li>Flying should not cause the density issues anymore; though there probably will be post relog quirks.</li>
<li>Entering a winding up state for an autohit causes existing grab to be broken; this is a temporary change before a bigger grab frame rework.</li>
<li>Removed the random legacy random length adjustment from KO timers; lengthened KO times from brutal (resulting from injury/lethal intent fights) KOs.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Going over the skills to align the cooldowns to bit more tight brackets; it'll take a while.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Lowered the amount of PU Boost Cloth provide across tier but fueled it back into some movement mastery so slightly reinforcing the clothless performance of the Saints.</li>
</ul>
<b>03/21/2019<br>
The usual.</b><br>
<ul>
<font size=+1>General</font size>
<li>More bugfixes and leveling out the damage a bit.</li>
<li>Beams are slowed down compared to other Ki since struggles really were the death of performance; will be boosted back after pooling implementation.</li>
<br><br>
<font size=+1>Skills</font size>
<li>The Knee Tier 3 (which I never really understood what it referred to) was replaced by a Meteor Combination sequential queue.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Odd behaviour of crystal balls on unskilled usage corrected.</li>
<li>Odd behaviour of flying devices on relog corrected.</li>
<li>Unplanned behaviour of human transmutation corrected.</li>
<li>Automated dispensers now show in technology window.</li>
<li>Weights now display the remaining training time upon relog and examination... correctly</li>
<br><br>
<font size=+1>Saga</font size>
<li>More Cosmo Saga content.</li>
</ul>
<b>03/20/2019<br>
Peaks and valleys.</b><br>
<ul>
<font size=+1>General</font size>
<li>Going over more odd damage spikes across the skill lists and tapping them down slightly; the structure is a bit messy so it's a bit of a spotty job.</li>
<li>Lack of density after landing from flying should now pass immediatelly.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Weights now display the remaining training time upon relog and examination.</li>
<br><br>
<font size=+1>Saga</font size>
<li>More Cosmo Saga content.</li>
</ul>
<b>03/19/2019<br>
Lack of health leads to free time. And death, but later.</b><br>
<ul>
<font size=+1>General</font size>
<li>Stuns/launchers/KOs now cancel beam charges; thanks Galoon.</li>
<li>Clothes should be properly lootable now, you perverts.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Blitz Power Armor is red again; because the red ones go faster.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Further expanding on Cosmo Saga content... in an unexpected direction.</li>
<li>Fixed issues with Gates.</li>
<li>Persona Holders and Magic Knights no longer require spell foci to cast higher level spells. Keyblade users can treat their keyblades as spell foci now.</li>
</ul>
<b>03/17/2019<br>
Lack of sleep leads to repeating yourself.</b><br>
<ul>
<font size=+1>Skills</font size>
<li>Couple more balancing taps on skills which were off their damage curve for given tier.</li>
<li>Willow Dance now provides less counters since it was in effect a much, much better version of Afterimage Strike.</li>
<li>Camouflage now adjusts the Power % dynamically. Fo'sho.</li>
<li>Erupting God Finger should be fun once again.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Digging no longer breaks resource spots; please inform us about any currently broken ones for manual fix.</li>
<li>Gear can now be forcefully removed out of Power Armors; it ends up in the gear breaking so be aware.</li>
<li>Regenerators can now only fit one person, there's a dedicated place person verb that moves someone inside the tank while you're holding them.</li>
<li>Crimson Grimoire now grants knowledge of all basic magic when active and ignores mechanization penalties or requirements for spell focii.</li>
<li>Made the class differences for staves less rabid because Wands were kinda not worth using ever; now wands tend towards costs and speed at the cost of damage, rods for accuracy at the cost of economy/speed and staves for damage at cost of... costs as well.</li>
<br><br>
<font size=+1>Saga</font size>
<li>King of Braves now properly receives <b>Drill Knee</b> at Tier 2.</li>
<li>King of Braves now properly receives <b>Plasma Hold</b> at Tier 3.</li>
<li>King of Braves now receives <b>Hell and Heaven</b> at Tier 3.</li>
<li>King of Braves now receives <b>Dividing Driver</b> at Tier 4, but it requires admin configuration.</li>
<li>King of Braves now receives <b>Goldion Hammer</b> at Tier 4.</li>
<li>King of Braves now receives <b>Broken Phantom / Protect Wall</b> at Tier 5, along with Cyberize Mod upgrade, Piloting skill upgrade and space walking capability.</li>
<li>King of Braves now upgrades to <b>Genesic Hell and Heaven</b> at Tier 7.</li>
</ul>
<b>03/15/2019<br>
Lack of sleep leads to a lack of balance.</b><br>
<ul>
<font size=+1>General</font size>
<li>More bugfixes.</li>
<li>Maim type attacks do actually pay attention to your wound settings now.</li>
<li>Modified the infusion passive a bit, doesn't grant the elemental defense type but the elemental offense type can now stack with your normal elemental offense type.</li>
<li>Elemental debuff dropoff rate increased in consideration of lower general stat mod values.</li>
<li>Added small graphical tells to winding autohits without dedicated icons and counter queue sets; if they get too annoying or affect performance, I'll make them more conditional.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Bounded accuracy on some of the sword queues as high accuracy mults on some of the moves reduced the main downside of swords a fair bit.</li>
<li>Pseudohoming on some force skills should now work proper.</li>
<li>Camouflage now adjusts the Power % dynamically.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Communicator output should now appear in the IC tab; did I replicate it for all other devices? I wanted to.</li>
<li>Weights now have a bi-daily timer before their buffs become active.</li>
<li>Fixed upgrades on radar tech; scouters now upgradable in same fashion.</li>
<li>Flying devices now grant true flight.</li>
<li>Flying devices now disable your ability to attack and with that to utilize most combat skills.</li>
<li>Dimension Cages should be obtainable now.</li>
<li>Some pricing changes for the future.</li>
<br><br>
<font size=+1>Saga</font size>
<li>Gold Cloths now can reject users who aren't aligned with their zodiac sign or lack enough control over their Cosmo.</li>
<li>Command Styles will now display if their finisher gauge is full using the Stance display window.</li>
</ul>
<b>03/13/2019<br>
Minority report.</b><br>
<ul>
<font size=+1>General</font size>
<li>Handled a couple more reported bugs.</li>
<li>Added an individual capping mechanic for RPP to catch up people who missed rewards in a more consistent fashion.</li>
<li>Discontinuing the timestamp setting function as it overcomplicates the chat code unnecessarily.</li>
<li>Unless lethal is ticked, you will not deal damage to KO'd people; should result in less unintended collateral.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Resource spots generation chances rebalanced and reevaluated a bit in general; newly spawned spots should be more valuable on average.</li>
<li>Reduced resources normally earned by non-Adult characters, Adult earnings are now the neutral point.</li>
</ul>
<b>03/11/2019<br>
Back to work. Wait...</b><br>
<ul>
<font size=+1>General</font size>
<li>Handled a couple of recently reported bugs.</li>
<li>Some improvements in RPP handling, but they may affect existing characters weirdly; joy.</li>
<br><br>
</ul>
<b>03/10/2019<br>
Spending work leave at work: The DBR story.</b><br>
<ul>
<font size=+1>General</font size>
<li>Bolt function corrected for all items; this is not retroactive for already made items so destroy them or whatever.</li>
<li>Materialized stuff should now count as innately costless.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Fixed weapon enchantment pricing, if you have an Ascension 2 sword contact the staff to be lowered to 1.</li>
<li>Fixed Crystal Balls by making them pickable items again. I hope this works.</li>
<li>Fixed (?) Crystals of Recall being stackable for no good reason.</li>
<li>Fixed Tarot Decks not making on click.</li>
</ul>
<b>03/09/2019<br>
I noticed really late the dates were reversed; goddamn 03/03 start.</b><br>
<ul>
<font size=+1>General</font size>
<li>Bolt function expanded to all items, but items meant to enter your inventory now automatically deny it; no more bolted medkits.</li>
<li>Power up auras now behave properly.</li>
<li>You should now be able to target swap between multiple targets, without it constantly swapping to the nearest.</li>
<li>Dashing after a knockbacked enemy should now trigger a short bout of rapid attacks between both fighters.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Functional (not finalized) implementation of vehicular power armor.</li>
<li>Removed the odd additional random variation from resource spots. What the fuck.</li>
<li>Fixed alchemy, again.</li>
<li>Fixed weapon enchantment.</li>
<li>Fixed availability of training weapons.</li>
<li>Fixed Crystal Balls not having a way to back out of observing.</li>
<li>Fixed Arcane Mask forceful placement; possibly broke other things.</li>
</ul>
<br><br>
<b>03/08/2019<br>
Dumb fixes for a dumb game made by dumb people.</b><br>
<ul>
<font size=+1>General</font size>
<li>New standard animation for explosions, might be bit more efficient.</li>
<li>Conversion rate of extra credit to money slashed by a good margin.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Lockpicks once again work.</li>
<li>Looting gear should no longer leave behind the skills provided by them.</li>
<li>Freeze Rays look fancier.</li>
<li>Upgrade costs on Gear now work.</li>
<li>Potions have longer effects but also longer cooldowns.</li>
<li>Extra-Class type weapons now properly stack with the weapons' favoured sword style.</li>
<li>Summoned spirits now can be permanently contracted on summon if you have an unsigned contract in your inventory</li>
</ul>
<br><br>
<b>03/06/2019<br>
Splitting up.</b><br>
<ul>
<font size=+1>General</font size>
<li>The recently reduced regeneration mods handle wounds and injuries better now.</li>
<li>Blur animations getting stuck should be fixed; enjoy being not made of fass.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Fusion Dance has now proper timer and does not require relog to end.</li>
<li>Heal scales a bit more with your enchanting ability.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Fixed issues plagueing alchemy... most of them.</li>
<li>Summoning magic gains access to punishing your summons in place of the teleporting to them; teleporting was stepping on Space Magic's toes a bit to much for my taste.</li>
</ul>
<br><br>
<b>03/04/2019<br>
Early Changes.</b><br>
<ul>
<font size=+1>General</font size>
<li>Clothing now easier to break; other items will follow suit with their own damage threshold adjustments.</li>
<li>Pressing normal attack will now take you out of meditation state.</li>
<br><br>
<font size=+1>Races</font size>
<li>Android spawning less weird (now you -need- a frame to be created to spawn).</li>
<li>Eldritch now properly timeless; considered them being perma stuck in one chosen age but Child/Youth don't provide any advantage over Adult at the moment so held back on that.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Combined Sword/Universal styles for every Sword style.</li>
<li>Small capacity cost on simple materialize (swords/armor), for the sake of diversifying up the weapon economy.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Finalizing work for new branches.</li>
</ul>
<br><br>
<b>03/03/2019<br>
New year, new DBR (RRR?). Or How I Gave Up On Writing Update Notes After Realizing How Much Shit There Is.</b><br>
<ul>
<font size=+1>General</font size>
<li>Lots of calc simplification and removing additional randomness where it wasn't really needed.</li>
<li>Ascension stats now serve as effectively extra point investments rather than an additional multiplier in attempt to bind the stat ceilings a little.</li>
<li>Standard anger point lowered to 25% health, rescaled BP drops from low health and energy accordingly.</li>
<li>After becoming Calm, Anger enters a cooldown period during which it won't trigger for a while.</li>
<li>Global ascension level setting reduced to uniform three levels across all races - in general, global unlocks now will provide races with about 40-60% of their complete potential, with the exception of Humans.</li>
<li>More in-depth Sense mechanics that influence many other skills.</li>
<li>Others' thoughts no longer can be heard without Telepathy.</li>
<li>All racial transformations provide a generic upscale in movement and attack speed along with more Flicker charges, compared to more varied effects of Ascensions.</li>
<br><br>
<font size=+1>Races</font size>
<li>Expanded racial mechanics and continued reworks!</li>
<li>Starting racial mods adjusted in values.</li>
<li>Aliens inherit the Beastman stat ascensions now, allowing them to more flexibly adjust their build as their progress through ascensions. Ascensions themselves also slightly buffed.</li>
<li>Aliens now permanently improve their focused stats for transformations 2 and beyond.</li>
<li>Aliens gain an extra ascension. After it... it's over.</li>
<li>Androids have less integration slots on creation but increase in number as they ascend.</li>
<li>Humans no longer gain extra chip slots on ascension.</li>
<li>Humans can now convert themselves to Androids upon Ascension 1.</li>
<li>Monsters grow bigger a bit more steadily as they ascend now.</li>
<li>Beastman monsters gain a higher anger point with their racial ascensions.</li>
<li>Eldritch Class monsters now effectively share majority passives with Zombies.</li>
<br><br>
<font size=+1>Skills</font size>
<li>New and reworked skills!</li>
<li>A larger number of Utility skills and skill functions assigned to the Utility tab.</li>
<li>Flicker charges are now shared between Zanzoken offense and defense.</li>
<li>Autoanger skills now will now trigger the Anger cooldown when ending, meaning normal anger won't be triggered in the duration. Autoanger can still be forced though (meaning Vaizard don't have to suffer a super extended vulnerability window... but it's still present).</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>New breakthroughs for every single branch of knowledge!</li>
<li>Resource Spots are now pretty much eternal. This also makes having control over them more significant. In turn, extraction time has been lengthened.</li>
<li>Clicking an uncovered Resource Spot now gives you an option to scavenge it, lowering its value permanently but providing some immediate resource grab.</li>
<li>Doors are now part of the tech tab; when made, they can be moved around, the password being set when bolted in desired place.</li>
<li>Legendary items can no longer be upgraded, regardless of your enhancer level.</li>
<li>Gear and prosthetic handling should be less buggy.</li>
<li>Enhancement Chip limit upped for all non-Tuffle/Android/Human races.</li>
<li>Androids can now be equipped with an energy Assimilation Suite giving them a draining grab attack and ability to consume Ki projectiles they face.</li>
<li>Having more summoning knowledge unlocks extra options for contracts.</li>
<li>Cauldrons are destructable. Please be more careful with them.</li>
<li>Magic Circles now can be erased, giving you ability to put one elsewhere.</li>
<li>Higher level spells (beyond second tier on Skill Tree + all Signatures) now require a spell focus - either a staff or a Magic Crest.</li>
<li>Grimoires now have specific Knowledge requirements.</li>
</ul>
<br><br>
<b>11/13/2018<br>
Exhausting.</b><br>
<ul>
<font size=+1>General</font size>
<li>Desperation get-up proc chance notably lowered for a strongly magnified effect, similar to hellspawn variable.</li>
<li>Items in inventory/put down on the ground will show their 'Inventory' icon state if they have one.</li>
<li>Game now has more specific ways of telling if someone's fighting seriously (wound/lethal intent declared, using a sharp sword, having cursed wounds active) and triggers specific effects like get-ups only when one (or either) side is fighting in that manner.</li>
<li>It also means that unless at least one of the side is fighting with intent to injure, your passives depending on the seriousness combat will not activate; do not come screeeing that shit isn't popping off like it used to.</li>
<li>Death Regeneration now nigh impossible to break but every time the regenerator is killed, it takes more and more for them to come back.</li>
<br><br>
<font size=+1>Skills</font size>
<li>In relation to the below update to Power Control, Esuna no longer affects fatigue.</li>
<li>Esuna single use should remove 100% of usual debuffs.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tomes can now have equip icons.</li>
</ul>
<br><br>
<b>11/11/2018<br>
Ruined.</b><br>
<ul>
<font size=+1>General</font size>
<li>Graphical and typo fixes.</li>
<li>Hitrate should remain same when powered down, which gives it additional role in concealing your power and mid-combat recovery.</li>
<li>Remaining in powered state a bit more exhausting except for Makyojins who now get it for free.</li>
<li>Bokkens no longer have the class upgrade option on them because somehow people don't see the disconnect between 'basic weapon styles' and 'Kendo'.</li>
<br><br>
<font size=+1>Races</font size>
<li>Longlived racial now only pickable at creation.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Having Sense now notifies you of being Observed so it's a bit better of an investment.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Elixir of Reincarnation race shifting disabled for now because of garbage implementation.</li>
</ul>
<br><br>
<b>11/03/2018<br>
KKTs' definition of off days.</b><br>
<ul>
<font size=+1>General</font size>
<li>Adjustments in sword/staff calcs, especially in context of upgrades.</li>
<li>Small changes for the basis of said calcs as whole.</li>
<li>Likewise changes for staves and armor.</li>
<li>Longer windup for autohits is now included in basic movement requirements; no more porting SEWs, sadly.</li>
<li>For clarity, references to health percentage wounds are being replaced by 'injury', while 'wounds' will refer solely to the BP affecting conditions.</li>
<li>Shearing now prevents Regeneration from healing wounds and regrowing limbs.</li>
<li>Fancier animation for Afterimage Strikes if both parties have it set, Afterimage Strikes now always knockback which improves their 'get off me' function, you can only have one AIS stack at once now, but the CD is structured similary to Zanzoken.</li>
<li>Afterimage Strike properly ends stuns.</li>
<li>Animal traits now retain proper colors.</li>
<li>Following up after a Zanzoken combo now actually requires you to be out of your attack cooldown; Zanzoken attacks still have a slightly smaller attack cooldown.</li>
<li>Transformations without default auras should now use your default Power Up Aura in absence of a specific one set.</li>
<li>Androids and mechanized folks (anyone whose Mana displays as Battery) can not be healed by magic targetting them nor by Purity effects.</li>
<br><br>
<font size=+1>Races</font size>
<li>Lots of Namekian reworks.</li>
<li>Warrior Nameks remain generally the same, inherit Dragon Namekian speed ascensions and get a little more powerful.</li>
<li>They also start out with Antenna Beam and Equipment Materialization, so they can branch out into sword techniques early, use armor to cover up for weaker defenses and produce training weights.</li>
<li>Dragon Namekians can branch out into Healer, Enchanter and Heretic at creation.</li>
<li><b>Healer</b> path grants Heal along with a give power packet (Give Power, Transfer Energy) at first ascension level.</li>
<li><b>Enchanter</b> provides extra capacity at creation and the usual Grimoire Arcana access at first ascension level.</li>
<li><b>Heretic</b> grants boosted Anger, Antenna Beam and Giant Form at first ascension.</li>
<li>All Dragon Namek first ascensions are White Ascension level; Warriors remain as usual.</li>
<li>Namekian Fusion fuses relevant passives from the Dragon Class.</li>
<li>Majority of Namekian power is now frontloaded in their Ascensions; Super Namekian levels are unlocked through fusing and provide extra stats, faster activation of Powered State and calm anger effect.</li>
<li>Changelings can now properly choose their Final Form upgrades at first Ascension.</li>
<li>Androids lose a bit of intelligence but gain a massive boost in learning ability (equal to human now); this is to align the upcoming changes to tech-ascension humans.</li>
<li>Android pure BP on creation scaled waaaaay down in relation to the above change.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Damage ceilings for Opener, Finisher and Decider traits buffed back a little.</li>
<li>Likewise for Determinator trait.</li>
<li>Light Rush now produces less projectiles but they're stronger.</li>
<li>Heal skill now nullifies your Shear stacks.</li>
<li>Heal no longer taxes regeneration but actually checks for your energy now, while also having really high energy cost.</li>
<li>Heal has an actual Cooldown now.</li>
<li>High Imagination healers receive less backlash from using Heal.</li>
<li>High Imagination healers patch up wounds immediatelly.</li>
<li>Materialize Equipment loses the ability to make staves but can create (crappy) armor now, weights and most importantly, grants access to Clothes Beam.</li>
<li>Clothes Beam allows you to create and automatically equip a piece of clothing to someone you are facing.</li>
<li>Creating weights with Materialize carries a relatively hefty capacity cost.</li>
<li>Blazing Storm isn't a launcher anymore.</li>
<li>Giant Form spell should now replace itself by the new Golem Form spell, which makes you larger, more intimidating and harder to hurt at the cost of completely taking away your magic ability in the duration.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>In-advance changes to Summoning and Armament Enchant trees; please report directly to KKT for adjustements.</li>
<li>Weapon Enchanters can now magnify the traits of the weapon class they're ascending, which allows you to retain the passives related to one of the basic weapon styles (Iaido, Zornhau, Fencing) when using a different style.</li>
<li>Innately greater magical capacity decreases effective capacity costs; artifically increased capacity won't replicate this functionality.</li>
<li>At least one level of Tool Enchantment knowledge is required to use a Crystal Ball.</li>
</ul>
<br><br>
<b>10/27/2018<br>
Let it Rip.</b><br>
<ul>
<font size=+1>General</font size>
<li>Small corrections in power calculation code.</li>
<li>Slayer Mod reworked from targeting humanlike races to targetting races with more or less standard biology.</li>
<li>Recovery effect on cooldowns and chargeup times reduced/bounded.</li>
<li>Intimidation effect on deflection reduced/bounded.</li>
<li>Mortal wounds now tint your screen. Things that heal them + relogging untint it in case it was stuck.</li>
<li>Targetting someone gives more information on their health status.</li>
<li>Flying/Skimming now grant a default movement speed, disconnected from other factors, with exception of Crippling and Attraction; Skimming is slower.</li>
<li>Successfully reverse-dashing out of a launcher now gives you a stability charge that protects you from the next one.</li>
<li>Juggernauts gain twice the stability charges of anyone else; in exchange, they lose their stun resistance.</li>
<li>Shield should be more reliable when it comes to damage reduction from projectiles.</li>
<br><br>
<font size=+1>Races</font size>
<li>More intimidating monsters.</li>
<li>Certain races (Namekians, Changelings, Dragons), classes (Eldritch), racials (Xenobiology) and Awakenings (Zombie) move your anatomy just far enough from usual biology that both techniques specifically designed to kill organic and critical hits just aren't effective against you.</li>
<li>New racial pick for aliens: <b>Xenobiology</b> - it alters your anatomy to the point where attacks specially effective against living beings lose their extra damage.</li>
<li>New racial pick for aliens: <b>Longevity</b> - doubles the duration of every life stage.</li>
<li>Infusion buffed - the absorbed element will not fade out till you meditate to shed it.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Minor Kaioken issues fixed.</li>
<li>Butcher style now uses Slayer Mod.</li>
<li>Magnet now allows Attacking just as it was intended to from the go.</li>
<li>Blade Dance now disconnected into two moves, with the secondary one that leads into the combo not having a hit message.</li>
<li>New T1 Unarmed Skill: <b>Volleyball Fist</b> - a combination of three attacks with different properties, becoming more powerful if you manage to chain them together.</li>
<li>New T1 Sword Skill: <b>Slam Wave</b> - leap high in the air and fall down, driving your weapon into the ground; range and shockwave size scale with sword damage.</li>
<li>New T2 Sword Skill: <b>Zantetsuken</b> - a single slash in the blink of an eye, with chance of inflicting mortal damage if it connects; fairly lengthy wind-up.</li>
<li>New T3 Slotless Buff: <b>Sparking Blast</b> - unleash a burst of energy that intensely revitalizes you while maximing your damage scaling and mobility in the duration.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>More buff grimoires now return to occupying Special slot.</li>
<li>Blood Grimoire now disables after a short timer, meant majorly to be used in advance of powerful spells being cast. Moderate cooldown.</li>
</ul>
<br><br>
<b>10/23/2018<br>
:-3.</b><br>
<ul>
<font size=+1>General</font size>
<li>Code aligned a bit more with Lummox autism; should cause bit less runtime errors.</li>
<li>Lot of fuckery with timing of autohit animation, might cause some potential processing bugs; we'll see on next crash.</li>
<li>Saiyan tails can now be hidden under clothing/covered by hair.</li>
<li>Mask-type items (the appearance altering ones) temporarily removed.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Backlash Wave bugs might be corrected; radius reduced, new icon.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Lightsabers less underpriced, slightly weaker stats.</li>
<li>Cost modifications on equipment upgrading and reforging.</li>
</ul>
<br><br>
<b>10/21/2018<br>
No sleep().</b><br>
<ul>
<font size=+1>General</font size>
<li>Saving issues should be -actually corrected- this time around.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Removed the charge from Backlash Wave, alowing it to be used on reaction (if you're a god, or GO1).</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Various seal-related things corrected; report to Yan to get yourself fixed if you were Power Sealed.</li>
</ul>
<br><br>
<b>10/14/2018<br>
We're so beta.</b><br>
<ul>
<font size=+1>General</font size>
<li>Moons occur three times slower.</li>
<li>Gear can now be properly stolen.</li>
<li>Android buff to RPP mult!</li>
<li>Androids can now integrate gear into their chasis.  They have 4 slots.</li>
<li>Water is less sticky when you use something that would let you walk on water.</li>
<li>Saiyan ascension code childproofed.</li>
</ul>
<br><br>
<b>10/11/2018<br>
146/98.</b><br>
<ul>
<font size=+1>General</font size>
<li>Dragon Dash fixed.</li>
<li>Ki Control off message fixed.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Less rangey Area-of-Effect signatures. Damage kept.</li>
<li>Walking now a separate skill from Blink, works like rapid untargetted Zanzoken (for now). Bother admins if you should have it.</li>
<li>Walking now reinforces your Zanzoken in similar way Shunkan Ido does. If someone approves both on one character, they will be fired.</li>
<li>Minor adjustments on a couple other skills.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>You can no longer remove gears that trigger buffs while the buffs are active.</li>
<li>Communications now display the device that YOU are receiving the message on, NOT the device that the sender used to send it.</li>
<li>Seals on the map can no longer be punched to be destroyed...</li>
<li>Armstrong Augmentation can now be given.  Typo.</li>
</ul>
<br><br>
<b>10/9/2018<br>
Enjoy your chill days.</b><br>
<ul>
<font size=+1>General</font size>
<li>Saiyans and half Saiyans with tails, werewolves, and those with Advanced Transmission Technology unlocked will be able to tell when a moon is about to rise.</li>
<li>Saiyan / half Saiyan form options work. To a degree.</li>
<li>Augmented Gear ascensions updated to new specs.</li>
<li>Moons now trigger at periodic times rather than randomly.</li>
<li>Conjured swords no longer appears in inventory. Conjured staff functionality will follow.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Lightning Kicks now have the Launcher property.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>You can no longer remove gears that trigger buffs while the buffs are active.</li>
</ul>
<br><br>
<b>10/6/2018<br>
Power overwhelming (yourself).</b><br>
<ul>
<font size=+1>General</font size>
<li>Power Up drains more. And less.</li>
<li>Hellspawn mechanics changed a bit to make the standups less often but also deliver much more of a notable kick.</li>
<li>Throw-type techs no longer spammable.</li>
<li>Aerial Recovery and Aerial Payback moves removed because they trigger automagically anyway.</li>
<li>Unmastered special slot buffs (Jinchuuriki, Vaizard) will remove any locks to prevent them from triggering when forced to activate.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Ki Control behaves similar to God Ki now where it restores some of your energy upon draining out.</li>
<li>Ki Blade less straining.</li>
<li>Power Recovery returns as Recovery, which everyone has access to. Doesn't help with regaining fatigue anymore. Normal energy regeneration slowed a bit.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makyojin can now set their standard Expand icon (tied to the base icon they chose on creation) as their buffed base.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Small corrections on Scouter detection, as they didn't take some factors under consideration.</li>
<li>Scouters should now display numbers rather than percentages.</li>
<li>Tuffles and humans should be prevented from unlocking Self-Cyberize twice in the form of a blank message.</li>
</ul>
<b>10/5/2018<br>
All the ass.</b><br>
<ul>
<font size=+1>General</font size>
<li>Regeneration mod -even- more impactful when it comes to poison resistance.</li>
<li>First time transformations have some access to their gathered Power Up percent, but not as much as mastered ones.</li>
<li>Doors on the other side of a warper which would not be able to be attacked are automatically destroyed when the warper is triggered.</li>
<li>Resource spots can no longer be attacked.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Buff eroding should no longer go all the way into negatives! In fact, even zero will be unreachable.</li>
<li>High Tension joins the collection of Special slotters!</li>
<li>Limit Breaker no longer based on desperation, now a simpler power spike. Health when activating now decides the amount of power generated and at which point it turns off.</li>
<li>Spirit Pulse increases the Power Up threshold in contrast to the spike of Spirit Burst.</li>
<li>Many a Special Buff slightly tapped to fit their new tiering bit more.</li>
<li>Mage Armor line skills now lock out Special Slot but have expanded durations and/or passives.</li>
<br><br>
<font size=+1>Races</font size>
<li>Changeling Regeneration mod buffed.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tome Translate and other various functions should be less buggy and maybe even working.</li>
<li>Pure Grimoire now toggleable rather than timer locked.</li>
<li>Wiretaps no longer lock up.</li>
<li>You can't make blank named potions anymore!</li>
</ul>
<br><br>
<b>10/3/2018<br>
Post tea time cookie bug break.</b><br>
<ul>
<font size=+1>General</font size>
<li>Lots of stuff no one will notice because it was fixed before it was a problem!</li>
<li>Augmented Gear should now be able to be layered and also not do the reverse of buffs.</li>
<li>General costs related to activating and holding your Power Up state were lowered.</li>
<li>Changelings gain some mechanics related to Powering Up if they received the One Hundred Percent or Fifth Forms.</li>
<li>You can now clear your targetting instantly using the new 'Target Clear' hidden verb.</li>
<br><br>
<font size=+1>Races</font size>
<li>Shinjin now begin with capped off non-event RPP, partly converted to Teach RPP. This means they can appear... properly elder.</li>
<li>They also gain Teach RPP as an Elder character would. In turn, they do not start with Power Control any more.</li>
<li>Timeless beings now learn slower.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Cyberized people and Androids gain more unique interactions with Power Control. Expect bugs.</li>
<li>Detecting resource zones works properly.</li>
<li>RPP to Money functionality displays properly, also provides more buck for your bang.</li>
<li>Certain Seals are stronger and more lasting.</li>
</ul>
<br><br>
<b>9/23/2018<br>
Relaxing tea time with bug fixes.</b><br>
<ul>
<font size=+1>General</font size>
<li>ToggleUnGrabbable...makes things ungrabbable!!</li>
<li>Pinpoint Blast no longer locks out Blazing Storm!</li>
<li>Vampires and Werewolves and Zombies and such can nibble on people again.</li>
<li>You can no longer quick swap to a stance you don't possess!</li>
<li>Swordless and Kyotouryuu Styles gain pseudo-sword ascensions depending on how many stances are mastered!</li>
<li>Static projectiles will now tick down and explode on their own!</li>
<li>Projectiles will only detonate on objects or turf when their center mass is struck!  For mobs, the same radius as usual is maintained.</li>
<li>Makyo ascensions buff energy and recovery.  (Again)</li>
<li>Augmented Gear will now bring you up to the level of ascension you were at before you equipped it.  If it's attuned!</li>
<li>Camo racial can be used.</li>
<li>Wooden swords don't start with 25% durability, though it is the same durability.</li>
<li>Larch and Willow Dance now require Camelia Dance to be purchased.</li>
<li>Esuna now ends itself.</li>
<li>Jinchuuriki and Jagan Eye make a re-debut.  They are T3 signatures and must be obtained by IC mechanism.</li>
<li>Giant Form tankier in the face of Ki Attacks.
<li>Inability to Dodge caused by certain states (Shield, Oozaru) substitutes normal Afterimage Strikes for counterhits.
<li>Staves now affect spirital attacks only with their element.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Summoning Contracts no longer give contract power.  Wer wer.</li>
<li>Time Displacers work!  Properly.</li>
</ul>
<br><br>
<b>9/18/2018-9/22/2018<br>
Screaming in robot.</b><br>
<ul>
<font size=+1>General</font size>
<li>Weaker Child and Senile characters, stronger Youths and Elders.</li>
<li>Adults receive normal RPP gain now. Non-retroactive.</li>
<li>Monsters can actually pick ascensions now!  Yay!</li>
<li>Facing returns!  I accidentally unincluded the file.</li>
<li>Icons with pixel X/Ys no longer use Ys for Xs!</li>
<li>You can now face southeast.  Or was it west?</li>
<li>Power/Ki Control now activates without needing admin edits ... !</li>
<li>Saiyans can now use Power/Ki Control!</li>
<li>Shearing should pop up on HUD.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Reverse dash now faster and more of a distraction function when Zanzoken is known by user.</li>
<li>Beams can now have fully custom activation text.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Fusion Core now explained with increased CLARITY! And you can actually obtain it now.</li>
<li>Upgrade Equipment properly accounts for legendary weapons.</li>
<li>Armors can't be enchanted with poison and silver anymore.</li>
<li>Weights no longer get used up if you didn't adjust to them (aka. have gotten their buff once).</li>
</ul>
<br><br>
<b>9/11/2018-9/13/2018<br>
Even Newer Update Log, Possibly New Bugs?! </b><br>
<ul>
<font size=+1>General</font size>
<li>Moons no longer spam everyone.</li>
<li>Mappers can now right click a turf / turf object to select it.  Thanks to Galion for code consultation!</li>
<li>Mappers will no longer continuously gain fly verbs.  YEET</li>
<li>You can no longer zanzoken through walls. :3c</li>
<li>You can't hold people while they die to get them to come back from beyond the grave.</li>
<li>Added insulting messages to people who try to buy the same skill twice, quickly.</li>
<li>Spirit Form can display its default message if form1 active text isn't set!!  Wowie.</li>
<li>When dying, it is possible to be annihilated so much that you do not leave a body!</li>
<li>Maiming attacks don't maim unless you have wound intent on.</li>
<li>Stackable items now dropable!</li>
<li>Excess afterimage counters are cleared on being KOed.  Similarly, Flow won't trigger while KOed.</li>
<li>You can set layer on your wearable items to alter the order in which they're reapplied to your character on relog; this is to fix the issue that caused them to be reequipped in order they were present in inventory instead. Current implementation
<li>New power control!  It will freeze you in place while powering up.  Once you cross a threshold determined by your Ki Control, you will enter Ki Control buff.  This will affect stats.  Without being in Ki Control buff, your Power Up percent will reset to 100 if it is over.</li>
<li>Having unmastered transformations will lower your total accessible power by a notable margin. This mechanic will with time replace the old mastery mechanics.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Mechanized folk will no longer experience interference from their own mechanization when scanning others.</li>
<li>Gears can now properly be integrated!!</li>
<li>The Senator is now known as Armstrong Augmentation.</li>
<li>Transmute is now listed under the utility tab.  Transmutations look a bit spicier.</li>
<li>Lethal Transmute now has a failure chance based on world Void Chance as well as the user's total skill at alchemy.</li>
<li>People no longer have no enhancement chip slots by default.</li>
<li>Multiple click-consumables cannot be used at the same time anymore.  PHEW</li>
<li>Tomes no longer appear as an overlay on relog.</li>
<li>Cauldrons no longer lock up!  Probably?  If they do, report it.</li>
<li>Lightsabers and progressive blades now have the right offsets!</li>
<li>Radars now give directions when used to Detect.  Detect length has been lengthened.  Radars no longer pop up a tab and constantly generate bits of lag.</li>
</ul>
<br><br>
<b>9/6/2018-9/11/2018 <br>
New Update Log, Same Bugs.  (kidding)</b><br>
<ul>
<font size=+1>General</font size>
<li>Mappers now have Mapper Delete!!</li>
<li>Mappers now get fly automagically!!</li>
<li>Saiyan Ascensions now trigger properly.</li>
<li>Items of all equippable types will refresh themselves on logout.  Ideally, this means no more items getting stuck on your character from logging out, but we'll see!</li>
<li>Elemental Queues from alien racials can now be used with a sword.</li>
<li>Human ascensions have been updated.  Please message an admin to get your ascension reverted if you have it.  You may pick a new type of ascension if you wish.</li>
<li>Stances now have confirm prompts which explain what they do!!</li>
<li>Shockwaves should not generate right click options anymore!  Hopefully.</li>
<li>Grab trains may be faster.</li>
<li>You can no longer walk through edges because you're carrying someone.  (why god).</li>
<li>Star Slash side-of-map mechanics have been DISABLED.  No more sneaky kills for you...Guy...</li>
<li>Power Integration and Power Control removed from skill tree until their merged functionality is complete.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Stackable items no longer delete the whole stack on use!</li>
<li>You now require the knowledge to make a type of gear in order to upgrade it!  This means you can't make lightsabers from progressive blades if you can't make progressive blades in the first place.</li>
<li>Fake Philosopher Stones no longer shatter if the person they are stolen from voids.</li>
<li>Jet Packs now make you fly.  WOOP.</li>
<li>Armor now loses durability while being hit.</li>
<li>Various types of summons/teleports will not be available if you are grabbing someone.</li>
<li>Teleport Nexuses are no longer pickable or grabbable, so make sure to place them where you want them to be forever!  Currently placed nexuses can be repositioned once with admin help.</li>
<li>Having medical+improved medical knowledges >=4 allows you to perform surgery on yourself!</li>
<li>Surgery cuts wound%, heals BP wounds, and no longer applies fatigue nerf.  Instead, just fatigue percent.</li>
<li>First aid kits now heal a small amount of wounds.  Medkits now heal a smaller amount of wounds, but still heal health.</li>
<li>Cooling spray has been renamed to <s>Icy Hot (lol)</s> Isothermic Spray.  It deals with burn and chill now.</li>
<li>Focus Stabilizers added as part of the Fast Acting Medication breakthrough!  They heal shock and confusion and make those status effects harder to apply.</li>
<li>Sealing Spray added as part of the Fast Acting Medication breakthrough!  They heal shatter, cripple, and shear status effects.</li>
</ul>
<br><br>
<b>9/4/2018<br>
Back to regularly scheduled update logs...!</b><br>
<ul>
<font size=+1>General</font size>
<li>Canceling a give/make from the admin menu no longer posts a log anyway.  WHY DID I WAIT THIS LONG TO FIX WHAT IS A SIMPLE THING TO DO</li>
<li>Event Credit can now only be acquired until it is equal to the RPP you've gained naturally!  Excess Event Credit will be converted immediately to money.</li>
<li>Strength stats are no longer factored into the display for offense stats. (Kek)</li>
<li>Admins can now manually unlock breakthroughs in knowledge.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Potion effects no longer trigger repeatedly and endlessly.</li>
<li>Toxic herb knowledge now gives access to Hallucinogenic herbs which can induce intense anger, but cause the target to take more serious injuries.  If you already have toxic herbs unlocked, hallucinogenic herbs knowledge will be granted on login.</li>
<li>Cauldrons can now fill up your capacity in partial amounts! For those with tight wallets.</li>
<li>Magic Circles are now savable (why).</li>
<li>Teleport Nexii don't take capacity if you cancel.</li>
<li>Wooden swords can now be made if you have ANY breakthrough from Forging knowledge.</li>
</ul>
<b>7/3/2018 - 9/4/2018 <br>
Bugs!  Bugs everywhere!</b></br>
<ul>
<font size=+1>General</font size>
<li>Resistance was removed as a stat.  Yes, really.</li>
<li>Mods were lowered across the board, even if this results in practically no change, relatively speaking.</li>
<li>Majin (the race) is now referred to as Djinn.</li>
<li>Agorothians are asplode.</li>
<li>Monster Rework!  We now have Beastmen, Yokai, Eldritch, and Hollow.  Giants are a semi-rare class with inherent giant form!</li>
<li>Removed Hollows.</li>
<li>Change Form Icons has added functionality to allow you to customize most transformations (or transformation-like abilities) yourself, no admin tweaks needed!</li>
<li>Transformation boosts can once again be seen on the stat panel.  The numbers are smaller.</li>
<li>Style and stance texts cannot be customized.  Because they're martial arts.</li>
<li>Saiyan 'Zenkai' Tier S has been refashioned into Ascensions as there was no particular reason to not do so.</li>
<li>Installing Cyber Power reverts you to base form.  You cannot transform when you have Cyber Power.</li>
<li>Cyber Power no longer exists!  Instead, it is calculated automatically depending on how cyberized you are.</li>
<li>Android may now install any number of Military Frames.</li>
<li>Non-Androids will never reach higher than 75% cyber cancel.</li>
<li>Cyberization modules that are not a military frame (special slotter) or stat mod (duh) no longer are limited in the number you can install.</li>
<li>Arcanic Capacitors are kill.</li>
<li>AND A WHOLE LOT MORE</li>
</ul>
<br><br>
<b>6/26/2018<br>
Finale.</b><br>
<ul>
<font size=+1>General</font size>
<li>Pure damage multipliers count in a much saner way now.</li>
<br>
</ul>
<b>6/24/2018<br>
In memoriam.</b><br>
<ul>
<font size=+1>General</font size>
<li>Graphical tweaks.</li>
<li>Autohits don't go as cray with rolls anymore, but they still get less whiffy with damage mod.</li>
<li>RP Mode now stops Powering Down from taking away PU%, making reverting under it less of a hassle.</li>
<li>Game skin modified to allow 64x64 mode.</li>
<br><br>
<font size=+1>Races</font size>
<li>Enhance Super State added which is a generic and more easily customizable way to evolve Super Saiyan states above one. If you currently have a customized path like that, report to KKT for adjustments.</li>
<li>Super Saiyan Blue can now also be triggered through being in Power Recovery state for those who don't feel like making a specific pose state.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Yan made some gay new skills. They're gay. And new.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>A proper implementation of the <b>Libra Gold Cloth</b>.</li>
<br>
</ul>
<b>6/17/2018<br>
Weighting the options.</b><br>
<ul>
<font size=+1>General</font size>
<li>Damage roll variance increased slightly, removed the slight native damage reduction that was in the code so we might have higher melee/autohit damage for a while.</li>
<li>When it comes to 'blocking' autohits, their accuracy multiplier when deciding on them whiffing is now equal to their damage multiplier.</li>
<li>Fusions now include the boons of unlocked potential.</li>
<li>In preparation for future changes, using Zanzoken now -always- triggers an attack. This means fights will probably get a bit more... flighty.</li>
<li>The above means that previous change to Launcher type attacks no longer matters.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Science people can now produce actual Scissor Blades in communication with admin staff.</li>
<li>Scissor Blades have slightly weaker shearing capabilities than Dainsleif and come in with a Decapitation Mode skill that changes their class and reach.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Hiten buffs here and there.</li>
<br>
</ul>
<b>6/15/2018<br>
A gay amount of time.</b><br>
<ul>
<font size=+1>General</font size>
<li>Darkness Flame and Absolute Zero no longer assign secondary debuffs over 100.</li>
<li>Dodge locking now correctly affects Afterimage Strikes, Wild Sense and Flow.</li>
<li>Launcher type attacks can now start Zanzoken combos.</li>
<li>Massively lower chance of KB from normal attacks to prevent KB loops. In turn, lower CD on basic Heavy Strike and Dragon Dash which are consistent source of knockback.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Dainsleiff Oversoul first form.</li>
<li>Anti-Form has a bit more pure power and anger.</li>
<li>Final Form now includes all advantages of Anti-Form as well.</li>
<li>Higher Drive forms reinforced slightly in general.</li>
<br>
</ul>
<b>6/9/2018<br>
Mature update for mature people.</b><br>
<ul>
<font size=+1>General</font size>
<li>Darkness Flame now pierces through normal debuff immunity so specific resistance sources like sealed suits and being from fire-resistant race work bit better against it.</li>
<li>A mirror passive added in Absolute Zero, which affects Water-type attacks, inflicting Chill, Shock and Shatter, even through debuff immunity.</li>
<li>Being debuff-immune still makes these qualities fade out faster.</li>
<li>Meditation no longer instantly heals away all shearing, but notably speeds up its recovery.</li>
<li>Small corrections to how undense turfs/objects interact with normal melee. Should fix issues Ray Gear had on underwater missions.</li>
<li>The above corrections will also make the delay increases through melee-replace attacks actually matter.</li>
<li>Super holy things (good Shinjin, Masamune Oversoul) can inflict 'holy' type damage even on neutral beings.</li>
<br><br>
<font size=+1>Races</font size>
<li>Android interactions PU spikes (in absence of Fusion Core) corrected. Making up for some lost options, an extra ascension. Please report to admin for adjustments regarding the former.</li>
<li>Endgame Makyos even ogrier.</li>
<li>Fusions should be capable of going SS4 now. Both parties need to be capable of entering it as a requirement.</li>
<li>Transformed Agorothians notably mightier.
<li>Final Ascension Tuffles gain an even higher cyberization multiplier.</li>
<li>The Offense/Defense buff moved an ascension earlier.</li>
<li>Half Saiyans now have access to Super Saiyan Rage (bleh), which is an odd in-between state of Super Saiyan God and Super Saiyan Two.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Multiple Oversoul modifications.</li>
<li>Gates provide bit more outburst strength in return for a bit less lasting power.</li>
<br>
</ul>
<b>6/3/2018<br>
KKT be moving (again). Celebratory (?) update.</b><br>
<ul>
<font size=+1>Skills</font size>
<li>Kirin Stance now has the ability to utilize every one of the receently added martial special slotters.</li>
<li>New T3 Sword Style: <b>Butcher Style</b> - an anti-regenerator style, aiming to deal shearing wounds and severe crippling while increasing damage and forsaking defenses.</li>
<li>New T3 Sword Style: <b>Sword and Board</b> - a defensive style that pairs up your trusty weapon with an even more trusty shield, providing a variety of strong defensive bonuses.</li>
<li>Arcane Bladework now combines sword and staff multipliers when calculating normal melee attacks.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Power of golden Bronze Cloths reduced but now they become available for all with Gold Cloth compatibility set.</li>
<li>Gemini users now gain a non-jury-rigged ability to traverse dimensions, albeit more limited in fashion and behaving similar to Another Dimension teleportation.</li>
<li>Kol'co technique added to Aquarius Cloth users - ability to entrap opponents in a ring of continuously applied chill, shatter and shock debuff.</li>
<li>For both of the above, please a-help to have them properly added.</li>
<br>
</ul>
<b>5/31/2018<br>
Kill the Bugs.</b><br>
<ul>
<font size=+1>General</font size>
<li>Wound/Fatigue/Capacity draining buffs fix.</li>
<li>Oozaru tailwrap fix.</li>
<li>Command Styles activation fix.</li>
<li>Sennin Mode deactivation fixes.</li>
<li>Constricting Coil no longer makes you normal attack immune. Please report to KKT if you got it to remove temp fixes.</li>
<li>Burn/Poison no longer ignore non-zero super armor values.</li>
<li>Beams should be less unreliable when it comes to hitting the tile in front of the shooter.</li>
<li>Homing projectiles now can backfire even without automatic dodging being involved, for more 'run them into caster' strats.</li>
<li>Makyojin buffs work now.</li>
<li>Unmastered Vaizard will kick you out of whatever other special buff you're using when it uncontrollably triggers, causing many to wonder why the fiddlesticks Yan didn't do it this way the first time.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Burn Cosmo now scales much higher when buffless, reduction of base scaling and scaling when buffed.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Reverse Dash for Haki users now provides the future sight buff, which is the parallel of the Haki Armor provided by Dragon Dash.</li>
<br>
</ul>
<b>5/28/2018<br>
Highway to the danger zone. (Pt. 2)</b><br>
<ul>
<font size=+1>General</font size>
<li>Elemental debuff effects on stats slightly increased.</li>
<li>Poison now drops off notably slower.</li>
<li>Desperation restands no longer as certain, but also not completely random. You can get less, you cannot get more. On the sidenote of this, the armor they grant doubled due to the gamble factor.</li>
<br><br>
<font size=+1>Races</font size>
<li>Tuffle last ascension offense and defense gain equalized. This is a buff.</li>
<li>Blue Ascension experiences a small upgrade. Please report to staff, nonblack humans.</li>
<li>High Tension no longer provides additional desperation - instead, provides stat buffs similar to other transes (still treated as a single one though, so the buff is same for all steps).</li>
<li>Saiyans can now wrap their furry appendages around their waists on Oozaru toggle.</li>
<br><br>
<font size=+1>Skills</font size>
<li>More small graphical taps.</li>
<li>Beams now display charge and activation texts, can take on custom charge icons.</li>
<li>Autonomous buff fixes.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Fusion Core now very slowly regenerates battery when it's active but user isn't Powered Up.</li>
<li>Bubble Shield back to old resilience but now with timer limit (better on offensive builds, worse on defensive ones).</li>
<li>Stat Buff potion effects increased.</li>
<li>Offense/Defense potions removed.</li>
<li>Tonic cooldowns reduced, downsides now scale differently for different type of tonics (with health having most cooldown and toxicity, mana the least both, energy in the middle).</li>
<li>Non-tonic healing potions now work only when meditating, but their downsides are for the most part removed.</li>
<li>Antivenoms nerfed in comparision to innate poison resistance.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Aurora Execution now shinier. Probably stronger too.</li>
<br>
</ul>
<b>5/28/2018<br>
Highway to the danger zone.</b><br>
<ul>
<font size=+1>General</font size>
<li>Life generation abilities slightly reduced, life draining improved.</li>
<li>Lasting time of elemental afflications extended slightly.</li>
<li>Couple corrections on sense functions.</li>
<li>You can now convert up to -half- your total held RPP into money currently. Cooldown remains same.</li>
<li>Star turf is now indestructible by default.</li>
<li>Undeflectable projectiles will now have their damage slightly reduced if a deflection check is successfuly made by the defending party.</li>
<br><br>
<font size=+1>Races</font size>
<li>Super Elite ascension tier for Aliums.</li>
<li>Additional ascension step added for various ascension-dependant races (Namek, Tuffle, Heran, Monster etc.) so they handle current endgame levels more competently.</li>
<li>Makyojin Expand interactions further expanded.</li>
<li>Mastered Super Saiyan 2 now grants same level of Recovery as Super Saiyan 3.</li>
<br><br>
<font size=+1>Skills</font size>
<li>A number of buffs to Tier 4 signatures.</li>
<li>Spirit Burst nerf (again); lower energy threshold before deactivation.</li>
<li>Spirit Pulse buff; now grants some extra Ki Control and also partly removes PU Locks from buffs (including armors).</li>
<li>Advanced special slotted augmentations for super and ultimate stances! More details in forum thread.</li>
<li>Buffs to knockback on various autohits.</li>
<li>Damage buff to Spin Rave line.</li>
<li>Duration buff to Soul Charge compared to Blood Rush; windup slightly shorter.</li>
<li>Energy cost buff on Super Explosive Wave line.</li>
<li>Great Deluge initial damage buff, windup lowered.</li>
<li>Mana costs reduced on various non-healing skills.</li>
<li>Small graphical taps.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Cloning Tank price up in context of new lategame ascensions being propped and as such more resources being in the run in regards of cyberization.</li>
<li>In preparation for future changes, Slotless Modules can now be installed by Tier S users.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Small changes to Muken (Chikara T8) to further improve its lasting potential.</li>
<li>Forming an Oversoul now provides a BP buff similar to a Transformation, but without anger scaling.</li>
<li>Gates users now gain additional stat ascensions as they progress. Report to KKT to get caught up.</li>
<li>The structure of Gates nerfs changed where rather than continuously upping, the nerfs for 6-7 become structuraly similar to 3-4, becoming their new 'standard'.</li>
<li>Burning Cosmo caps out a bit sooner.</li>
<br>
</ul>
<b>5/18/2018<br>
Push it to the limit....</b><br>
<ul>
<font size=+1>Skills</font size>
<li>Decreased casting time on Limit Breaker.</li>
<li>Limit Breaker effect brackets tightened to 3 (75, 40, 5) - effects slightly buffed.</li>
<li>Fusions now base on sense rather than scouter display.</li>
<li>Some skills can now inflict permament sense damage. Heal, Ripple touch, Give Power and Regenerator tanks can fix those currently.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Small damage count touches on the Gold Cloth abilities (Gemini Galaxian Explosion moved to top of potential damage scale, Virgo ability damage lowered).</li>
<li>Introduction of the <b>Aquarius Gold Cloth</b>.</li>
<br>
</ul>
<b>5/17/2018<br>
This was longer than I expected (that's what she said).</b><br>
<ul>
<font size=+1>General</font size>
<li>A significant amount of system side fuckery aiming to reduce the number of spawn calls within attack animations. Might cause freezups here and there.</li>
<li>Fusion procedures fixed.</li>
<li>Desperation no longer negates damage on injury immune users, as the mechanic is a risk-reward system; mostly included due to easy way to negate injuries being present in cyberize.</li>
<li>Couple trans stat changes.</li>
<br>
</ul>
<b>5/15/2018<br>
'Fuck updates' the update.</b><br>
<ul>
<font size=+1>General</font size>
<li>Dodge disabling skills now don't decrease natural deflection rate.</li>
<li>Sweeping attack tracking upgraded but now doesn't work with light attacks.</li>
<br><br>
<font size=+1>Races</font size>
<li>Fixed how Absorb interacts with Demigods (looked at wrong variable when calcing BPs); retroactive improvements might follow.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Flat deflection rates on skills reduced in the light of above change.</li>
<li>Cure overhealing effects corrected, hopefully without overdoing it the other way.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tonic/Antivenom interactions expanded.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Susanoo now inputs a small level of additional PU strain.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Sunlight Yellow Overdrive converted back to combo attack, keep holding attack when you land it.</li>
<li>Sendo Ripple Overdrive added as Earth-type Ripple attack.</li>
<br>
</ul>
<b>5/10/2018<br>
'Fuck Sleepy' the update.</b><br>
<ul>
<font size=+1>General</font size>
<li>Buff stealing no longer accounts for specific racial or Tier S ascensions.</li>
<li>Tightened up some buff activation procs so flipping stuff on and off should have less of a chance of leaving overlays or variables behind.</li>
<li>Fixed the graphical glitch with stun.</li>
<li>Buffs and forms that lower your agility to the point you cannot dodge anymore now also lock various methods of high-speed movement (Zanzoken, Afterimage Strike, etc.).</li>
<li>Ki Control influence over Power Up drain now more subtle.</li>
<li>Ki Control now allows reaching certain levels of Power Up faster depending on its level.</li>
<li>Power spike type skills now prevent Powering Down or meditating off the gained percent.</li>
<li>Launcher changes reverted. They were indeed gay.</li>
<li>Hitrate gained from offense/defense/speed finally undergoes scaling - less than pure BP, but it's there.</li>
<br><br>
<font size=+1>Races</font size>
<li>Mostly completed work on Super Saiyan Blue (lots of hair icons still need adjusting).</li>
<li>The customization options for SSJ hairs now allows you to set up hair for SSB.</li>
<li>Meanwhile, Super Saiyan 4 now properly applies Golden Oozaru girth.</li>
<li>Maou Class Demon True Form nerfed.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spirit Burst now spikes drain while active.</li>
<li>Calm Anger from Maki now interacts with Anger Multipliers.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Lengthened the potion delay on Tonics.</li>
<li>Improved the scaling of Cyber Power with buffs.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Mangekyou Sharingan no longer anger based, instead adds Mangekyou abilities based on your type (currently refer to KKT to set up your choice).</li>
<li>Complete Susanoo added for Eternal Mangekyou Sharingan level.</li>
<li>Initial implementation of <b>Virgo Gold Cloth</b>.</li>
<br>
</ul>
<b>5/1/2018<br>
...or is it?</b><br>
<ul>
<font size=+1>General</font size>
<li>Debuff Immunity now deals a bit more sensibly with already applied debuffs.</li>
<li>Changed the way Double/Triple Strike interacts with queuable moves to avoid attack verb lockups.</li>
<li>Couple modifications to how multi-strike launcher attacks work. Probably gayer.</li>
<li>Reset Multipliers now removes 'empty' slotless buffs and turns off Haki.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Healing magic skills now have actual range limitations.</li>
<li>Reintroduction of Metamorean Fusion, more commonly known as <b>Fusion Dance</b>!</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Yan assumedly fixed potion stacking issues.</li>
<li>Nox Nyctores modifications to make them usable by all manner of TS users.</li>
<li>Now simply holding a Nox Nyctores activates the calm anger quality (unless you're cyberized and hold Bolverk, then you're SoL).</li>
<li>Reinforced Remotes no longer need to be bolted to be used.  Kind of a weird feature.</li>
<li>Artificial Philosopher Stones can now be made at a cauldron for those who expect to be having repeat visits to the bubbly goo.</li>
<li>Gear with infinite uses should no longer pop up in recharge options.</li>
<li>Change in behavior of medical/reparative nanobots that makes it both a bit less and a bit more useful for regenerators.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Introducing the <b>Leo Gold Cloth</b> - an aggressive and speedy hybrid armor that makes your attacks faster than light!</li>
<li>Tier 7 Ansatsuken finishers now require the respective special buff to be active.</li>
<br>
</ul>
<b>4/27/2018<br>
Pacing is important.</b><br>
<ul>
<font size=+1>General</font size>
<li>Fixing up animation timings -more-.</li>
<li>Flow behaviour corrected.</li>
<li>A number of sense-based things can now see God Ki users who aren't actively using it.</li>
<br><br>
<font size=+1>Races</font size>
<li>High Tension now slightly scales with ascensions.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Battery packs can now be stacked like potions!!</li>
<li>Imperfect Ultima versions of magical implements now have increased drain. Please report to staff (hah) for adjustments.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Satsui Infection now restricted to Ansatsuken progression.</li>
<br>
</ul>
<b>4/23/2018<br>
Getting things out of the way early.</b><br>
<ul>
<font size=+1>General</font size>
<li>Fixing up animation timings.</li>
<li>Stealing Gear now should properly fix their overlays.</li>
<li>Relogging/Disconnecting should no longer make the stun overlay stuck.</li>
<br>
</ul>
<b>4/21/2018<br>
Finally, not mostly bugfixes.</b><br>
<ul>
<font size=+1>General</font size>
<li>Some modifications in how wind-ups and charges apply that can make them use the default power up icon with a simple adjustment.</li>
<li>Super Dashing delay now affects reverse dash too.</li>
<br><br>
<font size=+1>Races</font size>
<li>Reduced some of the new Zenkai scaling.</li>
<li>Namekian Fusion makes its return.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Typhoon Cannon changes: no longer 3x3, but keeps the low cooldown, high KB and holds the highest natural accuracy multiplier of all 'dodgeable' beams.</li>
<li>Typhoon Cannon now also applies shock and chill debuffs.</li>
<li>Speed Force even faster.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Targetting buffs on Ray Gear tuned down a little bit.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Certain positive effects of Gold Cloths now moved to their Burning Cosmo state only.</li>
<li>Under certain conditions Bronze Cloths now can emulate qualities of their Gold counterparts.</li>
<li>Satsui no Hado now enjoys a modified hitspark.</li>
<li>Couple inconsistencies with Gates behaviour fixed.</li>
<br>
</ul>
<b>4/18/2018<br>
Spoilers: Never.</b><br>
<ul>
<font size=+1>General</font size>
<li>Follow-up queues now shouldn't have more issues due to a default duration being set.</li>
<li>Punches causing shockwaves now actually begin that shockwave from the location of hit effect.</li>
<li>Purity now notably better at healing injuries.</li>
<li>Due to changes in above injury heal formula, a singular strong hit should now also be better than a large attack spam of lights.</li>
<li>You no longer need to have wound intent flagged to heal injuries with pure damage.</li>
<li>Pure damage can now stabilize mortally injured people.</li>
<li>Chaos element a bit more chaotic in its assigment of debuffs.</li>
<br><br>
<font size=+1>Races</font size>
<li>Some updates to Demi second trans animations!</li>
<li>Demigod third ascension slightly updated.</li>
<li>Changed a couple things about Zenkai scaling.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Jecht Shot buff.</li>
<li>Couple rebalances on other Ki skills.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Buff type gears should no longer trigger at 0 uses and go into negatives.</li>
<li>Staves, tomes and potions no longer provide their mystical boons to Androids/Cyborgs.</li>
<li>In turn, both Androids and Cyborgs can now use Recharge Self option on Power Packs to restore some of their battery.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Sage Mode pose now gathers required chakra much faster.</li>
<br>
</ul>
<b>4/16/2018<br>
When will the errors cease.</b><br>
<ul>
<font size=+1>General</font size>
<li>Queue hitsparks slightly modified, might be wonky for a bit.</li>
<br><br>
<font size=+1>Races</font size>
<li>A bit more small updates on various transes.</li>
<li>SS4 reversion bug fixes.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Small updates for couple homing gears/tomes.</li>
<li>Magic Missiles now shoot out five missiles at once tops, rest of the qualities unchanged.</li>
<li>Patriot Missiles a bit slower but takes a bit longer to lose tracking.</li>
<li>Plasma Casters fire a -very- slowly moving projectile that has a huge maximum range and keeps homing until dodged.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Muramasa Oversoul has some added edge... (small reference to Akame ga Kill)</li>
<br>
</ul>
<b>4/15/2018<br>
Errors had been made. Again.</b><br>
<ul>
<font size=+1>General</font size>
<li>Gear swapping bug corrected.</li>
<br><br>
<font size=+1>Races</font size>
<li>Dragon Fusion effects don't stack as much anymore.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Aether transformation updates.</li>
<br>
</ul>
<b>4/14/2018<br>
Errors had been made.</b><br>
<ul>
<font size=+1>General</font size>
<li>Some -more- updated graphical effects, credits to Fortune-chan.</li>
<li>Pure damage reduction mechanics corrected so they don't buff the damage against person instead (sorry Shelpuh v _ v)</li>
<li>Gear helmets should not stick on relog anymore.</li>
<li>Build tile deselecting fixed.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Reflect Pierce trait for autohits that allows them to ignore reversals. Granted to select few finishers at the moment.</li>
<li>Death Beam no longer faster than light.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Eight Gates power spikes a bit more turbo, no native fatigue drain.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Quickswapping gear/tomes should not allow equipping over the limit anymore. I hope.</li>
<br>
</ul>
<b>4/13/2018<br>
Birday the 13th - expect things to break horribly.</b><br>
<ul>
<font size=+1>General</font size>
<li>Some new/updated graphical effects.</li>
<li>Couple savefile read problems should cease occuring.</li>
<li>Attracted status should be a little bit more annoying now.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Once again removed knockback from Nebula Chain. Nyoro~n <:3c</li>
<br>
</ul>
<b>4/12/2018<br>
Majoring in minor.</b><br>
<ul>
<font size=+1>Skills</font size>
<li>Cure/Curaga names fixed.</li>
<li>Esuna converted to Wound/Fatigue heal along with the old debuff heal effects.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Keyblades now get the Cure line spells.</li>
<li>Surprise.</li>
<br>
</ul>
<b>4/12/2018<br>
Double rainbow is dead.</b><br>
<ul>
<font size=+1>General</font size>
<li>Couple transformation animations worked on.</li>
<li>More intriciate Instinct/Flow interactions.</li>
<li>Healing buffs can now be marked as stable heals which means their effects are not connected to the targets' regeneration.</li>
<br><br>
<font size=+1>Races</font size>
<li>Graphical fix on one of Dragon racials.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Slightly reduced a couple of humongous explosions on projectiles.</li>
<li>Targettable buffs should no longer cause issues on logout.</li>
<li>Cure/Curaga added.</li>
<li>Fire/Thunder/Blizzard now can be applied for as a set, considered a single T2 skill. Their upgrades will be counted as a single T3, but requiring the base versions.</li>
<li>Magnet/Stop/Gravity can now be applied for as a set, considered a single T3 skill. Their upgrades will be counted as a single T3+, but requiring the base versions.</li>
<li>Cure/Esuna/Pearl can now be applied for as a set, considered a single T3 skill. Their upgrades will be counted as a single T3+, but requiring the base versions.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Androids holding Tier S now receive an innate BP boost similar to effects of Overdrive as compensation for losing access to cybernetic actives.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Gate Eight no longer warrants immortality.</li>
<li>Modernized Amakakeru Ryu No Hirameki.</li>
<li>Final form now gives your main Keyblade the Magic Sword trait (making it work as a staff)</li>
<br>
</ul>
<b>4/6/2018<br>
2hu 4 u.</b><br>
<ul>
<font size=+1>General</font size>
<li>Objects can be flagged as hats.  Truly the most important update ever performed.</li>
<li>Expanding capacity now unified and working additively as well.</li>
<li>Issues with Dancing Lights type skills possibly resolved.</li>
<li>Issues with target buffs messing with overlays possibly resolved.</li>
<li>'Possibly resolved' will be used in reference to everything that worked during testing. Possibly.</li>
<br><br>
<font size=+1>Races</font size>
<li>Heran Aliens get a larger base power and their trans mult becomes consistent thorough all ascensions.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Blade Unity, Overlap Form and Jack of Blades made more defensive in nature as contrast to Weapon Master's Fury.</li>
<li>Red Hot Hundred has an actual cooldown now.</li>
<li>Ray Gear provides cyber BP buff to Androids similar to other cyber special slotters, but the base attacks are less turbo.</li>
<li>Kyoukaken graphical effect making a return.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Android modification no longer self-targets.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Small balancing taps to Andromeda Cloth.</li>
<br>
</ul>
<b>4/5/2018<br>
94 <s>Meetings</s> Updates.</b></br>
<ul>
<font size=+1>General</font size>
<li>Attack/Movement permission checks on Autohits tightened and disconnected from Beaming variables.</li>
<li>Telepaths should now be closer to their past setup in regards of thought reading.</li>
<br><br>
<font size=+1>Races</font size>
<li>Elite Aliens should no longer get a second stack of transformation verbs.</li>
<li>Changeling Golden Form buffed, three of four ascensions adjusted to the buff.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Some changes to Spirit Gun :^).</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Gear no longer vanishes on death.</li>
<li>Missile Swarm and Blaster gears now have upgrades!</li>
<li>Blade Mode used during Ripper Mode deactivates the latter but receives additional 3 seconds of drainless activation.</li>
<li>Blade Mode now holds the Bullet Kill passive that slices apart incoming projectiles.</li>
<li>Slotless modules now all use battery in some manner.</li>
<li>Attack types slotless modules improved in regards of the above change.</li>
<li><b>New Special Module</b>: Ray Gear - named after Metal Gear Ray, it focuses on upgrading Force and Ranged combat capacities.</li>
<li><b>New Slotless Module</b>: Rocket Punch - currently a simple homing projectile dealing strength-based damage.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Finalized Cygnus and Andromeda Cloths.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Haki now influences your Stance / Style when you reach Color specialization levels.</li>
<br>
</ul>
<b>3/28/2018<br>
(Dis)Content Patch.</br></b>
<ul>
<font size=+1>Skills</font size>
<li>Death Beam fires faster in many ways.</li>
<li>Pearl line spells now blockable rather than dodgeable.</li>
<li>Blood Armor partly rebalanced to provide more Resistance and Defense in place of Strength and Endurance, making it the 'balanced' armor choice.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Drive Forms now drain less mana passively but also drain it while doing damage.</li>
<li>Final Form now properly summons secondary Keyblade.</li>
<li>Final Form does not trigger Anti-Form anymore but has a daily cooldown.</li>
<li>Obtaining Final Form permanently expands the mana pool of the user to simulate Form Boost ability.</li>
<li>Cygnus Cloth and Andromeda Cloth initial implementations.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Frenzy no longer turbos lifedrain.</li>
<li>Natural energy aura should be a bit less exploitable.</li>
</ul>
<br>
<b>3/28/2018<br>
D'ohdates</br></b>
<ul>
<font size=+1>Skills</font size>
<li>Weapon Breaker styles and stances can now actually weapon breaker again. Wear the hat, Yan.</li>
<li>Cero shouldn't be misaligned anymore.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Tier 7 for Ansatsuken Satsui path starting to fill out.</li>
</ul>
<br>
<b>3/25/2018<br>
Juuuu...</br></b>
<ul>
<font size=+1>General</font size>
<li>Bit tighter yet higher damage rolls. I look towards the future with fear and loathing.</li>
<li>Slightly lowered cooldowns on Aerial Recovery/Payback to acompany the more common knockbacks.</li>
<li>Transformation graphics updates - very WIP.</li>
<li>Dragon dashing now provides temporary juggernaut value making it more possible to go through beams successfully for tankier folk.</li>
<li>Gods grow beyond holiness, darkness, humanity and less controlled energy.</li>
<br><br>
<font size=+1>Races</font size>
<li>Majins are no longer affected by combat slow or crippling.</li>
<li>Elite aliens should now properly get their new racial choice along with proper non-stacking of racials; cause of funtional reasons, elemental racials cannot be multipicked at the time.</li>
<li>Cyberize-path Humans now have access to additional stat implants and a bit more cyber BP.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Vaizards should now gain Cero on donning the mask; the power gained from the mask should be a bit more stable value wise too.</li>
<li>Some further Holy/Abyss Mod rebalances.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Gear and Tomes now properly drop on death.</li>
<li>Cloning Tanks now cost 2'000'000.</li>
</ul>
<br>
<b>3/24/2018<br>
Less clothes, more knockback! (Quickpatch edition.)</br></b>
<ul>
<font size=+1>General</font size>
<li>Game notably more reactive to knockback additions in queued attacks.</li>
<li>Buffs that target others and affect them with an overlay should now move said overlay around as the target is changed.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Ansatsuken's skill pains -should- be alleviated.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Gears should no longer stack their overlays on if not equipped.</li>
<br><br>
<font size=+1>Awakening</font size>
<li>Purity doesn't eat through vampire extra lives as easily anymore.</li>
<br>
</ul>
<b>3/24/2018<br>
Wooooah, I'm an Alien, I'm a legal Alien...</br></b>
<ul>
<font size=+1>General</font size>
<li>Dragon Dash now finishes with an attack if it fully closes the distance.</li>
<li>Super quick dashes return.</li>
<li>Anger thresholds actually look at the threshold of the person being damaged now, not the one dealing damage. Geez.</li>
<li>Stat taxes/cuts no longer can lead to having 0 stats.</li>
<li>A bit more transformation/buffs updates, mostly refocusing the existing offense/defense buffs on speed. All transformed/buffed folks are urged to reset their multipliers ASAP.</li>
<li>You can no longer attack -while- charging a beam - the functionality was unintended.</li>
<li>Race's original regeneration mod now influences how fast and how likely they are to die out of internal injuries.</li>
<br><br>
<font size=+1>Races</font size>
<li>Aliens gain an 'Elite Alien' ascension which kicks up their base power a little bit along with the option of picking an additional racial; doesn't check for your current racial yet and they generally don't stack (besides some exceptions) so please don't double up.</li>
<li>Changeling 100% Form no longer PU based.</li>
<li>Changelings can now actually drain out of their Golden Form.</li>
<li>Makyojin gained new interaction with Expand type buffs that makes them scale with their ascensions a little bit.</li>
<li>Makyojin Expand interactions expanded (heh) to Titan Form.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Slightly higher energy use and wind up for explosive waves. They're worth it.</li>
<li>Spirit Style now has the Instinct trait while Yin Yan keeps the Flow trait, making a proper mirror of upgrades.</li>
<li>Homing Finisher makes 4 times less projectiles but has double the accuracy and double the damage - this was mostly to reduce object spam.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Weapon Repair price increase updated to current upgrade prices.</li>
<li>Fusion Core renamed to Fusion Battery - actually uses up mana/battery to remain active as you fight.</li>
<li>Blink module no longer able to teleport -while- beaming.</li>
<li>Empty Grimoire actually looks at your mana when trying to teleport.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Couple updates on certain finishers so they're harder to avoid.</li>
<li>Saint Cloths now have an option in Other tab allowing them to remove the helmet while wearing them.</li>
<li>Burning your Cosmo now provides correct power spike.</li>
<li>Evil version of Soul Calibur has a new spazzy look.</li>
<br><br>
<font size=+1>Awakening</font size>
<li>Zombies can no longer get overkilled, but can actually die of non-pure causes (if you're patient enough to hack away).</li>
<br>
</ul>
<b>3/17/2018<br>
New Times, New Tools</br></b>
<ul>
<font size=+1>General</font size>
<li>A bit more bounds/scaling on movement/attack speed. This is a test change.</li>
<li>Abyss damage now loses its advantage over Holy but gains it against non-Holy things.</li>
<li>Skimming/Flying won't stack its movement delay decrease with God Speed now.</li>
<li>Sword hitsparks should now have adjustable sizes.</li>
<li>Exhausted and Barely Standing messages can be customized in text content now.</li>
<li>Anger, Exhausted, and Barely Standing messages can be customized in color now.</li>
<li>Cone and Arc autohits now look more arc-y and cone-y when fired diagonally.</li>
<br><br>
<font size=+1>Races</font size>
<li>Changeling now can choose between 100% Power and Fifth Form as their racial Final Form special slotter.</li>
<li>Changeling have their energy poured into Recovery for the sake of faster charges.</li>
<li>Majins buffed to average Energy/Recov, less Regeneration.</li>
<li>Majins can now freeform their build like Androids and Aliens.</li>
<li>Majin Regenerate now applies its entire effect -much- more rapidly.</li>
<br><br>
<font size=+1>Skills</font size>
<li>More rebalances on buffs/stances to make for less Offense / Defense value swings.</li>
<li>Void Fist and Void Dragon Fist gained new properties that make them harder to Wild Sense but in turn Dragon Fist lost some radius.</li>
<li>Final Getsuga Tenshou and Mugetsu received their modernized reworks.</li>
<li>Bronze Cloths gained their initial implementation.</li>
<li>Ultra Instinct Style received an initial implementation.</li>
<li>Void Style renamed to Astral/Starlight Style and granted Sunlight/Moonlight effects.</li>
<li>Empty Fist now gains debuff reversal capability to even further turn your opponent against themselves.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>The Senator now breaks weapons.  America!  Fuck yeah.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Mu no Ken - Chikara's ultimate form - now focuses on nullifying the effects of Holy, Abyss and Curse mods while providing very powerful sustain abilities.</li>
<li>Satsui no Hado / Denjin Renki now punch harder but don't provide as much Offense / Defense - the base stances handle those sufficiently well.</li>
<li>Jagan Eye acquires improved telekinesis at a certain level of mastery.</li>
<br>
</ul>
<b>3/15/2018<br>
Sloppy Firsts</br></b>
<ul>
<font size=+1>General</font size>
<li>Some of the recent changes to desperation mechanics reverted/diminished.</li>
<li>Recalcs for Spirit Hand / Sunlight type buffs so it no longer produces Force mods in the hundreds.</li>
<li>Death Regen should finally work. Should. (It does! Yay!)</li>
<br><br>
<font size=+1>Races</font size>
<li>Dragons continue to be test dummies.</li>
<li>Changeling transformation issues fixed.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Ripple should not lock you out of normal abilities now.</li>
<li>Bit different mechanics for Zombie death regeneration.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Nox Nyctores can now be properly made, as well as properly cost capacity, as well as actually produce the Nox Nyctores in question.  Good grief...</li>
<br>
</ul>
<b>3/8/2018<br>
Actually Not A Bugfix</br>
</b>
<ul>
<font size=+1>General</font size>
<li>Doors now have a verb to be toggled to be unlocked, which will deactivate their password nature for a while.</li>
<li>The way Ki Blade works now is that it adds a bit of force to every strike while taking a bit of accuracy; this means it mixes with a greater amount of things, but its general effectivness is lesser.</li>
<li>Couple number changes aiming to keep the Offense/Defense values on stuff a little more bound.</li>
<li>KOing will no longer turn off buffs since it seems to cause more issues than it helps.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Less casting delay on Limit Break, but less desperation on lower levels of health, so using it at high health is less of a dead option.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Small tweaks on how Ripple damage calcs, making full oxygen less important while purifying Ripple more.</li>
<br>
</ul>
<b>3/7/2018<br>
Bugfix Bothernanza</b></br>
<ul>
<font size=+1>General</font size>
<li>Super armor buffs should no longer ruin lives, saves and families.</li>
<li>Lots of semi-relevant number BS around damage values.</li>
<br><br>
<font size=+1>Skills</font size>
<li>A lot of true damage mults on skills reduced, at least tree-wise.</li>
<li>Couple Holy/Abyss mods too.</li>
<br><br>
<font size=+1>Races</font size>
<li>Humans will now gain Desperation value from their post-TE ascensions rather than High Tension alone. Please do a-help.</li>
<li>Alien transformations buffed slightly. Alien players should reset their multipliers whenever possible and those of ascension types should admin help for temporary reversion.</li>
<li>Super Saiyan slightly touched. Super Saiyan forms no longer touch recovery and are a bit faster. Full Power Super Saiyan recent buff reverted to earlier stages.</li>
</ul>
<br>
<b>2/22-3/3/2018<br>
Bugfix Bonanza and Fitting Numbers</b></br>
<ul>
<font size=+1>General</font size>
<li>Energy spent transfers into fatigue a little less intensely.</li>
<li>Autohit overlays should a bit more precisely fit the duration of the autohit.</li>
<li>Buffs should now automatically drop on KO; I expect many horrible things to happen in consequence, because BYOND and sequencing.</li>
<li>Admins can set you up with an expand icons which applies to Expand type skills and Super Saiyan Grades.</li>
<li>Likewise with Sacred Energy Armor offensive and defensive modes.</li>
<li>Changed the way overlays apply on characters, might end up in a fair scope of amusing failure.</li>
<br><br>
<font size=+1>Skills</font size>
<li>A lot of fatigue costs on skills adjusted into energy costs.</li>
<li>Spin Rave series moves have reduced windups.</li>
<li>Death Beam adjusted to behave more like a blast, funnily enough.</li>
<li>Stardust Scatter now works slightly differently - becoming a semi-homing burst rather than area of effect.</li>
<li>Clustering projectiles should now adjust to the icon used for the main.</li>
<li>Regeneration type skills now focus on fatigue/injury when you're meditating.</li>
<li><b>New Skill:</b> Prana Burst - an alternative special-slotter for sword users which lets you add bit of your mana to every attack to increase power, reach and speed; currently T2 like Sword Saint.</li>
<br><br>
<font size=+1>Races</font size>
<li>Demigod transformation no longer fondles their BP / God Ki permanently.</li>
<li>Removed ascension alien branch as issues with broken multipliers would become very troublesome to fix.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>You can only invoke the Legendary Weapon Soul form of a weapon you are bound to. Noble Phantasms will remain invokable with different bindings but there might be cost modifiers in future.</li>
<li>Caledfwlch and Soul Calibur can behave as respectively unholy/holy weapon depending on the Light/Darkness preference of their wielder.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Corrections to Overdrive module on Androids, which turned out stronger than on cyberized people while being cheaper to upkeep, which is not really the intended behaviour.</li>
<li>Overdrive now has a minor interaction with Reparative/Medical Nanobots.</li>
<li>Cost of higher level weapon ascensions made notably higher so special weapons become special-er.</li>
</ul>
<br>
<b>2/22/2018<br>
Quality of Life updates, vol.2</b></br>
<ul>
<font size=+1>General</font size>
<li>Some experimental changes in damage scaling reverted. Stronger people winning faster doesn't really appear fun.</li>
<li>Reduced meaningfulness of whiffing so defense tanks don't have as huge of an advantage to endurance/resistance ones.</li>
<br><br>
<font size=+1>Races</font size>
<li>Changelings give up energy in place of recovery when transforming so their Ki focus isn't damaged by long chargeups.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Every legendary blade received an unique characteristic that works even outside of their buff forms.</li>
<li>New generic Weapon Soul techniques allow users to infuse their weapons with either Darkness or Light.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Injury resistance increases with Cyberization level, as more and more cyberized person becomes similar to an android.</li>
</ul>
<br>
<b>2/22/2018<br>
Quality of Life updates!!</b></br>
<ul>
<font size=+1>General</font size>
<li>You can now make little notes that appear when a skill goes off cooldown.  The verb is in the Other tab.</li>
<li>Mappers have a new verb that allows them to choose to overwrite objects on a tile they put down, or not do so.</li>
<li>Autohits which skim around dodge and block now do get partly stopped by deploying your shields.</li>
<li>Couple of weird projectile behaviours corrected.</li>
<li>Queue moves duration extended slightly.</li>
<li>Reverse dash makes you face the opponent.<li>
<li>God Ki mechanics changed - it's now the only linearly scaling source of power in the game, which gives it a handful of interesting properties.</li>
<li>In relation to above, if you notice things not doing damage or similarly joyful occurences, please report ASAP.</li>
<br><br>
<font size=+1>Races</font size>
<li>Chimera racial skill a bit more buff.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Kamui's health-based powerup mechanics now scale of regeneration.</li>
<li>Impulse Kamui now also ascend regeneration.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Due to small reworks on how oxygen deprivation works/kills, Ripple should become less suicidal.</li>
<li>Also, pose-walking should now adjust your swim overlays even when already in water/lava.</li>
<li>Lycan half-form no longer triggers on Aerial Recovery, instead they enjoy lowered cooldown.</li>
</ul>
<br>
<b>2/12/2018<br>
Mini.</b>
<ul>
<font size=+1>General</font size>
<li>Couple buffs and nerfs.</li>
<li>New graphical effect for Sword Pressure.</li>
<li>Some more bugfixes.</li>
</ul>
<br>
<b>2/10/2018<br>
Ironic.</b>
<ul>
<font size=+1>General</font size>
<li>The Unstoppable passive no longer ironically stops regeneration under certain circumstances.</li>
<li>Stat cuts and taxes will now display in the stat panels.</li>
<li>Fatigue recovery in Power Recovery state rebuffed slightly.</li>
<li>Half saiyan ascensions have been reduced from 4 to 2.  As a result, each ascension is far more significant.  <b><font size=+1>IF YOU ARE A HALF SAIYAN, ADMINHELP TO ENSURE THAT ONLY ONE OF YOUR ASCENSIONS IS MARKED AS UNLOCKED/ACQUIRED.</font size></b></li>
<li>Fancy graphical effect on Tactical Shield. Not currently customizable.</li>
<li>Zombies now ignore BP debuffs from injuries and their max health/energy aren't impacted by injury or fatigue. They are also not affected by mortal wound death.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Ki Blade icon can now be set without admin intervention.</li>
<li>Overclock nerfs are now displayed similar to Wound timers in the stat panel as 'fatigue status'.</li>
<li>Overclock nerfs will now accumulate rather than be set.  Spamming your extremely taxing abilities is a bad idea.</li>
<li>Expand derivatives now share the Makyojin racial boost with its base form.</li>
<li>Limit Breaker now has a bigger backlash the lower health it was triggered at.</li>
<li>Grade 2/3 in FPSSJ simplified to be costless versions of their 75% forms. FPSSJ approval rate will most likely drop in perspective.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>An indention error allowed for true memes to occur with the Blink module.  It was corrected.  Sadly.</li>
<li>A few buff gears have the functionality to Upgrade into higher forms, similar to the Powered Armor and Mk2.  More improvements to come.</li>
<li>Environment Suits no longer can traverse corrupted ground and space - functionality moved to their upgrade, Sealed Suits.</li>
</ul>
<br>
<b>2/2/2018<br>
A cat probably vomited on this update.</b>
<ul>
<font size=+1>General</font size>
<li>Since Caelum is banned for good, Super Saiyan God and Super Saiyan God Super Saiyan are starting to get some actual work done on them.</li>
<li>Trying to app for them based on this declaration will be a bootable offense.</li>
<li>Since I got inspired by Curtain Call screenshot, considering putting more work into making Metamorean Fusion functional again.</li>
<li>Trying to app for it based on the mere statement of it being a possibility or asking when it'll be finished will be a bootable offense.</li>
<li>Pressing Hair verb and choosing 'No Change' should now relayer your hair.</li>
<li>There's also a hidden, macroable Relayer-Hair verb which does the same.</li>
<li>Beam charge mechanics changed a little bit - beams charge at about the same pace and their Charge factor decides the upper bound on the charged-up damage you can attain, meaning some stuff can profit from excessive charge rates.</li>
<li>High Recovery improves charging rate.</li>
<li>It's also a very initial implementation so numbers can be a little eyebally.</li>
<li>After initial testing, Power Recovery less crazy with fatigue.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Movement speed on Chasing Bullet and Death Saucer lowered; will probably look janky until a way to properly interpret decimals in speed values for projectiles and autohits is coded in, aka. a while.</li>
<li>Comments on them being such will be a bootable offense.</li>
<br><br>
<font size+=1>Knowledge</font size>
<li>Cyber Actives had their nerf values equalized with Cyber Power and Cyber Stats.</li>
<br><br>
<font size+=1>Awakenings</font size>
<li>Various Senjutsu issues addressed.</li>
</ul>
<br>
<b>1/30/2018<br>
Humorous anecdote.</b>
<ul>
<font size=+1>General</font size>
<li>Deluged tiles are no longer SPAAAAAAAACE.</li>
<li>Death Regeneration should work less quirkily right now.</li>
<li>Power-up drain even more dependant on actual level of PU, meaning lower levels should be easier to manage.</li>
<li>Power Recovery now actually affects Fatigue.</li>
<li>Energy Recovery slightly better in buffs.</li>
<li>Higher levels of PU slightly harder to reach.</li>
<li>Things that allow you to safely walk in lava now make you more resistant to getting burned by Fire and Darkness Flames.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Spin Rave, Crowd Cutter and Pinpoint Blast trees buffed slightly.</li>
<li>Smaller Accuracy boost on a lot of the more basic tree queues.</li>
<li>Less raw damage on Tracker Wave, smaller energy cost.</li>
<li>Likewise, less range on Hyper Explosive wave, smaller fatigue cost.</li>
<br><br>
<font size+=1>Knowledge</font size>
<li>A few tomes and gears weren't properly linked to the equipped gear, resulting in attempting to use gear/tomes that weren't actually equipped.  This behavior should be rectified now.</li>
<li>Some of the newer functionality with Zanzoken was replicated with the Blink module offered through cyberize.</li>
<li>Prices for cybernetic special slotters ramped up a bit more notably.</li>
</ul>
<br>
<b>1/28/2018<br>
I wasn't joking, apparently.</b>
<ul>
<font size=+1>General</font size>
<li>Small reworks on split forms aiming to make them less spastic and obey normal attack delays. If the changes prove satisfying, maybe gonna look at split form skills a bit more later.</li>
<li>Small reworks on potential unlocking.</li>
<li>Demons/Half-Demon should now have their -normal- PU auras in trans, at the very least.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Plasma Hold now looks at/causes fatigue instead.</li>
<li>The highest levels of Jagan caught a small buff to the Darkness Flame special slot buff.</li>
<li>Vaizard Mask is no longer a Tier S, and is instead a masterable signature.  Assume that obtaining it is the same as obtaining a T2 signature skill.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Kendo style has been made.  It is a sword style blending all the benefits of the skill tree sword styles together, but functions best with a wooden sword.  Consider it a T2 signature.</li>
</ul>
<br>
<b>1/26/2018<br>
KKT off work, back to daily updates.</b>
<ul>
<font size=+1>General</font size>
<li>Instant Strikes no longer get extra tap after delivering their full attack.</li>
<li>Power Recovery now impacts fatigue more notably.</li>
<li>Demons/Half-Demons no longer have their aura defined by transing.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Incremental increases of Cyber Power should now actually work. Science ahoy.</li>
<li>Androids and fusion-powered people no longer affected by PULock recovery modifications.</li>
<li>Overdrive less explosive on Androids due to reduced cost and backlash.</li>
<li>Drains on tech-related special slotters bopped up a bit.</li>
<li>New spell Added to Tome of Transmutations: Ice Beast, a heavily defensive charm that increases deflection rates and overall resistance to attacks.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>No more passive wound regen on lycans to make silver more effective against them. Speed and strength of their Regeneration buffed to compensate.</li>
</ul>
<br>
<b>1/25/2018<br>
I'm ashamed at how long that one was in.</b>
<ul>
<font size=+1>General</font size>
<li>Instant Strikes no longer get extra tap after delivering their full attack.</li>
<li>Health remaining now affects energy recovery in reverse (energy regen gets closer at lower health, representing characters pushing their stamina).</li>
<li>Fatigue recovery is the opposite.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Limit Breaker now properly heals energy on activation.</li>
<li>It doesn't apply double the negative passive on turning on.</li>
<br><br>
<font size=+1>Races</font size>
<li>Aliens have a new, boring racial, <b>Ascension</b>, making their transformations permament.</i>
</ul>
<br>
<b>1/22/2018<br>
This update barely deserves a title</b>
<ul>
<font size=+1>General</font size>
<li>Couple small taps on how knockbacks apply. Quirkiness inbound.</li>
<li>People in transformed states now recover energy bit more easily, but don't recover fatigue outside of medding, period.</li>
<li>Prediction fix.</li>
<li>Change in behaviour of instant strikes. Might turn oddly.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Lightning Ball non-deflectable, but doesn't ignore Wild Sense anymore, which means it remains relatively more dangerous for all parties involved now.</li>
<li>Void Style buff; I didn't find it dumb enough just yet.</li>
<li>Shunkan Ido combat use slightly streamlined.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Combat CPU little less funky considering it's slotlessness.</li>
<li>No timer on Progressive Blades because they're not powerful enough to deserve one at the moment.</li>
<br><br>
<font size=+1>Races</font size>
<li>Mechanics of Grade 2 and Grade 3 modified for FPSSJ.</li>
<li>Grade 2 should adjust the verb name but old macros should still work.</li>
</ul>
<br>
<b>1/21/2018<br>
I'm not feeling it Mr. Krabs</b>
<ul>
<font size=+1>Skills</font size>
<li>Crystal Spear now knockbacks in order for the full range of strikes to take effect at point blank range.  Thank you Phantom Merlock for reporting the issue.</li>
<li>Haste cost increased, but so did its uptime.  In both convenience and mana per goesfast, this is a buff.</li>
<li>Projectiles using HolyMod, AbyssMod, and SlayerMod now stack differently with innate mods of same nature; work in progress.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Cyber Power can now be updated in increments.</li>
<li>Powered Armor Mk.2 can be macroed without using weird arcane methods now.</li>
<li>Arcane Eyes should work properly now instead of you showing only the void (which was infiltrated with pancakes).</li>
<li>Having sense be active will now shut off internal scouters, in case that generates too much lag; this is a temporary quickfix.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Caledfwlch can slay elemental beasts because ambition and glory go hand in hand.</li>
<li>Masamune has a higher innate Holy mod now, though not quite to the point of yesteryear.  Or yesteryesteryear.  Look, it's not 5 like it was on MMORPG wipe.</li>
<li>Kusanagi and Durendal heal more energy and health while fighting, respectively.</li>
<li>Evil Legendary Weapons gained sword stat buffs similar to the ones holy swords held.</li>
</ul>
<br>
<b>1/19/2018<br>
Yan weeds out (even more typos).</b>
<ul>
<font size=+1>General</font size>
<li>Various Skill Tree corrections to Spirit Tree moves.</li>
<br><br>
<font size=+1>Races</font size>
<li>Isroth regain their automatic-anger on trans, apparently the current functionality was just forgetfulness.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Humans have a slightly better relation with cyber power but it excludes obtaining High Tension - generally consider it a secondary dev branch.</li>
<li>Overdrive no longer ignores highest PU limits; that was extremely unintended.</li>
<li>Blast Fists actually respect their ammo count now.</li>
</ul>
<br><br>
<b>1/17/2018<br>
KKT weeds out (typos).</b>
<ul>
<font size=+1>General</font size>
<li>I've become Death, destroyer of bad grammar.</li>
<li>Couple adjustments to sense displays so God Ki holders and Androids/Void people can be less of a bug-message generating mess.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Highly cyberized people will start popping up on Sense in the same vein Androids do.</li>
<li>Enhanced Speed mods no longer give twice the boon they should.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>The base power of Jaganshi Mode now scales with Tier S level so it isn't outscaled as rapidly.</li>
</ul>
<br><br>
<b>1/16/2018<br>
Hungry Gays.</b>
<ul>
<font size=+1>General</font size>
<li>Couple balance recalcs.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Esuna no longer as good as Regeneration while 2.5x less cd.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Wisdom form / Aether Bow now release more projectiles in one 'shot'.</li>
</ul>
<br><br>
<b>1/15/2018<br>
Hunger Games.</b>
<ul>
<font size=+1>General</font size>
<li>Couple balance recalcs.</li>
<li>Some kinds of knockbacks can be forced even against beings normally immune. That's relevant mostly for beams right now. Mostly.</li>
<li>Androids and other debuff immune things should no longer spam debuff messages.</li>
<li>Projectiles should no longer freely soar over things meant to stop them, like windows.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Improved Telekinesis... improved? It basically offers the functionalities of various telekinesis-like skills that were implemented in Gregwipe.</li>
</ul>
<br><br>
<b>1/10/2018<br>
Smart Both Ways.</b>
<ul>
<font size=+1>General</font size>
<li>Fixed the bugs with Androids being unable to properly install Reparative Nanobots.</li>
<li>Fixed Androids clearing out their additional over-the-limit stat mods.</li>
<li>Fixed the Give Power bug. No Broly.</li>
<li>Fixed Chakra Freeze not clearing off for people otherwise immune to elemental and crippling-related debuffs.</li>
<li>Increased the impact of buff strains on energy usage a little bit.</li>
<li>Poison offset now scales better with improving regeneration mod. Also, poison requires more stacks to hit its current damage cap.</li>
<li>Chaos Elemental Defense Added. Void Elemental Offense now has innate damage mult.</li>
<li>Transformation strains for SSJ forms should now work properly. Also, differences between different masteries of SSJ should be more notable.</li>
<br><br>
<font size=+1>Races</font size>
<li>Makai denizens now all get access to Maki (formerly: Majin). It serves purely as auto-anger and cursed wound trigger right now and carries no other boosts.</li>
<li>Half-Demon hairs no longer affected by their transformation being unlocked. Also, setting hair for the transformation should work now, but mind - no default ones.</li>
<li>Heran ascensions now overall slightly stronger than standard Aliens due to lack of specialization and less safety wheels in form of trans moments.</li>
<li>Nobody will play them cause they're gingers anyway.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Small Ray buff since it was generally worse than T1 Beam sides ease of deployment.</li>
<li>Sweeping Beam icon issues fixed.</li>
<li>Poison Gas now innatelly deals some damage to accomodate for the debuff nerf.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Modified the boosts granted by Chain Grimoire contracts to be more sensible. There's also a small debuff that's associated with being contracted but it's only functional when your contract power gets siphoned into another person.</li>
<li>Silver weaponry effectivness boosted - damage from it is considered 'pure' against evil (and thus dealing 100% damage as injuries).</li>
<li>Evil beings with really high unholy affinity (represented by Abyss Mod) and various Tier S pinging as evil that gain such mod can use it to partly resist silver damage (but not true 'pure' damage).</li>
</ul>
<br><br>
<b>1/06/2018<br>
48 God Damn Tilesets.</b>
<ul>
<font size=+1>General</font size>
<li>New passive: <b>Auto-Reversal</b> - a counter ability that reflects autohit damage at the opponent.</li>
<li>New passive: <b>Technique Mastery</b> - a scaling reduction on skill cooldown; currently kept to low levels for testing purposes.</li>
<li>New passive: <b>Movement Mastery</b> - a scaling trait which decides how much power any given PU% translates to.</li>
<li>Above added to plainer T3 styles (Yin Yang and Spirit Style), which didn't really provide T3 utilities.</li>
<li>Spirit Style no longer provides a BP buff with basic stances for consistency purposes.</li>
<li>Shearing now clears out immediately on meditating, making it more specifically an anti-regnerator ability.</li>
<li>Enough regeneration/healing can now push through shearing and make you heal again. It's not easy.</li>
<li>Queued grab moves fade out slightly faster.</li>
<li>Queued counters now announce themselves.</li>
<br><br>
<font size=+1>Races</font size>
<li>Humans now normally recover energy in High Tension states, making it easier to manage.</li>
<li>High Tension appearance even gayer now. Hairs are work in progress. Returning to old Aura colors as they feel more accurate.</li>
<li>Standard progression for most races tops out around Mastered SSJ2 level, allowing SSJ3 exist in a class of its own before God Tiers.</li>
<li>Non-standard progression is all over the fucking place.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Ansatsuken now has a reduced chance to roll Satsui Infect, but it affects a wider range of levels.</li>
<li>Keyblades users now build mana on dealing damage when outside of drive forms.</li>
<li>Anti Form less punishing, mana-based like others. Attacking drains mana rather than building it.</li>
<li>Valor Form gains the Stunning Strike trait, letting it land a stun from normal attacks once in a while. Shouldn't be too bad with current stun immunity window.</li>
<li>Wisdom Form now gains the Skimming trait similar to Jet Boots.</li>
<li>Master Form gains the Technique Mastery trait.</li>
<li>Final Form gains the Movement Mastery trait.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Androids now can target themselves with Upgrade Android. If you were granted Self-Enhancement for this purpose, please ahelp to confirm and then remove the latter.</li>
<li>Costs of upgrading android cyber power should no longer display odd values.</li>
<li>Costs of various android upgrades are higher than similar costs for cyberize due to amount of resources they can easily produce.</li>
<li>As a boon, Androids now begin with 10 stat modules slot, the same amount as fully ascended Tuffle.</li>
<li>Ripper Mode and Senator have reduced active cost for Androids in similar manner to Overdrive.</li>
</ul>
<br><br>
<b>01/03/2018<br>
The End Of The Beginning (And The World) (well at least that one)</b>
<ul>
<font size=+1>General</font size>
<li>At long fucking last, overlays won't be quite so sticky when you relog with them on.  There may be a few remaining which will get stuck on log out.  Feel free to report them to Yan.</li>
<li>At long fucking last, you can have a different OOC color than your IC color.  This is controlled by the OOCColor verb and TextColor verbs respectively!!</li>
<li>At long fucking last, observe's spy feature can feature multiple observees.</li>
<li>Relatively large changes to how grab moves apply their damage to make them go along the usual damage reduction mechanics.</li>
<li>Beams should overall appear slightly better (visually).</li>
<br><br>
<font size=+1>Races</font size>
<li>Androids don't get transmuted, absorbed, or use magic.  But they are very smart!  Compile times like whoa.</li>
<li>Lust Demons now traded some of their Energy for more Recovery to further facilitate their Force specialization (faster chargetimes for projectiles).</li>
<li>Sloth Demons are a little less lazy and a bit more likely to actively run away from their duties (because Yan is conditioned by FMA).</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>At long fucking last---er, actually, this one is new.  Swords can carry the purity trait inherently.  Yay laziness!</li>
<li>At long fucking last---er, again, new.  Economy is divided into cost and income.  So it can be super easy to get money and super hard to spend it all!  Or vice versa.</li>
<br><br>
</ul>
<b>12/27/2017<br>
In Unitam Fuckup</b>
<ul>
<font size=+1>General</font size>
<li>The point at which anger occurs can now be set by a variable.</li>
<li>Couple clarification on various BP adds.</li>
<li>Shearing heals slower :3c</li>
<li>Crippling actually does things now.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Weapon Soul now learns how to snap their legendary sword back to themselves at Tier 5.  Likewise, the tier represents the ability to resonate with ANY legendary weapon.</li>
<li>You can now get knocked out in Eight Gates without failing to close them.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Tomes now start with increased charge numbers; existing tomes will be edited to reflect the change.</li>
</ul>
<br><br>
<b>12/25/2017<br>
Merry Update</b>
<ul>
<font size=+1>General</font size>
<li>Oozaru/Fullmoon Lycans can now use MARTIAL ARTS even if they weren't set before the transition.  Get ready for Cheetah Stance Oozaru Fist of Darkness Flame beatdowns, bois.</li>
<li>Races with damaging blood now respond accordingly to life-drain.</li>
<li>Skimming no longer flips the flight state on in suspicion it might've icnreased movement lag; all comments on it looking silly will be ignored.</li>
<li>Pure damage (the kind that heals non-evil beings) now acts as cursed wounds against evil.</li>
<li>There is now a passive to prevent one from reverting from their transformations.</li>
<li>Buff strains now more influential on energy expenditure/recovery as they climb up. Armors nearly as impactful on recovery as using Power Control.</li>
<br><br>
<font size=+1>Races</font size>
<li>True demons caught a buff to their base statistics in order to keep them in line with ascended half demons.</li>
<li>Super Saiyan Grade 2 and 3 will automatically be bestowed on Saiyans and Half Saiyans with a mastery of 75% or higher.</li>
<li>Flicker Alien get free Zanzoken; I must've been drunk when I forgot to add that.</li>
<br><br>
<font size=+1>Skills</font size>
<li>The prerequisites and lockouts of techniques have been improved to be able to read from lists beyond the first item.</li>
<li>Piercer can now be bought from the skill tree.</li>
<li>Hammerhead was being a hard head but we knocked that sucker around a bit and you can see him around now, eh.</li>
<li>Dual Wield now properly displays your second wielded sword on your icon.  Herpa Yan derpa.</li>
<li>Virtually every skill has had an average of 20 seconds added to its cooldown to make combat feel less enormously busy.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>New Elemental Enchant for Tier 3 Smiths: Silver - it intensifies the injuries evil races suffer from contact with the weapon, but makes the weapon itself naturally brittle.</li>
<li>Less toxic tonics.</li>
<li>Stat buffing potions timer extended. This in prep for a rework that'll make potions a bit more varied and interesting.</li>
<li>Another batch of Fusion Core bugs fixed. Hopefully the last.</li>
<li>Fake Philosopher Stones now break if the source of the circuits was dead. The Philosopher Stones currently held will be adjusted to this fact.</li>
<li>Pain Killer duration shortened but they remove the entire BP debuff. Burn Oinment and Antivenom durations boosted.</li>
<li>Less magically effective regen tanks.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Anti Form properly removes Keyblade-related buffs.</li>
<li>Sync Blade a bit less of a rushed hackjob, icon-wise.</li>
<br><br>
<font size=+1>Awakening</font size>
<li>Werewolf Full Moon Form adjustments. Now you can kill your friends even more efficiently.</li>
<li>Haki skill adding should work fine.</li>
<li>Pose for Awakening users should be fixed.</li>
<br><br>
</ul>
<br><br>
<b>12/20/2017<br>
Incomprehensible Tomfoolery</b>
<ul>
<font size=+1>General</font size>
<li>Autonomous Buffs without a Timer immediately turned off.  This was a turn off, so it has been removed.</li>
<li>Not every being in the world posseses Mana Circuits.</li>
<li>The stun immune grace period after getting stunned once extended to force a greater spacing outs of stun.</li>
<li>On that note, please note that Afterimage Strike and Wild Sense trigger while stunned (them not giving a message is a bug caused by old skill architecture, probably not gonna be fixed for a while).</li>
<li>Instinct mechanics made a bit less absolute.</li>
<li>Automatic Super Saiyan hairs now interact a bit better with precolored hair but still mustardy.</li>
<br><br>
<font size=+1>Races</font size>
<li>High Tension is less spammy to logs.</li>
<li>Wraiths enjoy increased immunity to pain as they ascend.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Jagan Eye can't raise the stength stat, only the strength stat.  Corrections had to be made.</li>
<br><br>
<font size=+1>Awakening</font size>
<li>Haki overhaul accomplished.</li>
</ul>
<br><br>
<b>12/18/2017<br>
Uwaablades Advanced</b>
<ul>
<font size=+1>General</font size>
<li>There is now a global damage modifier which actually modifies damage globally since damage has been unified to allow that to be possible.</li>
<li>Regeneration/healing buffs now dependent on Regen/Recov values during their active period.</li>
<li>All queues should now perform a correct number of hits.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Keyblades now must use Attach Keychain BEFORE summoning their Keyblades, which makes things less clunky.</li>
<li>Likewise, once T5 keyblade is reached, Attach Keychain will allow you to modify the second keyblade wielded in a majority of Drive Forms...though you obviously will not be able to dual wield the same keyblade.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Werewolves now have more reasons to swap between forms.</li>
<li>Small polishes on Haki before a more complete overhaul.</li>
<br><br>
</ul>
<b>12/13/2017<br>
Dusting Off.</b>
<ul>
<font size=+1>General</font size>
<li>Couple bug and balance patches.</li>
<li>Voiding bugs fixed.</li>
<li>True Damage mults make more sense.</li>
<li>Staves now restrict using stances and unarmed styles, like swords do.</li>
<li>Batle Mages can use staff multipliers in melee attacks, replacing swords for them.</li>
<li>Aliens can make entirely separate profiles for their transformation stages.</li>
<li><a href="https://angryanimebitches.files.wordpress.com/2010/11/picture-610.png">Tried making beams that move with no delay.</a></li>
<li>On the other hand, some beams (like Ray and Death Beam) gained the ability to be fired instantly, without entering the charge period at all.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Kyoukaken mirroring graphic upgraded a bit.</li>
<li>Damage adjustments on multiple skills.</li>
<li>Arcane Bladework now a style.</li>
<li>Void Dragon Fist now obtainable from the skill tree.</li>
<li>Infinity Trap lost counter properties, bit longer stun.</li>
<li>Zero Reversal gained the counter property.</li>
<br><br>
<font size=+1>Technology</font size>
<li>The Modify Android verb will now actually be able to be obtained!  If you have Physical Enhancement knowledge, admin help for the verb to be added to you.  <u>Do not attempt to use Create Android at this time.</u></li>
<br><br>
<font size=+1>Enchantment</font size>
<li>Evocation Tomes have been debugged!  Now projectiles won't share traits they really shouldn't share.</li>
<li>Conjuration Tomes have had a number of skills added to them!</li>
</ul>
<b>12/10/2017<br>
And They Weren't Even All Of The Mistakes!</b>
<ul>
<font size=+1>General</font size>
<li>Damage was more bounded in relation to upper ends since after observing it in the pure state I didn't like how the old formulas worked.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Couple ways of cheesing Give Power and Saiyan Soul squashed in embryonal stage.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Ansatsuken now builds up SUPER through other than normal attacks. Blocking hits and deflecting projectiles builds up some meter as well.</li>
<li>But it can no longer gain SUPER through medding after putting up the stance.</li>
<br><br>
</ul>
<b>12/9/2017<br>
Mistakes Were Made</b>
<ul>
<font size=+1>General</font size>
<li>Pricings for T4 Sword/Spirit skills corrected. People who got them on the cheap are in luck. <font color=#000000>(And will die.)</font></li>
<br><br>
<font size=+1>Skills</font size>
<li>Fire/Blizzard CD no longer laughably short.</li>
<li>Ye olde Give Power was rehashed and made a little more interesting.</li>
<br><br>
<font size=+1>Races</font size>
<li>Android BP is now properly calculated.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Yet more Gear!!  This time, Tear Gas and Freeze Rays.</li>
<li>Cyberize also got a new module option: Machine Gun Flurry.  Like Taser Strike, it is a skill.  Unlike Taser Strike, it is an autohit.</li>
<li>Health/Energy Potions (not Tonics!) now heal Injury and Fatigue while active.</li>
<br><br>
</ul>
<b>12/8/2017<br>
At This Point, We're Overdoing It. (Vol.2)</b>
<ul>
<font size=+1>Knowledge</font size>
<li>Stat affecting and healing potions now let you ignore taxation/cuts to stats they affect in their duration. So for example using a strength-boosting potion will let you ignore stat cuts to strength.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Vaizard activation quirks not fixed. Nor there's much initiative to do so.</li>
<br><br>
</ul>
<b>12/6/2017<br>
At This Point, We're Overdoing It.</b>
<ul>
<font size=+1>General</font size>
<li>Couple animations were made a bit less heavy on the server.</li>
<li>Continued striving and experimentation to make performance less quirky.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>The starting Keyblade styles get their finishers.</li>
<li>Keyblades should now be able to open doors without a-helping. I don't even have a honest expectation people will not be grimy with it.</li>
<li>Vaizard activation quirks fixed, I think?</li>
<br><br>
</ul>
<b>12/6/2017<br>
People In Poland Give Eachother Gifts Today; Meanwhile We Just Give Nerfs</b>
<ul>
<font size=+1>General</font size>
<li>(More) Balance tweaks and bug fixes. Mainly nerfs.</li>
<li>Potion debuffs slightly nerfed to not be as bad.</li>
<li>Movement speed while <b>crippled</b> was nerfed.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Saiyan Dominance timer slightly nerfed due to high-damage nature of the wipe.</li>
<li>Saiyan Soul now looks at overall power rather than base. You could say everything else was nerfed by comparision.</li>
<li>Aether Arrows nerfed to not home.</li>
<li>Spellweaver nerfed by having a source proper and unique effect.</li>
<br><br>
<font size=+1>Technology</font size>
<li>The Dragon Dash time on Jet Boots was nerfed to be lower.</li>
<li>The resistance injuries have to medkits was nerfed.</li>
<li>The amount of Gear slots without cyber limbs nerfed.</li>
<br><br>
</ul>
<b>12/4/2017<br>
Running Out Of Ideas For Those</b>
<ul>
<font size=+1>General</font size>
<li>Balance tweaks and bug fixes.</li>
<li>Walk build disabled by default. Mappers can use it normally by enabling Mapper Walk.</li>
<br><br>
</ul>
<b>12/1/2017<br>
Add Funny Joke Later Edition</b>
<ul>
<font size=+1>General</font size>
<li>Some mighty fuckery in attempt to improve performance of the game. Inb4 everything is on fire.</li>
<li>Webclient off. For good, this time.</li>
<br><br>
<font size=+1>Buffs</font size>
<li>The interesting bugs associated with not being able to turn 'on' a buff have been solved.  Probably.</li>
<br><br>
<font size=+1>Technology</font size>
<li>Medkits better and more immediate.</li>
<li>Regenerators even better in certain ways but more expensive.</li>
<li>Rebalanced gear to be more build neutral.</li>
<br><br>
</ul>
<b>11/29/2017<br>
Literally Poop Nuggets Of Code</b>
<ul>
<font size=+1>General</font size>
<li>Telepaths don't see telepathies across Z-planes anymoar.</li>
<li>Further animation corrections.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Stardust Scatter now... well, scatters..</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Lots of Tier S skills gained additional Instinct properties.</li>
<li>Ansatsuken students can now develop murderous urges as they tier up.</li>
<br><br>
<font size=+1>Races</font size>
<li>Wrath Half-Demon base BP and anger were swapped places, as they were initially supposed to be. KKT just sometimes forgets to implement things he noted for himself.</li>
<li>Changelings no longer double nerfed at anger.</li>
<li>Small taps on Zenkai; all affected players please report to the staff.</li>
</ul>
<br><br>
<b>11/28/2017<br>
If I Had A Life Right Now, I'd Be Living It.</b>
<ul>
<font size=+1>General</font size>
<li>Various icon and logic fixes. Nothing interesting or worth hyping but I did say every update will have a changelog.</li>
</ul>
<br><br>
<b>11/27/2017<br>
Guns Are Gay. We Are Gay. We = Guns???</b>
<ul>
<font size=+1>General</font size>
<li>You should no longer appear as weaker/stronger than yourself when sensing.</li>
<li>Also, range increased. I think. There's like three different but same-named variables governing this shit???</li>
<li>You should no longer be able to throw people 0 tiles.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Aerial Recovery and Payback now all properly obey their cooldowns. Cooldowns lenghtened to make combos a little more possible.</li>
<li>Suplex and Izuna Drop minor bugs corrected.</li>
<li>Dominator/Determinator should no longer have peak damage mods of over 3 trillion. This is not a hyperbole.</li>
<br><br>
<font size=+1>Technology</font size>
<li>Suddenly: Gear!  Incinerators, Power Claws, Pile Bunkers, Missile Swarms, Plasma Gatlings, Jet Boots, Environment Suits have all been added.  Try them out in a live-fire experiment today!!</li>
<li>Additionally, Powered Armor and its Mark 2 versions were added as full Buff options to the Gear toolbox. They occupy the main buff slot and the base version acts as an Armor-type buff.</li>
<li>Also, Cyberize has a new mod: Combat CPU.  It helps you see why kids love cinnamon toast crunch, or something.  It takes up one of the slotless...slots...for cyberize enhancements.</li>
</ul>
<br><br>
<b>11/25/2017<br>
Skill Tree Not So Skillful After Getting Bullied</b>
<ul>
<font size=+1>General</font size>
<li>Skill Points for smarty/unsmarty races now should round off nicely. Say bye to your odd halves and .3333...(s)</li>
<li>New Queued move trait: <b>Counter</b> - when queued, they will react to opponent's normal attacks and dodge it similarly to AIS/WS, while launching their own strike.</li>
<br><br>
<font size=+1>Skills</font size>
<li>Couple (read: a lot) of fixes to various unpickable Skill Tree objects. There are still some bugs with locks/unlocks that Jinxu is currently working his hardest on.</li>
<li>Soft taps on some damage outputs and cooldowns.</li>
<li>Due to buffs to Elements and Elemental Punches, the previously approved of exploit of combining them with autohits was corrected.</li>
<li>Animation upgrades.</li>
</ul>
<br><br>
<b>11/22/2017<br>
This Kills The Dog</b>
<ul>
<font size=+1>General</font size>
<li>Broken swords can now be dropped without issues.</li>
<li>Launcher freeze length adjusted. Also, it can be gotten out of with Reverse Dash - please remember that, might save your life.</li>
<br><br>
<font size=+1>Races</font size>
<li>The scourge of KKT math had befallen Misshape. The results it provides will be patently less impressive, at least at low ascension levels.</li>
<li>On the other hand, it should bug out notably less.</li>
<li>Bestial instincts are not a thing. No. Not at all.</li>
</ul>
<br><br>
<b>11/19/2017<br>
Jesus Christ, Already?</b>
<ul>
<font size=+1>General</font size>
<li>Observe lets you observe people, instead of just the void.  <font color='black'>Hello darkness my old friend...</font color></li>
<br><br>
<font size=+1>Races</font size>
<li>Chimera's racial unique, Misshape, was computed to make retarded numbers.  <b>On purpose.</b>  But now it doesn't.  So, that's kind of a nerf.</li>
<li>It also slightly adjusts icon coloration, as it was supposed to.</li>
<li>Regenerate now heals again.<li>
</ul>
<br><br>
<b>9/12/2017-11/16/2017<br>
Autism Is Not A Limited Resource Edition</b>
<ul>
<font size=+1>General</font size>
<li>After sincere consideration, anger mods have been scaled back.  With few notably angry exceptions, the maximum NATURAL anger mod is now 200%.</li>
<li>Base movement speed raised slightly, diminishing returns on Speed and Godspeed affecting movement speed - less headless chickens running about.</li>
<li>Slight UI updates for pretty much everything.</li>
<li>You can now adjust the color of your animal traits separately from your hair.</li>
<li>Reduced message spam on multi-hit elemental attacks.</li>
<li>Grab bug should no longer happen. On the other hand, Grab now stops moving in a direction so please be mindful of how you use it.</li>
<li>Skills that normally only healed health/energy will now heal wounds and fatigue if you hit your current cap on the former - obviously, much slower.</li>
<li>New status effect added: <b>Sheared</b> - stops any life recovery and only heals up (relatively quickly) while meditating. Inflicted by Scissor Blades and a handful of other things.</li>
<li>New status effect added: <b>Crippled</b> - doubles movement delay for the duration; inflicted by variety of melee moves.</li>
<li>Divinity passive effects replaced by Ki Control. It no longer increases the speed of powering up, but rather improves its handling. Thus, drain get slower the closer the user is to draining out and they can power down much faster - allowing for greater energy management.</li>
<li>Divinity now notably rarer and handled by possession of the God Ki Mastery.</li>
<li>Visible BP is now slightly variable on per-character basis. It means that it's no longer as easy to tell if someone's is of particular race or injury level simply by seeing their BP value.</li>
<li>Think display range lowered.</li>
<li>Reading thoughts now comes in pack with telepathy, rather than divinity. It has a more restricted range though.</li>
<li>Temporary return to high damage DBR as we're buffing up a lot of signature and skill tree moves damage output in comparision to more consistent power offered by various buffs.</li>
<li>Flicker no longer provides automatic combos.</li>
<li>Juggernaut no longer provides complete stun immunity.</li>
<li>Adrenaline movement speed upgrade caps out now.</li>
<li>The Siphon trait (like the one Aphotic Shield holds) can now drain energy from Ki-imbued melee attacks.</li>
<li>Opener, Decider and Finisher effects made more meaningful, so it is more worth to keep them for the right moment rather than spam all your queues whenever available.</li>
<br><br>
<font size=+1>Races</font size>
<li>After suffering from not being reworked for like an entire wipe, Humans have once again been overhauled.  The infinity gimmick is gone and now they have four ascensions.  High Tension has 4 levels in 25% increments, though you only need a single level unlocked to use all four.</li>
<li>Tuffles slightly worse at learning magic than tech.</li>
<li>Dragon Namekians slightly better at learning magic.</li>
<li>New Alien racial: Venomblood - grants improved poison resistance and can apply poison onto attacker when wounded.</li>
<li>Genius Aliens learn a bit faster in general (bonus RPP gain).</li>
<li>Hunter Aliens now have more keen sense of smell.</li>
<li>Overall, Aliens slightly buffed as a base, due to nerfs on their best passives.</li>
<li>Alien transformation auto-unlock moved to same period as Demi and Namekian first ascension.</li>
<li>Changelings begin with a little less power but their hardened body posses an additional layer of protection that exists as bonus health. Be aware that transforming into higher forms sheds parts of it.</li>
<li>Changelings can now access a One Hundred Percent Power form in their third transformation. Appable after first ascension.</li>
<li>Non-Kaioshin Shinjin no longer innately divine in accordance with the source.</li>
<li>Demigod God-Mode now accessed through the God Ki buff.</li>
<li>Monsters have been reworked considerably.  There is a new class, Beastmen, which uses the stat ascension mechanic all monsters used to have.  Chaos monsters have been reworked into Chimeras, and Boundless have become Wraiths.  One is suited to shifting their body about to approximately mimic their targets, while the other has maintained survivability and all-terrain features, now with an Eldritch flavor.  Devourers are stronger, but mostly the same.</li>
<li>Majins have Super Buu and Kid Buu ascensions.</li>
<br><br>
<font size=+1>Stances</font size>
<li>Living Weapon was converted into a stance. This opens the style slot which allows it to be competitive with Champloo and its sword upgrades.</li>
<li>Strong Fist / Strongest Fist now carry the qualities of shattering and weapon breaking.</li>
<br><br>
<font size=+1>Styles</font size>
<li>Slight buffs to Elemental Styles.</li>
<li>Higher levels of Weapon Breaker act both in offense and in defense.</li>
<li>Yin Yang Style now behaves as low level Weapon Breaker when targetting a sword user.</li>
<li>Moonlight Style now offers a damage reduction based on Resistance, in opposite to Sunlight stance.</li>
<li>Dual Wield and Trinity Style now calculate melee attacks with the second and third blade you wield.</li>
<li>Champloo Kendo had some logical errors addressed.</li>
<br><br>
<font size=+1>Buffs</font size>
<li>Small boosts to Limit Breaker to make it slightly better as alternative to Trance Form.</li>
<li>Regeneration works slower but over longer period. Overall the health healed is the same, but it's easier to outpace damage wise.</li>
<li>Fixed the bug where Regeneration allowed you to regenerate limbs and wounds even without the energy necessary to use it.</li>
<li>Hunter Alien Invisibility renamed to Camouflage, it has a three minute time limit and requires you to be greatly powered down before and during usage. Broken by speaking.</li>
<li>Kaioken now has only 6 mastery levels so you can max it out notably faster. It's upper power cap was lowered slightly.</li>
<li>Small boosts to Limit Breaker to make it slightly better as alternative to Trance Form.</li>
<li>Broken Phantasm no longer completely destroys non-conjured swords; in relation, the buff provided was reduced along with the mana cost.</li>
<li>Broken Phantasm now ends in a damaging explosion.</li>
<li>Bonuses from Reinforcement now consolidated into upgrading the sword's ascension level. Just like sword themselves, the total level caps out at 4, so there's no point in reinforcing Ascension 4 weapons.</li>
<li>Badass Bards and Legends can now customize their guitars in similar way Spirit Sword users get to customize theirs.</li>
<li>The MakesSword trait had some logical errors addressed.</li>

<br><br>
<font size=+1>Skills</font size>
<li>Sense now takes the stat average into account when comparing strengths.</li>
<li>Zanzoken can be used twice before going on a cooldown. Flicker passive now directly adds to this value instead of affecting the CD.</li>
<li>Zanzoken automatically goes into an attack if used on opponent in knockback state. Those combo attacks have additional knockback themselves.</li>
<li>The priority on all forms of Absorb has shifted from absorbing a number of people to a higher quality of person.</li>
<li>Burning Finger, Thunder Hands and any other grab moves no longer stack. In return, they received duration and power upgrades.</li>
<br><br>
<font size=+1>Technology</font size>
<li>Gear and Tomes now display the number of charges they hold.</li>
<li>You can increase the number of your Gear slots by fitting them into your cybernetic limbs.</li>
<li>The above means that Androids hold <b>four</b> extra Gear slots by definition.</li>
<li>New Gears. Reworked Tomes.</li>
<li>Weaponized Grimoires: advent of Ars Armagus and Nox Nyctores!  Currently featuring Yukianesa, Bolverk and Ookami!</li>
<li>Philosopher Stones make their debut.  In order to gain the Transmute power which can be used on a knocked out foe, one must possess knowledge of Alchemy and Arcanic Creation.  Those knowledgable of Grimoires can inact an even more potent ritual.</li>
<li>Highly cyberized people and androids do not have their battery capacity accounted for enchanting.</li>
<li>In line with the above, they cannot store their battery capacity in capacitors either.</li>
<li>Due to lowering a lot of anger values, cybernetics now also affect power up rate.</li>
<li>The ability to cyberize others can now be acquired by learning Improved Medical Technology and Physical Enhancement technology knowledges.  Note that this can ONLY be performed on others!</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Kamui has been readded as a Tier S!</li>
<li>Keyblades have been readded as a Tier S!</li>
<li>Weapon Soul and Hiten Mitsurugi practitioners can use half of their Tier S level (rounded up) in place of their sword ascension level (if higher); this applies to everything besides how prone to breakage it is.</li>
<li>Hiten Mitsurugi style now gains higher innate Pursuer passive with every stat ascension. The style itself is focused on God Speed and Flicker passives.</li>
<li>Sharingan can now copy-learn Skill Tree skills. Ability to do depends on tier of the skill and Sharingan in question.</li>
<li>It's now relatively harder to suffer total blindness from Mangekyou Sharingan overuse.</li>
<li>Additional option for Aetherians: Aether Bow - improves their projectile and spell-like abilities instead of melee combat.</l>
<li>Aether Blade mechanics smoothened out and adjusted to working with Autohits (and projectiles in case of Aether Bow).</li>
<li>Eight Gates has been modified somewhat.  Using the Open Gates verb, you may ascend by one Gate each press.  Closing the Gates is handled with the Close Gates verb.  There is a hidden verb for every individual Gate with the syntax "Gate (Number)" where (Number) is replaced with the word of the number (for example, 'Gate-One', 'Gate-Five' and so on).</li>
<li>Weapon Soul has been restructured.  Each of the blades is an actual item now.  Developing a bond with that legendary artifact is what will enable you to walk down the path of the Tier S.</li>
</ul>
<br><br>
<b>9/6/2017</b><br>
Bed Vendetta: Mid End Wipe Reshittening.<br>
<ul>
<font size=+1>Races</font size>
<li>Monster early game scaled back, as people seem fond of playing them as actual PCs rather than just ECs.</li>
</ul>
<br><br>
<b>9/1/2017<br>
Emergency Unshitting Of Beds.<br>
v11.2.11<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Skill Icons should now be possible to be customized by players. Also the Customize grid should once again work on blasts. Hopefully.</li>
<li>Some trans icon and mechanic tweaks.</li>
<li>Half Demon trans no longer buffs regen considering they got their buffed regen integrated into their base forms. That was an oversight.</li>
<li>Medkit effectivness now scales with the seriousness of injury, so they should be more worthwhile in treating heavy wounds in field.</li>
<br><br>
<font size=+1>Awakenings</font size>
<li>Vamps no longer drain energy (because why), but their Frenzy should now properly scale to their blood drinkings.</li>
<li>Non-lethal vampy interactions now scale their blood power. In the future the scaling will be reduced for infected vamps.</li>
</ul>
<br><br>
<b>8/30/2017<br>
I'll honestly try to be regular with those now even if it doesn't have that much point.<br>
v11.2.10<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Reversion issues on Half Saiyan SSJ should be fixed.</li>
<li>Unlocking Ascension/transformations now resets transformation variables so there should be less cases of 0 BP.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>New activation flashes for Azure/Blue Grimoire.</li>
</ul>
<br><br>
<b>8/26/2017<br>
Since people who don't read update logs 90% of the time are asking for update logs.<br>
v11.2.9<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Ripple costs scaled a bit so there's less people killing themselves.</li>
<li>Wolf Fang Fist tapped down slightly as experiment upon request of one of the users.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>The World mechanics changed a bit, now it's dependant on vitality rather than mana.</li>
<li>Grimoire prices upped due to larger playerbase making them notably easier to attain.</li>
<li>Grimoire limit scaled back to two per person.</li>
</ul>
<br><br>
<b>8/25/2017<br>
That's my secret. I'm always angry.<br>
v11.2.8<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Fanged Dragon bug fixed.</li>
<li>Champloo / basic stance interaction fixed.</li>
<li>Weapon Soul bug should be corrected.</li>
<li>Snatch stance no logner scales like its T4 version.</li>
<li>Projectile damage remains a mystery.</li>
</ul>
<br><br>
<b>8/20/2017<br>
Not so Bright, Shit<br>
v11.2.7<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Sunlight Yellow Overdrive no longer carries its own additional HolyMod. Dedication for Yan: https://www.youtube.com/watch?v=Zd9muK2M36c.</li>
<li>Also an overall nerf to damage just in case.</li>
<li>Crimson Grimoire: Burning Red now contains a lengthy but finite timer.</li>
<li>Azure/Blue Grimoires rebalanced a bit. They have a lower activation threshold but scale down as they use up mana. Also the overall buffs provided were tweaked to be less heavy.</li>
<li><s>Buffs that create swords should now deactivate all sword-needing buffs as they're turned off. Thanks to Greg for reporting.</s></li>
<li><s>Above fix caused a nasty loop in main slotters which made swords so for now it's replaced with a sanity check.</s></li>
<li>Above fixes were worth fuck all, wait for Yan (or a post-sleep KKT) to fix and don't get spotted using that shit in the meantime.</li>
</ul>
<br><br>
<b>8/15/2017<br>
Shine On, Crazy Hamon<br>
v11.2.6<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Finalized implementation of the Ripple. Like Majin, Mystic and Haki, it belongs to the category of skills usable in combination with Tier S and Signature skills alike. The working name for the skill category currently is 'Awakenings'.</li>
<li>Awakenings will no longer provide signature verbs of their own (as Haki did), instead altering the basic verbs (Heavy Strike, Throw, Grab, Pose, etc.) to use variety of effects.</li>
<li>Presence of awakenings will be strongly considered when it comes to progression speed.</li>
<li>Awakenings currently in works: Haki (polishing), Senjutsu (basic foundations present), Majin and Mystic (working out new mechanics), Vampirism (expanding on basic verb modifications).</li>
</ul>
<br><br>
<b>7/25/2017<br>
The Lost Update ~ I Thought You Guys Weren't Updating Between Wipes? ~ Yan-tan Shoots A Weird Bug ~ Emotionless Skyscraper<br>
v11.2.5<br></b>
<br>
<ul>
<font size=+1>Races</font size>
<li>Human stat points reduced from 40 to 30.  Human ascensions were tweaked.</li>
<li>Half Saiyans tweaked as they are common now.  They operate as effective half Saiyans, half humans.  They have two ascensions that are similar in function to humans, and use the same transformation mechanics as saiyans.  Half Saiyans are not eligible for Zenkai Tier S.</li>
<li>Half humans of all types gain 1.25x RPP.</li>
<li>Changelings learn slower due to their high natural power.</li>
<li>Minion progression tweaked.</li>
<li>Tweaks and changes to Monster progression all around.</li>
<li>Agorothians start out a bit better.  They have a racial Tier S, Aether, which grants them ascensions in the same vein as Zenkai.</li>
<li>Tuffles no longer start with Self Enhancement, but they gain it at their first ascension.</li>
<li>Androids suffered a small nerf starting out in order to enjoy greater ascensions.</li>
<li>Makyojins enjoyed a significant buff.</li>
<li>Almost all races had their potential stat adjusted.</li>
<br><br>
<font size=+1>General</font size>
<li>Unarmed techniques of all kinds now ignore sword damage multipliers.</li>
<li>Special attack type autohits (magic/force related) look at staff multipliers instead of sword ones.</li>
<li>Elemental staves no longer craftable. Only Null versions, which later can be enchanted into proper elemental versions with Upgrade Equipment.</li>
<li>Fusion Core made less 'always good'.</li>
<li>Some icon updates.</li>
<br><br>
<font size=+1>Queues</font size>
<li>Speed Strike, Sweep Strike, Opener, Decider and Finisher all have been given a limit to how high they can boost damage.</li>
<li>Queues now ignore attack strength settings so stunning strikes and combo moves become less management-heavy.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>After a strong debut, Denjin Renki stun proc reduced.</li>
<li>Aether has been made into a racial Tier S along the same lines as Zenkai.  It's for Agorothians only.</li>
<br><br>
<font size=+1>Styles</font size>
<li>Champloo Kendo can now use basic stances once again. Related to one of the above changes.</li>
<li><s>Kyotoryu</s> Living Weapon style has been made.  It is the mirror of Champloo Kendo, allowing a practitioner to utilize sword-only skills while unarmed.</li>
<br><br>
<font size=+1>Knowledge</font size>
<li>Many technology prices were adjusted.</li>
<li>Autodrills now cost a fraction of their old price to promote capitalism.  And blood money.</li>
<br><br>
<font size=+1>Passives</font size>
<li>Flow and Instinct passives now meaningfully scale and interact.</li>
<br><br>
<font size=+1>Build</font size>
<li>Players can now only build objects.  Mappers and Admins can build turfs.</li>
<li>Special thanks to Katie for giving us click building!  Only usable by Mappers and Admins.</li>
</ul>
<br><br>
<b>7/15/2017<br>
Now with more lava. And demons.<br>
v11.0.6<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Weapon Breaker suggestions addressed, mostly by small buffs here and there.</li>
<li>Dimension Sword added for those who thought Spin Rave-tier Judgments are too restraining.</li>
<li>Human... buff? Just report to KKT if you have Red Ascension and you'll be set up. This is still valid though frnakly I may just toss you a Stats Redo.</li>
<li>Higher Tensions slightly lesser in reference to the above.</li>
<br><br>
<font size=+1>Races</font size>
<li>Humanity has abandoned its limits.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Small buff on Ryumeisen stun.</li>
<li>All Weapon Souls now feature signature techniques that can only be obtained by using that sword.  Some of them are old.  Most of them are not.</li>
<li>Stands were buffed to include stat growths in the later levels.</li>
<br><br>
<font size=+1>Debug</font size>
<li>Giant Form passive fix - damage reduction, like Flicker's Zanzo CD reduction, was higher than intended.</li>
<li>Higher levels of Godspeed even fasser.</li>
<li>Fanged Dragon oversight with carrying over Bladed Flurry's shatterproofing fixed.</li>
<li>Ryumeisen / Sonic Sheath issues fixed at the core.</li>
<li>Androids should be finally safe to meditate with Fusion Core active.</li>
<li>Weapon Soul issues fixed.</li>
<li>Elements were proccing multiple times from the same source.  This has been rectified.</li>
</ul>
<br><br>
<b>7/12/2017<br>
Changelogs feat. more change logs<br>
v11.0.5<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Internal scouters mercifully allowed to see Health.</li>
<li>Queable accuracy mods now included in whiff rolls. Funny damage values will probably occur but v(' _ ' )v</li>
<li>Scouter range upgrade. Old models may not automatically update in which case... just get a new one.</li>
<br><br>
<font size=+1>Tier S</font size>
<li>Couple of older Tier S moves reworked in new frames.</li>
<li>Dark Weapon Souls now exchange some of your life force (regeneration) for bit beefier stats in opposition to strong passives of the Holy ones.</li>
<br><br>
<font size=+1>Debug</font size>
<li>Reaching default thresholds (including mana) should no longer turn off all buffs. Woo</li>
<li>Flicker now properly divides Zanzoken cooldown (instead of dividing it twice)</li>
<li>Now it's actually fixed. Probably.</li>
<li>Battle Mage actually does what it's made to do (being really gay)</li>
<li>Weapon Soul Tier-up issues fixed.</li>
<li>Healing potions -of all types- now have (intended) downsides. Pushing your entire body to last longer is a gamble.</li>
</ul>
<br><br>
<b>7/7/2017<br>
Changelogs feat. change logs<br>
v11.0.4<br></b>
<br>
<ul>
<font size=+1>General</font size>
<li>Standing capacity regeneration is a thing now - half the rate of meditating one.</li>
<li>Holy buff.</li>
<li>Elemental debuffs shouldn't go over 100 anymore. I think.</li>
<li>Finisher beams have less rough energy costs so struggless are less dependent on stamina.</li>
<br><br>
<font size=+1>Races</font size>
<li>High Tension progression '<i><u>altered</u></i>.'  That's different than a nerf.</li>
<li>Human ascensions <s>also</s> nerfed, which is possible because NO ONE GETS RED ASCENSION.  Until now.  Now it's kind of reasonable.  Not really.  But whatever, it's better than it was!</li>
<li>Androids will always have 100% anger cancel, which makes it impossible to give them anger through <font size=-2>alternative methods</font size>.</li>
<br><br>
<font size=+1>Buffs</font size>
<li>Super Kaioken (it is just Kaioken while also using a trans) drain nerfed.  Buffed.  It kills you less fasterer.  But will also always wound you to use.  So be careful!</li>
<br><br>
<font size=+1>Debug</font size>
<li>Targeted autohits no longer doubletap if they could have been dodged.</li>
<li>Fusion Core fix.</li>
<li>Fatigue immunity fix.</li>
<br><br>
<font size=+1>Debug?</font size>
<li>Lariat can now accept custom flavor texts...but once you use the Cockroach Tackle once, you <b>never</b> go back...</li>
</ul>
<br><br>
6/27/2017<br>
It's Easier to Make Those Than Read Through General Nowadays<br>
v11.0.3<br>
<br>
<ul>
<font size=+1>General</font size>
<li>Heal now better but it becomes increasingly harder to heal multiple folks in a row. Not by much, but it does.</li>
<li>Wound timers reduced in support of our working class people.</li>
<li>Wounds also turn into lesser ones as they heal as well.</li>
<li>Injury regen trifled with - more notable effects of Regen Tanks and Injury recovery in general.</li>
<li>Slight reduction of poison/bleed buildup.</li>
<li>Headbutt has less damage and more notable cooldown.</li>
<li>We have an afterlife. Sort of.</li>
<li>Repair kits work and they work faster than ever before. Still not fast enough for combat usage though.</li>
<li>Small Super/Ultimate Stances buffs.</li>
<li>Powering down under 50% should make you immune to Observe now.</li>
<li>#equalangerrights</li>
<br><br>

<font size=+1>Tier S</font size>
<li>After a more fitting introduction, Spiral made reasonable again. To a point.</li>
<li>Additional content. Reworks of some of the signature techniques.</li>
<br><br>

<font size=+1>Debug</font size>
<li>Great Deluge is most likely no longer be <a href="https://www.youtube.com/watch?v=kRuVe2voS1U&t=2m02s">this</a>.</li>
<li>Likewise, Super Explosive Wave should no longer be nuclear.</li>
<li>Sokidan and Kienzan is working and probably not making you freeze in place.  Also they (and other projectiles) can't be destroyed by punching them even though that was funny.</li>
<li>Saiyans don't have super frisky tails that pop out when they sense the m o o n.</li>
<li>Scouters are no longer part of Scanner Technology and are part of Advanced Transmission Technology.  This makes them able to be made.</li>
<li><s>Topkek</s> Toppuken now working properly.  This is why you don't rush development.</li>
<li>*whiffed*</li>
<li>Couple smaller bug and typo fixes.</li>
</ul>
<br><br>

6/23/2017<br>
Edition We Need To Slow Down<br>
v11.0.2<br>
<br>
<ul>
<font size=+1>General</font size>
<li>Deity two-way telepaths now protected by higher divinity levels, meaning you can have secret conversations with followers without the mortal being a source of leaks.</li>
<li>Higher Divinities cannot be observed by lower beings.</li>
<li>Queues now can have their text colors set.</li>
<li>Slight Android buff since BlueAkira suggested they may need a nerf.</li>
<br><br>

<font size=+1>Knowledge</font size>
<li>Grimoire Arcana has had additional restrictions put on it.  A single person can only make up to three different types of grimoire.  Each grimoire can only be made a certain number of times by a single person.</li>
<li>For the most part, items made by enchantment had their prices reduced.  Or made less odd.</li>
<li>Ascending weapons now scales in cost.</li>
<li>Rescaling of the prices of some stuff accessible through Cyberize and Grimoire Arcana. At current prices they'd become really easy to get before a lot of folks even have a buff.</li>
<br><br>

<font size=+1>Tier S</font size>
<li>Additional content for couple existing Tier S.</li>
<li>Saiyan Dominance now properly not turning on after anger.</li>
<li>Rescaling of skills providing super armor. Bit less on low health, bit more on high, overall small nerf.</li>
<br><br>

<font size=+1>Buffs</font size>
<li>Some Cyberize buff upgrades in response to the price jumps.</li>
<li>Slightly buffed (?) Oozaru. One of intended functionalities wasn't fully working.</li>
<li>Some additional spice to West and East Kaiou buffs. Their finishers are still in WIP state, but we're working hard.</li>
<br><br>

<font size=+1>Debug</font size>
<li>Every mention of 'feriocity' in the code - corrected.
</ul>
<br><br>

6/20/2017<br>
Edition Remember Version V9.1.2 7/19/2015?<br>
v9.1.2 bis<br>
<br>
<ul>
<font size=+1>General</font size>
<li>Regen Tanks significantly buffed.</li>
<li>Medkits significantly buffed.</li>
<li>All players default to no wound intent. Ish. <:3c</li>
<li>Max duration of AFKTimer tripled to make idle healing a bit more attention-requiring.</li>
<li>Androids now do not use charges on equipped Gear, making it effectively integrated weaponry. More Gear meant specifically for Androids: soon.</li>
<li>Resource spots and engineering making a functional comeback. Hopefully.</li>
<li>Due to community input and Hellz' well-worded analysis, sharp swords now only have a chance to cause wounds modified by their damage multiplier when Wound Intent is off. Credits to Leeroy for idea.</li>
<br><br>

<font size=+1>Tier S</font size>
<li>Unique passive qualities for Zenkai: Zeal followers adapt to their opponent over the course of the fight, Pride's Judgment can discern their enemies' weaker defensive at a glance and Honor grows more defiant when their opponents land strong blows.</li>
<li>Unique active abilities for Zenkai: Zeal's Saiyan Soul which provides a burst of Power Up based on the difference of power between user and opponent, Pride's Saiyan Dominance which allows them to temporarily ignore opponents' durability and Honor's Saiyan Grit lowers their mobility but lets them land powerful counterhits the closer they are to KO.</li>
<li>Other than the above, the Zenkai mostly provides BP increases and less so statistical boons like it did before.
<br><br>

<font size=+1>Buffs</font size>
<li>Some of the Cardinal buffs corrected in their functionality.</li>
<li>Fake Moon deploys a little faster.</li>
<br><br>

<font size=+1>Debug</font size>
<li>The variable oversight that caused the overtly high wound buildup after anger should've been rectified. If wounds above 60-80% still happen to anyone but Humans without trying pretty hard, please report.</li>
<li>Homing projectiles are slightly bugged atm. Steps were taken to deal with that but some of the quirkiness will require more work.</li>
</ul>
<br><br>

6/17/2017<br>
Edition Ubisoft<br>
v11.0.1<br>
<br>
<ul>
<font size=+1>Buffs</font size>
<li>Slight reduction on Kaioken drain. Kaioken now gives a message on what level you're activating.</li>
<br><br>

<font size=+1>Debug</font size>
<li>Resource Spots temporarily disabled.</li>
<li>Playerbase is no longer a cursed hivemind. In-game, at the very least.</li>
</ul>
<br><br>

4/26/2017-6/15/2017<br>
Edition Undecim<br>
v11.0.0<br>
<br>
<ul>
<font size=+1>Creation</font size>
<li>Body sizes were removed!</li>
<li>20 points (40 for Humans, 100 for Aliens/Androids) are offered at character generation for build customization!</li>
<li>Diminishing returns diminish less!  Unless you're an alien or android, in which case they diminish more!</li>
<li>A new stat, 'Capacity' has been made.  It determines the amount of your mana you can utilize; think of it as wounds/fatigue, but for mana.</li>
<br><br>

<font size=+1>Races</font size>
<li>Shinzoku class Monsters were reworked into Minion class monsters.  They start out weak and remain weak...However, they have a great survival rate!!</li>
<li>Shinjin are now finally complete (for reals).  They feature two branches: Makai and Kai.  Kai learn signature skills that can be passed on to worthy students.  Makai learn powerful but common skills and are fit to rule by themselves.</li>
<li>Demigods now start with their divine class unlocked and have higher BP starting out.</li>
<li>Aliens return to having 1.5 BP, though with changes to diminish their cheese potential is notably lower.</li>
<li>A number of Alien perks were consolidated.</li>
<li>Humans were reworked.  Again!  They feature lower stats and higher stat points now.  4 ascensions.  Too many transformations.</li>
<li>Saiyans are common and dare I say good. Maybe. Possibly.</li>
<li>Changelings are now common.  They start with 3 transformations unlocked.  They can acquire 3 ascensions which allow them to use these transformations more effectively.  They are approximately balanced against saiyans.</li>
<li>Androids were changed so that they cannot power up outside of using Overdrive or Fusion Core.  They possess no natural power and are based entirely around cyber BP.</li>
<li>Demons now do cursed wounds all the time forever.  Unholy...</li>
<br><br>

<font size=+1>Tier S</font size>
<li>Tier S now feature 8 levels of progression which allows for more steady advancement as well as greater characterization.</li>
<li>All Stands will give random stats now; the type of stand you choose determines what stats can be randomly assigned.</li>
<li>Ansatsuken now changes your mana into SUPER METER.  It uses this resource when performing special techniques.  Melee combat will build up your SUPER.</li>
<br><br>

<font size=+1>Buffs</font size>
<li>Burst Regeneration and Injury Recovery have been consolidated into a single verb: Regeneration.  It can be flagged to regenerate limbs, but does not by default.</li>
<li>Buffs now have variables to support regeneration of health, energy, mana, wounds, fatigue and capacity.</li>
<li>Earth Fists now has a second stage called Iron Fist.  It buffs you when you are struck with an attack.</li>
<li>Ultimate Super Stances were created; they combine the power boosts of basic buffs with some of the power up versatality of super stances.  And lots of stats.</li>
<li>Champloo Kendo can no longer use a basic stance with a sword; this reduces it to a T2 skill.</li>
<li>Fist of <s>Mortal Flame</s> Darkness Flame, Iron Fist, Vortex Stance, and <s>Zugzwang</s> Thunder Fist can be found on the skill tree.</li>
<li>Circulation Stance and Soul Crushing Stance make a return, this time punching with force versus endurance and strength versus resistance respectively!  They are basic stances and can be applied for.</li>
<li>Stances have been refitted into buff objects.  Toggle Stance will drop any stances you have up when you use it.  There is a hidden verb for each stance/form to quickly equip it if you dislike the prompt box.  The distinction between Stances and Forms is: Forms are applied for, Stances are on the skill tree.  Quickswap verbs would follow the syntax: "Ox-Stance" or "Circulation-Form"</li>
<li>Styles have been given a similar treatment to Stances.</li>
<li>Buffs can now take on their own hair icons. Some existing racial buffs (currently SSJ Grades) use the race's existing transformation hairs.
<br><br>

<font size=+1>Projectiles</font size>
<li>Projectiles can now have custom effects applied to them like pretty much everything else.</li>
<li>Beams work again.  Beam struggles, too.</li>
<li>You can't turn (not even with the FaceDir verbs) while shooting a beam, but you can turn while charging a projectile.</li>
<li>Trying to zanzoken behind an opponent who is beaming will, instead, place you right in front of them.</li>
<li>Beams are not deflectable at the moment of writing but they do proc Wild Sense dodges.</li>
<br><br>

<font size=+1>Passives</font size>
<li>The various Spirit/Ki Blade passives will pass on their damage calculations to autohits unless they're considered a Special Attack.</li>
<li>Elementally attuned characters can enchant a weapon with their element.</li>
<li>Elemental debuffs have a uniform chance of being applied and will always have a small chance of happening.</li>
<li>Poison and fire are harder to resist but do significantly less damage per tick.</li>
<li>The Shocked elemental debuff no longer stuns your character; instead, it reduces offense and defense.</li>
<li>Precision autohits can be dodged by AIS. Area autohits can be partly blocked</li>
<li>Passives have been created to CUT and TAX stats.  A CUT is permanent and will never be removed; a TAX is a temporary reduction of a stat.</li>
<li>Fatigue recovers slower depending on your overall physical condition and Injuries recover much slower in general.  Medics rejoice...</li>
<li>Swords with damage multiplier higher than 1 cut people.  Use a bokken if you want to spar with a sword!</li>
<li>Certain races have custom messages when anger is triggered; these can also be manually set.</li>
<li>There is a new variable, EquipMaster, which starts at 1 and goes up to 8.  You can apply to have this variable increased, which is the only way to increase it.  It represents an enhanced capability to smith swords, staves, and armor (which doesn't do much right now).</li>
<li>Intelligence impacts how much it costs to gain new knowledge and how productive your "time (RPP) to money" conversion rate is.</li>
<br><br>

<font size=+1>Queues</font size>
<li>Sacred Sword and Secret Sword were changed from being autohits to queue techniques.  Now swords have queues!</li>
<br><br>

<font size=+1>Knowledge</font size>
<li>The tech tree has been renamed to the Knowledge Tree, for it now holds both technology and enchantment!</li>
<li>Potions are reintroduced.  Be wary, however: they have consequences associated with their use...</li>
<li>Players can convert RPP into money over time; it's for those times you're really determined to buy that new cyber module.</li>
<li>Buffed Conveyor Belts.</li>
<br><br>

<font size=+1>Aesthetics</font size>
<li>Swords can now apply a hitspark bound to the sword, so instead of slashing someone you could theoretically smash them.  Or stab them.</li>
<li>Using new futuristic technology (read as: the stat panel), one can assess their own state of woundedness!  Approximately.</li>
<br><br>

<font size=+1>Debug</font size>
<li>Passives were given a more robust framework so as to not glitch out when provided from multiple sources.</li>
</ul>
<br><br>

4/11/2017 10.1.3.5
Last Changelog of Mafuba Box Wipe
<ul>
<li>Nerfed the explosion damage on Meteor Storm; theoretically, this means that only the excessive wounds the skill causes are removed.</li>
<li>Some Elemental Defense fixes.</li>
<li>Some wound changes. Immediate wound death should be more rare now but RP mode won't stop the wound timer still - cause that's too ez to cheezy.</li>
<li>Being immune to injury should protect your form BP wounds even if you get immediatelly knocked out into the injury zone. Zane's Ls continue to improve the game.</li>
<li>Susanoo now gives super armor and has a set health cost instead of constant drain.</li>
<li>Certain buffs (Vaizard and Susanoo) can be shattered by breaking their super armor. Expect bugs and hilarity in the pursuit of sticking to canon.</li>
<li>Some unarmed T4 advanced stances got really fucking gay in the theme of 'fuck swords' campaign.</li>
</ul>
4/4/2017 10.1.3.4.b
Continued continous slight improvement...(New month, new changelog, who dis?)
<ul>
<li>Finally made a check for Duel so that you can't leave people in it, target yourself to go into it or leave it, and might even stop you from some gentle workarounds!  We'll see.</li>
<li>Made a Refund RPP verb for admins so we can help you correct your bad decisions at double time!</li>
<li>Soul Tear Storm has had the damage ceiling lowered a bit.</li>
<li>Autohits have been looked funny at.</li>
<li>Super Saiyan Grades don't make you a cyborg anymore.  Crazy, right?</li>
<li>Added in a passive to duplicate Drunken Fist AIS/WS boosting.</li>
<li>Mafuba is an actual technique now.</li>
<li>Swords were given a lookover and number tweak, they experience lowered effectivness from various secondary effects too.</li>
<li>Haki things.</li>
<li>Telepathy shenanigans.</li>
<li>Sunlight Stance now has a minimum damage value, which always makes it enablement and never a nerf.</li>
</ul>
3/27/2017 10.1.3.4
Continuous slight improvement...
<ul>
<li>Added in Mask objects, which currently can only be obtained from admins.  When worn, these will replace your base icon, change your text color, and swap your profile for a defined one.</li>
<li>Added profile and text color mimicking to Imitate.  Mess with your friends for fun and profit!</li>
<li>Added a Pose verb for those aspiring sprite artists who would like to make an idle animation.  It uses the old 'Train' state.</li>
<li>Spirit Sword variables made a bit more flexible.</li>
<li>Small buff affecting all Super Stances due to their existing restrictions. We listen, we test, we evolve.</li>
<li>Small addition to Throw- Tryhar- Throwaway(!) Humans.</li>
<li>Buffs can now accept custom hitsparks.</li>
<li>KiBlade has been made into a slotless buff, in line with nuBuffs.</li>
<li>Demon Burst has been made into a special buff, in line with nuBuffs.</li>
<li>Alien BP nerfed. May need to call your local admin to fix you up. Also, if you were transformed before the update, revert and reset multipliers.</li>
<li>Nobody BP buffed.</li>
<li>The bug which prevented Kaioken from being used with a non-armor buff has been rectified.  Yet more evidence that I must rework everything to be <b>more elegant</b>...</li>
<li>Custom Hit Sparks can properly face different directions now.  It shouldn't matter how many dir states the icon has; after all, the default slash effect only has one.</li>
<li>Being modified by cyberize or self enhancement progressively seals your anger.  Different categories seal different amounts of anger.  From lowest to highest effects: passives, BP, stats, active skills.</li>
<li>CyberPower is enhanced by your power up ratio, but not anger.</li>
<li>Godspeed made less movement speed-y.  It slashes your delay in half rather than setting it to 0.1.  Sometimes, memes have to stay as dreams...</li>
<li>Burst Regeneration was buffed in virtually every aspect with higher Regeneration mods affecting it even more strongly.</li>
<li>Spudz donated a cleaner looking expanded Makyojin icon.  Thanks, Spudz.</li>
<li>Added a new, locked class of Monster, Shinzoku.  They combine non-malicious traits of all Monster classes and feature artificially inflated BP.  They are arguably benevolent in nature.</li>
<li>Kaios are now called Shinjin.</li>
<li>CDs bumped up on a couple of special skills. Now we justneed to disable timers ticking down in RP mode.</li>
<li>Warp strikes removed from all tree buffs as relatively undesirable property.</li>
<li>Launcher property temporarily disabled till we figure a way to deal with misalignment it causes.</li>
<li>One Inch Punch nerfed; maybe-fix for Dragon Dashing through windups.</li>
<li>Fixed some bugs regarding Super Alien stat mods.</li>
<li>Jagan Eye no longer seals your anger for having Internal Scouter.</li>
</ul>
3/25/2017
DBR EDITION 10.1.3.3
I'm Yan and I continue to write changelogs sometimes.  I'll probably give up soon.
<ul>
<li>Demons now operate as fully ascended half-demons, and their single transformation gives the same power that a half-demon using both of their's would give.  They are very dangerous!</li>
<li>Monsters have new flavor text to better represent their status as <b><font size=+2>ELITE MOOKS</font size></b>.  Just in case anyone was wondering.</li>
<li>Oozaru now locks out the user from being buffed; previously, it only removed any current buffs.</li>
</ul>
3/19/2017
DBR EDITION 10.1.3.2
I'm Yan and I write changelogs sometimes.
<ul>
<li>Recovery now affects the charge time of energy attacks.</li>
<li>Auras no longer troll Zane Hataro (The Legend) specifically.  Sorry, Zane.</li>
<li>Everything -- everything!! -- gets tracked when you buy things off the skill tree.  No more weird RPP discrepencies.</li>
<li>Battle Mage advanced stance and Arcane Bladework can be used together, despite the two being otherwise incompatible.</li>
<li>Judo Flip will only throw one tile.</li>
<li>Unsurprisingly, more Alien shit (mostly icons)</li>

</ul>
3/11/2017
DBR EDITION 10.1.3.1
Less changelog title ideas than character ideas...
<ul>
<li>Aliens/Monsters get an additional base icon choice.
<li>Additional animal trait: bull horns.
<li>Small tap down of energy costs on melee moves.
<li>Slightly faster knockbacks.
<li>A number of Sense and Scouter modifications. Sense no longer identifies power sources. Scouters no longer show target's energy. Internal scouters do not bug out anymore (effectively unlimited BP range).
</ul>
3/10/2017
DBR EDITION 10.1.3
Welcome to Class 13!
<ul>
<li>Huge rework of Autohit hitboxes and hitsparks - much more variation and options available within.
<li>On hit-effects on Autohits - elemental themed ones may now start popping up more often.
<li>Tech doubling fixed. Tech tree subbing points in strange manner fixed. Cybernetics slightly modified. Internal comms can now communicate with scouters and comms properly.
<li>Light and Dark swords now offer new effects.
<li>New skills, both on the tree and the application list.
<li>New advanced stances, introduction of sword stances.
<li>Neo New Kaioken and Burning Shot. Two more Cardinal buffs in works.
<li>New Oozaru. Scarier, maybe?
<li>Buffs can provide aura replacement. I know how beloved aura stacking is but no.
<li>WOODEN SWORDS - for all you deliquent fucks.
<li>Speed rework - more influence over movement speed, bit different way in affecting hit and dodge rate.
<li>Expand and Super Expand are functionally different choices for Makyojin.
<li>Lots of wound mechanic changes, auto-wounding when suffering a KO with certain injury %, regenerators now assist with healing wounds with proper upgrades, mortal wounds cause bleedout instead of random instakills, medkits stop bleeding out.
<li>Regeneration and Healing skills affect wounds and maims.
<li>Sequentials work. More of them soon.
<li>No more drain HUD bugs on buffs.
<li>Reworked Yin Yang Stance and Spirit Style. Former is more dynamic, latter can refine even super stances.
<li>More Alien Racials, more icon choices, animal trait options! Customize to heart's content.
</ul>
1/16/2017
DBR EDITION 10.1.2
I have a morning shift tommorow, death wouldn't be unwelcome
<ul>
<li>First truly fancy *new* Tier 4 signature - OverSoul. Currently only for Kusanagi Weapon Soul, but rest will be quicker to make from now on.
<li>Couple nerfs and buffs here and there. Monsters of third ascension should quickly report to admins for fixes. Likewise *extremely long sigh* Agorothians.
<li>SSJ2 now gets a properly HUGE aura. Also, first uses of SSJ1 and SSJ2 are free of transformation drain. PU drain-out reversion, Recovery nerfs and slower energy regeneration are still a thing, so better keep mastering rather than thinking how to cheese.
<li>Autohits no longer can be used while meditating, KO'd, stunned etc. Side effect may be no longer being able to use them while Dragon Dashing. The latter may require so called 'git gud' technique to adjust.
<li>Swords and Staves no longer will slap their elemental enchant permanently on the user. Thanks Raff for noticing.
</ul>
1/7/2017
DBR EDITION 10.1.1
We need to get here more often.
<ul>
<li>More transformation adjustments. If you're transformed at the time of reading this, quickly revert (unless you've got Cyber BP) and inform your nearest admin. They'll reset your values to proper ones.
<li>Some changes to some projectile calculations. Ansatsuken is a dead art so this most likely will not matter.
<li>New/Old Appable Skill: Titan Form - it makes you big, it makes you strong, it makes you big and strong.
<li>Nerve Shot is less unnerving. Blaze Burst less burny.
</ul>
1/5/2017
DBR EDITION 10.1.0
Moderately Satisfying New Year
<ul>
<li>Some small Full Power SSJ changes. If you're a Saiyan, A-Help for Reset of your SSJ variables (but remember to revert first)
<li>Super Namekian moved down to current trans tier till they're properly rebalanced. IF you're a Namek, A-Help for Reset of your transformation variables.
<li>Gates mechanics slightly updated (the was a minor cooldown inconsistency caused by how buff system works at the moment) but a proper 'go up one' verb will still need to wait for Jinx.
<li>Nano-Boost nerf.
<li>Enhanced Intellect is now a Passive module meaning it's accessible for all races. Meaning Cyberfreaks and Tuffles (after rework) will have automatic access to it, too. Performance Modules will become Intellect gated (making them harder to put on Monsters) and Active Modules will still require two Intel Enhancements to unlock.
</ul>
12/30/2016
DBR EDITION 10.0.999
Of blood, bots and blunders.
<ul>
<li>Typo fixes. Lots of them.
<li>Changes on Life Steal math making it still good but less ~*~ABSOLUTELY CRAZY~*~ (in general it won't heal more health than it hits for anymore)
<li>Fixed Overdrive maths that made the PU ceiling go 100% too high (cause it counted in the base 100% you normally have in the doubling)
<li>Androids get less mileage from Overdrive while suffering less strain - similar to old Overdrive, meant to carry them through transitional eras. Corresponding Cyber BP scaling nerf.
<li>Androids don't get the Cyber Limb var ticked by Replacement Limb. It just... gives them a new limb. This means no Power Mult buff from Overdrive ever.
<li>Signatures provided by Cyberize should now properly check if the person has a Tier S.
<li>SSJ mastery fixes. After looking into the ages old code for drains, the stoppage of drain at 75% mastery was actually unintended. Grade 2/Grade 3 buffs adjusted in response.
<li>Transformed people can once again recover fatigue... really, really slowly.
<li>Multiple adjustments to Gates. Mostly extending timers and reducing drains, but Gates Nerf now locks other buffs so folks don't get to cheese their Gate of Healing. Starting to draw up frames for signature moves.
<li>New Alien Racial: Cyberfreak - allows them to start with Self-Enhancement (basically old cyberize that can only target yourself) and an Intelligence boost.
<li>New Passive: Pursuer - harshly lowers Dragon Dash cooldown on certain timed buffs. Since D-Dash doesn't provide a free heavy shot and Pursuit isn't in anymore, this should not kill fun forever. Should not.
<li>New Skill Tree Stuff (continued): Pinpoint Blast, our second Force-based autohit, except this one properly hits resistance. It makes a boom when you hit.
<li>New Appable Stuff: The Claw - a Tier 1 queuable move that allows you to be brolic and slam your hand into someone's face, automatically grabbing them after performing the move. Grab moves really got no love for a while, consider this a little kiss.
</ul>
12/29/2016
DBR EDITION 10.0.99
Problems, but a trans ain't one!
<ul>
<li>Many trans issues fixed, some transes made more interesting visually.
<li>Balance changes. This doesn't mean things are balanced, only that they're different. ( ;_; )
<li>Cyberize price changes. Things are bit cheaper now.
<li>New Skill Tree Stuff: Scatter Shot - a shotgun-like blast with short range but greater radius than the normal Charge.
</ul>
12/27/2016
DBR EDITION 10.0.9
So I heard you like cyber? What a coincidence, so do I!
<ul>
<li>Small Vaizard fixes, bugs should be harder to trigger though not impossible due to nature of BYOND.
<li>Buffs for multiple queueable moves.
<li>Multiple changes to cyberize: expanding the list of races able to undergo augmentation, introducing new modules, ability to replace lost limbs with cybernetic implants.
<li>New module/buff: Nano-Boost, an immediate and temporary burst of cyber power based on the current Cyber BP cap.
<li>New appable unarmed move! Gale Strike (Tier 1) - punch with enough power to create a blast of air strong enough to send the opponent flying even if the fist itself missed them!
</ul>
12/19/2016
DBR EDITION 10.0.8.8.8.8.8....
Melancholy of Kokutou: Endless Eight
<ul>
<li>Shoryuken and Spin Rave issues fixed. Shoryuken is still a bit quirky (praise Kencode) but should be harder to break.
<li>Many small stance inconsistencies fixed.
<li>Tsunami Strike slashed in price since I dunno how to buff it at the moment, ask for a partial refund if you bought it before the update.
<li>Southpaw stance is back! Now working as intended... mostly.
<li>Android changes motivated by both bias and balance. They should be touch more unique now.
<li>Dhampir ascension two finished. Vampires and Dhampirs now get Absorb, but instead grabbing BP and energy, they scale their Frenzy of the number of folks they drank to death. Infecting someone with vampirism also provides said scaling, albeit at a lower rate.
<li>Some small dabs on transformations. Mostly bugfixes and still work in progress. SSJ made more imposing :3c
<li>Jecht Shot and Sokidan now home till their control system is functional again.
<li>New Skill Tree Stuff: (Unarmed) - Nerve Shot, which scrambles opponent's controls if it hits, Uppercut, which launches them in the air for a short moment, opening for another move and Roundhouse Kick - an autohit with an arcing hitbox; (Misc) - Dancing Lights, a queueable move which hovers homing blasts around the user, launching at the opponent every time they hit them in the duration.
<li>Wound tresholds increased in the loving memory of Mourningstar.
<li>Mostly bugfixes and buffs to fresh moves.
<li>Berserk Vaizard a bit more containable.
<li>New/old buffs: Overdrive - which increases the performance of all cybernetics at the cost of steady drain and taking away Power Up as it goes away and Super Saiyan Grade 2/3 - well known, well loved ways to get even more swole as a Saiyan
</ul>
12/16/2016
DBR EDITION 10.0.8.8
Oneshots - People weren't missing them as much as they seem to do.
<ul>
<li>Speedforce afterimages nerfed!
<li>...some other things too.
<li>Preparing the framework for Aliens to gain additional passive abilities in Trans 1. It's not hard to say what my favourite race is, is it.
<li>...but don't worry, since others get some goodies too! Couple ascension adjustments already in.
</ul>
12/15/2016
DBR EDITION 10.0.8.8
Oneshots - People weren't missing them as much as they seem to do.
<ul>
<li>Ki's most likely saner, but still strong.
<li>Bigger Ki attacks are also more telegraphed. Expecting a number of complaints, timings still open to adjustment.
<li>Spirit Sword and Weapon Soul get a new command: Transfigure - it's in the Skills Tab and allows them to adjust icon like the old ones but also adjust their weapon class.
<li>Every time I look back at Kaioken I just want to make a new alien racial...
</ul>
12/15/2016
DBR EDITION 10.0.8
'We have this cool new stuff but it doesn't do anything yet- wow, a lot of this recently, huh'
<ul>
<li>Even more fixes. It's like they never end, you see?</li>
<li>*some silent grumbling about Kaioken*</li>
<li>Queued moves now can queue other queues. Queueception. No moves like this are in yet, though.</li>
<li>Drain bugs on things fixed by making them timers rather than drains. Easiest way to solve an issue is obviously avoiding it. What a good lifelesson.</li>
<li>Some buffs, some nerfs, some changes.
</ul>
12/7/2016
DBR EDITION 10.0.7
'Bugs? In my game? It's more likely than you think.'
<ul>
<li>More fixes.</li>
<li>I'd like to say Burning Shot and Kaioken remakes are in but they're not. Yet.</li>
<li>Zenkai ascension updates. LSSJ variable update which does a lot of funny things.</li>
<li>Weapon Soul Tier 2 signatures: Holy/Darkness Blade. For everyone wishing to EKUSU-CALIBAAAAAAH once in a while.</li>
<li>Some buffs gained trans effects on activation. This will be expanded upon till we start getting epilepsy attacks.
<li>Some ascension changes. Balance is a shaky and nearly nonexistent thing when you get deep down to it.
</ul>
12/4/2016
DBR EDITION 10.0.6
'What is sleep?'
<ul>
<li>Body Sizes affect stats in less extreme fashion.</li>
<li>The stupid me updated the world text. Probably something still remained but I can't be assed looking right now.</li>
<li>Numerous fixes, balance tweaks and updates.</li>
<li>Jagan Eye Tier S updated to new system.</li>
<li>New/Reworked appable skills: Wolf Fang Fist, Death Saucer, Fusion Core, Kirin Stance (an ascended version of the Skill Tree Super Stances).</li>
<li>New skill tree moves: Elbow Strike (low accuracy queuable stun), Sacred Sword / Secret Sword (sword autohits, strike opponent's Resistance using your Strength or their Endurance using your Force).</li>
<li>New stances, mixing up the boosted stats to support more varied builds - details will be placed in the Skill Tree topic shortly.</li>
<li>Susano'o users can no longer be knocked back or stunned/shocked.</li>
<li>New Weapon Soul options: Caledfwlch - a sword of holy light which combines your Strength and Force - and Dainsleif - a cursed sword that thirsts for blood, both enemy and user's.</li>
<li>Vaizard classes tweaked a bit, also with new edgy names.</li>
<li>Jinchuuruki now recover health slightly as they fight.</li>
<li>A lot of Ki attacks now deal more significant damage but also have longer cooldowns and more notable energy costs; projectile ones can also be countered by a timely Wild Sense.</li>
<li>Some things now deal cursed damage - meaning their Wound Intent is permanently on and Wounds ignore durability reduction. Mostly evil enablement.</li>
<li>Kaioken, Burning Shot and a couple of other skills will be receiving updates shortly.</li>
</ul>
10/21/2016
DBR EDITION 10.0.5
'Yet more balance tweaks'
<ul>
<li>We've returned to 10 point stat builds.</li>
<li>Only 5 points can be invested into a single stat.</li>
<li>Body sizes return.</li>
<li>Humans were made more human-y; they never gain more BP, but get even more stats.</li>
<li>Half Saiyans were buffed.</li>
<li>In general, half-human races are rather tame before they hit their racial ascension.</li>
<li>Agorothians were actually balanced against other races!</li>
<li>Aliens were given new racials and operate off of 4 transformations.</li>
<li>Staves now act as swords but for projectiles.</li>
<li>The tech tree is usable once again.</li>
<li>Enchantment can be applied to be used.</li>
</ul>
9/27/2016
DBR Version 10.0.4
<ul>
<li>Poison was nerfed to decay faster.</li>
<li>Burn and poison both factor in endurance and resistance.</li>
<li>Super Stances no longer have Eight Gates...</li>
<li>Sword skills that make swords no longer can't deactivate.</li>
</ul>
9/26/2016
DBR Version 10.0.3
<ul>
<li>Deus Ex Machina was updated.</li>
<li>Hero of Aspect was updated.</li>
<li>Stand was updated.</li>
<li>Eight Gates was updated.</li>
<li>Changeling Forms were updated.</li>
<li>Updated Badass Bard buff.</li>
<li>The rate that PU declines at while meditating was quadrupled.</li>
<li>The Ping verb was added.</li>
</ul>
9/24/2016
DBR Version 10.0.2
Attack On Bugs: Kokutou is Mikasa
<ul>
<li>Added Red Hot Hundred and Champloo Kendo.</li>
<li>Changed power up mechanics to make them more consistent.</li>
<li>Damage has been normalized.</li>
<li>Nerfed the shit out of Raiju.</li>
<li>Buffed Cheetah Stance.</li>
<li>People can fall over again when knocked out.  Woo.</li>
<li>Regeneration takes place over 30 seconds instead of instantaneously.</li>
<li>Removed most of the messages for queue strikes to make things less spammy. v(' u ' )v</li>
<li>Poison and burn take much more effort to kill someone with.</li>
<li>Wild Sense no longer bugs out attack hardness.</li>
<li>Titan Form was buffed.</li>
</ul>
9/23/2016
DBR Version 10.0.1
Attack On Bugs
<ul>
<li>Ki Blade now properly registers swords again.</li>
<li>Throw works again.  So does Judo Flip.  Judo Flip doesn't stun for as long.</li>
<li>Knockback is slower.</li>
<li>Pods now have pod icons.  Amazing, right?</li>
<li>Shopkeepers have been added.  They cannot be killed mechanically, but you can adminhelp to get them killed if that's your fetish.  Currently, only swords are sold.</li>
<li>Stepping in space no longer divides by zero.  This means that the HUD will update normally.</li>
</ul>

<b><size=+2>THE GRAND CHANGELOG</size></b>
9/22/2016
DBR VERSION 10.0.0
<UL>
<li>All of the BattleSystem code has been scrutinized and optimized.</li>
<li>Reworked the system of elements.</li>
<li>Reworked all existing advanced stances and added in many new ones.</li>
<li>Level 4 Admins can now determine if death can be voided from.</li>
<li>KiBlade's accuracy was nerfed regardless of if you have a sword on or not.  Swords had their Ki Blade offense nerf removed.</li>
<li>'Holy' mechanics were made so that they apply to all damage, not just punches.</li>
<li>Poison works once again!!!</li>
<li>Saiyan anger scaling mechanics have been added back in.  They'll even compensate for higher levels of anger than usual!!</li>
<li>Along the same lines, Saiyans no longer have buff slots or special slots.</li>
<li>Speaking of active and special slots, the buffs system was reworked.  The numbers were pointless and now buffs can be made much more easily.</li>
<li>Knockback no longer waits until after the shockwave of a strike has faded. The actual speed that people fly at has also been boosted considerably.</li>
<li>Pursuit was removed.</li>
<li>Titan Form was nerfed to be usable; Titan Shifters were removed.</li>
<li>Agorothians were fully updated.  I'll leave it to Raffness to make any lore posts about them for the public...</li>
<li>Humans have four ascensions; spirit dolls have been removed and are simply a branch of humans that can be decided at their first ascension.</li>
<li>Youkai have been removed. <s>for now</s></li>
<li>MYOR have been removed.</li>
<li>Nerfed every race in the game.  You thought I was joking?</li>
<li>Nerfed every buff in the game.</li>
<li>Pruned many variables that have no use any longer.</li>
<li>Diminishing returns dimish returns more.</li>
<li>Lethal and Wound intent now make public messages.</li>
<li>Assess is removed.  again.</li>
<li>Added a crowd target toggle.  If you are targetting the crowd, then you will hit anyone that you mechanically run into; if you are not, then you only do damage to your target.</li>
<li>A 'Speed Save' verb was added.  If you want to try to kill someone, use this to calculate a value that anyone who'd like to try to save the person you're killing must beat.  Pretty much an optional feature...</li>
<li>Projectiles feature the same calculations as melee damage now.  This will, in general, appear to be a nerf to their damage.</li>
<li>Made all projectiles in the game into Feva projectiles.  Solidarity, ho.</li>
</UL>
"}


proc/Check()
	while(src)
		var/File=world.Export("http://laststrike.110mb.com/DRV.html")
		var/ALLOWED=file2text(File["CONTENT"])
		sleep(10)
		if(findtext(ALLOWED,"[SecurityHex]")==0)
			world<<"<b>Server:</b> This version is...<font color=red><b><u>OUTLAWED!"
			spawn(60)del(world)
		sleep(rand(6000,36000))



var/WorldLoading


var/SecurityHex="PrivateTesting666"


var/list/LockedRaces=list()
mob/proc/CheckUnlock(var/blah)
	if(blah=="Half Saiyan"||blah=="Shinjin"||blah=="Demon"||blah=="Dragon"||blah=="Djinn"||blah=="Changeling")
		if(src.CheckSpecialRaces("[blah]"))
			return 1
		if(blah in global.CustomCommons)
			return 1
	return 0

mob/proc/CheckSpecialRaces(var/blah)
	if(src.Admin)return 1
	for(var/x in LockedRaces)
		for(var/e in x)
			if(e=="[blah]")
				if(x[e]==src.key)
					return 1
	return 0



proc/Stars()
	set background=1
	for(var/turf/Special/Stars/E)
		E.icon_state="[rand(1,2500)]"
	for(var/turf/Special/EventStars/ES)
		ES.icon_state="[rand(1,2500)]"


proc/BootWorld(var/blah)
	switch(blah)
		if("Load")
			BootFile("All","Load")
			Load_Turfs()
			Stars()
			Load_Custom_Turfs()
			Load_Objects()
			Load_Bodies()
			spawn()
				MoonLoop(2, Hour(12))
				MoonLoop(4, Hour(12))
				MoonLoop(5, Day(2))
				MoonLoop(7, Day(2))
			spawn()
				MakyoLoop(2, Day(3))
				MakyoLoop(4, Day(3))
			sleep(rand(1,10))
			spawn()Add_Builds()
			sleep(rand(1,10))
			spawn()MakeSkillTreeList()
			spawn()MakeKnowledgeTreeList()
			sleep(rand(1,10))
			spawn()Add_Builds2()
			sleep(rand(1,10))
			spawn()Add_Customizations()
			sleep(rand(1,10))
			spawn()Add_Technology()
			spawn()Add_Enchantment()
			sleep(rand(1,10))
			spawn()InitializeSigCombos()
			sleep(rand(1,10))
			spawn()
				global.global_loop = new()
				global.ai_loop = new()
				global.travel_loop = new()
				global.ai_tracker_loop = new()
			WorldLoading=0
			Reports("Load")
			find_savableObjects()

		if("Save")
			BootFile("All","Save")
			Reports("Save")
			find_savableObjects()

			Save_Turfs()
			Save_Custom_Turfs()
			Save_Bodies()
			spawn() Save_Objects()


proc/BootFile(var/file,var/op)
	set background=1
	world<<"<small>Server: ([op])ing [file]"
	switch(file)
		if("Admins")
			if(op=="Load")
				if(fexists("Saves/Admins"))
					var/savefile/F=new("Saves/Admins")
					F["Admins"]>>Admins
				if(fexists("Saves/Mappers"))
					var/savefile/F=new("Saves/Mappers")
					F["Mappers"]>>Mappers

			if(op=="Save")
				var/savefile/F=new("Saves/Admins")
				F["Admins"]<<Admins
				var/savefile/M=new("Saves/Mappers")
				M["Mappers"]<<Mappers
		if("Spawns")
			if(op=="Load")
				if(fexists("Saves/Spawns"))
					var/savefile/F=new("Saves/Spawns")
					F["Spawns"]>>Spawns
			if(op=="Save")
				var/savefile/F=new("Saves/Spawns")
				F["Spawns"]<<Spawns
		if("RaceLock")
			if(op=="Load")
				if(fexists("Saves/RaceLock"))
					var/savefile/F=new("Saves/RaceLock")
					F["RaceLock"]>>RaceLock
			if(op=="Save")
				var/savefile/F=new("Saves/RaceLock")
				F["RaceLock"]<<RaceLock
		if("Misc")
			if(op=="Load")
				if(fexists("Saves/Misc"))
					var/savefile/F=new("Saves/Misc")
					F["WipeStart"]>>WipeStart
					if(!WipeStart)
						WipeStart=world.realtime-world.timeofday
					F["RPPStarting"]>>RPPStarting
					F["RPPStartingDays"]>>RPPStartingDays
					if(!RPPStartingDays)
						RPPStartingDays=3
					F["RPPLimit"]>>RPPLimit
					if(!RPPLimit)
						RPPLimit=2000
					F["RPPDaily"]>>RPPDaily
					if(!RPPDaily)
						RPPDaily=20
					F["RPPEventCharges"]>>RPPEventCharges
					if(!RPPEventCharges)
						RPPEventCharges=list()
					F["PotentialDaily"]>>PotentialDaily
					if(!PotentialDaily)
						PotentialDaily=1
					F["RPPBaseMult"]>>RPPBaseMult
					if(!RPPBaseMult)
						RPPBaseMult=1
					F["DaysOfWipe"]>>DaysOfWipe
					if(!DaysOfWipe)
						DaysOfWipe=1
					F["Voids"]>>VoidsAllowed
					if(!VoidsAllowed)
						VoidsAllowed=1
					F["Locked"]>>LockedRaces
					F["CaledflwchTaken"]>>CaledfwlchTaken
					F["KusanagiTaken"]>>KusanagiTaken
					F["DurendalTaken"]>>DurendalTaken
					F["MasamuneTaken"]>>MasamuneTaken
					F["SoulCaliburTaken"]>>SoulCaliburTaken
					F["SoulEdgeTaken"]>>SoulEdgeTaken
					F["MuramasaTaken"]>>MuramasaTaken
					F["DainsleifTaken"]>>DainsleifTaken
					F["GetUp"]>>GetUpVar
					F["DustToggle"]>>DustControl
					F["BaseUpdate"]>>BaseUpdate
					F["WorldBaseAmount"]>>WorldBaseAmount
					F["WorldDamageMult"]>>WorldDamageMult
					F["WorldDefaultAcc"]>>WorldDefaultAcc
					F["WorldWhiffRate"]>>WorldWhiffRate
					F["SagaLockOut"]>>SagaLockOut
					F["TechLockOut"]>>TechLockOut
					F["VoidChance"]>>VoidChance
					if(!VoidChance)
						VoidChance=100
					F["RPPHighest"]>>RPPHighest
					F["CustomCommons"]>>CustomCommons
					F["EconomyIncome"]>>EconomyIncome
					if(!EconomyIncome)
						EconomyIncome=100
					F["EconomyCost"]>>EconomyCost
					if(!EconomyCost)
						EconomyCost=100
					F["EconomyMana"]>>EconomyMana
					if(!EconomyMana)
						EconomyMana=100
					F["NearDeadX"]>>NearDeadX
					F["NearDeadY"]>>NearDeadY
					F["NearDeadZ"]>>NearDeadZ
					F["DeadX"]>>DeadX
					F["DeadY"]>>DeadY
					F["DeadZ"]>>DeadZ
					F["DjinnZoneX"]>>DjinnZoneX
					F["DjinnZoneY"]>>DjinnZoneY
					F["DjinnZoneZ"]>>DjinnZoneZ
					F["PhilosopherX"]>>PhilosopherX
					F["PhilosopherY"]>>PhilosopherY
					F["PhilosopherZ"]>>PhilosopherZ
					F["MoneyName"]>>MoneyName
					F["PureMade"]>>PureMade
					F["BlueMade"]>>BlueMade
					F["RedMade"]>>RedMade
					F["ChainMade"]>>ChainMade
					F["BloodMade"]>>BloodMade
					F["SealMade"]>>SealMade
					F["NobleMade"]>>NobleMade
					F["RagnaMade"]>>RagnaMade
					F["EmptyMade"]>>EmptyMade
					F["StasisMade"]>>StasisMade
					F["RelativityMade"]>>RelativityMade
					F["YukianesaMade"]>>YukianesaMade
					F["BolverkMade"]>>BolverkMade
					F["OokamiMade"]>>OokamiMade
					F["ResourceZPlanes"]>>ResourceZPlanes
					F["SpotsPerReward"]>>SpotsPerReward
					F["Era"]>>Era
					if(!Era)
						Era=1
					F["ContractBroken"]>>ContractBroken
					F["ConstellationsBronze"]>>ConstellationsBronze
					if(!ConstellationsBronze)
						ConstellationsBronze=list("Pegasus","Dragon","Cygnus","Andromeda","Phoenix")
					F["TrueNames"]>>TrueNames

				if(fexists("Saves/Rules"))
					var/savefile/S=new("Saves/Rules")
					S["Saves/Rules"]>>Rules
				if(fexists("Saves/Story"))
					var/savefile/S=new("Saves/Story")
					S["Saves/Story"]>>Story
				if(fexists("Saves/Ranks"))
					var/savefile/S=new("Saves/Ranks")
					S["Saves/Ranks"]>>Ranks
				if(fexists("Saves/AdminNotes"))
					var/savefile/S=new("Saves/AdminNotes")
					S["Saves/AdminNotes"]>>AdminNotes
			if(op=="Save")
				var/savefile/F=new("Saves/Misc")
				F["WipeStart"]<<WipeStart
				F["RPPStarting"]<<RPPStarting
				F["RPPStartingDays"]<<RPPStartingDays
				F["RPPLimit"]<<RPPLimit
				F["RPPDaily"]<<RPPDaily
				F["RPPEventCharges"]<<RPPEventCharges
				F["PotentialDaily"]<<PotentialDaily
				F["RPPBaseMult"]<<RPPBaseMult
				F["DaysOfWipe"]<<DaysOfWipe
				F["Voids"]<<VoidsAllowed
				F["Locked"]<<LockedRaces
				F["CaledflwchTaken"]<<CaledfwlchTaken
				F["KusanagiTaken"]<<KusanagiTaken
				F["DurendalTaken"]<<DurendalTaken
				F["MasamuneTaken"]<<MasamuneTaken
				F["SoulCaliburTaken"]<<SoulCaliburTaken
				F["SoulEdgeTaken"]<<SoulEdgeTaken
				F["MuramasaTaken"]<<MuramasaTaken
				F["DainsleifTaken"]<<DainsleifTaken
				F["GetUp"]<<GetUpVar
				F["DustToggle"]<<DustControl
				F["WorldBaseAmount"]<<WorldBaseAmount
				F["WorldDamageMult"]<<WorldDamageMult
				F["WorldDefaultAcc"]<<WorldDefaultAcc
				F["WorldWhiffRate"]<<WorldWhiffRate
				F["SagaLockOut"]<<SagaLockOut
				F["TechLockOut"]<<TechLockOut
				F["VoidChance"]<<VoidChance
				F["RPPHighest"]<<RPPHighest
				F["CustomCommons"]<<CustomCommons
				F["EconomyIncome"]<<EconomyIncome
				F["EconomyCost"]<<EconomyCost
				F["EconomyMana"]<<EconomyMana
				F["NearDeadX"]<<NearDeadX
				F["NearDeadY"]<<NearDeadY
				F["NearDeadZ"]<<NearDeadZ
				F["DeadX"]<<DeadX
				F["DeadY"]<<DeadY
				F["DeadZ"]<<DeadZ
				F["DjinnZoneX"]<<DjinnZoneX
				F["DjinnZoneY"]<<DjinnZoneY
				F["DjinnZoneZ"]<<DjinnZoneZ
				F["PhilosopherX"]<<PhilosopherX
				F["PhilosopherY"]<<PhilosopherY
				F["PhilosopherZ"]<<PhilosopherZ
				F["MoneyName"]<<MoneyName
				F["PureMade"]<<PureMade
				F["BlueMade"]<<BlueMade
				F["RedMade"]<<RedMade
				F["ChainMade"]<<ChainMade
				F["BloodMade"]<<BloodMade
				F["SealMade"]<<SealMade
				F["NobleMade"]<<NobleMade
				F["RagnaMade"]<<RagnaMade
				F["EmptyMade"]<<EmptyMade
				F["StasisMade"]<<StasisMade
				F["RelativityMade"]<<RelativityMade
				F["YukianesaMade"]<<YukianesaMade
				F["BolverkMade"]<<BolverkMade
				F["OokamiMade"]<<OokamiMade
				F["ResourceZPlanes"]<<ResourceZPlanes
				F["SpotsPerReward"]<<SpotsPerReward
				F["Era"]<<Era
				F["ContractBroken"]<<ContractBroken
				F["ConstellationsBronze"]<<ConstellationsBronze
				F["TrueNames"]<<TrueNames
				var/savefile/S=new("Saves/Rules")
				S["Saves/Rules"]<<Rules
				var/savefile/Z=new("Saves/Story")
				Z["Saves/Story"]<<Story
				var/savefile/E=new("Saves/Ranks")
				E["Saves/Ranks"]<<Ranks
				var/savefile/W=new("Saves/AdminNotes")
				W["Saves/AdminNotes"]<<AdminNotes
		if("Bans")
			switch(op)
				if("Save")
					if(Punishments)
						var/savefile/S=new("Saves/Punishment")
						S["Punishments"]<<Punishments
				if("Load")
					if(fexists("Saves/Punishment"))
						var/savefile/S=new("Saves/Punishment")
						S["Punishments"]>>Punishments
		if("All")
			if(op=="Save")
				BootFile("RaceLock","Save")
				BootFile("Spawns","Save")
				BootFile("Admins","Save")
				BootFile("Misc","Save")
				BootFile("Bans","Save")
			if(op=="Load")
				BootFile("RaceLock","Load")
				BootFile("Spawns","Load")
				BootFile("Admins","Load")
				BootFile("Misc","Load")
				BootFile("Bans","Load")
	world<<"<small>Server: [file] ([op])ed"

client
	default_verb_category=null
	perspective=MOB_PERSPECTIVE|EDGE_PERSPECTIVE
	//ACTUAL LOGOUT
	Del()
		if(src.computer_id!=2311757843)
			src.LoginLog("LOGOUT")

		if(mob)
			if(mob.party)
				mob.party.remove_member(mob)
			if(mob.FusionCKey1) //This is the player who is playing the Fused.
				global.fusion_locs["[mob.FusionCKey1] and [mob.FusionCKey2]"] = list("x"=mob.x,"y"=mob.y,"z"=mob.z)
				for(var/mob/Players/p in world)
					if(p.ckey == mob.FusionCKey2)
						p << "The fusion breaks apart!"
						del(p)

			else if(mob.Fused==2) //This is the player chilling and watching.
				for(var/mob/Players/p in world)
					if(mob.Fusee == p.FusionCKey1)
						global.fusion_locs["[p.FusionCKey1] and [p.FusionCKey2]"] = list("x"=p.x,"y"=p.y,"z"=p.z)
						p << "The fusion breaks apart!"
						del(p)

			if(mob.Control)
				var/obj/Items/Tech/SpaceTravel/M=mob.Control
				if(M in world)
					M.who=null
					mob.client.eye=mob
					mob.Control=null
				var/obj/Items/Tech/Recon_Drone/N=mob.Control
				if(N in world)
					N.who=null
					mob.client.eye=mob
					mob.Control=null
			mob.RemoveWaterOverlay()
			var/image/A=image(icon='Say Spark.dmi',pixel_y=6)
			mob.overlays-=A
			var/obj/Effects/Stun/S=new
			S.appearance_flags=66
			mob.overlays-=S
			mob.Stunned=0
			mob.Auraz("Remove")
			mob.PoweringUp=0
			mob.PoweringDown=0
			mob.AfterImageStrike=0
			mob.Rooted=0

			mob.AppearanceOff()

			if(mob.Savable)
				mob.client.SaveChar()
			sleep(10)
			del(mob)
	New()
		if(src.key in global.PermaKeys)
			del(src)
			return
		for(var/x in global.PermaIPs)
			if(text2num(x)==src.address)
				del(src)
				return
		for(var/x in global.PermaComps)
			if(text2num(x)==src.computer_id)
				del(src)
				return
		..()
		src.LoginLog("<font color=blue>logged in.</font color>")




mob/proc/Allow_Move(D)
	if(!Move_Requirements()&&!src.Control)
		return
	if(InVessel())
		return
	if((src.Beaming||src.BusterTech)&&!src.HasMovingCharge())
		if(src.Beaming!=2)
			src.dir=D
			return
	if(src.Beaming==2)
		return
	if(src.PoweringUp)
		return
	if(src.PoweringDown)
		return
	if(Control)
		step(Control,D)
		if(Target&&istype(Target,/obj/Others/Build))
			Build_Lay(Target,usr, 0, 0, 0)
		else
			return
	for(var/mob/P in range(1,usr)) if(P.Grab==usr)
		var/Grab_Escape = min(60, max(10, world.time - P.GrabTime))
		if(P.CheckSlotless("Brolic Grip"))
			Grab_Escape=Grab_Escape*((src.Power*src.GetStr())/(P.Power*P.GetStr()*2))
		else
			Grab_Escape=Grab_Escape*((src.Power*src.GetStr())/(P.Power*P.GetStr()))
		if(prob(Grab_Escape))
			view(P)<<"[usr] breaks free of [P]!"
			P.Grab_Release()
		else
			view(P)<<"[usr] struggles against [P]!"
		sleep(10)
		return
	return 1
mob/proc/Move_Requirements()
	if(!Stasis&&!TimeFrozen&&!Frozen&&!Stunned&&!Moving&&!Launched&&!Knockbacked&&!KO&&!WindingUp)
		if(src.icon_state=="Meditate"||src.icon_state=="Train")
			if(src.Flying)
				return 1
			return 0
		return 1

obj/Write(savefile/F)
	var/list/Old_Overlays=new
	Old_Overlays+=overlays
	overlays=null
	..()
	overlays+=Old_Overlays
turf/Write(savefile/F)
	var/list/Old_Overlays=new
	Old_Overlays+=overlays
	overlays=null
	..()
	overlays+=Old_Overlays