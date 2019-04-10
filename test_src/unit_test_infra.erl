%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(unit_test_infra).
 
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
    do_test(1,[]).

do_test(0,Acc)->
    io:format("Unit test result = ~p~n",[Acc]),
    erlang:halt();
do_test(N,Acc)->
 %   UnitObj=[{test_loader_eunit,"ebin","staging/unit_test/loader","loader_test"}],
    UnitObj=[{test_dns_eunit,"ebin","staging/unit_test/dns","dns_test"},
	     {test_lib_eunit,"ebin","staging/unit_test/lib","lib_test"},
	     {test_loader_eunit,"ebin","staging/unit_test/loader","loader_test"},
	     {test_repo_eunit,"ebin","staging/unit_test/repo","repo_test"}],
    NewAcc=[unit_test(UnitObj,na,[])|Acc],
    
    do_test(N-1,NewAcc).
    

unit_test([],_,R)->
    R;
unit_test(_,{error,_,_},R)->
    R;
unit_test([{M,EbinPath,StartPath,NodeName}|T],_,R)->
    io:format(" Testing = ~p~n",[{?LINE,NodeName}]),
    vm:stop_vm(NodeName),
    {NodeName,ok}=vm:start_vm(EbinPath,StartPath,NodeName),
    D=date(),
    Host=net_adm:localhost(),
    NodeStr=NodeName++"@"++Host,
    Node=list_to_atom(NodeStr),
    io:format("~p~n",[{Node}]),
    D=date(),
    D=rpc:call(Node,erlang,date,[]),
   % io:format("~p~n",[{?MODULE,?LINE,rpc:call(Node,file,get_cwd,[])}]),
   % io:format("~p~n",[{?MODULE,?LINE,rpc:call(Node,file,list_dir,["ebin"])}]),
    %glurk=rpc:call(Node,application,start,[repo]),

%    glurk=rpc:call(Node,file,get_cwd,[]),
    I=case rpc:call(Node,M,test,[]) of
	ok->
	    NewR=[{ok,M}|R],
	     {ok,M};
	Err ->
	      NewR=[{error,M,Err}|R],
	      {error,Err}
    end,
    vm:stop_vm(NodeName),
    unit_test(T,I,NewR).
