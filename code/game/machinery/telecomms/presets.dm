// ### Preset machines  ###

//Relay

/obj/machinery/telecomms/relay/preset
	network = "nadezhda"

/obj/machinery/telecomms/relay/preset/station
	id = "station relay"
	listening_levels = list(1,2,3)
	autolinkers = list("s_relay")

/obj/machinery/telecomms/relay/preset/telecomms
	id = "telecomms relay"
	autolinkers = list("relay")

/obj/machinery/telecomms/relay/preset/mining
	id = "mining relay"
	autolinkers = list("m_relay")

/obj/machinery/telecomms/relay/preset/ruskie
	id = "ruskie relay"
	hide = 1
	toggled = 0
	autolinkers = list("r_relay")

/obj/machinery/telecomms/relay/preset/centcom
	id = "Centcom relay"
	hide = 1
	toggled = 1
	//anchored = 1
	//use_power = NO_POWER_USE
	//idle_power_usage = 0
	produces_heat = 0
	autolinkers = list("c_relay")

//HUB

/obj/machinery/telecomms/hub/preset
	id = "Hub"
	network = "nadezhda"
	autolinkers = list("hub", "relay", "c_relay", "s_relay", "m_relay", "r_relay", "science", "medical",
	"supply", "service", "common", "command", "prospector", "engineering", "security", "blackshield", "marshal", "nt", "unused",
	"receiverA", "broadcasterA")

/obj/machinery/telecomms/hub/preset_cent
	id = "CentCom Hub"
	network = "nadezhda"
	produces_heat = 0
	autolinkers = list("hub_cent", "c_relay", "s_relay", "m_relay", "r_relay",
	 "centcom", "receiverCent", "broadcasterCent")

//Receivers

/obj/machinery/telecomms/receiver/preset_right
	id = "Receiver A"
	network = "nadezhda"
	autolinkers = list("receiverA") // link to relay
	freq_listening = list(AI_FREQ, SCI_FREQ, MED_FREQ, NT_FREQ, SUP_FREQ, SRV_FREQ, COMM_FREQ, ENG_FREQ, SEC_FREQ, BLS_FREQ, MAR_FREQ, PRO_FREQ)

//Common and other radio frequencies for people to freely use
/obj/machinery/telecomms/receiver/preset_right/New()
	for(var/i = PUBLIC_LOW_FREQ, i < PUBLIC_HIGH_FREQ, i += 2)
		freq_listening |= i
	..()

/obj/machinery/telecomms/receiver/preset_cent
	id = "CentCom Receiver"
	network = "nadezhda"
	produces_heat = 0
	autolinkers = list("receiverCent")
	freq_listening = list(DTH_FREQ)


//Buses

/obj/machinery/telecomms/bus/preset_one
	id = "Bus 1"
	network = "nadezhda"
	freq_listening = list(SCI_FREQ, MED_FREQ, PRO_FREQ)
	autolinkers = list("processor1", "science", "medical", "prospector")

/obj/machinery/telecomms/bus/preset_two
	id = "Bus 2"
	network = "nadezhda"
	freq_listening = list(SUP_FREQ, SRV_FREQ, NT_FREQ)
	autolinkers = list("processor2", "supply", "service", "nt", "unused")

/obj/machinery/telecomms/bus/preset_two/New()
	for(var/i = PUBLIC_LOW_FREQ, i < PUBLIC_HIGH_FREQ, i += 2)
		if(i == PUB_FREQ)
			continue
		freq_listening |= i
	..()

/obj/machinery/telecomms/bus/preset_three
	id = "Bus 3"
	network = "nadezhda"
	freq_listening = list(SEC_FREQ, BLS_FREQ, MAR_FREQ, COMM_FREQ)
	autolinkers = list("processor3", "security", "blackshield", "marshal", "command")

/obj/machinery/telecomms/bus/preset_four
	id = "Bus 4"
	network = "nadezhda"
	freq_listening = list(ENG_FREQ, AI_FREQ, PUB_FREQ)
	autolinkers = list("processor4", "engineering", "common")

/obj/machinery/telecomms/bus/preset_cent
	id = "CentCom Bus"
	network = "nadezhda"
	freq_listening = list(DTH_FREQ)
	produces_heat = 0
	autolinkers = list("processorCent", "centcom")

//Processors

/obj/machinery/telecomms/processor/preset_one
	id = "Processor 1"
	network = "nadezhda"
	autolinkers = list("processor1") // processors are sort of isolated; they don't need backward links

/obj/machinery/telecomms/processor/preset_two
	id = "Processor 2"
	network = "nadezhda"
	autolinkers = list("processor2")

/obj/machinery/telecomms/processor/preset_three
	id = "Processor 3"
	network = "nadezhda"
	autolinkers = list("processor3")

/obj/machinery/telecomms/processor/preset_four
	id = "Processor 4"
	network = "nadezhda"
	autolinkers = list("processor4")

/obj/machinery/telecomms/processor/preset_cent
	id = "CentCom Processor"
	network = "nadezhda"
	produces_heat = 0
	autolinkers = list("processorCent")

//Servers

/obj/machinery/telecomms/server/presets

	network = "nadezhda"

/obj/machinery/telecomms/server/presets/science
	id = "science server"
	freq_listening = list(SCI_FREQ)
	channel_tags = list(list(SCI_FREQ, "science", COMMS_COLOR_SCIENCE))
	autolinkers = list("science")

/obj/machinery/telecomms/server/presets/medical
	id = "medical server"
	freq_listening = list(MED_FREQ)
	channel_tags = list(list(MED_FREQ, "medical", COMMS_COLOR_MEDICAL))
	autolinkers = list("medical")

/obj/machinery/telecomms/server/presets/supply
	id = "supply server"
	freq_listening = list(SUP_FREQ)
	channel_tags = list(list(SUP_FREQ, "supply", COMMS_COLOR_SUPPLY))
	autolinkers = list("supply")

/obj/machinery/telecomms/server/presets/service
	id = "service server"
	freq_listening = list(SRV_FREQ, PT_BT_FREQ, PT_RT_FREQ, PT_YT_FREQ, PT_GT_FREQ)
	channel_tags = list(list(SRV_FREQ, "service", COMMS_COLOR_SERVICE))
	autolinkers = list("service")

/obj/machinery/telecomms/server/presets/common
	id = "common server"
	freq_listening = list(PUB_FREQ, AI_FREQ) // AI Private and Common
	channel_tags = list(
		list(PUB_FREQ, "common", COMMS_COLOR_COMMON),
		list(AI_FREQ, "AI private", COMMS_COLOR_AI),
		list(ENT_FREQ, "entertainment", COMMS_COLOR_ENTERTAIN)
	)
	autolinkers = list("common")

// "Unused" channels, AKA all others.
/obj/machinery/telecomms/server/presets/unused
	id = "unused server"
	freq_listening = list()
	autolinkers = list("unused")

/obj/machinery/telecomms/server/presets/unused/Initialize()
	. = ..()
	for(var/i = PUBLIC_LOW_FREQ, i < PUBLIC_HIGH_FREQ, i += 2)
		if(i == AI_FREQ || i == PUB_FREQ)
			continue
		freq_listening |= i

/obj/machinery/telecomms/server/presets/command
	id = "command server"
	freq_listening = list(COMM_FREQ)
	channel_tags = list(list(COMM_FREQ, "command", COMMS_COLOR_COMMAND))
	autolinkers = list("command")

/obj/machinery/telecomms/server/presets/engineering
	id = "engineering server"
	freq_listening = list(ENG_FREQ)
	channel_tags = list(list(ENG_FREQ, "engineering", COMMS_COLOR_ENGINEER))
	autolinkers = list("engineering")

/obj/machinery/telecomms/server/presets/security
	id = "security server"
	freq_listening = list(SEC_FREQ)
	channel_tags = list(list(SEC_FREQ, "security", COMMS_COLOR_SECURITY))
	autolinkers = list("security")

/obj/machinery/telecomms/server/presets/blackshield
	id = "blackshield server"
	freq_listening = list(BLS_FREQ)
	channel_tags = list(list(BLS_FREQ, "blackshield", WOOD_COLOR_RICH))
	autolinkers = list("blackshield")

/obj/machinery/telecomms/server/presets/marshal
	id = "marshal server"
	freq_listening = list(MAR_FREQ)
	channel_tags = list(list(MAR_FREQ, "marshal", COMMS_COLOR_SECURITY))
	autolinkers = list("marshal")

/obj/machinery/telecomms/server/presets/prospector
	id = "prospector server"
	freq_listening = list(PRO_FREQ)
	channel_tags = list(list(PRO_FREQ, "prospector", COMMS_COLOR_EXPLORER))
	autolinkers = list("prospector")

/obj/machinery/telecomms/server/presets/centcom
	id = "CentCom server"
	freq_listening = list(ERT_FREQ, DTH_FREQ)
	channel_tags = list(list(ERT_FREQ, "response team", COMMS_COLOR_CENTCOMM), list(DTH_FREQ, "special ops", COMMS_COLOR_SYNDICATE))
	produces_heat = 0
	autolinkers = list("centcom")

/obj/machinery/telecomms/server/presets/nt
	id = "Church Server"
	freq_listening = list(NT_FREQ)
	channel_tags = list(list(NT_FREQ, "church", WOOD_COLOR_GENERIC))
	autolinkers = list("nt")


//Broadcasters

//--PRESET LEFT--//

/obj/machinery/telecomms/broadcaster/preset_right
	id = "Broadcaster A"
	network = "nadezhda"
	autolinkers = list("broadcasterA")

/obj/machinery/telecomms/broadcaster/preset_cent
	id = "CentCom Broadcaster"
	network = "nadezhda"
	produces_heat = 0
	autolinkers = list("broadcasterCent")
