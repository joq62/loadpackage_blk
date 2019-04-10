%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(test_kubelet_eunit).
 
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
    ok=application:load(kubelet),
    ok=application:start(kubelet),
    ok.





stop_test()->
    ok=application:stop(kubelet),
    ok=application:unload(kubelet),
    ok.
