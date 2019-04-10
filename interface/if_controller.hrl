%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------

-define(AllNodes(),{controller,all_nodes,[]}).
-define(GetAllApplications(),{controller,get_all_applications,[]}).
-define(GetAllServices(),{controller,get_all_servicess,[]}).

-define(Add(AppId,Vsn),{controller,add,[AppId,Vsn]}).
-define(Remove(AppId,Vsn),{controller,remove,[AppId,Vsn]}).

-define(NodeRegister(KubeletInfo),{controller,node_register,[KubeletInfo]}).
-define(DeNodeRegister(KubeletInfo),{controller,de_node_register,[KubeletInfo]}).
