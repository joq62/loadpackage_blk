%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------


-define(SslSend(IpAddr,Port,M,F,A),ssl_lib:ssl_call([{IpAddr,Port}],{M,F,A})).
