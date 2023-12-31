/mob/proc/MultiStrike(secondStrike, thirdStrike)
    if(!AttackQueue)
        var/dblProb = 15 * GetDoubleStrike()
        var/tripleProb = 25 * GetTripleStrike()
        if(HasDoubleStrike())
            if(prob(dblProb + tripleProb) && !secondStrike)
                log2text("Double Strike", "Double Strike proc'd", "damageDebugs.txt", "[ckey]/[name]")
                Melee1(SecondStrike=1)
            if(HasTripleStrike())
                if(prob(tripleProb) && !thirdStrike && secondStrike)
                    log2text("Triple Strike", "Triple Strike proc'd", "damageDebugs.txt", "[ckey]/[name]")
                    Melee1(SecondStrike=1, ThirdStrike=1) // TODO come back to this, this is odd