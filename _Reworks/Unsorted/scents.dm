mob/proc/setUpScent()
    switch(usr.Target.Race)
        if("Human")
            custom_scent=pick("Sweat","Gamer Musk","Flowery","Cologne")
        if("Namekian")
            custom_scent="Grass"
        if("Saiyan")
            custom_scent="Musk"
        if("Makyo")
            custom_scent="Garlic"
        if("Tuffle")
            custom_scent="Oil"
        if("Alien")
            if(usr.Target.Class=="Brutality"||usr.Target.Class=="Tenacity")
                custom_scent="Musk"
            if(usr.Target.Class=="Harmony"||usr.Target.Class=="Equanimity")
                custom_scent="Incense"
            else
                custom_scent="Exotic"
        if("Monster")
            if(usr.Target.Class=="Yokai")
                custom_scent="Incense"
            else if(usr.Target.Class=="Eldritch")
                custom_scent="Ocean"
            else
                custom_scent="Musk"
        if("Android")
            custom_scent="Metal"
        if("Changeling")
            custom_scent="Acrid"
        if("Shinjin")
            custom_scent="Fruit"
        if("Demon")
            custom_scent="Brimstone"
        if("Majin")
            switch(usr.Target.Class)
                if("Innocent")
                    custom_scent="Chocolate"
                if("Super")
                    custom_scent="Gum"
                if("Unhinged")
                    custom_scent="Candy"
        if("Dragon")
            custom_scent="Ozone"
    if(custom_scent!="Overwhelming")
        if(usr.Target.HasHellPower())
            custom_scent="Brimstone"
        if(usr.Target.HasJagan())
            custom_scent="Death"
        if(usr.Target.HasMechanized())
            custom_scent="Metal"
        if(usr.Target.Secret=="Ripple"||usr.Target.Secret=="Senjutsu")
            custom_scent="Grass"
        if(usr.Target.Secret=="Vampire"||usr.Target.Secret=="Werewolf")
            custom_scent="Blood"
        if(usr.Target.Secret=="Necromancer"||usr.Target.Secret=="Zombie")
            custom_scent="Decay"