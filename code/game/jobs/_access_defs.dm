#define ACCESS_REGION_NONE -1
#define ACCESS_REGION_ALL 0
#define ACCESS_REGION_SECURITY 1
#define ACCESS_REGION_MEDBAY 2
#define ACCESS_REGION_RESEARCH 3
#define ACCESS_REGION_ENGINEERING 4
#define ACCESS_REGION_COMMAND 5
#define ACCESS_REGION_GENERAL 6
#define ACCESS_REGION_SUPPLY 7
#define ACCESS_REGION_CHURCH 8
#define ACCESS_REGION_PROSPECTOR 9
#define ACCESS_REGION_NT 10

// Keep those two up to date
#define ACCESS_REGION_MIN 1
#define ACCESS_REGION_MAX 10

#define ACCESS_TYPE_NONE 0
#define ACCESS_TYPE_CENTCOM 1
#define ACCESS_TYPE_STATION 2
#define ACCESS_TYPE_SYNDICATE 4
#define ACCESS_TYPE_ALL (ACCESS_TYPE_CENTCOM|ACCESS_TYPE_STATION|ACCESS_TYPE_SYNDICATE)

#define CLEARANCE_NONE 0
#define CLEARANCE_COMMON 1
#define CLEARANCE_CLERGY 2