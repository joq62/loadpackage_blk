%% service_info
%% Information of the servie

-define(HEARTBEAT_INTERVAL,1*20*1000).
-define(INACITIVITY_TIMEOUT,1*60*1000).
-define(DNS_TABLE,dns_table).

-define(DNS_INFO(Zone,ServiceId,IpAddr,Port,Time,Schedule),{Zone,ServiceId,IpAddr,Port,Time,Schedule}).
-define(DNS_INFO_ZONE(DnsInfo),element(1,hd([DnsInfo]))).
-define(DNS_INFO_SERVICE(DnsInfo),element(2,hd([DnsInfo]))).
-define(DNS_INFO_IPADDR(DnsInfo),element(3,hd([DnsInfo]))).
-define(DNS_INFO_PORT(DnsInfo),element(4,hd([DnsInfo]))).
-define(DNS_INFO_TIME(DnsInfo),element(5,hd([DnsInfo]))).
-define(DNS_INFO_SCHEDULE(DnsInfo),element(6,hd([DnsInfo]))).


% ServiceInfo used by kubelet

-define(SERVICE_INFO(Zone,ServiceId,IpAddr,Port),{Zone,ServiceId,IpAddr,Port}).
-define(SERVICE_INFO_ZONE(ServiceInfo),element(1,hd([ServiceInfo]))).
-define(SERVICE_INFO_SERVICE(ServiceInfo),element(2,hd([ServiceInfo]))).
-define(SERVICE_INFO_IPADDR(ServiceInfo),element(3,hd([ServiceInfo]))).
-define(SERVICE_INFO_PORT(ServiceInfo),element(4,hd([ServiceInfo]))).

-record (dns_info, 
         {
	   time_stamp="not_initiaded_time_stamp",    % un_loaded, started
	   zone ="zone not initiaded",
	   service_id = "not_initiaded_service_id",
	   ip_addr="not_initiaded_ip_addr",
	   port="not_initiaded_port",
	   schedule_info="not used"
	 }).

-record (sd_info, 
         {
	   time_stamp="not_initiaded_time_stamp",    % un_loaded, started
	   zone ="zone not initiaded",
	   service_id = "not_initiaded_service_id",
	   ip_addr="not_initiaded_ip_addr",
	   port="not_initiaded_port",
	   schedule_info="not used"
	 }).
