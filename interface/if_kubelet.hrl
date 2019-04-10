%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------

-define(StartService(ServiceId),{kubelet,start_service,[ServiceId]}).
-define(StopService(ServiceId),{kubelet,stop_service,[ServiceId]}).
-define(LoadedServices(),{kubelet,loaded_services,[]}).
-define(Register(ServiceId),{kubelet,register,[ServiceId]}).
-define(DeRegister(ServiceId),{kubelet,de_register,[ServiceId]}).
