Scriptname MAG_MolagBalTempleBlessingScript extends ObjectReference  

Spell Property TempleBlessing  Auto  

EVENT OnActivate(ObjectReference akActionRef)

IF DA10.IsStageDone(80) == 1

    TempleBlessing.Cast(akActionRef, akActionRef)
    IF akActionRef == PlayerRef
    
        MAG_BlessingStorageScript LastBlessingStorageScript = Quest.GetQuest("MAG_PilgrimPriestQuest") as MAG_BlessingStorageScript
        
        IF(LastBlessingStorageScript)   ;Null check just in case this script is somehow run on a shrine without the quest present
        
            IF !(PlayerRef.HasSpell(LastBlessingStorageScript.Prayer))
                (PlayerRef.AddSpell(LastBlessingStorageScript.Prayer))
            ENDIF
            
            LastBlessingStorageScript.LastBlessing = TempleBlessing
            LastBlessingStorageScript.LastMessage = BlessingMessage
            
        ENDIF
        AltarRemoveMsg.Show()
        BlessingMessage.Show()
    ENDIF

ENDIF

ENDEVENT

Message Property BlessingMessage  Auto  

Message Property AltarRemoveMsg  Auto  

Quest Property DA10 auto

Actor Property PlayerRef auto