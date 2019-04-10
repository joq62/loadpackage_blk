%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(local_test).
 
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
 
%% --------------------------------------------------------------------

%% External exports

-export([start/0]).

 
%% ====================================================================
%% External functions
%% ====================================================================
%% --------------------------------------------------------------------
%% Function:init 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------
start()->
    R=start_node_loader("node_master","staging/local/node_master","*/"),
    receive
	infinity->
	    ok
    end,
    erlang:halt(),
    R.


start_node_loader(NodeName,StartPath,EbinPath)->
    vm:stop_vm(NodeName),
    {NodeName,ok}=vm:start_vm(EbinPath,StartPath,NodeName),
    Host=net_adm:localhost(),
    NodeStr=NodeName++"@"++Host,
    Node=list_to_atom(NodeStr),
    D=date(),
    D=rpc:call(Node,erlang,date,[]),
    io:format("~p~n",[{Node}]),
    R=rpc:call(Node,loader,start,[]),
    R.
 
