LibCyrodiilTracker.CST = {}

LibCyrodiilTracker.CST.KEEP = {
    WARDEN         = {id=3},
    RAYLES         = {id=4},
    GLADEMIST      = {id=5,  alias="GLADE"}, --@TODO to check
    ASH            = {id=6},
    ALESWELL       = {id=7}, --@TODO to check
    DRAGONCLAW     = {id=8, alias="DRAGON"},
    CHALMAN        = {id=9},
    ARRIUS         = {id=10},
    KINGSCREST     = {id=11, alias="KINGS"},
    FARRAGUT       = {id=12, name="FARRA"},
    BLUE_ROAD_KEEP = {id=13, alias="BRK"},
    DRAKELOWE      = {id=14, alias="DRAKE"},
    ALESSIA        = {id=15},
    FAREGYL        = {id=16},
    ROEBECK        = {id=17},
    BRINDLE        = {id=18},
    BLACK_BOOT     = {id=19, alias="BB"},
    BLOODMAYNE     = {id=20, alias="BM"},
}

LibCyrodiilTracker.CST.BASE = {
    WESTERN_ELSWEYR    = {id=105},
    EASTERN_ELSWEYR    = {id=106},
    SOUTHERN_MORROWIND = {id=107},
    NORTHERN_MORROWIND = {id=108},
    SOUTHERN_HIGH_ROCK = {id=109},
    NORTHERN_HIGH_ROCK = {id=110},
}

LibCyrodiilTracker.CST.TEMPLE = {
    ALTADOON  = {id=118},
    MNEM      = {id=119},
    GHARTOK   = {id=120},
    CHIM      = {id=121},
    NI_MOHK   = {id=122},
    ALMA_RUMA = {id=123},
}

LibCyrodiilTracker.CST.GATE = {
    ALTADOON  = {id=124, keep={"BLACK_BOOT", "FAREGYL"}},
    MNEM      = {id=125, keep={"BLOODMAYNE", "FAREGYL"}},
    GHARTOK   = {id=126, keep={"FARRAGUT", "ARRIUS"}},
    CHIM      = {id=127, keep={"KINGSCREST", "ARRIUS"}},
    NI_MOHK   = {id=128, keep={"WARDEN", "GLADEMIST"}},
    ALMA_RUMA = {id=129, keep={"RAYLES", "GLADEMIST"}},
}

LibCyrodiilTracker.CST.OUTPOST = {
    NIKEL   = {id=132, alias="NIK"},
    SEJANUS = {id=133, alias="SEJ"},
    BLEAKER = {id=134, alias="BLK"}, -- unknown alias
}

LibCyrodiilTracker.CST.TOWN = {
    VLASTARUS   = {id=149, alias="VLAST"},
    BRUMA       = {id=151},
    CROPSFORD   = {id=152, alias="CROPS"},
    WINTER_PAEK = {id=163, alias="WINTER"},
    CARMALA     = {id=164, alias="CARMA"},
    HARLUN      = {id=165},
}

LibCyrodiilTracker.CST.BRIDGE = {
    ALESSIA     = {id=154},
    NIBEN_RIVER = {id=156, alias="NIBEN"},
    BAY         = {id=157},
}

LibCyrodiilTracker.CST.MILEGATE = {
    ASH        = {id=155},
    PRIORY     = {id=158},
    CHORROL    = {id=159},
    KINGSCREST = {id=160},
    HORUNN     = {id=161},
    CHALMAN    = {id=162},
}

LibCyrodiilTracker.CST.VOLENDRUNG_BASE = {
    AD_TEMPLE                 = {id=439, keep={{type="KEEP_TEMPLE", name="MNEM"}}},
    AD_BRINDLE_NIKEL          = {id=440, keep={{type="KEEP_KEEP", name="BRINDLE"}, {type="KEEP_OUTPOST", name="NIKEL"}}},
    AD_VLASTARUS_BLACK_BOOT   = {id=441, keep={{type="KEEP_TOWN", name="VLASTARUS"}, {type="KEEP_KEEP", name="BLACK_BOOT"}}},
    AD_VLASTARUS_ROEBECK      = {id=442, keep={{type="KEEP_TOWN", name="VLASTARUS"}, {type="KEEP_KEEP", name="ROEBECK"}}},
    AD_ROEBECK_ALESSIA        = {id=443, keep={{type="KEEP_KEEP", name="ROEBECK"}, {type="KEEP_KEEP", name="ALESSIA"}}},
    AD_FAREGYL_ALESSIA        = {id=444, keep={{type="KEEP_KEEP", name="FAREGYL"}, {type="KEEP_KEEP", name="ALESSIA"}}},
    AD_BLOODMAYNE_BLACK_BOOT  = {id=445, keep={{type="KEEP_KEEP", name="BLOODMAYNE"}, {type="KEEP_KEEP", name="BLACK_BOOT"}}},
    AD_BAY_BRIDGE             = {id=446, keep={{type="KEEP_BRIDGE", name="BAY"}}},
    EP_TEMPLE                 = {id=447, keep={{type="KEEP_TEMPLE", name="CHIM"}}},
    EP_KINGSCREST_MILEGATE    = {id=448, keep={{type="KEEP_KEEP", name="KINGSCREST"}, {type="KEEP_MILEGATE", name="KINGSCREST"}}},
    EP_KINGSCREST_FARRAGUT    = {id=449, keep={{type="KEEP_KEEP", name="KINGSCREST"}, {type="KEEP_KEEP", name="FARRAGUT"}}},
    EP_CHALMAN_ARRIUS         = {id=450, keep={{type="KEEP_KEEP", name="CHALMAN"}, {type="KEEP_KEEP", name="ARRIUS"}}},
    EP_BLUE_ROAD_KEEP_CHALMAN = {id=451, keep={{type="KEEP_KEEP", name="BLUE_ROAD_KEEP"}, {type="KEEP_KEEP", name="CHALMAN"}}},
    EP_BLUE_ROAD_KEEP_ARRIUS  = {id=452, keep={{type="KEEP_KEEP", name="BLUE_ROAD_KEEP"}, {type="KEEP_KEEP", name="ARRIUS"}}},
    EP_SEJANUS_HARLUN         = {id=453, keep={{type="KEEP_OUTPOST", name="SEJANUS"}, {type="KEEP_OUTPOST", name="HARLUN"}}},
    EP_SEJANUS_DRAKELOWE      = {id=454, keep={{type="KEEP_OUTPOST", name="SEJANUS"}, {type="KEEP_KEEP", name="DRAKELOWE"}}},
    DC_TEMPLE                 = {id=455, keep={{type="KEEP_TEMPLE", name="ALMA_RUMA"}}},
    DC_WARDEN_RAYLES          = {id=456, keep={{type="KEEP_KEEP", name="WARDEN"}, {type="KEEP_KEEP", name="RAYLES"}}},
    DC_WARDEN_BRUMA           = {id=457, keep={{type="KEEP_KEEP", name="WARDEN"}, {type="KEEP_TOWN", name="BRUMA"}}},
    DC_GLADEMIST_ALESWELL     = {id=458, keep={{type="KEEP_KEEP", name="GLADEMIST"}, {type="KEEP_KEEP", name="ALESWELL"}}},
    DC_GLADEMIST_ASH          = {id=459, keep={{type="KEEP_KEEP", name="GLADEMIST"}, {type="KEEP_KEEP", name="ASH"}}},
    DC_ASH_ALESWELL           = {id=460, keep={{type="KEEP_KEEP", name="ASH"}, {type="KEEP_KEEP", name="ALESWELL"}}},
    DC_BRUMA_BLEAKER          = {id=461, keep={{type="KEEP_TOWN", name="BRUMA"}, {type="KEEP_OUTPOST", name="BLEAKER"}}},
    DC_RAYLES_MILEGATE        = {id=462, keep={{type="KEEP_KEEP", name="RAYLES"}, {type="KEEP_MILEGATE", name="CHORROL"}}},
}
