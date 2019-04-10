%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(vm).

%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
%%  -include("").
%% --------------------------------------------------------------------
%% External exports
-compile(export_all).



%% ====================================================================
%% External functions
%% ====================================================================
start_vm(EbinPath,StartPath,NodeName)->
    S=self(),
    Pid=spawn(fun()->do_start_vm(EbinPath,StartPath,NodeName,S) end),
    R=receive
	{Pid,R}->
	    R
    end,
    R.

do_start_vm(EbinPath,StartPath,NodeName,StartingProcess)->
 %   io:format("Node,cwd = ~p~n",[{?LINE,Node,file:get_cwd()}]),
    {ok,Cwd}=file:get_cwd(),
    c:cd(StartPath),
    ErlCmd="erl -pa "++EbinPath++" -sname "++NodeName++" -detached", 
    []=os:cmd(ErlCmd),
    R=check_started(NodeName,10,100,error),
    c:cd(Cwd),
  %  io:format("Node,cwd = ~p~n",[{?LINE,Node,file:get_cwd()}]),    
    StartingProcess!{self(),R},
    ok.

check_started(NodeName,_,0,R)->
    {NodeName,R};
check_started(NodeName,_,_,ok) ->
     {NodeName,ok};
check_started(NodeName,Interval,N,R)-> 
    timer:sleep(Interval),
    Host=net_adm:localhost(),
    NodeStr=NodeName++"@"++Host,
    Node=list_to_atom(NodeStr),
    case net_adm:ping(Node) of
	pong->
	    NewR=ok;
	pang ->
	    NewR=R
    end,
    check_started(NodeName,Interval,N-1,NewR).
    


stop_vm(NodeName)->
    Host=net_adm:localhost(),
    NodeStr=NodeName++"@"++Host,
    Node=list_to_atom(NodeStr),
    rpc:call(Node,erlang,halt,[]),
    check_stopped(NodeName,10,100,error),
    ok.

check_stopped(NodeName,_,0,R)->
    {NodeName,R};
check_stopped(NodeName,_,_,ok) ->
     {NodeName,ok};
check_stopped(NodeName,Interval,N,R)-> 
    timer:sleep(Interval),
    Host=net_adm:localhost(),
    NodeStr=NodeName++"@"++Host,
    Node=list_to_atom(NodeStr),
    case net_adm:ping(Node) of
	pang->
	    NewR=ok;
	pong ->
	    NewR=R
    end,
    check_started(NodeName,Interval,N-1,NewR).
