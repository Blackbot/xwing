# This must be loaded before any of the card language modules!
exportObj = exports ? this

exportObj.unreleasedExpansions = [
]

exportObj.isReleased = (data) ->
    for source in data.sources
        return true if source not in exportObj.unreleasedExpansions
    false

exportObj.secondEditionExpansions = [
    'Second Edition Core Set',
    "Saw's Renegades Expansion Pack",
    'TIE Reaper Expansion Pack',
    'T-65 X-Wing Expansion Pack',
    'BTL-A4 Y-Wing Expansion Pack',
    'TIE/ln Fighter Expansion Pack',
    'TIE Advanced x1 Expansion Pack',
    'Slave I Expansion Pack',
    'Fang Fighter Expansion Pack',
    "Lando's Millennium Falcon Expansion Pack"
]

exportObj.secondEditionCheck = (data, faction='') ->
    # Handle special cases
    if (data.name == 'Y-Wing' and faction == 'Scum and Villainy')
        return false
    else if (data.name == 'TIE Fighter' and faction == 'Rebel Alliance')
        return false
    for source in data.sources
        return true if source in exportObj.secondEditionExpansions
    false

String::canonicalize = ->
    this.toLowerCase()
        .replace(/[^a-z0-9]/g, '')
        .replace(/\s+/g, '-')

exportObj.hugeOnly = (ship) ->
    ship.data.huge ? false

# Returns an independent copy of the data which can be modified by translation
# modules.
exportObj.basicCardData = ->
    ships:
        "X-Wing":
            name: "X-Wing"
            xws: "T-65 X-Wing".canonicalize()
            factions: [ "Rebel Alliance", ]
            attack: 3
            agility: 2
            hull: 4
            shields: 2
            actions: [
                "Focus"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 2, 2, 2, 0, 0, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0]
              [ 1, 1, 1, 1, 1, 0, 0, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0]
            ]
        "Y-Wing":
            name: "Y-Wing"
            xws: "BTL-A4 Y-Wing".canonicalize()
            factions: [ "Rebel Alliance", "Scum and Villainy" ]
            attack: 2
            agility: 1
            hull: 6
            shields: 2
            actions: [
                "Focus"
                "Lock"
            ]
            actionsred: [
                "Barrel Roll"
                "Reload"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0]
              [ 0, 2, 2, 2, 0, 0]
              [ 1, 1, 2, 1, 1, 0]
              [ 3, 1, 1, 1, 3, 0]
              [ 0, 0, 3, 0, 0, 3]
            ]
        "A-Wing":
            name: "A-Wing"
            xws: "RZ-1 A-Wing".canonicalize()
            factions: [ "Rebel Alliance" ]
            attack: 2
            agility: 3
            hull: 2
            shields: 2
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
                "Boost"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0, 0, 0]
              [ 2, 2, 2, 2, 2, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 3, 3]
              [ 0, 0, 2, 0, 0, 0, 0, 0]
              [ 0, 0, 2, 0, 0, 3, 0, 0]
            ]
        "YT-1300":
            name: "YT-1300"
            xws: "Modified YT-1300 Light Freighter".canonicalize()
            factions: [ "Rebel Alliance" ]
            attackdt: 3
            agility: 1
            hull: 8
            shields: 5
            actions: [
                "Focus"
                "Lock"
                "Rotate Arc"
            ]
            actionsred: [
                "Boost"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 1, 2, 1, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0]
            ]
            large: true
        "Customized YT-1300":
            name: "Customized YT-1300"
            canonical_name: 'Customized YT-1300'.canonicalize()
            xws: "Customized YT-1300 Light Freighter".canonicalize()
            factions: [ "Scum and Villainy" ]
            attackdt: 2
            agility: 1
            hull: 8
            shields: 3
            actions: [
                "Focus"
                "Lock"
                "Rotate Arc"
            ]
            actionsred: [
                "Boost"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 2, 2, 2, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0]
            ]
            large: true
        "TIE Fighter":
            name: "TIE Fighter"
            xws: "TIE/LN Fighter".canonicalize()
            factions: ["Rebel Alliance", "Galactic Empire"]
            attack: 2
            agility: 3
            hull: 3
            shields: 0
            actions: [
                "Focus"
                "Barrel Roll"
                "Evade"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0]
              [ 1, 2, 2, 2, 1, 0]
              [ 1, 1, 2, 1, 1, 3]
              [ 0, 0, 1, 0, 0, 3]
              [ 0, 0, 1, 0, 0, 0]
            ]
        "TIE Advanced":
            name: "TIE Advanced"
            xws: "TIE Advanced X1".canonicalize()
            factions: [ "Galactic Empire" ]
            attack: 2
            agility: 3
            hull: 3
            shields: 2
            actions: [
                "Focus" 
                "R> Barrel Roll"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 2, 1, 2, 0, 0, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0]
              [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
            ]
        "TIE Interceptor":
            name: "TIE Interceptor"
            xws: "TIE Interceptor".canonicalize()
            factions: [ "Galactic Empire" ]
            attack: 3
            agility: 3
            hull: 3
            shields: 0
            actions: [
                "Focus"
                "Barrel Roll"
                "Boost"
                "Evade"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0, 0, 0]
              [ 2, 2, 2, 2, 2, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 3, 3]
              [ 0, 0, 2, 0, 0, 3, 0, 0]
              [ 0, 0, 1, 0, 0, 0, 0, 0]
            ]
        "Firespray-31":
            name: "Firespray-31"
            xws: "Firespray-Class Patrol Craft".canonicalize()
            factions: [ "Scum and Villainy", ]
            attack: 3
            attackb: 3
            agility: 2
            hull: 6
            shields: 4
            medium: true
            actions: [
                "Focus"
                "Lock"
                "Boost"
            ]
            actionsred: [
                "Reinforce"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0]
              [ 0, 1, 2, 1, 0, 0, 0, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0]
            ]
        "HWK-290":
            name: "HWK-290"
            xws: "Hwk-290 Light Freighter".canonicalize()
            factions: [ "Rebel Alliance", "Scum and Villainy" ]
            attackt: 2
            agility: 2
            hull: 3
            shields: 2
            actions: [
                "Focus"
                "R> Rotate Arc"
                "Lock" 
                "R> Rotate Arc"
                "Rotate Arc"
            ]
            actionsred: [
                "Boost"
                "Jam"
            ]
            maneuvers: [
              [ 0, 0, 3, 0, 0]
              [ 0, 2, 2, 2, 0]
              [ 1, 1, 2, 1, 1]
              [ 3, 1, 1, 1, 3]
              [ 0, 0, 1, 0, 0]
            ]
        "Lambda-Class Shuttle":
            name: "Lambda-Class Shuttle"
            xws: "Lambda-Class T-4a Shuttle".canonicalize()
            factions: [ "Galactic Empire", ]
            attack: 3
            attackb: 2
            agility: 1
            hull: 6
            shields: 4
            actions: [
                "Focus"
                "Coordinate"
                "Reinforce"
            ]
            actionsred: [
                "Jam"
            ]
            maneuvers: [
              [ 0, 0, 3, 0, 0]
              [ 0, 2, 2, 2, 0]
              [ 3, 1, 2, 1, 3]
              [ 0, 3, 1, 3, 0]
            ]
            large: true
        "B-Wing":
            name: "B-Wing"
            xws: "A/SF-01 B-Wing".canonicalize()
            factions: [ "Rebel Alliance", ]
            attack: 3
            agility: 1
            hull: 4
            shields: 4
            actions: [
                "Focus"
                "R> Barrel Roll"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 3, 2, 2, 2, 3, 0, 0, 0, 3, 3]
              [ 1, 1, 2, 1, 1, 3, 0, 0, 0, 0]
              [ 0, 3, 2, 3, 0, 0, 0, 0, 0, 0]
              [ 0, 0, 3, 0, 0, 0, 0, 0, 0, 0]
            ]
        "TIE Bomber":
            name: "TIE Bomber"
            xws: "TIE/SA Bomber".canonicalize()
            factions: [ "Galactic Empire", ]
            attack: 2
            agility: 2
            hull: 6
            shields: 0
            actions: [
                "Focus"
                "Lock"
                "Barrel Roll"
                "R> Lock"
            ]
            actionsred: [
                "Reload"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0]
              [ 0, 1, 2, 1, 0, 0]
              [ 1, 2, 2, 2, 1, 0]
              [ 1, 1, 2, 1, 1, 3]
              [ 0, 0, 1, 0, 0, 0]
              [ 0, 0, 0, 0, 0, 3]
            ]
        "Z-95 Headhunter":
            name: "Z-95 Headhunter"
            xws: "Z-95-AF4 Headhunter".canonicalize()
            factions: [ "Rebel Alliance", "Scum and Villainy", ]
            attack: 2
            agility: 2
            hull: 2
            shields: 2
            actions: [
                "Focus"
                "Lock"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0]
              [ 0, 1, 2, 1, 0, 0]
              [ 1, 2, 2, 2, 1, 0]
              [ 1, 1, 2, 1, 1, 3]
              [ 0, 0, 1, 0, 0, 3]
            ]
        "TIE Defender":
            name: "TIE Defender"
            xws: "TIE/D Defender".canonicalize()
            factions: [ "Galactic Empire", ]
            attack: 3
            agility: 3
            hull: 3
            shields: 4
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
                "Boost"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0]
              [ 3, 2, 0, 2, 3, 0]
              [ 3, 1, 2, 1, 3, 3]
              [ 1, 1, 2, 1, 1, 0]
              [ 0, 0, 2, 0, 0, 1]
              [ 0, 0, 2, 0, 0, 0]
            ]
        "E-Wing":
            name: "E-Wing"
            xws: "E-Wing".canonicalize()
            factions: [ "Rebel Alliance", ]
            attack: 3
            agility: 3
            hull: 3
            shields: 3
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
                "R> Lock"
                "Boost"
                "R> Lock"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 3, 2, 2, 2, 3, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 3, 3 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0 ]
                [ 0, 0, 1, 0, 0, 0, 0, 0 ]
            ]
        "TIE Phantom":
            name: "TIE Phantom"
            xws: "TIE/PH Phantom".canonicalize()
            factions: [ "Galactic Empire", ]
            attack: 3
            agility: 2
            hull: 3
            shields: 2
            actions: [
                "Focus"
                "Evade"
                "Barrel Roll"
                "Cloak"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0]
                [ 1, 1, 0, 1, 1, 0]
                [ 1, 2, 2, 2, 1, 0]
                [ 1, 1, 2, 1, 1, 3]
                [ 0, 0, 1, 0, 0, 3]
            ]
        "YT-2400":
            name: "YT-2400"
            xws: "YT-2400 Light Freighter".canonicalize()
            factions: [ "Rebel Alliance", ]
            attackdt: 4
            agility: 2
            hull: 6
            shields: 4
            actions: [
                "Focus"
                "Lock"
                "Rotate Arc"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            large: true
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0]
                [ 1, 2, 2, 2, 1, 0]
                [ 1, 1, 2, 1, 1, 0]
                [ 1, 1, 1, 1, 1, 0]
                [ 0, 0, 1, 0, 0, 3]
            ]
        "VT-49 Decimator":
            name: "VT-49 Decimator"
            xws: "VT-49 Decimator".canonicalize()
            factions: [ "Galactic Empire", ]
            attackdt: 3
            agility: 0
            hull: 12
            shields: 4
            actions: [
                "Focus"
                "Lock"
                "Reinforce"
                "Rotate Arc"
            ]
            actionsred: [
                "Coordinate"
            ]
            large: true
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0]
                [ 3, 2, 2, 2, 3, 0]
                [ 1, 1, 2, 1, 1, 0]
                [ 1, 1, 1, 1, 1, 0]
                [ 0, 0, 1, 0, 0, 0]
            ]
        "StarViper":
            name: "StarViper"
            xws: "Starviper-Class Attack Platform".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 3
            agility: 3
            hull: 4
            shields: 1
            actions: [
                "Focus"
                "Lock"
                "Barrel Roll"
                "R> Focus"
                "Boost"
                "R> Focus"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0]
                [ 1, 2, 2, 2, 1, 0, 0, 0]
                [ 1, 2, 2, 2, 1, 0, 0, 0]
                [ 0, 1, 2, 1, 0, 0, 3, 3]
                [ 0, 0, 1, 0, 0, 0, 0, 0]
            ]
        "M3-A Interceptor":
            name: "M3-A Interceptor"
            xws: "M3-A Interceptor".canonicalize()
            factions: [ "Scum and Villainy" ]
            attack: 2
            agility: 3
            hull: 3
            shields: 1
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0 ]
                [ 1, 2, 0, 2, 1, 0 ]
                [ 1, 1, 2, 1, 1, 0 ]
                [ 0, 1, 2, 1, 0, 3 ]
                [ 0, 0, 1, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 3 ]
            ]
        "Aggressor":
            name: "Aggressor"
            xws: "Aggressor Assault Fighter".canonicalize()
            factions: [ "Scum and Villainy" ]
            attack: 3
            agility: 3
            hull: 5
            shields: 3
            actions: [
                "Calculate"
                "Evade"
                "Lock"
                "Boost"
            ]
            actionsred: [
            ]
            medium: true
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0, 3, 3 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0 ]
            ]
        "YV-666":
            name: "YV-666"
            xws: "YV-666 Light Freighter".canonicalize()
            factions: [ "Scum and Villainy" ]
            attackf: 3
            agility: 1
            hull: 9
            shields: 3
            large: true
            actions: [
                "Focus"
                "Reinforce"
                "Lock"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0 ]
                [ 3, 1, 2, 1, 3, 0 ]
                [ 1, 1, 2, 1, 1, 0 ]
                [ 0, 0, 1, 0, 0, 0 ]
            ]
        "Kihraxz Fighter":
            name: "Kihraxz Fighter"
            xws: "Kihraxz Fighter".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 3
            agility: 2
            hull: 5
            shields: 1
            actions: [
                "Focus"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 1, 2, 0, 2, 1, 0, 0, 0, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0, 0, 0, 3, 3 ]
                [ 0, 1, 2, 1, 0, 0, 0, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0 ]
            ]
        "K-Wing":
            name: "K-Wing"
            xws: "BTL-S8 K-Wing".canonicalize()
            factions: ["Rebel Alliance"]
            attackdt: 2
            agility: 1
            hull: 6
            shields: 3
            medium: true
            actions: [
                "Focus"
                "Lock"
                "Slam"
                "Rotate Arc"
                "Reload"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0 ]
                [ 0, 1, 1, 1, 0, 0 ]
            ]
        "TIE Punisher":
            name: "TIE Punisher"
            xws: "TIE/CA Punisher".canonicalize()
            factions: ["Galactic Empire"]
            attack: 2
            agility: 1
            hull: 6
            shields: 3
            medium: true
            actions: [
                "Focus"
                "Lock"
                "Boost" 
                "R> Lock"
                "Reload"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0 ]
                [ 3, 1, 1, 1, 3, 0 ]
                [ 0, 0, 0, 0, 0, 3 ]
            ]
        "VCX-100":
            name: "VCX-100"
            xws: "VCX-100 Light Freighter".canonicalize()
            factions: ["Rebel Alliance"]
            attack: 4
            agility: 0
            hull: 10
            shields: 4
            large: true
            actions: [
                "Focus"
                "Lock"
                "Reinforce"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0 ]
                [ 3, 1, 2, 1, 3, 0 ]
                [ 1, 2, 2, 2, 1, 0 ]
                [ 3, 1, 1, 1, 3, 0 ]
                [ 0, 0, 1, 0, 0, 3 ]
            ]
        "Attack Shuttle":
            name: "Attack Shuttle"
            xws: "Attack Shuttle".canonicalize()
            factions: ["Rebel Alliance"]
            attack: 3
            agility: 2
            hull: 3
            shields: 1
            actions: [
                "Focus"
                "Evade"
                "Barrel Roll"
                "R> Evade"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0 ]
                [ 3, 2, 2, 2, 3, 0 ]
                [ 1, 1, 2, 1, 1, 0 ]
                [ 3, 1, 1, 1, 3, 0 ]
                [ 0, 0, 1, 0, 0, 3 ]
            ]
        "TIE Advanced Prototype":
            name: "TIE Advanced Prototype"
            xws: "TIE Advanced V1".canonicalize()
            factions: ["Galactic Empire"]
            attack: 2
            agility: 3
            hull: 2
            shields: 2
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
                "R> Focus"
                "Boost"
                "R> Focus"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 2, 2, 0, 2, 2, 0, 0, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0, 3, 3 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ]
            ]
        "G-1A Starfighter":
            name: "G-1A Starfighter"
            xws: "G-1A Starfighter".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 3
            agility: 1
            hull: 5
            shields: 4
            medium: true
            actions: [
                "Focus"
                "Lock"
                "Jam"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0, 0 ]
                [ 3, 2, 2, 2, 3, 0 ]
                [ 1, 1, 2, 1, 1, 3 ]
                [ 0, 3, 1, 3, 0, 0 ]
                [ 0, 0, 3, 0, 0, 3 ]
            ]
        "JumpMaster 5000":
            name: "JumpMaster 5000"
            xws: "JumpMaster 5000".canonicalize()
            factions: ["Scum and Villainy"]
            large: true
            attackt: 2
            agility: 2
            hull: 6
            shields: 3
            actions: [
                "Focus"
                "R> Rotate Arc"
                "Lock"
                "R> Rotate Arc"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 1, 2, 2, 1, 3, 0, 0, 0 ]
                [ 1, 2, 2, 1, 3, 0, 0, 0 ]
                [ 0, 2, 2, 1, 0, 0, 3, 0 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0 ]
            ]
        "ARC-170":
            name: "ARC-170"
            xws: "Arc-170 Starfighter".canonicalize()
            factions: ["Rebel Alliance"]
            attack: 3
            attackb: 2
            agility: 1
            hull: 6
            shields: 3
            medium: true
            actions: [
                "Focus"
                "Lock"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0 ]
                [ 3, 1, 1, 1, 3, 0 ]
                [ 0, 0, 3, 0, 0, 3 ]
            ]
        "Fang Fighter":
            name: "Fang Fighter"
            canonical_name: 'Protectorate Starfighter'.canonicalize()
            xws: "Fang fighter".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 3
            agility: 3
            hull: 4
            shields: 0
            actions: [
                "Focus"
                "Lock"
                "Barrel Roll"
                "R> Focus"
                "Boost"
                "R> Focus"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 1, 0, 0, 0, 1, 0, 0, 0, 0, 0 ]
                [ 2, 2, 2, 2, 2, 0, 0, 0, 3, 3 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0 ]
            ]
        "Lancer-Class Pursuit Craft":
            name: "Lancer-Class Pursuit Craft"
            xws: "Lancer-Class Pursuit Craft".canonicalize()
            factions: ["Scum and Villainy"]
            large: true
            attack: 3
            attackt: 2
            agility: 2
            hull: 8
            shields: 2
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Rotate Arc"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0]
                [ 0, 1, 1, 1, 0, 0]
                [ 1, 1, 2, 1, 1, 0]
                [ 2, 2, 2, 2, 2, 0]
                [ 0, 0, 2, 0, 0, 0]
                [ 0, 0, 1, 0, 0, 3]
            ]
        "Quadjumper":
            name: "Quadjumper"
            xws: "Quadrijet Transfer Spacetug".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 2
            agility: 2
            hull: 5
            shields: 0
            actions: [
                "Barrel Roll"
                "Focus"
            ]
            actionsred: [
                "Evade"
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 3, 0, 3 ]
                [ 1, 2, 2, 2, 1, 0, 3, 3, 0, 0, 0, 3, 0 ]
                [ 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
            ]
        "U-Wing":
            name: "U-Wing"
            xws: "UT-60D U-Wing".canonicalize()
            factions: ["Rebel Alliance"]
            medium: true
            attack: 3
            agility: 2
            hull: 5
            shields: 3
            actions: [
                "Focus"
                "Lock"
            ]
            actionsred: [
                "Coordinate"
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0 ]
                [ 0, 2, 2, 2, 0 ]
                [ 1, 2, 2, 2, 1 ]
                [ 0, 1, 1, 1, 0 ]
                [ 0, 0, 1, 0, 0 ]
            ]
        "TIE Striker":
            name: "TIE Striker"
            xws: "TIE/SK Striker".canonicalize()
            factions: ["Galactic Empire"]
            attack: 3
            agility: 2
            hull: 4
            shields: 0
            actions: [
                "Focus"
                "Evade"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 1, 2, 2, 2, 1, 3, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0, 3, 3 ]
                [ 0, 1, 2, 1, 0, 0, 0, 0 ]
            ]
        "Auzituck Gunship":
            name: "Auzituck Gunship"
            xws: "Auzituck Gunship".canonicalize()
            factions: ["Rebel Alliance"]
            attackf: 3
            agility: 1
            hull: 6
            shields: 2
            actions: [
                "Focus"
                "Reinforce"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 0, 0, 0 ]
            ]
        "Scurrg H-6 Bomber":
            name: "Scurrg H-6 Bomber"
            xws: "Scurrg H-6 Bomber".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 3
            agility: 1
            hull: 6
            shields: 4
            medium: true
            actions: [
                "Focus"
                "Lock"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0, 0, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0 ]
                [ 3, 1, 1, 1, 3, 0, 0, 0, 3, 3 ]
                [ 0, 0, 3, 0, 0, 0, 0, 0, 0, 0 ]
            ]
        "TIE Aggressor":
            name: "TIE Aggressor"
            xws: "TIE/AG Aggressor".canonicalize()
            factions: ["Galactic Empire"]
            attack: 2
            agility: 2
            hull: 4
            shields: 1
            actions: [
                "Focus"
                "Lock"
                "Barrel Roll" 
                "R> Evade"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 0, 1, 2, 1, 0, 0, 0, 0, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0 ]
                [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0 ]
                [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0 ]
            ]
        "Alpha-Class Star Wing":
            name: "Alpha-Class Star Wing"
            xws: "Alpha-Class Star Wing".canonicalize()
            factions: ["Galactic Empire"]
            attack: 2
            agility: 2
            hull: 4
            shields: 3
            actions: [
                "Focus"
                "Lock"
                "Slam"
                "Reload"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0 ]
                [ 0, 1, 2, 1, 0, 0, 0, 0 ]
                [ 1, 2, 2, 2, 1, 0, 0, 0 ]
                [ 1, 1, 1, 1, 1, 0, 0, 0 ]
                [ 0, 0, 3, 0, 0, 0, 0, 0 ]
            ]
        "M12-L Kimogila Fighter":
            name: "M12-L Kimogila Fighter"
            xws: "M12-L Kimogila Fighter".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 3
            agility: 1
            hull: 7
            shields: 2
            medium: true
            actions: [
                "Focus"
                "Lock"
                "Reload"
            ]
            actionsred: [
                "Barrel Roll"
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0]
                [ 3, 1, 2, 1, 3, 0]
                [ 1, 2, 2, 2, 1, 0]
                [ 1, 1, 2, 1, 1, 0]
                [ 0, 0, 0, 0, 0, 3]
            ]
        "Sheathipede-Class Shuttle":
            name: "Sheathipede-Class Shuttle"
            xws: "Sheathipede-Class Shuttle".canonicalize()
            factions: ["Rebel Alliance"]
            attack: 2
            attackb: 2
            agility: 2
            hull: 4
            shields: 1
            actions: [
                "Focus"
                "Coordinate"
            ]
            actionsred: [
            ]
            maneuvers: [
                [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                [ 0, 1, 2, 1, 0, 0, 0, 0, 0, 0, 0, 3, 0]
                [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0]
                [ 3, 1, 2, 1, 3, 3, 0, 0, 0, 0, 0, 0, 0]
                [ 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            ]
        "TIE Reaper":
            name: "TIE Reaper"
            xws: "TIE Reaper".canonicalize()
            factions: ["Galactic Empire"]
            attack: 3
            agility: 1
            hull: 6
            shields: 2
            medium: true
            actions: [
                "Focus"
                "Evade"
                "Jam"
            ]
            actionsred: [
                "Coordinate"
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0, 0, 0, 0 ]
                [ 3, 2, 2, 2, 3, 0, 3, 3 ]
                [ 3, 1, 2, 1, 3, 0, 0, 0 ]
                [ 0, 1, 2, 1, 0, 0, 0, 0 ]
            ]
        "Escape Craft":
            name: "Escape Craft"
            xws: "Escape Craft".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 2
            agility: 2
            hull: 2
            shields: 2
            actions: [
                "Focus"
                "Barrel Roll"
            ]
            actionsred: [
                "Coordinate"
            ]
            maneuvers: [
                [ 0, 0, 3, 0, 0, 0, 0, 0 ]
                [ 0, 2, 2, 2, 0, 0, 0, 0 ]
                [ 3, 1, 2, 1, 3, 0, 0, 0 ]
                [ 0, 1, 1, 1, 0, 3, 0, 0 ]
            ]
        "T-70 X-Wing":
            name: "T-70 X-Wing"
            xws: "T-70 X-Wing".canonicalize()
            factions: [ "Resistance"]
            attack: 3
            agility: 2
            hull: 4
            shields: 3
            actions: [
                "Focus"
                "Lock"
                "Boost"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 2, 2, 2, 0, 0, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0, 0, 0]
            ]
        "RZ-2 A-Wing":
            name: "RZ-2 A-Wing"
            xws: "RZ-2 A-Wing".canonicalize()
            factions: ["Resistance"]
            attack: 2
            attackt: 2
            agility: 3
            hull: 3
            shields: 2
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0, 0, 0]
              [ 2, 2, 2, 2, 2, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 0, 0, 0]
              [ 0, 0, 1, 0, 0, 3, 0, 0]
            ]
        "TIE/FO Fighter":
            name: "TIE/FO Fighter"
            xws: "TIE/FO Fighter".canonicalize()
            factions: ["First Order"]
            attack: 2
            agility: 3
            hull: 3
            shields: 1
            actions: [
                "Focus"
                "Evade"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0, 0, 0]
              [ 2, 2, 2, 2, 2, 0, 3, 3]
              [ 1, 1, 2, 1, 1, 0, 0, 0]
              [ 0, 0, 1, 0, 0, 3, 0, 0]
              [ 0, 0, 1, 0, 0, 0, 0, 0]
            ]
        "TIE Silencer":
            name: "TIE Silencer"
            xws: "TIE Silencer".canonicalize()
            factions: ["First Order"]
            attack: 3
            agility: 3
            hull: 4
            shields: 2
            actions: [
                "Focus"
                "Boost"
                "Lock"
                "Barrel Roll"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0, 0, 0, 0, 0]
              [ 2, 2, 2, 2, 2, 0, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0, 3, 3]
              [ 0, 0, 2, 0, 0, 3, 0, 0, 0, 0]
              [ 0, 0, 2, 0, 0, 0, 0, 0, 0, 0]
            ]
        "TIE/SF Fighter":
            name: "TIE/SF Fighter"
            xws: "TIE/SF Fighter".canonicalize()
            factions: ["First Order"]
            attack: 0
            attackt: 0
            agility: 2
            hull: 3
            shields: 3
            actions: [
                "Focus"
                "> Rotate Arc"
                "Evade"
                "> Rotate Arc"
                "Lock"
                "> Rotate Arc"
                "Barrel Roll"
                "> Rotate Arc"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 2, 2, 2, 0, 0, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0]
              [ 3, 1, 2, 1, 3, 0, 3, 3, 0, 0]
              [ 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            ]
        "Upsilon-Class Shuttle":
            name: "Upsilon-Class Shuttle"
            xws: "Upsilon-Class Shuttle".canonicalize()
            factions: ["First Order"]
            attack: 0
            agility: 0
            hull: 0
            shields: 6
            actions: [
                "Focus"
                "Reinforce"
                "Lock"
                "Coordinate"
                "Jam"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 3, 0, 0, 0, 0, 0, 0, 0]
              [ 3, 1, 2, 1, 3, 0, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0, 0, 0]
              [ 3, 1, 1, 1, 3, 0, 0, 0, 0, 0]
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            ]
            large: true
        "B/SF-17 Bomber":
            name: "B/SF-17 Bomber"
            xws: "B/SF-17 Bomber".canonicalize()
            factions: ["Resistance"]
            attack: 0
            agility: 0
            hull: 9
            shields: 3
            actions: [
                "Focus"
                "Lock"
                "Rotate Arc"
                "Reload"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 3, 0, 0, 0, 0, 0, 0, 0]
              [ 3, 2, 2, 2, 3, 0, 0, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 0, 0, 0, 0]
              [ 0, 1, 1, 1, 0, 0, 0, 0, 0, 0]
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
            ]
            large: true
        "Scavenged YT-1300":
            name: "Scavenged YT-1300"
            canonical_name: 'Scavenged YT-1300'.canonicalize()
            xws: "Scavenged YT-1300 Light Freighter".canonicalize()
            factions: [ "Resistance" ]
            attackdt: 3
            agility: 1
            hull: 8
            shields: 3
            actions: [
                "Focus"
                "Lock"
            ]
            actionsred: [
                "Boost"
                "Rotate Arc"
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0, 0, 0]
              [ 0, 1, 2, 1, 0, 0, 0, 0]
              [ 1, 2, 2, 2, 1, 0, 0, 0]
              [ 1, 1, 2, 1, 1, 0, 3, 3]
              [ 0, 0, 1, 0, 0, 3, 0, 0]
            ]
            large: true
        "Mining Guild TIE Fighter":
            name: "Mining Guild TIE Fighter"
            xws: "Modified TIE/LN Fighter".canonicalize()
            factions: ["Scum and Villainy"]
            attack: 2
            agility: 3
            hull: 3
            shields: 0
            actions: [
                "Focus"
                "Barrel Roll"
                "Evade"
            ]
            actionsred: [
            ]
            maneuvers: [
              [ 0, 0, 0, 0, 0, 0]
              [ 1, 0, 0, 0, 1, 0]
              [ 1, 2, 2, 2, 1, 0]
              [ 1, 1, 2, 1, 1, 3]
              [ 0, 0, 1, 0, 0, 0]
              [ 0, 0, 3, 0, 0, 0]
            ]
    # name field is for convenience only
    pilotsById: [
        {
            name: "Cavern Angels Zealot"
            id: 0
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 1
            points: 41
            slots: [
                "Illicit"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Blue Squadron Escort"
            id: 1
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 2
            points: 41
            slots: [
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Red Squadron Veteran"
            id: 2
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 3
            points: 43
            slots: [
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Jek Porkins"
            id: 3
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 4
            points: 46
            slots: [
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Luke Skywalker"
            id: 4
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 5
            force: 2
            points: 62
            slots: [
                "Force"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Wedge Antilles"
            id: 5
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 6
            points: 52
            slots: [
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Garven Dreis (X-Wing)"
            canonical_name: 'Garven Dreis'.canonicalize()
            id: 6
            unique: true
            xws: "garvendreis-t65xwing"
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 4
            points: 47
            slots: [
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Biggs Darklighter"
            id: 7
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 3
            points: 48
            slots: [
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Edrio Two-Tubes"
            id: 8
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 2
            points: 45
            slots: [
                "Illicit"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Thane Kyrell"
            id: 9
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 5
            points: 48
            slots: [
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Leevan Tenza"
            id: 10
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 3
            points: 46
            slots: [
                "Illicit"
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "whoops"
            id: 11
            skip: true
        }
        {
            name: "Kullbee Sperado"
            id: 12
            unique: true
            faction: "Rebel Alliance"
            ship: "X-Wing"
            skill: 4
            points: 48
            slots: [
                "Illicit"
                "Talent"
                "Torpedo"
                "Astromech"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Sabine Wren (TIE Fighter)"
            canonical_name: 'Sabine Wren'.canonicalize()
            id: 13
            unique: true
            xws: "sabinewren-tielnfighter"
            faction: "Rebel Alliance"
            ship: "TIE Fighter"
            skill: 3
            points: 28
            slots: [
                "Talent"
                "Modification"
            ]
        }
        {
            name: "Ezra Bridger (TIE Fighter)"
            canonical_name: 'Ezra Bridger'.canonicalize()
            id: 14
            unique: true
            xws: "ezrabridger-tielnfighter"
            faction: "Rebel Alliance"
            ship: "TIE Fighter"
            skill: 3
            force: 1
            points: 32
            slots: [
                "Force"
                "Modification"
            ]
        }
        {
            name: '"Zeb" Orrelios (TIE Fighter)'
            canonical_name: '"Zeb" Orrelios'.canonicalize()
            id: 15
            unique: true
            xws: "zeborrelios-tielnfighter"
            faction: "Rebel Alliance"
            ship: "TIE Fighter"
            skill: 2
            points: 26
            slots: [
                "Modification"
            ]
        }
        {
            name: "Captain Rex"
            id: 16
            unique: true
            faction: "Rebel Alliance"
            ship: "TIE Fighter"
            skill: 2
            points: 32
            slots: [
                "Modification"
            ]
            applies_condition: 'Suppressive Fire'.canonicalize()
        }
        {
            name: "Miranda Doni"
            id: 17
            unique: true
            faction: "Rebel Alliance"
            ship: "K-Wing"
            skill: 4
            points: 48
            slots: [
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Crew"
                "Device"
                "Device"
                "Modification"
            ]
        }
        {
            name: "Esege Tuketu"
            id: 18
            unique: true
            faction: "Rebel Alliance"
            ship: "K-Wing"
            skill: 3
            points: 50
            slots: [
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Crew"
                "Device"
                "Device"
                "Modification"
            ]
        }
        {
            name: "empty"
            id: 19
            skip: true
        }
        {
            name: "Warden Squadron Pilot"
            id: 20
            faction: "Rebel Alliance"
            ship: "K-Wing"
            skill: 2
            points: 40
            slots: [
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Crew"
                "Device"
                "Device"
                "Modification"
            ]
        }
        {
            name: "Corran Horn"
            id: 21
            unique: true
            faction: "Rebel Alliance"
            ship: "E-Wing"
            skill: 5
            points: 74
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Gavin Darklighter"
            id: 22
            unique: true
            faction: "Rebel Alliance"
            ship: "E-Wing"
            skill: 4
            points: 68
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Rogue Squadron Escort"
            id: 23
            faction: "Rebel Alliance"
            ship: "E-Wing"
            skill: 4
            points: 63
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Knave Squadron Escort"
            id: 24
            faction: "Rebel Alliance"
            ship: "E-Wing"
            skill: 2
            points: 61
            slots: [
                "Sensor"
                "Torpedo"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Norra Wexley (Y-Wing)"
            id: 25
            unique: true
            canonical_name: 'Norra Wexley'.canonicalize()
            xws: "norrawexley-btla4ywing"
            faction: "Rebel Alliance"
            ship: "Y-Wing"
            skill: 5
            points: 43
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Astromech"
                "Modification"
                "Device"
                "Gunner"
            ]
        }
        {
            name: "Horton Salm"
            id: 26
            unique: true
            faction: "Rebel Alliance"
            ship: "Y-Wing"
            skill: 4
            points: 38
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Astromech"
                "Modification"
                "Device"
                "Gunner"
            ]
        }
        {
            name: '"Dutch" Vander'
            id: 27
            unique: true
            faction: "Rebel Alliance"
            ship: "Y-Wing"
            skill: 4
            points: 42
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Astromech"
                "Modification"
                "Device"
                "Gunner"
            ]
        }
        {
            name: "Evaan Verlaine"
            id: 28
            unique: true
            faction: "Rebel Alliance"
            ship: "Y-Wing"
            skill: 3
            points: 36
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Astromech"
                "Modification"
                "Device"
                "Gunner"
            ]
        }
        {
            name: "Gold Squadron Veteran"
            id: 29
            faction: "Rebel Alliance"
            ship: "Y-Wing"
            skill: 3
            points: 34
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Astromech"
                "Modification"
                "Device"
                "Gunner"
            ]
        }
        {
            name: "Gray Squadron Bomber"
            id: 30
            faction: "Rebel Alliance"
            ship: "Y-Wing"
            skill: 2
            points: 32
            slots: [
                "Turret"
                "Torpedo"
                "Astromech"
                "Modification"
                "Device"
                "Gunner"
            ]
        }
        {
            name: "Bodhi Rook"
            id: 31
            unique: true
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 4
            points: 49
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Cassian Andor"
            id: 32
            unique: true
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 3
            points: 47
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Heff Tobber"
            id: 33
            unique: true
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 2
            points: 45
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Magva Yarro"
            id: 34
            unique: true
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 3
            points: 50
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
                "Illicit"
            ]
        }
        {
            name: "Saw Gerrera"
            id: 35
            unique: true
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 4
            points: 52
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
                "Illicit"
            ]
        }
        {
            name: "Benthic Two-Tubes"
            id: 36
            unique: true
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 2
            points: 47
            slots: [
                "Illicit"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Blue Squadron Scout"
            id: 37
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 2
            points: 43
            slots: [
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Partisan Renegade"
            id: 38
            faction: "Rebel Alliance"
            ship: "U-Wing"
            skill: 1
            points: 43
            slots: [
                "Illicit"
                "Sensor"
                "Crew"
                "Crew"
                "Modification"
                "Configuration"
            ]
        }
        {
            name: "Dash Rendar"
            id: 39
            unique: true
            faction: "Rebel Alliance"
            ship: "YT-2400"
            skill: 5
            points: 100
            slots: [
                "Talent"
                "Missile"
                "Gunner"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
        }
        {
            name: '"Leebo"'
            id: 40
            unique: true
            faction: "Rebel Alliance"
            ship: "YT-2400"
            skill: 3
            points: 98
            slots: [
                "Missile"
                "Gunner"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
            ship_override:
                actions: [
                    "Calculate"
                    "Lock"
                    "Rotate Arc"
                ]
        }
        {
            name: "Wild Space Fringer"
            id: 41
            faction: "Rebel Alliance"
            ship: "YT-2400"
            skill: 1
            points: 88
            slots: [
                "Missile"
                "Gunner"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
        }
        {
            name: "Han Solo"
            id: 42
            unique: true
            xws: "hansolo-modifiedyt1300lightfreighter"
            faction: "Rebel Alliance"
            ship: "YT-1300"
            skill: 6
            points: 92
            slots: [
                "Talent"
                "Missile"
                "Gunner"
                "Crew"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
        }
        {
            name: "Lando Calrissian"
            id: 43
            unique: true
            xws: "landocalrissian-modifiedyt1300lightfreighter"
            faction: "Rebel Alliance"
            ship: "YT-1300"
            skill: 5
            points: 92
            slots: [
                "Talent"
                "Missile"
                "Gunner"
                "Crew"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
        }
        {
            name: "Chewbacca"
            id: 44
            unique: true
            faction: "Rebel Alliance"
            ship: "YT-1300"
            skill: 4
            charge: 1
            recurring: true
            points: 84
            slots: [
                "Talent"
                "Missile"
                "Gunner"
                "Crew"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
        }
        {
            name: "Outer Rim Smuggler"
            id: 45
            faction: "Rebel Alliance"
            ship: "YT-1300"
            skill: 1
            points: 78
            slots: [
                "Missile"
                "Gunner"
                "Crew"
                "Crew"
                "Modification"
                "Title"
                "Illicit"
            ]
        }
        {
            name: "Jan Ors"
            id: 46
            unique: true
            faction: "Rebel Alliance"
            ship: "HWK-290"
            skill: 5
            points: 42
            slots: [
                "Talent"
                "Device"
                "Crew"
                "Modification"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Roark Garnet"
            id: 47
            unique: true
            faction: "Rebel Alliance"
            ship: "HWK-290"
            skill: 4
            points: 38
            slots: [
                "Talent"
                "Device"
                "Crew"
                "Modification"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Kyle Katarn"
            id: 48
            unique: true
            faction: "Rebel Alliance"
            ship: "HWK-290"
            skill: 3
            points: 38
            slots: [
                "Talent"
                "Device"
                "Crew"
                "Modification"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Rebel Scout"
            id: 49
            faction: "Rebel Alliance"
            ship: "HWK-290"
            skill: 2
            points: 32
            slots: [
                "Device"
                "Crew"
                "Modification"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Jake Farrell"
            id: 50
            unique: true
            faction: "Rebel Alliance"
            ship: "A-Wing"
            skill: 4
            points: 40
            slots: [
                "Talent"
                "Missile"
            ]
        }
        {
            name: "Arvel Crynyd"
            id: 51
            unique: true
            faction: "Rebel Alliance"
            ship: "A-Wing"
            skill: 3
            points: 36
            slots: [
                "Talent"
                "Missile"
            ]
        }
        {
            name: "Green Squadron Pilot"
            id: 52
            faction: "Rebel Alliance"
            ship: "A-Wing"
            skill: 3
            points: 34
            slots: [
                "Talent"
                "Missile"
            ]
        }
        {
            name: "Phoenix Squadron Pilot"
            id: 53
            faction: "Rebel Alliance"
            ship: "A-Wing"
            skill: 1
            points: 30
            slots: [
                "Missile"
            ]
        }
        {
            name: "Airen Cracken"
            id: 54
            unique: true
            faction: "Rebel Alliance"
            ship: "Z-95 Headhunter"
            skill: 5
            points: 36
            slots: [
                "Talent"
                "Missile"
                "Modification"
            ]
        }
        {
            name: "Lieutenant Blount"
            id: 55
            unique: true
            faction: "Rebel Alliance"
            ship: "Z-95 Headhunter"
            skill: 4
            points: 30
            slots: [
                "Talent"
                "Missile"
                "Modification"
            ]
        }
        {
            name: "Tala Squadron Pilot"
            id: 56
            faction: "Rebel Alliance"
            ship: "Z-95 Headhunter"
            skill: 2
            points: 25
            slots: [
                "Talent"
                "Missile"
                "Modification"
            ]
        }
        {
            name: "Bandit Squadron Pilot"
            id: 57
            faction: "Rebel Alliance"
            ship: "Z-95 Headhunter"
            skill: 1
            points: 23
            slots: [
                "Missile"
                "Modification"
            ]
        }
        {
            name: "Wullffwarro"
            id: 58
            unique: true
            faction: "Rebel Alliance"
            ship: "Auzituck Gunship"
            skill: 4
            points: 56
            slots: [
                "Talent"
                "Crew"
                "Crew"
                "Modification"
            ]
        }
        {
            name: "Lowhhrick"
            id: 59
            unique: true
            faction: "Rebel Alliance"
            ship: "Auzituck Gunship"
            skill: 3
            points: 52
            slots: [
                "Talent"
                "Crew"
                "Crew"
                "Modification"
            ]
        }
        {
            name: "Kashyyyk Defender"
            id: 60
            faction: "Rebel Alliance"
            ship: "Auzituck Gunship"
            skill: 1
            points: 46
            slots: [
                "Crew"
                "Crew"
                "Modification"
            ]
        }
        {
            name: "Hera Syndulla (VCX-100)"
            id: 61
            unique: true
            canonical_name: 'Hera Syndulla'.canonicalize()
            xws: "herasyndulla-vcx100lightfreighter"
            faction: "Rebel Alliance"
            ship: "VCX-100"
            skill: 5
            points: 76
            slots: [
                "Talent"
                "Torpedo"
                "Turret"
                "Crew"
                "Crew"
                "Modification"
                "Gunner"
                "Title"
            ]
        }
        {
            name: "Kanan Jarrus"
            id: 62
            unique: true
            faction: "Rebel Alliance"
            ship: "VCX-100"
            skill: 3
            force: 2
            points: 90
            slots: [
                "Force"
                "Torpedo"
                "Turret"
                "Crew"
                "Crew"
                "Modification"
                "Gunner"
                "Title"
            ]
        }
        {
            name: '"Chopper"'
            id: 63
            unique: true
            faction: "Rebel Alliance"
            ship: "VCX-100"
            skill: 2
            points: 72
            slots: [
                "Torpedo"
                "Turret"
                "Crew"
                "Crew"
                "Modification"
                "Gunner"
                "Title"
            ]
            ship_override:
                actions: [
                    "Calculate"
                    "Lock"
                    "Reinforce"
                ]
        }
        {
            name: "Lothal Rebel"
            id: 64
            faction: "Rebel Alliance"
            ship: "VCX-100"
            skill: 2
            points: 70
            slots: [
                "Torpedo"
                "Turret"
                "Crew"
                "Crew"
                "Modification"
                "Gunner"
                "Title"
            ]
        }
        {
            name: "Hera Syndulla"
            id: 65
            unique: true
            faction: "Rebel Alliance"
            ship: "Attack Shuttle"
            skill: 5
            points: 39
            slots: [
                "Talent"
                "Crew"
                "Modification"
                "Turret"
                "Title"
            ]
        }
        {
            name: "Sabine Wren"
            canonical_name: 'Sabine Wren'.canonicalize()
            id: 66
            unique: true
            faction: "Rebel Alliance"
            ship: "Attack Shuttle"
            skill: 3
            points: 38
            slots: [
                "Talent"
                "Crew"
                "Modification"
                "Turret"
                "Title"
            ]
        }
        {
            name: "Ezra Bridger"
            id: 67
            unique: true
            faction: "Rebel Alliance"
            ship: "Attack Shuttle"
            skill: 3
            force: 1
            points: 41
            slots: [
                "Force"
                "Crew"
                "Modification"
                "Turret"
                "Title"
            ]
        }

        {
            name: '"Zeb" Orrelios'
            id: 68
            unique: true
            faction: "Rebel Alliance"
            ship: "Attack Shuttle"
            skill: 2
            points: 34
            slots: [
                "Crew"
                "Modification"
                "Turret"
                "Title"
            ]
        }
        {
            name: "Fenn Rau (Sheathipede)"
            id: 69
            unique: true
            xws: "fennrau-sheathipedeclassshuttle"
            faction: "Rebel Alliance"
            ship: "Sheathipede-Class Shuttle"
            skill: 6
            points: 52
            slots: [
                "Talent"
                "Crew"
                "Modification"
                "Astromech"
                "Title"
            ]
        }
        {
            name: "Ezra Bridger (Sheathipede)"
            canonical_name: 'Ezra Bridger'.canonicalize()
            id: 70
            unique: true
            xws: "ezrabridger-sheathipedeclassshuttle"
            faction: "Rebel Alliance"
            ship: "Sheathipede-Class Shuttle"
            skill: 3
            force: 1
            points: 42
            slots: [
                "Force"
                "Crew"
                "Modification"
                "Astromech"
                "Title"
            ]
        }
        {
            name: '"Zeb" Orrelios (Sheathipede)'
            canonical_name: '"Zeb" Orrelios'.canonicalize()
            id: 71
            unique: true
            xws: "zeborrelios-sheathipedeclassshuttle"
            faction: "Rebel Alliance"
            ship: "Sheathipede-Class Shuttle"
            skill: 2
            points: 32
            slots: [
                "Talent"
                "Crew"
                "Modification"
                "Astromech"
                "Title"
            ]
        }
        {
            name: "AP-5"
            id: 72
            unique: true
            faction: "Rebel Alliance"
            ship: "Sheathipede-Class Shuttle"
            skill: 1
            points:30
            slots: [
                "Talent"
                "Crew"
                "Modification"
                "Astromech"
                "Title"
            ]
            ship_override:
                actions: [
                    "Calculate"
                    "Coordinate"
                ]
        }
        {
             name: "Braylen Stramm"
            id: 73
            unique: true
            faction: "Rebel Alliance"
            ship: "B-Wing"
            skill: 4
            points: 50
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Torpedo"
                "Modification"
            ]
        }
        {
            name: "Ten Numb"
            id: 74
            unique: true
            faction: "Rebel Alliance"
            ship: "B-Wing"
            skill: 4
            points: 50
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Torpedo"
                "Modification"
            ]
        }
        {
            name: "Blade Squadron Veteran"
            id: 75
            faction: "Rebel Alliance"
            ship: "B-Wing"
            skill: 3
            points: 44
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Torpedo"
                "Modification"
            ]
        }
        {
            name: "Blue Squadron Pilot"
            id: 76
            faction: "Rebel Alliance"
            ship: "B-Wing"
            skill: 2
            points: 42
            slots: [
                "Sensor"
                "Cannon"
                "Cannon"
                "Torpedo"
                "Modification"
            ]
        }
        {
            name: "Norra Wexley"
            id: 77
            unique: true
            faction: "Rebel Alliance"
            ship: "ARC-170"
            skill: 5
            points: 55
            slots: [
                "Talent"
                "Torpedo"
                "Crew"
                "Gunner"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Shara Bey"
            id: 78
            unique: true
            faction: "Rebel Alliance"
            ship: "ARC-170"
            skill: 4
            points: 53
            slots: [
                "Talent"
                "Torpedo"
                "Crew"
                "Gunner"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Garven Dreis"
            id: 79
            unique: true
            faction: "Rebel Alliance"
            ship: "ARC-170"
            skill: 4
            points: 51
            slots: [
                "Talent"
                "Torpedo"
                "Crew"
                "Gunner"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "Ibtisam"
            id: 80
            unique: true
            faction: "Rebel Alliance"
            ship: "ARC-170"
            skill: 3
            points: 50
            slots: [
                "Talent"
                "Torpedo"
                "Crew"
                "Gunner"
                "Astromech"
                "Modification"
            ]
        }
        {
            name: "IG-88A"
            id: 81
            unique: true
            faction: "Scum and Villainy"
            ship: "Aggressor"
            skill: 4
            points: 70
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Device"
                "Illicit"
                "Modification"
                "Title"
            ]
        }
        {
            name: "IG-88B"
            id: 82
            unique: true
            faction: "Scum and Villainy"
            ship: "Aggressor"
            skill: 4
            points: 70
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Device"
                "Illicit"
                "Modification"
                "Title"
                ]
        }
        {
            name: "IG-88C"
            id: 83
            unique: true
            faction: "Scum and Villainy"
            ship: "Aggressor"
            skill: 4
            points: 70
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "IG-88D"
            id: 84
            unique: true
            faction: "Scum and Villainy"
            ship: "Aggressor"
            skill: 4
            points: 70
            slots: [
                "Talent"
                "Sensor"
                "Cannon"
                "Cannon"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Kavil"
            id: 85
            unique: true
            faction: "Scum and Villainy"
            ship: "Y-Wing"
            skill: 5
            points: 42
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Gunner"
                "Astromech"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Drea Renthal"
            id: 86
            unique: true
            faction: "Scum and Villainy"
            ship: "Y-Wing"
            skill: 4
            points: 40
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Gunner"
                "Astromech"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Hired Gun"
            id: 87
            faction: "Scum and Villainy"
            ship: "Y-Wing"
            skill: 2
            points: 34
            slots: [
                "Talent"
                "Turret"
                "Torpedo"
                "Gunner"
                "Astromech"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Crymorah Goon"
            id: 88
            faction: "Scum and Villainy"
            ship: "Y-Wing"
            skill: 1
            points: 32
            slots: [
                "Turret"
                "Torpedo"
                "Gunner"
                "Astromech"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Han Solo (Scum)"
            id: 89
            unique: true
            xws: "hansolo"
            faction: "Scum and Villainy"
            ship: "Customized YT-1300"
            skill: 6
            points: 54
            slots: [
                "Talent"
                "Missile"
                "Crew"
                "Crew"
                "Gunner"
                "Illicit"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Lando Calrissian (Scum)"
            id: 90
            unique: true
            xws: "landocalrissian"
            faction: "Scum and Villainy"
            ship: "Customized YT-1300"
            skill: 4
            points: 49
            slots: [
                "Talent"
                "Missile"
                "Crew"
                "Crew"
                "Gunner"
                "Illicit"
                "Modification"
                "Title"
            ]
        }
        {
            name: "L3-37"
            id: 91
            unique: true
            faction: "Scum and Villainy"
            ship: "Customized YT-1300"
            skill: 2
            points: 47
            slots: [
                "Missile"
                "Crew"
                "Crew"
                "Gunner"
                "Illicit"
                "Modification"
                "Title"
            ]
            ship_override:
                actions: [
                    "Calculate"
                    "Lock"
                    "Rotate Arc"
                ]
        }
        {
            name: "Freighter Captain"
            id: 92
            faction: "Scum and Villainy"
            ship: "Customized YT-1300"
            skill: 1
            points: 46
            slots: [
                "Missile"
                "Crew"
                "Crew"
                "Gunner"
                "Illicit"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Lando Calrissian (Scum) (Escape Craft)"
            canonical_name: 'Lando Calrissian (Scum)'.canonicalize()
            id: 93
            unique: true
            xws: "landocalrissian-escapecraft"
            faction: "Scum and Villainy"
            ship: "Escape Craft"
            skill: 4
            points: 26
            slots: [
                "Talent"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Outer Rim Pioneer"
            id: 94
            unique: true
            faction: "Scum and Villainy"
            ship: "Escape Craft"
            skill: 3
            points: 24
            slots: [
                "Talent"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "L3-37 (Escape Craft)"
            canonical_name: 'L3-37'.canonicalize()
            id: 95
            unique: true
            xws: "l337-escapecraft"
            faction: "Scum and Villainy"
            ship: "Escape Craft"
            skill: 2
            points: 22
            slots: [
                "Talent"
                "Crew"
                "Modification"
              ]
            ship_override:
                actions: [
                    "Calculate"
                    "Barrel Roll"
                ]
        }
        {
            name: "Autopilot Drone"
            id: 96
            unique: true        
            faction: "Scum and Villainy"
            ship: "Escape Craft"
            skill: 1
            charge: 3
            points: 12
            slots: [
            ]
            ship_override:
                actions: [
                    "Calculate"
                    "Barrel Roll"
                ]

        }
        {
            name: "Fenn Rau"
            id: 97
            unique: true
            faction: "Scum and Villainy"
            ship: "Fang Fighter"
            skill: 6
            points: 68
            slots: [
                "Talent"
                "Torpedo"
              ]
        }
        {
            name: "Old Teroch"
            id: 98
            unique: true
            faction: "Scum and Villainy"
            ship: "Fang Fighter"
            skill: 5
            points: 56
            slots: [
                "Talent"
                "Torpedo"
              ]
        }
        {
            name: "Kad Solus"
            id: 99
            unique: true
            faction: "Scum and Villainy"
            ship: "Fang Fighter"
            skill: 4
            points: 54
            slots: [
                "Talent"
                "Torpedo"
              ]
        }
        {
            name: "Joy Rekkoff"
            id: 100
            unique: true
            faction: "Scum and Villainy"
            ship: "Fang Fighter"
            skill: 4
            points: 52
            slots: [
                "Talent"
                "Torpedo"
              ]
        }
        {
            name: "Skull Squadron Pilot"
            id: 101
            faction: "Scum and Villainy"
            ship: "Fang Fighter"
            skill: 4
            points: 50
            slots: [
                "Talent"
                "Torpedo"
              ]
        }
        {
            name: "Zealous Recruit"
            id: 102
            faction: "Scum and Villainy"
            ship: "Fang Fighter"
            skill: 1
            points: 44
            slots: [
                "Torpedo"
              ]
        }
        {
            name: "Boba Fett"
            id: 103
            unique: true
            faction: "Scum and Villainy"
            ship: "Firespray-31"
            skill: 5
            points: 80
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Emon Azzameen"
            id: 104
            unique: true
            faction: "Scum and Villainy"
            ship: "Firespray-31"
            skill: 4
            points: 76
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Kath Scarlet"
            id: 105
            unique: true
            faction: "Scum and Villainy"
            ship: "Firespray-31"
            skill: 4
            points: 74
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Koshka Frost"
            id: 106
            unique: true
            faction: "Scum and Villainy"
            ship: "Firespray-31"
            skill: 3
            points: 71
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Krassis Trelix"
            id: 107
            unique: true
            faction: "Scum and Villainy"
            ship: "Firespray-31"
            skill: 3
            points: 70
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Bounty Hunter"
            id: 108
            faction: "Scum and Villainy"
            ship: "Firespray-31"
            skill: 2
            points: 66
            slots: [
                "Cannon"
                "Missile"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "4-LOM"
            id: 109
            unique: true
            faction: "Scum and Villainy"
            ship: "G-1A Starfighter"
            skill: 3
            points: 49
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
            ship_override:
                actions: [
                    "Calculate"
                    "Lock"
                    "Jam"
                ]

        }
        {
            name: "Zuckuss"
            id: 110
            unique: true
            faction: "Scum and Villainy"
            ship: "G-1A Starfighter"
            skill: 3
            points: 47
            slots: [
                "Talent"
                "Sensor"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Gand Findsman"
            id: 111
            faction: "Scum and Villainy"
            ship: "G-1A Starfighter"
            skill: 1
            points: 43
            slots: [
                "Sensor"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Palob Godalhi"
            id: 112
            unique: true
            faction: "Scum and Villainy"
            ship: "HWK-290"
            skill: 3
            points: 38
            slots: [
                "Talent"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Dace Bonearm"
            id: 113
            unique: true
            faction: "Scum and Villainy"
            ship: "HWK-290"
            skill: 4
            charge: 3
            recurring: true
            points: 36
            slots: [
                "Talent"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Torkil Mux"
            id: 114
            unique: true
            faction: "Scum and Villainy"
            ship: "HWK-290"
            skill: 2
            points: 36
            slots: [
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Dengar"
            id: 115
            unique: true
            faction: "Scum and Villainy"
            ship: "JumpMaster 5000"
            skill: 6
            charge: 1
            recurring: true
            points: 64
            slots: [
                "Talent"
                "Crew"
                "Torpedo"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Tel Trevura"
            id: 116
            unique: true
            faction: "Scum and Villainy"
            ship: "JumpMaster 5000"
            skill: 4
            charge: 1        
            points: 60
            slots: [
                "Talent"
                "Crew"
                "Torpedo"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Manaroo"
            id: 117
            unique: true
            faction: "Scum and Villainy"
            ship: "JumpMaster 5000"
            skill: 3
            points: 56
            slots: [
                "Talent"
                "Crew"
                "Torpedo"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Contracted Scout"
            id: 118
            faction: "Scum and Villainy"
            ship: "JumpMaster 5000"
            skill: 2
            points: 52
            slots: [
                "Torpedo"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Talonbane Cobra"
            id: 119
            unique: true
            faction: "Scum and Villainy"
            ship: "Kihraxz Fighter"
            skill: 5
            points: 50
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Graz"
            id: 120
            unique: true
            faction: "Scum and Villainy"
            ship: "Kihraxz Fighter"
            skill: 4
            points: 47
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Viktor Hel"
            id: 121
            unique: true
            faction: "Scum and Villainy"
            ship: "Kihraxz Fighter"
            skill: 4
            points: 45
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Captain Jostero"
            id: 122
            unique: true
            faction: "Scum and Villainy"
            ship: "Kihraxz Fighter"
            skill: 3
            points: 43
            slots: [
                "Missile"
                "Illicit"
                "Modification"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Black Sun Ace"
            id: 123
            faction: "Scum and Villainy"
            ship: "Kihraxz Fighter"
            skill: 3
            points: 42
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Cartel Marauder"
            id: 124
            faction: "Scum and Villainy"
            ship: "Kihraxz Fighter"
            skill: 2
            points: 40
            slots: [
                "Missile"
                "Illicit"
                "Modification"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Asajj Ventress"
            id: 125
            unique: true
            faction: "Scum and Villainy"
            ship: "Lancer-Class Pursuit Craft"
            skill: 4
            points: 84
            force: 2
            slots: [
                "Force"
                "Crew"
                "Illicit"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Ketsu Onyo"
            id: 126
            unique: true
            faction: "Scum and Villainy"
            ship: "Lancer-Class Pursuit Craft"
            skill: 5
            points: 74
            slots: [
                "Talent"
                "Crew"
                "Illicit"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Sabine Wren (Scum)"
            id: 127
            unique: true
            xws: "sabinewren-lancerclasspursuitcraft"
            faction: "Scum and Villainy"
            ship: "Lancer-Class Pursuit Craft"
            skill: 3
            points: 68
            slots: [
                "Talent"
                "Crew"
                "Illicit"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Shadowport Hunter"
            id: 128
            faction: "Scum and Villainy"
            ship: "Lancer-Class Pursuit Craft"
            skill: 2
            points: 64
            slots: [
                "Crew"
                "Illicit"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Torani Kulda"
            id: 129
            unique: true
            faction: "Scum and Villainy"
            ship: "M12-L Kimogila Fighter"
            skill: 4
            points: 50
            slots: [
                "Talent"
                "Torpedo"
                "Missile"
                "Astromech"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Dalan Oberos"
            id: 130
            unique: true
            faction: "Scum and Villainy"
            ship: "M12-L Kimogila Fighter"
            skill: 3
            charge: 2
            points: 48
            slots: [
                "Talent"
                "Torpedo"
                "Missile"
                "Astromech"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Cartel Executioner"
            id: 131
            faction: "Scum and Villainy"
            ship: "M12-L Kimogila Fighter"
            skill: 3
            points: 44
            slots: [
                "Talent"
                "Torpedo"
                "Missile"
                "Astromech"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Serissu"
            id: 132
            unique: true
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 5
            points: 43
            slots: [
                "Talent"
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Genesis Red"
            id: 133
            unique: true
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 4
            points: 35
            slots: [
                "Talent"
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Laetin A'shera"
            id: 134
            unique: true
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 3
            points: 35
            slots: [
                "Talent"
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Quinn Jast"
            id: 135
            unique: true
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 3
            points: 35
            slots: [
                "Talent"
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Tansarii Point Veteran"
            id: 136
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 3
            points: 33
            slots: [
                "Talent"
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Inaldra"
            id: 137
            unique: true
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 2
            points: 32
            slots: [
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Sunny Bounder"
            id: 138
            unique: true
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 1
            points: 31
            slots: [
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Cartel Spacer"
            id: 139
            faction: "Scum and Villainy"
            ship: "M3-A Interceptor"
            skill: 1
            points: 29
            slots: [
                "Modification"
                "Hardpoint"
              ]
        }
        {
            name: "Constable Zuvio"
            id: 140
            unique: true
            faction: "Scum and Villainy"
            ship: "Quadjumper"
            skill: 4
            points: 33
            slots: [
                "Talent"
                "Tech"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Sarco Plank"
            id: 141
            unique: true
            faction: "Scum and Villainy"
            ship: "Quadjumper"
            skill: 2
            points: 31
            slots: [
                "Tech"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Unkar Plutt"
            id: 142
            unique: true
            faction: "Scum and Villainy"
            ship: "Quadjumper"
            skill: 2
            points: 30
            slots: [
                "Tech"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Jakku Gunrunner"
            id: 143
            faction: "Scum and Villainy"
            ship: "Quadjumper"
            skill: 1
            points: 28
            slots: [
                "Tech"
                "Crew"
                "Device"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Captain Nym"
            id: 144
            unique: true
            faction: "Scum and Villainy"
            ship: "Scurrg H-6 Bomber"
            skill: 5
            charge: 1
            recurring: true
            points: 52
            slots: [
                "Talent"
                "Turret"
                "Crew"
                "Device"
                "Device"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Sol Sixxa"
            id: 145
            unique: true
            faction: "Scum and Villainy"
            ship: "Scurrg H-6 Bomber"
            skill: 3
            points: 49
            slots: [
                "Talent"
                "Turret"
                "Crew"
                "Device"
                "Device"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Lok Revenant"
            id: 146
            faction: "Scum and Villainy"
            ship: "Scurrg H-6 Bomber"
            skill: 2
            points: 46
            slots: [
                "Turret"
                "Crew"
                "Device"
                "Device"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Guri"
            id: 147
            unique: true
            faction: "Scum and Villainy"
            ship: "StarViper"
            skill: 5
            points: 62
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Modification"
                "Title"
              ]
            ship_override:
                actions: [
                    "Calculate"
                    "Lock"
                    "Barrel Roll"
                    "R> Calculate"
                    "Boost"
                    "R> Calculate"
                ]
        }
        {
            name: "Prince Xizor"
            id: 148
            unique: true
            faction: "Scum and Villainy"
            ship: "StarViper"
            skill: 4
            points: 54
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Dalan Oberos (StarViper)"
            id: 149
            unique: true
            xws: "dalanoberos-starviperclassattackplatform"
            faction: "Scum and Villainy"
            ship: "StarViper"
            skill: 4
            points: 54
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Black Sun Assassin"
            id: 150
            faction: "Scum and Villainy"
            ship: "StarViper"
            skill: 3
            points: 48
            slots: [
                "Talent"
                "Sensor"
                "Torpedo"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Black Sun Enforcer"
            id: 151
            faction: "Scum and Villainy"
            ship: "StarViper"
            skill: 2
            points: 46
            slots: [
                "Sensor"
                "Torpedo"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Moralo Eval"
            id: 152
            unique: true
            faction: "Scum and Villainy"
            ship: "YV-666"
            skill: 4
            charge: 2
            points: 72
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Crew"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Bossk"
            id: 153
            unique: true
            faction: "Scum and Villainy"
            ship: "YV-666"
            skill: 4
            points: 70
        
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Crew"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Latts Razzi"
            id: 154
            unique: true
            faction: "Scum and Villainy"
            ship: "YV-666"
            skill: 3
            points: 66
            slots: [
                "Talent"
                "Cannon"
                "Missile"
                "Crew"
                "Crew"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Trandoshan Slaver"
            id: 155
            faction: "Scum and Villainy"
            ship: "YV-666"
            skill: 2
            points: 58
            slots: [
                "Cannon"
                "Missile"
                "Crew"
                "Crew"
                "Crew"
                "Illicit"
                "Modification"
                "Title"
              ]
        }
        {
            name: "N'dru Suhlak"
            id: 156
            unique: true
            faction: "Scum and Villainy"
            ship: "Z-95 Headhunter"
            skill: 4
            points: 31
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Kaa'to Leeachos"
            id: 157
            unique: true
            faction: "Scum and Villainy"
            ship: "Z-95 Headhunter"
            skill: 3
            points: 29
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Black Sun Soldier"
            id: 158
            faction: "Scum and Villainy"
            ship: "Z-95 Headhunter"
            skill: 3
            points: 27
            slots: [
                "Talent"
                "Missile"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Binayre Pirate"
            id: 159
            faction: "Scum and Villainy"
            ship: "Z-95 Headhunter"
            skill: 1
            points: 24
            slots: [
                "Missile"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Nashtah Pup"
            id: 160
            unique: true
            faction: "Scum and Villainy"
            ship: "Z-95 Headhunter"
            skill: 1
            points: 6
            slots: [
                "Missile"
                "Illicit"
                "Modification"
              ]
        }
        {
            name: "Major Vynder"
            id: 161
            unique: true
            faction: "Galactic Empire"
            ship: "Alpha-Class Star Wing"
            skill: 4
            points: 41
            slots: [
                "Talent"         
                "Sensor"
                "Torpedo"
                "Missile"
                "Modification"
                "Configuration"
              ]
        }
        {
            name: "Lieutenant Karsabi"
            id: 162
            unique: true
            faction: "Galactic Empire"
            ship: "Alpha-Class Star Wing"
            skill: 3
            points: 39
            slots: [
                "Talent"         
                "Sensor"
                "Torpedo"
                "Missile"
                "Modification"
                "Configuration"
              ]
        }
        {
            name: "Rho Squadron Pilot"
            id: 163
            faction: "Galactic Empire"
            ship: "Alpha-Class Star Wing"
            skill: 3
            points: 37
            slots: [
                "Talent"         
                "Sensor"
                "Torpedo"
                "Missile"
                "Modification"
                "Configuration"
              ]
        }
        {
            name: "Nu Squadron Pilot"
            id: 164
            faction: "Galactic Empire"
            ship: "Alpha-Class Star Wing"
            skill: 2
            points: 35
            slots: [      
                "Sensor"
                "Torpedo"
                "Missile"
                "Modification"
                "Configuration"
              ]
        }
        {
            name: "Captain Kagi"
            id: 165
            unique: true
            faction: "Galactic Empire"
            ship: "Lambda-Class Shuttle"
            skill: 4
            points: 48
            slots: [       
                "Sensor"
                "Cannon"
                "Crew"
                "Crew"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Lieutenant Sai"
            id: 166
            unique: true
            faction: "Galactic Empire"
            ship: "Lambda-Class Shuttle"
            skill: 3
            points: 47
            slots: [       
                "Sensor"
                "Cannon"
                "Crew"
                "Crew"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Colonel Jendon"
            id: 167
            unique: true
            faction: "Galactic Empire"
            ship: "Lambda-Class Shuttle"
            skill: 3
            charge: 2
            points: 46
            slots: [       
                "Sensor"
                "Cannon"
                "Crew"
                "Crew"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Omicron Group Pilot"
            id: 168
            faction: "Galactic Empire"
            ship: "Lambda-Class Shuttle"
            skill: 1
            points: 43
            slots: [       
                "Sensor"
                "Cannon"
                "Crew"
                "Crew"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Grand Inquisitor"
            id: 169
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Advanced Prototype"
            skill: 5
            points: 58
            force: 2
            slots: [       
                "Force"
                "Sensor"
                "Missile"
              ]
        }
        {
            name: "Seventh Sister"
            id: 170
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Advanced Prototype"
            skill: 4
            points: 48
            force: 2
            slots: [       
                "Force"
                "Sensor"
                "Missile"
              ]
        }
        {
            name: "Inquisitor"
            id: 171
            faction: "Galactic Empire"
            ship: "TIE Advanced Prototype"
            skill: 3
            points: 40
            force: 1
            slots: [       
                "Force"
                "Sensor"
                "Missile"
              ]
        }
        {
            name: "Baron of the Empire"
            id: 172
            faction: "Galactic Empire"
            ship: "TIE Advanced Prototype"
            skill: 3
            points: 34
            slots: [       
                "Talent"
                "Sensor"
                "Missile"
              ]
        }
        {
            name: "Darth Vader"
            id: 173
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Advanced"
            skill: 6
            points: 70
            force: 3
            slots: [       
                "Force"
                "Sensor"
                "Missile"
                "Modification"
              ]
        }
        {
            name: "Maarek Stele"
            id: 174
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Advanced"
            skill: 5
            points: 50
            slots: [       
                "Talent"
                "Sensor"
                "Missile"
                "Modification"
              ]
        }
        {
            name: "Ved Foslo"
            id: 175
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Advanced"
            skill: 4
            points: 47
            slots: [       
                "Talent"
                "Sensor"
                "Missile"
                "Modification"
              ]
        }
        {
            name: "Zertik Strom"
            id: 176
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Advanced"
            skill: 3
            points: 45
            slots: [       
                "Sensor"
                "Missile"
                "Modification"
              ]
        }
        {
            name: "Storm Squadron Ace"
            id: 177
            faction: "Galactic Empire"
            ship: "TIE Advanced"
            skill: 3
            points: 43
            slots: [       
                "Talent"
                "Sensor"
                "Missile"
                "Modification"
              ]
        }
        {
            name: "Tempest Squadron Pilot"
            id: 178
            faction: "Galactic Empire"
            ship: "TIE Advanced"
            skill: 2
            points: 41
            slots: [  
                "Sensor"
                "Missile"
                "Modification"
              ]
        }
        {
            name: "Soontir Fel"
            id: 179
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Interceptor"
            skill: 6
            points: 52
            slots: [       
                "Talent"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Turr Phennir"
            id: 180
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Interceptor"
            skill: 4
            points: 44
            slots: [       
                "Talent"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Saber Squadron Ace"
            id: 181
            faction: "Galactic Empire"
            ship: "TIE Interceptor"
            skill: 4
            points: 40
            slots: [       
                "Talent"
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Alpha Squadron Pilot"
            id: 182
            faction: "Galactic Empire"
            ship: "TIE Interceptor"
            skill: 1
            points: 34
            slots: [       
                "Modification"
                "Modification"
              ]
        }
        {
            name: "Major Vermeil"
            id: 183
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Reaper"
            skill: 4
            points: 49
            slots: [       
                "Talent"
                "Crew"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Captain Feroph"
            id: 184
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Reaper"
            skill: 3
            points: 47
            slots: [       
                "Talent"
                "Crew"
                "Crew"
                "Modification"
              ]
        }
        {
            name: '"Vizier"'
            id: 185
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Reaper"
            skill: 2
            points: 45
            slots: [
                "Crew"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Scarif Base Pilot"
            id: 186
            faction: "Galactic Empire"
            ship: "TIE Reaper"
            skill: 1
            points: 41
            slots: [       
                "Crew"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Lieutenant Kestal"
            id: 187
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Aggressor"
            skill: 4
            points: 36
            slots: [       
                "Talent"
                "Turret"
                "Missile"
                "Missile"
                "Gunner"
                "Modification"
              ]
        }
        {
            name: '"Double Edge"'
            id: 188
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Aggressor"
            skill: 2
            points: 33
            slots: [       
                "Talent"
                "Turret"
                "Missile"
                "Missile"
                "Gunner"
                "Modification"
              ]
        }
        {
            name: "Onyx Squadron Scout"
            id: 189
            faction: "Galactic Empire"
            ship: "TIE Aggressor"
            skill: 3
            points: 32
            slots: [       
                "Talent"
                "Turret"
                "Missile"
                "Missile"
                "Gunner"
                "Modification"
              ]
        }
        {
            name: "Sienar Specialist"
            id: 190
            faction: "Galactic Empire"
            ship: "TIE Aggressor"
            skill: 2
            points: 30
            slots: [       
                "Turret"
                "Missile"
                "Missile"
                "Gunner"
                "Modification"
              ]
        }
        {
            name: '"Redline"'
            id: 191
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Punisher"
            skill: 5
            points: 44
            slots: [       
                "Sensor"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: '"Deathrain"'
            id: 192
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Punisher"
            skill: 4
            points: 42
            slots: [       
                "Sensor"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Cutlass Squadron Pilot"
            id: 193
            faction: "Galactic Empire"
            ship: "TIE Punisher"
            skill: 2
            points: 36
            slots: [       
                "Sensor"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Colonel Vessery"
            id: 194
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Defender"
            skill: 4
            points: 88
            slots: [       
                "Talent"
                "Sensor"
                "Cannon"
                "Missile"
              ]
        }
        {
            name: "Countess Ryad"
            id: 195
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Defender"
            skill: 4
            points: 86
            slots: [       
                "Talent"
                "Sensor"
                "Cannon"
                "Missile"
              ]
        }
        {
            name: "Rexler Brath"
            id: 196
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Defender"
            skill: 5
            points: 84
            slots: [       
                "Talent"
                "Sensor"
                "Cannon"
                "Missile"
              ]
        }
        {
            name: "Onyx Squadron Ace"
            id: 197
            faction: "Galactic Empire"
            ship: "TIE Defender"
            skill: 4
            points: 78
            slots: [       
                "Talent"
                "Sensor"
                "Cannon"
                "Missile"
              ]
        }
        {
            name: "Delta Squadron Pilot"
            id: 198
            faction: "Galactic Empire"
            ship: "TIE Defender"
            skill: 1
            points: 72
            slots: [       
                "Sensor"
                "Cannon"
                "Missile"
              ]
        }
        {
            name: '"Whisper"'
            id: 199
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Phantom"
            skill: 5
            points: 52
            slots: [       
                "Talent"
                "Sensor"
                "Crew"
                "Modification"
              ]
        }
        {
            name: '"Echo"'
            id: 200
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Phantom"
            skill: 4
            points: 50
            slots: [       
                "Talent"
                "Sensor"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Sigma Squadron Ace"
            id: 201
            faction: "Galactic Empire"
            ship: "TIE Phantom"
            skill: 4
            points: 46
            slots: [       
                "Talent"
                "Sensor"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Imdaar Test Pilot"
            id: 202
            faction: "Galactic Empire"
            ship: "TIE Phantom"
            skill: 3
            points: 44
            slots: [       
                "Sensor"
                "Crew"
                "Modification"
              ]
        }
        {
            name: "Captain Jonus"
            id: 203
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Bomber"
            skill: 4
            points: 36
            slots: [       
                "Talent"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Major Rhymer"
            id: 204
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Bomber"
            skill: 4
            points: 34
            slots: [       
                "Talent"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Tomax Bren"
            id: 205
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Bomber"
            skill: 5
            points: 34
            slots: [       
                "Talent"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: '"Deathfire"'
            id: 206
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Bomber"
            skill: 2
            points: 32
            slots: [       
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Gamma Squadron Ace"
            id: 207
            faction: "Galactic Empire"
            ship: "TIE Bomber"
            skill: 3
            points: 30
            slots: [       
                "Talent"
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Scimitar Squadron Pilot"
            id: 208
            faction: "Galactic Empire"
            ship: "TIE Bomber"
            skill: 2
            points: 28
            slots: [       
                "Torpedo"
                "Missile"
                "Missile"
                "Gunner"
                "Device"
                "Device"
                "Modification"
              ]
        }
        {
            name: '"Countdown"'
            id: 209
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Striker"
            skill: 4
            points: 44
            slots: [       
                "Talent"
                "Gunner"
                "Device"
                "Modification"
              ]
        }
        {
            name: '"Pure Sabacc"'
            id: 210
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Striker"
            skill: 4
            points: 44
            slots: [       
                "Talent"
                "Gunner"
                "Device"
                "Modification"
              ]
        }
        {
            name: '"Duchess"'
            id: 211
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Striker"
            skill: 5
            points: 42
            slots: [       
                "Talent"
                "Gunner"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Black Squadron Scout"
            id: 212
            faction: "Galactic Empire"
            ship: "TIE Striker"
            skill: 3
            points: 38
            slots: [       
                "Talent"
                "Gunner"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Planetary Sentinel"
            id: 213
            faction: "Galactic Empire"
            ship: "TIE Striker"
            skill: 1
            points: 34
            slots: [    
                "Gunner"
                "Device"
                "Modification"
              ]
        }
        {
            name: "Rear Admiral Chiraneau"
            id: 214
            unique: true
            faction: "Galactic Empire"
            ship: "VT-49 Decimator"
            skill: 5
            points: 88
            slots: [       
                "Talent"
                "Torpedo"
                "Crew"
                "Crew"
                "Gunner"
                "Device"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Captain Oicunn"
            id: 215
            unique: true
            faction: "Galactic Empire"
            ship: "VT-49 Decimator"
            skill: 3
            points: 84
            slots: [       
                "Talent"
                "Torpedo"
                "Crew"
                "Crew"
                "Gunner"
                "Device"
                "Modification"
                "Title"
              ]
        }
        {
            name: "Patrol Leader"
            id: 216
            faction: "Galactic Empire"
            ship: "VT-49 Decimator"
            skill: 2
            points: 80
            slots: [    
                "Torpedo"
                "Crew"
                "Crew"
                "Gunner"
                "Device"
                "Modification"
                "Title"
              ]
        }
        {
            name: '"Howlrunner"'
            id: 217
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 5
            points: 40
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: "Iden Versio"
            id: 218
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 4
            charge: 1
            points: 40
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: '"Mauler" Mithel'
            id: 219
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 5
            points: 32
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: '"Scourge" Skutu'
            id: 220
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 5
            points: 32
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: '"Wampa"'
            id: 221
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 1
            recurring: true
            charge: 1
            points: 30
            slots: [       
                "Modification"
              ]
        }
        {
            name: "Del Meeko"
            id: 222
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 4
            points: 30
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: "Gideon Hask"
            id: 223
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 4
            points: 30
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: "Seyn Marana"
            id: 224
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 4
            points: 30
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: "Valen Rudor"
            id: 225
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 3
            points: 28
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: '"Night Beast"'
            id: 226
            unique: true
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 2
            points: 26
            slots: [       
                "Modification"
              ]
        }
        {
            name: "Black Squadron Ace"
            id: 227
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 3
            points: 26
            slots: [       
                "Talent"
                "Modification"
              ]
        }
        {
            name: "Obsidian Squadron Pilot"
            id: 228
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 2
            points: 24
            slots: [       
                "Modification"
              ]
        }
        {
            name: "Academy Pilot"
            id: 229
            faction: "Galactic Empire"
            ship: "TIE Fighter"
            skill: 1
            points: 23
            slots: [       
                "Modification"
              ]
        }
        {
            name: "Spice Runner"
            id: 230
            faction: "Scum and Villainy"
            ship: "HWK-290"
            skill: 1
            points: 32
            slots: [
                "Crew"
                "Device"
                "Illicit"
                "Modification"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Poe Dameron"
            id: 231
            unique: true
            faction: "Resistance"
            ship: "T-70 X-Wing"
            skill: 6
            points: 100
            charge: 1
            recurring: true 
            slots: [
                "Astromech"
                "Modification"
                "Configuration"
                "Tech"
                "Title"
                "Hardpoint"
            ]
        }
        {
            name: "Lieutenant Bastian"
            id: 232
            unique: true
            faction: "Resistance"
            ship: "T-70 X-Wing"
            skill: 6
            points: 1
            slots: [
                "Astromech"
                "Modification"
                "Configuration"
                "Tech"
                "Hardpoint"
            ]
        }
        {
            name: '"Midnight"'
            id: 233
            unique: true
            faction: "First Order"
            ship: "TIE/FO Fighter"
            skill: 6
            points: 100
            slots: [
                "Modification"
            ]
        }
        {
            name: '"Longshot"'
            id: 234
            unique: true
            faction: "First Order"
            ship: "TIE/FO Fighter"
            skill: 3
            points: 100
            slots: [
                "Modification"
            ]
        }
        {
            name: '"Muse"'
            id: 235
            unique: true
            faction: "First Order"
            ship: "TIE/FO Fighter"
            skill: 2
            points: 100
            slots: [
                "Modification"
            ]
        }
        {
            name: "Kylo Ren"
            id: 236
            unique: true
            faction: "First Order"
            ship: "TIE Silencer"
            skill: 5
            force: 2
            points: 100
            applies_condition: '''I'll Show You the Dark Side'''.canonicalize()
            slots: [
                "Force"
                "Tech"
                "Modification"
            ]
        }
        {
            name: '"Blackout"'
            id: 237
            unique: true
            faction: "First Order"
            ship: "TIE Silencer"
            skill: 5
            points: 100
            slots: [
                "Talent"
                "Tech"
                "Modification"
            ]
        }
        {
            name: "Lieutenant Dormitz"
            id: 238
            unique: true
            faction: "First Order"
            ship: "Upsilon-Class Shuttle"
            skill: 0
            points: 100
            slots: [
                "Tech"
                "Tech"
                "Crew"
                "Crew"
                "Cannon"
                "Sensor"
                "Modification"
            ]
        }
        {
            name: "Lulo Lampar"
            id: 239
            unique: true
            faction: "Resistance"
            ship: "RZ-2 A-Wing"
            skill: 5
            points: 100
            slots: [
                "Talent"
                "Missile"
            ]
        }
        {
            name: "Tallissan Lintra"
            id: 240
            unique: true
            faction: "Resistance"
            ship: "RZ-2 A-Wing"
            skill: 5
            charge: 1
            recurring: true
            points: 100
            slots: [
                "Talent"
                "Missile"
            ]
        }
        {
            name: "Lulo Lampar"
            id: 241
            unique: true
            faction: "Resistance"
            ship: "RZ-2 A-Wing"
            skill: 5
            points: 100
            slots: [
                "Talent"
                "Missile"
            ]
        }
        {
            name: '"Backdraft"'
            id: 242
            unique: true
            faction: "First Order"
            ship: "TIE/SF Fighter"
            skill: 4
            points: 100
            slots: [
                "Talent"
                "Tech"
                "Gunner"
                "Sensor"
                "Modification"
            ]
        }
        {
            name: '"Quickdraw"'
            id: 243
            unique: true
            faction: "First Order"
            ship: "TIE/SF Fighter"
            skill: 0
            points: 100
            slots: [
                "Talent"
                "Tech"
                "Gunner"
                "Sensor"
                "Modification"
            ]
        }
        {
            name: "Rey"
            id: 244
            unique: true
            faction: "Resistance"
            ship: "Scavenged YT-1300"
            skill: 5
            points: 100
            force: 2
            slots: [
                "Force"
                "Crew"
                "Crew"
                "Gunner"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Han Solo (Resistance)"
            id: 245
            unique: true
            faction: "Resistance"
            ship: "Scavenged YT-1300"
            skill: 6
            points: 100
            slots: [
                "Talent"
                "Crew"
                "Crew"
                "Gunner"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Chewbacca (Resistance)"
            id: 246
            unique: true
            faction: "Resistance"
            ship: "Scavenged YT-1300"
            skill: 4
            points: 100
            slots: [
                "Talent"
                "Crew"
                "Crew"
                "Gunner"
                "Modification"
                "Title"
            ]
        }
        {
            name: "Captain Seevor"
            id: 247
            unique: true
            faction: "Scum and Villainy"
            ship: "Mining Guild TIE Fighter"
            skill: 3
            charge: 1
            Recurring: true
            points: 100
            slots: [
                "Talent"
                "Modification"
            ]
        }
        {
            name: "Mining Guild Surveyor"
            id: 248
            faction: "Scum and Villainy"
            ship: "Mining Guild TIE Fighter"
            skill: 2
            points: 100
            slots: [
                "Modification"
            ]
        }
        {
            name: "Ahhav"
            id: 249
            unique: true
            faction: "Scum and Villainy"
            ship: "Mining Guild TIE Fighter"
            skill: 0
            points: 100
            slots: [
                "Talent"
                "Modification"
            ]
        }
        {
            name: "Finch Dallow"
            id: 250
            unique: true
            faction: "Resistance"
            ship: "B/SF-17 Bomber"
            skill: 0
            points: 100
            slots: [
                "Talent"
                "Modification"
            ]
        }
    ]


    upgradesById: [
       {
           name: '"Chopper" (Astromech)'
           id: 0
           slot: "Astromech"
           canonical_name: '"Chopper"'.canonicalize()
           points: 2
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: '"Genius"'
           id: 1
           slot: "Astromech"
           points: 0
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "R2 Astromech"
           id: 2
           slot: "Astromech"
           points: 6
           charge: 2
       }
       {
           name: "R2-D2"
           id: 3
           unique: true
           slot: "Astromech"
           points: 8
           charge: 3
           faction: "Rebel Alliance"
       }
       {
           name: "R3 Astromech"
           id: 4
           slot: "Astromech"
           points: 3
       }
       {
           name: "R4 Astromech"
           id: 5
           slot: "Astromech"
           points: 2
           restriction_func: (ship) ->
                not (ship.data.large? or ship.data.medium?)
           modifier_func: (stats) ->
                for turn in [0 ... stats.maneuvers[1].length]
                    if turn > 4
                        continue
                    if stats.maneuvers[1][turn] > 0 
                        if stats.maneuvers[1][turn] == 3
                            stats.maneuvers[1][turn] = 1
                        else 
                            stats.maneuvers[1][turn] = 2
                    if stats.maneuvers[2][turn] > 0 
                        if stats.maneuvers[2][turn] == 3
                            stats.maneuvers[2][turn] = 1
                        else 
                            stats.maneuvers[2][turn] = 2
       }
       {
           name: "R5 Astromech"
           id: 6
           slot: "Astromech"
           points: 5
           charge: 2
       }
       {
           name: "R5-D8"
           id: 7
           unique: true
           slot: "Astromech"
           points: 7
           charge: 3
           faction: "Rebel Alliance"
       }
       {
           name: "R5-P8"
           id: 8
           slot: "Astromech"
           points: 4
           unique: true
           faction: "Scum and Villainy"
           charge: 3
       }
       {
           name: "R5-TK"
           id: 9
           slot: "Astromech"
           points: 1
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Heavy Laser Cannon"
           id: 10
           slot: "Cannon"
           points: 4
           attackbull: 4
           range: """2-3"""
       }
       {
           name: "Ion Cannon"
           id: 11
           slot: "Cannon"
           points: 5
           attack: 3
           range: """1-3"""
       }
       {
           name: "Jamming Beam"
           id: 12
           slot: "Cannon"
           points: 2
           attack: 3
           range: """1-2"""
       }
       {
           name: "Tractor Beam"
           id: 13
           slot: "Cannon"
           points: 3
           attack: 3
           range: """1-3"""
       }
       {
           name: "Admiral Sloane"
           id: 14
           slot: "Crew"
           points: 10
           unique: true
           faction: "Galactic Empire"
       }
       {
           name: "Agent Kallus"
           id: 15
           slot: "Crew"
           points: 6
           unique: true
           faction: "Galactic Empire"
           applies_condition: 'Hunted'.canonicalize()
       }
       {
           name: "Boba Fett"
           id: 16
           slot: "Crew"
           points: 4
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Baze Malbus"
           id: 17
           slot: "Crew"
           points: 8
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "C-3PO"
           id: 18
           slot: "Crew"
           points: 12
           unique: true
           faction: "Rebel Alliance"
           modifier_func: (stats) ->
                stats.actions.push 'Calculate' if 'Calculate' not in stats.actions
       }
       {
           name: "Cassian Andor"
           id: 19
           slot: "Crew"
           points: 6
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Cad Bane"
           id: 20
           slot: "Crew"
           points: 4
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Chewbacca"
           id: 21
           slot: "Crew"
           points: 5
           unique: true
           faction: "Rebel Alliance"
           charge: 2
           recurring: true 
       }
       {
           name: "Chewbacca (Scum)"
           id: 22
           slot: "Crew"
           xws: "chewbacca-crew" 
           points: 4
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: '"Chopper" (Crew)'
           id: 23
           canonical_name: '"Chopper"'.canonicalize()
           xws: "chopper-crew" 
           slot: "Crew"
           points: 2
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Ciena Ree"
           id: 24
           slot: "Crew"
           points: 10
           unique: true
           faction: "Galactic Empire"
           restriction_func: (ship) ->
                "Coordinate" in ship.effectiveStats().actions or "Coordinate" in ship.effectiveStats().actionsred
       }
       {
           name: "Cikatro Vizago"
           id: 25
           slot: "Crew"
           points: 2
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Darth Vader"
           id: 26
           slot: "Crew"
           points: 14
           force: 1
           unique: true
           faction: "Galactic Empire"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Death Troopers"
           id: 27
           slot: "Crew"
           points: 6
           unique: true
           faction: "Galactic Empire"
           restriction_func: (ship, upgrade_obj) ->
                ship.hasAnotherUnoccupiedSlotLike upgrade_obj
           validation_func: (ship, upgrade_obj) ->
                upgrade_obj.occupiesAnotherUpgradeSlot()
           also_occupies_upgrades: [ "Crew" ]
       }
       {
           name: "Director Krennic"
           id: 28
           slot: "Crew"
           points: 5
           unique: true
           faction: "Galactic Empire"
           applies_condition: 'Optimized Prototype'.canonicalize()
           modifier_func: (stats) ->
                stats.actions.push 'Lock' if 'Lock' not in stats.actions
       }
       {
           name: "Emperor Palpatine"
           id: 29
           slot: "Crew"
           points: 13
           force: 1
           unique: true
           faction: "Galactic Empire"
           restriction_func: (ship, upgrade_obj) ->
                ship.hasAnotherUnoccupiedSlotLike upgrade_obj
           validation_func: (ship, upgrade_obj) ->
                upgrade_obj.occupiesAnotherUpgradeSlot()
           also_occupies_upgrades: [ "Crew" ]
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Freelance Slicer"
           id: 30
           slot: "Crew"
           points: 3
       }
       {
           name: "4-LOM"
           id: 31
           slot: "Crew"
           points: 3
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: 'GNK "Gonk" Droid'
           id: 32
           slot: "Crew"
           points: 10
           charge: 1
       }
       {
           name: "Grand Inquisitor"
           id: 33
           slot: "Crew"
           points: 16
           unique: true
           force: 1 
           faction: "Galactic Empire"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Grand Moff Tarkin"
           id: 34
           slot: "Crew"
           points: 10
           unique: true
           faction: "Galactic Empire"
           charge: 2
           recurring: true
           restriction_func: (ship) ->
                "Lock" in ship.effectiveStats().actions or "Lock" in ship.effectiveStats().actionsred
       }
       {
           name: "Hera Syndulla"
           id: 35
           slot: "Crew"
           points: 4
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "IG-88D"
           id: 36
           slot: "Crew"
           points: 4
           unique: true
           faction: "Scum and Villainy"
           modifier_func: (stats) ->
                stats.actions.push 'Calculate' if 'Calculate' not in stats.actions
        
       }
       {
           name: "Informant"
           id: 37
           slot: "Crew"
           points: 5
           unique: true
           applies_condition: 'Listening Device'.canonicalize()
       }
       {
           name: "ISB Slicer"
           id: 38
           slot: "Crew"
           points: 3
           faction: "Galactic Empire"
       }
       {
           name: "Jabba the Hutt"
           id: 39
           slot: "Crew"
           points: 8
           unique: true
           faction: "Scum and Villainy"
           charge: 4
           restriction_func: (ship, upgrade_obj) ->
                ship.hasAnotherUnoccupiedSlotLike upgrade_obj
           validation_func: (ship, upgrade_obj) ->
                upgrade_obj.occupiesAnotherUpgradeSlot()
           also_occupies_upgrades: [ "Crew" ]
       }
       {
           name: "Jyn Erso"
           id: 40
           slot: "Crew"
           points: 2
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Kanan Jarrus"
           id: 41
           slot: "Crew"
           points: 14
           force: 1
           unique: true
           faction: "Rebel Alliance"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Ketsu Onyo"
           id: 42
           slot: "Crew"
           points: 5
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "L3-37"
           id: 43
           slot: "Crew"
           points: 4
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Lando Calrissian"
           id: 44
           slot: "Crew"
           xws: "landocalrissian" 
           points: 5
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Lando Calrissian (Scum)"
           id: 45
           slot: "Crew"
           xws: "landocalrissian-crew" 
           points: 8
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Leia Organa"
           id: 46
           slot: "Crew"
           points: 8
           unique: true
           faction: "Rebel Alliance"
           charge: 3
           recurring: true 
       }
       {
           name: "Latts Razzi"
           id: 47
           slot: "Crew"
           points: 7
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Maul"
           id: 48
           slot: "Crew"
           points: 13
           unique: true
           force: 1
           modifier_func: (stats) ->
                stats.force += 1
           restriction_func: (ship) ->
                builder = ship.builder
                return true if builder.faction == "Scum and Villainy"
                for t, things of builder.uniques_in_use
                    return true if 'ezrabridger' in (thing.canonical_name.getXWSBaseName() for thing in things)
                false
       }
       {
           name: "Minister Tua"
           id: 49
           slot: "Crew"
           points: 7
           unique: true
           faction: "Galactic Empire"
       }
       {
           name: "Moff Jerjerrod"
           id: 50
           slot: "Crew"
           points: 12
           unique: true
           faction: "Galactic Empire"
           charge: 2
           recurring: true
           restriction_func: (ship) ->
                "Coordinate" in ship.effectiveStats().actions or "Coordinate" in ship.effectiveStats().actionsred
       }
       {
           name: "Magva Yarro"
           id: 51
           slot: "Crew"
           points: 7
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Nien Nunb"
           id: 52
           slot: "Crew"
           points: 5
           unique: true
           faction: "Rebel Alliance"
           modifier_func: (stats) ->
                for s, spd in (stats.maneuvers ? [])
                    continue if spd == 0
                    if s[1] > 0 
                        if s[1] = 1
                            s[1] = 2
                        else if s[1] = 3
                            s[1] = 1
                    if s[3] > 0 
                        if s[3] = 1
                            s[3] = 2
                        else if s[3] = 3
                            s[3] = 1
       }
       {
           name: "Novice Technician"
           id: 53
           slot: "Crew"
           points: 4
       }
       {
           name: "Perceptive Copilot"
           id: 54
           slot: "Crew"
           points: 10
       }
       {
           name: "Qi'ra"
           id: 55
           slot: "Crew"
           points: 2
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "R2-D2 (Crew)"
           id: 56
           slot: "Crew"
           canonical_name: 'r2d2-crew'
           xws: "r2d2-crew"
           points: 8
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Sabine Wren"
           id: 57
           slot: "Crew"
           points: 3
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Saw Gerrera"
           id: 58
           slot: "Crew"
           points: 8
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Seasoned Navigator"
           id: 59
           slot: "Crew"
           points: 5
       }
       {
           name: "Seventh Sister"
           id: 60
           slot: "Crew"
           points: 12
           force: 1
           unique: true
           faction: "Galactic Empire"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Tactical Officer"
           id: 61
           slot: "Crew"
           points: 2
           restriction_func: (ship) ->
                "Coordinate" in ship.effectiveStats().actionsred
           modifier_func: (stats) ->
                stats.actions.push 'Coordinate' if 'Coordinate' not in stats.actions
       }
       {
           name: "Tobias Beckett"
           id: 62
           slot: "Crew"
           points: 2
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "0-0-0"
           id: 63
           slot: "Crew"
           points: 3
           unique: true
           restriction_func: (ship) ->
                builder = ship.builder
                return true if builder.faction == "Scum and Villainy"
                for t, things of builder.uniques_in_use
                    return true if 'darthvader' in (thing.canonical_name.getXWSBaseName() for thing in things)
                false
       }
       {
           name: "Unkar Plutt"
           id: 64
           slot: "Crew"
           points: 2
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: '"Zeb" Orrelios' 
           id: 65
           slot: "Crew"
           points: 1
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Zuckuss"
           id: 66
           slot: "Crew"
           points: 3
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Bomblet Generator"
           id: 67
           slot: "Device"
           points: 5
           charge: 2
           applies_condition: 'Bomblet'.canonicalize()
           restriction_func: (ship, upgrade_obj) ->
                ship.hasAnotherUnoccupiedSlotLike upgrade_obj
           validation_func: (ship, upgrade_obj) ->
                upgrade_obj.occupiesAnotherUpgradeSlot()
           also_occupies_upgrades: [ "Device" ]
       }
       {
           name: "Conner Nets"
           id: 68
           slot: "Device"
           points: 6
           charge: 1
           applies_condition: 'Conner Net'.canonicalize()
       }
       {
           name: "Proton Bombs"
           id: 69
           slot: "Device"
           points: 5
           charge: 2
           applies_condition: 'Proton Bomb'.canonicalize()
       }
       {
           name: "Proximity Mines"
           id: 70
           slot: "Device"
           points: 6
           charge: 2
           applies_condition: 'Proximity Mine'.canonicalize()
       }
       {
           name: "Seismic Charges"
           id: 71
           slot: "Device"
           points: 3
           charge: 2
           applies_condition: 'Seismic Charge'.canonicalize()
       }
       {
           name: "Heightened Perception"
           id: 72
           slot: "Force"
           points: 3
       }
       {
           name: "Instinctive Aim"
           id: 73
           slot: "Force"
           points: 2
       }
       {
           name: "Supernatural Reflexes"
           id: 74
           slot: "Force"
           points: 12
           restriction_func: (ship) ->
                not (ship.data.large? or ship.data.medium?)
       }
       {
           name: "Sense"
           id: 75
           slot: "Force"
           points: 6
       }
       {
           name: "Agile Gunner"
           id: 76
           slot: "Gunner"
           points: 10
       }
       {
           name: "Bistan"
           id: 77
           slot: "Gunner"
           points: 14
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Bossk"
           id: 78
           slot: "Gunner"
           points: 10
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "BT-1"
           id: 79
           slot: "Gunner"
           points: 2
           unique: true
           restriction_func: (ship) ->
                builder = ship.builder
                return true if builder.faction == "Scum and Villainy"
                for t, things of builder.uniques_in_use
                    return true if 'darthvader' in (thing.canonical_name.getXWSBaseName() for thing in things)
                false
       }
       {
           name: "Dengar"
           id: 80
           slot: "Gunner"
           points: 6
           unique: true
           faction: "Scum and Villainy"
           recurring: true
           charge: 1

       }
       {
           name: "Ezra Bridger"
           id: 81
           slot: "Gunner"
           points: 18
           force: 1
           unique: true
           faction: "Rebel Alliance"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Fifth Brother"
           id: 82
           slot: "Gunner"
           points: 12
           force: 1
           unique: true
           faction: "Galactic Empire"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Greedo"
           id: 83
           slot: "Gunner"
           points: 1
           unique: true
           faction: "Scum and Villainy"
           charge: 1
       }
       {
           name: "Han Solo"
           id: 84
           slot: "Gunner"
           xws: "hansolo" 
           points: 12
           unique: true
           faction: "Rebel Alliance"
       }
       {
           name: "Han Solo (Scum)"
           id: 85
           slot: "Gunner"
           xws: "hansolo-gunner"
           points: 4
           unique: true
           faction: "Scum and Villainy"
       }
       {
           name: "Hotshot Gunner"
           id: 86
           slot: "Gunner"
           points: 7
       }
       {
           name: "Luke Skywalker"
           id: 87
           slot: "Gunner"
           points: 30
           force: 1
           unique: true
           faction: "Rebel Alliance"
           modifier_func: (stats) ->
                stats.force += 1
       }
       {
           name: "Skilled Bombardier"
           id: 88
           slot: "Gunner"
           points: 2
       }
       {
           name: "Veteran Tail Gunner"
           id: 89
           slot: "Gunner"
           points: 4
           restriction_func: (ship) ->
                ship.data.attackb?
       }
       {
           name: "Veteran Turret Gunner"
           id: 90
           slot: "Gunner"
           points: 8
           restriction_func: (ship) ->
                "Rotate Arc" in ship.effectiveStats().actions or "Rotate Arc" in ship.effectiveStats().actionsred
       }
       {
           name: "Cloaking Device"
           id: 91
           slot: "Illicit"
           points: 5
           unique: true
           charge: 2
           restriction_func: (ship) ->
                not(ship.data.large?)
       }
       {
           name: "Contraband Cybernetics"
           id: 92
           slot: "Illicit"
           points: 5
           charge: 1
       }
       {
           name: "Deadman's Switch"
           id: 93
           slot: "Illicit"
           points: 2
       }
       {
           name: "Feedback Array"
           id: 94
           slot: "Illicit"
           points: 4
       }
       {
           name: "Inertial Dampeners"
           id: 95
           slot: "Illicit"
           points: 1
       }
       {
           name: "Rigged Cargo Chute"
           id: 96
           slot: "Illicit"
           points: 4
           charge: 1
           restriction_func: (ship) ->
                ship.data.medium?  or ship.data.large?
       }
       {
           name: "Barrage Rockets"
           id: 97
           slot: "Missile"
           points: 6
           attack: 3
           range: """2-3"""
           rangebonus: true 
           charge: 5
           restriction_func: (ship, upgrade_obj) ->
               ship.hasAnotherUnoccupiedSlotLike upgrade_obj
           validation_func: (ship, upgrade_obj) ->
               upgrade_obj.occupiesAnotherUpgradeSlot()
           also_occupies_upgrades: [ 'Missile' ]
       }
       {
           name: "Cluster Missiles"
           id: 98
           slot: "Missile"
           points: 5
           attack: 3
           range: """1-2"""
           rangebonus: true 
           charge: 4
       }
       {
           name: "Concussion Missiles"
           id: 99
           slot: "Missile"
           points: 6
           attack: 3
           range: """2-3"""
           rangebonus: true 
           charge: 3
       }
       {
           name: "Homing Missiles"
           id: 100
           slot: "Missile"
           points: 3
           attack: 4
           range: """2-3"""
           rangebonus: true 
           charge: 2
       }
       {
           name: "Ion Missiles"
           id: 101
           slot: "Missile"
           points: 4
           attack: 3
           range: """2-3"""
           rangebonus: true 
           charge: 3
       }
       {
           name: "Proton Rockets"
           id: 102
           slot: "Missile"
           points: 7
           attackbull: 5
           range: """1-2"""
           rangebonus: true 
           charge: 1
       }
       {
           name: "Ablative Plating"
           id: 103
           slot: "Modification"
           points: 4
           charge: 2
           restriction_func: (ship) ->
                ship.data.medium?  or ship.data.large?
       }
       {
           name: "Advanced SLAM"
           id: 104
           slot: "Modification"
           points: 3
           restriction_func: (ship) -> 
                "Slam" in ship.effectiveStats().actions or "Slam" in ship.effectiveStats().actionsred
       }
       {
           name: "Afterburners"
           id: 105
           slot: "Modification"
           points: 8
           charge: 2
           restriction_func: (ship) ->
                not ((ship.data.large ? false) or (ship.data.medium ? false))
       }
       {
           name: "Electronic Baffle"
           id: 106
           slot: "Modification"
           points: 2
       }
       {
           name: "Engine Upgrade"
           id: 107
           slot: "Modification"
           points: '*'
           basepoints: 3
           variablebase: true
           restriction_func: (ship) ->
                "Boost" in ship.effectiveStats().actionsred
           modifier_func: (stats) ->
                stats.actions.push 'Boost' if 'Boost' not in stats.actions
       }
       {
           name: "Munitions Failsafe"
           id: 108
           slot: "Modification"
           points: 2
       }
       {
           name: "Static Discharge Vanes"
           id: 109
           slot: "Modification"
           points: 6
       }
       {
           name: "Tactical Scrambler"
           id: 110
           slot: "Modification"
           points: 2
           restriction_func: (ship) ->
                ship.data.medium?  or ship.data.large?
       }
       {
           name: "Advanced Sensors"
           id: 111
           slot: "Sensor"
           points: 8
       }
       {
           name: "Collision Detector"
           id: 112
           slot: "Sensor"
           points: 5
           charge: 2
       }
       {
           name: "Fire-Control System"
           id: 113
           slot: "Sensor"
           points: 3
       }
       {
           name: "Trajectory Simulator"
           id: 114
           slot: "Sensor"
           points: 3
       }
       {
           name: "Composure"
           id: 115
           slot: "Talent"
           points: 2
           restriction_func: (ship) ->
                "Focus" in ship.effectiveStats().actions or "Focus" in ship.effectiveStats().actionsred
       }
       {
           name: "Crack Shot"
           id: 116
           slot: "Talent"
           points: 1
           charge: 1
       }
       {
           name: "Daredevil"
           id: 117
           slot: "Talent"
           points: 3
           restriction_func: (ship) ->
                "Boost" in ship.effectiveStats().actions and not (ship.data.large? or ship.data.medium?)
       }
       {
           name: "Debris Gambit"
           id: 118
           slot: "Talent"
           points: 2
           restriction_func: (ship) ->
                not (ship.data.large?)
           modifier_func: (stats) ->
                stats.actionsred.push 'Evade' if 'Evade' not in stats.actionsred
       }
       {
           name: "Elusive"
           id: 119
           slot: "Talent"
           points: 3
           charge: 1
           restriction_func: (ship) ->
                not ship.data.large?
       }
       {
           name: "Expert Handling"
           id: 120
           slot: "Talent"
           points: '*'
           basepoints: 2
           variablebase: true
           restriction_func: (ship) ->
                "Barrel Roll" in ship.effectiveStats().actionsred
           modifier_func: (stats) ->
                stats.actions.push 'Barrel Roll' if 'Barrel Roll' not in stats.actions
       }
       {
           name: "Fearless"
           id: 121
           slot: "Talent"
           points: 3
           faction: "Scum and Villainy"
       }
       {
           name: "Intimidation"
           id: 122
           slot: "Talent"
           points: 3
       }
       {
           name: "Juke"
           id: 123
           slot: "Talent"
           points: 4
           restriction_func: (ship) ->
                not (ship.data.large?)
       }
       {
           name: "Lone Wolf"
           id: 124
           slot: "Talent"
           points: 4
           unique: true
           recurring: true
           charge: 1
       }
       {
           name: "Marksmanship"
           id: 125
           slot: "Talent"
           points: 1
       }
       {
           name: "Outmaneuver"
           id: 126
           slot: "Talent"
           points: 6
       }
       {
           name: "Predator"
           id: 127
           slot: "Talent"
           points: 2
       }
       {
           name: "Ruthless"
           id: 128
           slot: "Talent"
           points: 1
           faction: "Galactic Empire"
       }
       {
           name: "Saturation Salvo"
           id: 129
           slot: "Talent"
           points: 6
           restriction_func: (ship) ->
                "Reload" in ship.effectiveStats().actions or "Reload" in ship.effectiveStats().actionsred
       }
       {
           name: "Selfless"
           id: 130
           slot: "Talent"
           points: 3
           faction: "Rebel Alliance"
       }
       {
           name: "Squad Leader"
           id: 131
           slot: "Talent"
           points: 4
           unique: true
           modifier_func: (stats) ->
                if stats.actionsred?
                    stats.actionsred.push 'Coordinate' if 'Coordinate' not in stats.actionsred
       }
       {
           name: "Swarm Tactics"
           id: 132
           slot: "Talent"
           points: 3
       }
       {
           name: "Trick Shot"
           id: 133
           slot: "Talent"
           points: 1
       }
       {
           name: "Adv. Proton Torpedoes"
           id: 134
           slot: "Torpedo"
           points: 6
           attack: 5
           range: """1"""
           rangebonus: true 
           charge: 1
       }
       {
           name: "Ion Torpedoes"
           id: 135
           slot: "Torpedo"
           points: 6
           attack: 4
           range: """2-3"""
           rangebonus: true 
           charge: 2
       }
       {
           name: "Proton Torpedoes"
           id: 136
           slot: "Torpedo"
           points: 9
           attack: 4
           range: """2-3"""
           rangebonus: true 
           charge: 2
       }
       {
           name: "Dorsal Turret"
           id: 137
           slot: "Turret"
           points: 4
           attackt: 2
           range: """1-2"""
           modifier_func: (stats) ->
                stats.actions.push 'Rotate Arc' if 'Rotate Arc' not in stats.actions
       }
       {
           name: "Ion Cannon Turret"
           id: 138
           slot: "Turret"
           points: 6
           attackt: 3
           range: """1-2"""
           modifier_func: (stats) ->
                stats.actions.push 'Rotate Arc' if 'Rotate Arc' not in stats.actions
       }
       {
           name: "Os-1 Arsenal Loadout"
           id: 139
           points: 0
           slot: "Configuration"
           ship: "Alpha-Class Star Wing"
           confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Torpedo"
                }
                {
                    type: exportObj.Upgrade
                    slot: "Missile"
                }
            ]
       }
       {
           name: "Pivot Wing"
           id: 140
           points: 0
           slot: "Configuration"
           ship: "U-Wing"
       }
       {
           name: "Pivot Wing (Open)"
           id: 141
           points: 0
           skip: true 
       }
       {
           name: "Servomotor S-Foils"
           id: 142
           points: 0
           slot: "Configuration"
           ship: "X-Wing"
       }
       {
           name: "Blank"
           id: 143
           skip: true
       }
       {
           name: "Xg-1 Assault Configuration"
           id: 144
           points: 0
           slot: "Configuration"
           ship: "Alpha-Class Star Wing"
           confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Cannon"
                }
           ]
       }
       {
           name: "L3-37's Programming"
           id: 145
           skip: true 
           points: 0
           slot: "Configuration"
           faction: "Scum and Villainy"
       }
       {
           name: "Andrasta"
           id: 146
           slot: "Title"
           points: 6
           unique: true
           faction: "Scum and Villainy"
           ship: "Firespray-31"
           confersAddons: [
              {
                  type: exportObj.Upgrade
                  slot: "Device"
              }
            ]
           modifier_func: (stats) ->
                stats.actions.push 'Reload' if 'Reload' not in stats.actions
       }
       {
           name: "Dauntless"
           id: 147
           slot: "Title"
           points: 6
           unique: true
           faction: "Galactic Empire"
           ship: "VT-49 Decimator"
       }
       {
           name: "Ghost"
           id: 148
           slot: "Title"
           unique: true
           points: 0
           faction: "Rebel Alliance"
           ship: "VCX-100"
       }
       {
           name: "Havoc"
           id: 149
           slot: "Title"
           points: 4
           unique: true
           faction: "Scum and Villainy"
           ship: "Scurrg H-6 Bomber"
           unequips_upgrades: [
                'Crew'
            ]
           also_occupies_upgrades: [
                'Crew'
           ]
           confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: 'Sensor'
                }
                {
                    type: exportObj.Upgrade
                    slot: 'Astromech'
                }
           ]
       }
       {
           name: "Hound's Tooth"
           id: 150
           slot: "Title"
           points: 1
           unique: true
           faction: "Scum and Villainy"
           ship: "YV-666"
       }
       {
           name: "IG-2000"
           id: 151
           slot: "Title"
           points: 2
           faction: "Scum and Villainy"
           ship: "Aggressor"
       }
       {
           name: "Lando's Millennium Falcon"
           id: 152
           slot: "Title"
           points: 6
           unique: true
           faction: "Scum and Villainy"
           ship: "Customized YT-1300"
       }
       {
           name: "Marauder"
           id: 153
           slot: "Title"
           points: 3
           unique: true
           faction: "Scum and Villainy"
           ship: "Firespray-31"
           confersAddons: [
              {
                  type: exportObj.Upgrade
                  slot: "Gunner"
              }
            ]       }
       {
           name: "Millennium Falcon"
           id: 154
           slot: "Title"
           points: 6
           unique: true
           faction: "Rebel Alliance"
           ship: "YT-1300"
           modifier_func: (stats) ->
                stats.actions.push 'Evade' if 'Evade' not in stats.actions
       }
       {
           name: "Mist Hunter"
           id: 155
           slot: "Title"
           points: 2
           unique: true
           faction: "Scum and Villainy"
           ship: "G-1A Starfighter"
           modifier_func: (stats) ->
                stats.actions.push 'Barrel Roll' if 'Barrel Roll' not in stats.actions
           confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Cannon"
                }
           ]
       }
       {
           name: "Moldy Crow"
           id: 156
           slot: "Title"
           points: 12
           unique: true
           ship: "HWK-290"
       }
       {
           name: "Outrider"
           id: 157
           slot: "Title"
           points: 14
           unique: true
           faction: "Rebel Alliance"
           ship: "YT-2400"
       }
       {
           name: "Phantom (Sheathipede)"
           id: 158
           skip: true 
           slot: "Title"
           points: 2
           unique: true
           faction: "Rebel Alliance"
           ship: "Sheathipede-Class Shuttle"
       }
       {
           name: "Punishing One"
           id: 159
           slot: "Title"
           points: 8
           unique: true
           faction: "Scum and Villainy"
           ship: "JumpMaster 5000"
           unequips_upgrades: [
                'Crew'
           ]
           also_occupies_upgrades: [
                'Crew'
           ]
           confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: 'Astromech'
                }
           ]
       }
       {
           name: "Shadow Caster"
           id: 160
           slot: "Title"
           points: 6
           unique: true
           faction: "Scum and Villainy"
           ship: "Lancer-Class Pursuit Craft"
       }
       {
           name: "Slave I"
           id: 161
           slot: "Title"
           points: 5
           unique: true
           faction: "Scum and Villainy"
           ship: "Firespray-31"
           confersAddons: [
              {
                  type: exportObj.Upgrade
                  slot: "Torpedo"
              }
            ]       }
       {
           name: "ST-321"
           id: 162
           slot: "Title"
           points: 6
           unique: true
           faction: "Galactic Empire"
           ship: "Lambda-Class Shuttle"
       }
       {
           name: "Virago"
           id: 163
           slot: "Title"
           points: 10
           unique: true
           charge: 2
           ship: "StarViper"
           modifier_func: (stats) ->
                stats.shields += 1       
           confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Modification"
                }
            ]
       }
       {
           name: "Hull Upgrade"
           id: 164
           slot: "Modification"
           points: '*'
           basepoints: 2
           variableagility: true
           modifier_func: (stats) ->
                stats.hull += 1       
       }
       {
           name: "Shield Upgrade"
           id: 165
           slot: "Modification"
           points: '*'
           basepoints: 3
           variableagility: true
           modifier_func: (stats) ->
                stats.shields += 1       
       }
       {
           name: "Stealth Device"
           id: 166
           slot: "Modification"
           points: '*'
           basepoints: 3
           variableagility: true
           charge: 1
           modifier_func: (stats) ->
                stats.agility += 1       
       }
       {
           name: "Phantom"
           id: 167
           slot: "Title"
           points: 2
           unique: true
           faction: "Rebel Alliance"
           ship: ["Attack Shuttle","Sheathipede-Class Shuttle"]
       }
       {
            name: "Hardpoint: Cannon"
            id: 168
            slot: "Hardpoint"
            points: 0
            ignorecollection: true
            confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Cannon"
                }
            ]
       }
       {
            name: "Hardpoint: Torpedo"
            id: 169
            slot: "Hardpoint"
            ignorecollection: true
            points: 0
            confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Torpedo"
                }
            ]
       }
       {
            name: "Hardpoint: Missile"
            id: 170
            slot: "Hardpoint"
            ignorecollection: true
            points: 0
            confersAddons: [
                {
                    type: exportObj.Upgrade
                    slot: "Missile"
                }
            ]
       }
       {
            name: "Black One"
            id: 171
            slot: "Title"
            charge: 1
            points: 0
            faction: "Resistance"
            ship: "T-70 X-Wing"
            modifier_func: (stats) ->
                stats.actions.push 'Slam' if 'Slam' not in stats.actions
       }
       {
            name: "Heroic"
            id: 172
            slot: "Talent"
            points: 0
            faction: "Resistance"
       }
       {
            name: "Rose Tico"
            id: 173
            slot: "Crew"
            points: 0
            unique: true
            faction: "Resistance"
       }
       {
            name: "Finn"
            id: 174
            slot: "Gunner"
            points: 0
            unique: true
            faction: "Resistance"
       }
       {
            name: "Integrated S-Foils"
            id: 175
            slot: "Configuration"
            points: 0
            faction: "Resistance"
            ship: "T-70 X-Wing"
       }
       {
            name: "Integrated S-Foils (Open)"
            id: 176
            skip: true
       }
       {
            name: "Targeting Synchronizer"
            id: 177
            slot: "Tech"
            points: 0
            restriction_func: (ship) ->
                "Lock" in ship.effectiveStats().actions or "Lock" in ship.effectiveStats().actionsred
       }
       {
            name: "Primed Thrusters"
            id: 178
            slot: "Tech"
            points: 0
       }
       {
            name: "Kylo Ren (Crew)"
            id: 179
            slot: "Crew"
            points: 0
            force: 1
            faction: "First Order"
            unique: true
            applies_condition: '''I'll Show You the Dark Side'''.canonicalize()
            modifier_func: (stats) ->
                stats.force += 1
       }
       {
            name: "General Hux"
            id: 180
            slot: "Crew"
            points: 0
            unique: true
            faction: "First Order"
       }
       {
            name: "Fanatical"
            id: 181
            slot: "Talent"
            points: 0
            faction: "First Order"
       }
       {
            name: "Special Forces Gunner"
            id: 182
            slot: "Gunner"
            points: 0
            faction: "First Order"
       }
       {
            name: "Captain Phasma"
            id: 183
            slot: "Crew"
            unique: true
            points: 0
            faction: "First Order"
       }
       {
            name: "Supreme Leader Snoke"
            id: 184
            slot: "Crew"
            unique: true
            points: 0
            force: 1
            faction: "First Order"
            restriction_func: (ship, upgrade_obj) ->
                ship.hasAnotherUnoccupiedSlotLike upgrade_obj
            validation_func: (ship, upgrade_obj) ->
                upgrade_obj.occupiesAnotherUpgradeSlot()
            also_occupies_upgrades: [ "Crew" ]
            modifier_func: (stats) ->
                stats.force += 1
       }
       {
            name: "Hyperspace Tracking Data"
            id: 185
            slot: "Tech"
            points: 0
       }
       {
            name: "Advanced Optics"
            id: 186
            slot: "Tech"
            points: 0
       }
       {
            name: "Rey"
            id: 187
            slot: "Gunner"
            points: 0
            unique: true
            force: 1
            faction: "Resistance"
            modifier_func: (stats) ->
                stats.force += 1
       }
       {
            name: "Chewbacca (Resistance)"
            id: 188
            slot: "Crew"
            points: 0
            charge: 2
            unique: true
            faction: "Resistance"
       }
       {
            name: "Paige Tico"
            id: 189
            slot: "Gunner"
            points: 0
            unique: true
            faction: "Resistance"
       }
       {
            name: "R2-HA"
            id: 190
            slot: "Astromech"
            points: 0
            unique: true
            faction: "Resistance"
       }
       {
            name: "C-3PO (Resistance)"
            id: 191
            slot: "Crew"
            points: 0
            unique: true
            faction: "Resistance"
            modifier_func: (stats) ->
                stats.actions.push 'Calculate' if 'Calculate' not in stats.actions
                stats.actionsred.push 'Coordinate' if 'Coordinate' not in stats.actionsred
       }
       {
            name: "Han Solo (Resistance)"
            id: 192
            slot: "Crew"
            points: 0
            unique: true
            faction: "Resistance"
            modifier_func: (stats) ->
                stats.actionsred.push 'Evade' if 'Evade' not in stats.actionsred
       }
       {
            name: "Rey's Millenium Falcon"
            id: 193
            slot: "Title"
            points: 0
            unique: true
            ship: "Scavenged YT-1300"
            faction: "Resistance"
       }
    ]


    conditionsById: [
        {
            name: '''Zero Condition'''
            id: 0
        }
        {
            name: 'Suppressive Fire'
            id: 1
            unique: true
        }
        {
            name: 'Hunted'
            id: 2
            unique: true
        }
        {
            name: 'Listening Device'
            id: 3
            unique: true
        }
        {
            name: 'Optimized Prototype'
            id: 4
            unique: true
        }
        {
            name: '''I'll Show You the Dark Side'''
            id: 5
            unique: true
        }
        {
            name: 'Proton Bomb'
            id: 6
        }
        {
            name: 'Seismic Charge'
            id: 7
        }
        {
            name: 'Bomblet'
            id: 8
        }
        {
            name: 'Loose Cargo'
            id: 9
        }
        {
            name: 'Conner Net'
            id: 10
        }
        {
            name: 'Proximity Mine'
            id: 11
        }
    ]



exportObj.setupCardData = (basic_cards, pilot_translations, upgrade_translations, condition_translations) ->
    # assert that each ID is the index into BLAHById (should keep this, in general)
    for pilot_data, i in basic_cards.pilotsById
        if pilot_data.id != i
            throw new Error("ID mismatch: pilot at index #{i} has ID #{pilot_data.id}")
    for upgrade_data, i in basic_cards.upgradesById
        if upgrade_data.id != i
            throw new Error("ID mismatch: upgrade at index #{i} has ID #{upgrade_data.id}")
    for condition_data, i in basic_cards.conditionsById
        if condition_data.id != i
            throw new Error("ID mismatch: condition at index #{i} has ID #{condition_data.id}")

    exportObj.pilots = {}
    # Assuming a given pilot is unique by name...
    for pilot_data in basic_cards.pilotsById
        unless pilot_data.skip?
            pilot_data.sources = []
            pilot_data.canonical_name = pilot_data.name.canonicalize() unless pilot_data.canonical_name?
            exportObj.pilots[pilot_data.name] = pilot_data
    # pilot_name is the English version here as it's the common index into
    # basic card info
                
    exportObj.upgrades = {}
    for upgrade_data in basic_cards.upgradesById
        unless upgrade_data.skip?
            upgrade_data.sources = []
            upgrade_data.canonical_name = upgrade_data.name.canonicalize() unless upgrade_data.canonical_name?
            exportObj.upgrades[upgrade_data.name] = upgrade_data

    exportObj.conditions = {}
    for condition_data in basic_cards.conditionsById
        unless condition_data.skip?
            condition_data.sources = []
            condition_data.canonical_name = condition_data.name.canonicalize() unless condition_data.canonical_name?
            exportObj.conditions[condition_data.name] = condition_data

    for ship_name, ship_data of basic_cards.ships
        ship_data.canonical_name ?= ship_data.name.canonicalize()
        ship_data.sources = []

    # Set sources from manifest
    for expansion, cards of exportObj.manifestByExpansion
        # console.log(exportObj.manifestByExpansion)
        for card in cards
            continue if card.skipForSource # heavy scyk special case :(
            try
                switch card.type
                    when 'pilot'
                        exportObj.pilots[card.name].sources.push expansion
                    when 'upgrade'
                        exportObj.upgrades[card.name].sources.push expansion
                    when 'ship'
                        exportObj.ships[card.name].sources.push expansion
                    else
                        throw new Error("Unexpected card type #{card.type} for card #{card.name} of #{expansion}")
            catch e
                console.error "Error adding card #{card.name} (#{card.type}) from #{expansion}"

    for name, card of exportObj.pilots
        card.sources = card.sources.sort()
    for name, card of exportObj.upgrades
        card.sources = card.sources.sort()

    exportObj.expansions = {}

    exportObj.pilotsById = {}
    for pilot_name, pilot of exportObj.pilots
        exportObj.fixIcons pilot
        exportObj.pilotsById[pilot.id] = pilot
        for source in pilot.sources
            exportObj.expansions[source] = 1 if source not of exportObj.expansions
    if Object.keys(exportObj.pilotsById).length != Object.keys(exportObj.pilots).length
        throw new Error("At least one pilot shares an ID with another")

    exportObj.pilotsByFactionCanonicalName = {}
    # uniqueness can't be enforced just be canonical name, but by the base part
    exportObj.pilotsByUniqueName = {}
    for pilot_name, pilot of exportObj.pilots
        ((exportObj.pilotsByFactionCanonicalName[pilot.faction] ?= {})[pilot.canonical_name] ?= []).push pilot
        (exportObj.pilotsByUniqueName[pilot.canonical_name.getXWSBaseName()] ?= []).push pilot

    exportObj.pilotsByFactionXWS = {}
    for pilot_name, pilot of exportObj.pilots
        ((exportObj.pilotsByFactionXWS[pilot.faction] ?= {})[pilot.xws] ?= []).push pilot
        

    exportObj.upgradesById = {}
    for upgrade_name, upgrade of exportObj.upgrades
        exportObj.fixIcons upgrade
        exportObj.upgradesById[upgrade.id] = upgrade
        for source in upgrade.sources
            exportObj.expansions[source] = 1 if source not of exportObj.expansions
    if Object.keys(exportObj.upgradesById).length != Object.keys(exportObj.upgrades).length
        throw new Error("At least one upgrade shares an ID with another")

    exportObj.upgradesBySlotCanonicalName = {}
    exportObj.upgradesBySlotXWSName = {}
    exportObj.upgradesBySlotUniqueName = {}
    for upgrade_name, upgrade of exportObj.upgrades
        (exportObj.upgradesBySlotCanonicalName[upgrade.slot] ?= {})[upgrade.canonical_name] = upgrade
        (exportObj.upgradesBySlotXWSName[upgrade.slot] ?= {})[upgrade.xws] = upgrade
        (exportObj.upgradesBySlotUniqueName[upgrade.slot] ?= {})[upgrade.canonical_name.getXWSBaseName()] = upgrade

    exportObj.conditionsById = {}
    for condition_name, condition of exportObj.conditions
        exportObj.fixIcons condition
        exportObj.conditionsById[condition.id] = condition
        for source in condition.sources
            exportObj.expansions[source] = 1 if source not of exportObj.expansions
    if Object.keys(exportObj.conditionsById).length != Object.keys(exportObj.conditions).length
        throw new Error("At least one condition shares an ID with another")

    exportObj.conditionsByCanonicalName = {}
    for condition_name, condition of exportObj.conditions
        (exportObj.conditionsByCanonicalName ?= {})[condition.canonical_name] = condition

    exportObj.expansions = Object.keys(exportObj.expansions).sort()

    for upgrade_name, translations of upgrade_translations
        exportObj.fixIcons translations
        for field, translation of translations
            try
                exportObj.upgrades[upgrade_name][field] = translation
            catch e
                console.error "Cannot find translation for attribute #{field} for upgrade #{upgrade_name}"
                throw e

    for condition_name, translations of condition_translations
        exportObj.fixIcons translations
        for field, translation of translations
            try
                exportObj.conditions[condition_name][field] = translation
            catch e
                console.error "Cannot find translation for attribute #{field} for condition #{condition_name}"
                throw e

    for pilot_name, translations of pilot_translations
        exportObj.fixIcons translations
        for field, translation of translations
            try
                exportObj.pilots[pilot_name][field] = translation
            catch e
                console.error "Cannot find translation for attribute #{field} for pilot #{pilot_name}"
                throw e

exportObj.fixIcons = (data) ->
    if data.text?
        data.text = data.text
            .replace(/%ASTROMECH%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-astromech"></i>')
            .replace(/%BULLSEYEARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-bullseyearc"></i>')
            .replace(/%GUNNER%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-gunner"></i>')
            .replace(/%SINGLETURRETARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-singleturretarc"></i>')
            .replace(/%FRONTARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-frontarc"></i>')
            .replace(/%REARARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-reararc"></i>')
            .replace(/%ROTATEARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-rotatearc"></i>')
            .replace(/%FULLFRONTARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-fullfrontarc"></i>')
            .replace(/%FULLREARARC%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-fullreararc"></i>')
            .replace(/%DEVICE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-device"></i>')
            .replace(/%MODIFICATION%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-modification"></i>')
            .replace(/%RELOAD%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-reload"></i>')
            .replace(/%CONFIG%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-config"></i>')
            .replace(/%TALENT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-talent"></i>')
            .replace(/%FORCE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-forcecharge"></i>')
            .replace(/%CHARGE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-charge"></i>')
            .replace(/%CALCULATE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-calculate"></i>')
            .replace(/%BANKLEFT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-bankleft"></i>')
            .replace(/%BANKRIGHT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-bankright"></i>')
            .replace(/%BARRELROLL%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-barrelroll"></i>')
            .replace(/%BOMB%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-bomb"></i>')
            .replace(/%BOOST%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-boost"></i>')
            .replace(/%CANNON%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-cannon"></i>')
            .replace(/%CARGO%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-cargo"></i>')
            .replace(/%CLOAK%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-cloak"></i>')
            .replace(/%COORDINATE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-coordinate"></i>')
            .replace(/%CRIT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-crit"></i>')
            .replace(/%CREW%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-crew"></i>')
            .replace(/%DUALCARD%/g, '<span class="card-restriction">Dual card.</span>')
            .replace(/%ELITE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-elite"></i>')
            .replace(/%EVADE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-evade"></i>')
            .replace(/%FOCUS%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-focus"></i>')
            .replace(/%HARDPOINT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-hardpoint"></i>')
            .replace(/%HIT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-hit"></i>')
            .replace(/%ILLICIT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-illicit"></i>')
            .replace(/%JAM%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-jam"></i>')
            .replace(/%KTURN%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-kturn"></i>')
            .replace(/%MISSILE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-missile"></i>')
            .replace(/%RECOVER%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-recover"></i>')
            .replace(/%REINFORCE%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-reinforce"></i>')
            .replace(/%SALVAGEDASTROMECH%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-salvagedastromech"></i>')
            .replace(/%SLAM%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-slam"></i>')
            .replace(/%SLOOPLEFT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-sloopleft"></i>')
            .replace(/%SLOOPRIGHT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-sloopright"></i>')
            .replace(/%STRAIGHT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-straight"></i>')
            .replace(/%STOP%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-stop"></i>')
            .replace(/%SENSOR%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-sensor"></i>')
            .replace(/%LOCK%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-lock"></i>')
            .replace(/%TEAM%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-team"></i>')
            .replace(/%TECH%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-tech"></i>')
            .replace(/%TORPEDO%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-torpedo"></i>')
            .replace(/%TROLLLEFT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-trollleft"></i>')
            .replace(/%TROLLRIGHT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-trollright"></i>')
            .replace(/%TURNLEFT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-turnleft"></i>')
            .replace(/%TURNRIGHT%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-turnright"></i>')
            .replace(/%TURRET%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-turret"></i>')
            .replace(/%UTURN%/g, '<i class="xwing-miniatures-font xwing-miniatures-font-kturn"></i>')
            .replace(/%LARGESHIPONLY%/g, '<span class="card-restriction">Large ship only.</span>')
            .replace(/%SMALLSHIPONLY%/g, '<span class="card-restriction">Small ship only.</span>')
            .replace(/%REBELONLY%/g, '<span class="card-restriction">Rebel only.</span>')
            .replace(/%IMPERIALONLY%/g, '<span class="card-restriction">Imperial only.</span>')
            .replace(/%SCUMONLY%/g, '<span class="card-restriction">Scum only.</span>')
            .replace(/%LIMITED%/g, '<span class="card-restriction">Limited.</span>')
            .replace(/%LINEBREAK%/g, '<br /><br />')
            
exportObj.canonicalizeShipNames = (card_data) ->
    for ship_name, ship_data of card_data.ships
        ship_data.canonical_name ?= ship_data.name.canonicalize()

exportObj.renameShip = (name, new_name) ->
    exportObj.ships[name].display_name = new_name

exportObj.randomizer = (faction_name, points) ->
    shiplistmaster = exportObj.basicCardData #export ship database
    listcount = 0 #start count at 0
    #for shiplistmaster in shiplistmaster.pilotsbyid.faction == faction_name loop grab pilots by faction
        #if Math.random() >= 0.9
        #append.shiplistmaster.pilotsbyid.xws ? shiplistmaster.pilotsbyid.canonical_name ? shiplistmaster.pilotsbyid.name.canonicalize())    
            
        
    
    
