%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(test_adder_eunit).
 
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").

%-include("infra_kube/lib/src/dns_local.hrl").

-include("include/kubelet_data.hrl").
-include("include/dns_data.hrl").

%% --------------------------------------------------------------------

%% External exports

-export([]).


%% ====================================================================
%% External functions
%% ====================================================================
%% --------------------------------------------------------------------
%% Function:init 
%% Description:
%% Returns: non
%% --------------------------------------------------------------------
init_test()->
    ok=application:load(adder),
    ok=application:start(adder),
    ok.





stop_test()->
    ok=application:stop(adder),
    ok=application:unload(adder),
    ok.
