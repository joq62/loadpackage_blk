## set the paths for a default setup
apps:
#
#	Infrastructure

##-------- Start Service ------------------
#service

# loadpackage

# testnode

##-------- End Service ---------------------

##-------- Clean up staging -----------------
#
#
##-------- Start adder  --------------------------------
# compile
	erlc -o loadpackage_apps_kube/adder  apps_kube/adder/src/*.erl;
	cp apps_kube/adder/src/*.app loadpackage_apps_kube/adder;
	rm -rf apps_kube/adder/src/*~;
	rm loadpackage_apps_kube/adder/*.beam;
	rm loadpackage_apps_kube/adder/*.app;
	erlc -o loadpackage_apps_kube/adder  apps_kube/adder/src/*.erl;
	cp apps_kube/adder/src/*.app loadpackage_apps_kube/adder;
# staging
	cp loadpackage_apps_kube/adder/*.beam staging/unit_test/adder/ebin;
	rm staging/unit_test/adder/ebin/*;
	erlc -o staging/unit_test/adder/ebin apps_kube/adder/test_src/*.erl ;
	cp loadpackage_apps_kube/adder/* staging/unit_test/adder/ebin;
#
##-------- End adder ------------------------------------
##
	echo
	echo
	echo  OK OK 0K  APPS KUBE Build_succeded  OK OK OK
	echo
	echo
#
#*********  infra_kube **********************************
#
infra:

##-------- Start controller --------------------------------
# compile
	erlc -o loadpackage_infra_kube/controller  infra_kube/controller/src/*.erl;
	cp infra_kube/controller/src/*.app loadpackage_infra_kube/controller;
	rm loadpackage_infra_kube/controller/*.beam;
	rm loadpackage_infra_kube/controller/*.app;
	erlc -o loadpackage_infra_kube/controller  infra_kube/controller/src/*.erl;
	cp infra_kube/controller/src/*.app loadpackage_infra_kube/controller;
# staging
	cp loadpackage_infra_kube/controller/*.beam staging/unit_test/controller/ebin;
	rm staging/unit_test/controller/ebin/*;
	erlc -o staging/unit_test/controller/ebin infra_kube/controller/test_src/*.erl ;
	cp loadpackage_infra_kube/controller/* staging/unit_test/controller/ebin;
#
##-------- End controller ------------------------------------
##
#
##-------- Start kubelet --------------------------------
# compile
	erlc -o loadpackage_infra_kube/kubelet  infra_kube/kubelet/src/*.erl;
	cp infra_kube/kubelet/src/*.app loadpackage_infra_kube/kubelet;
	rm loadpackage_infra_kube/kubelet/*.beam;
	rm loadpackage_infra_kube/kubelet/*.app;
	erlc -o loadpackage_infra_kube/kubelet  infra_kube/kubelet/src/*.erl;
	cp infra_kube/kubelet/src/*.app loadpackage_infra_kube/kubelet;
# staging
	cp loadpackage_infra_kube/kubelet/*.beam staging/unit_test/kubelet/ebin;
	rm staging/unit_test/kubelet/ebin/*;
	erlc -o staging/unit_test/kubelet/ebin infra_kube/kubelet/test_src/*.erl ;
	cp loadpackage_infra_kube/kubelet/* staging/unit_test/kubelet/ebin;
#
##-------- End kubelet ------------------------------------
##
#
##-------- Start repo --------------------------------
# compile
	erlc -o loadpackage_infra_kube/repo  infra_kube/repo/src/*.erl;
	cp infra_kube/repo/src/*.app loadpackage_infra_kube/repo;
	rm loadpackage_infra_kube/repo/*.beam;
	rm loadpackage_infra_kube/repo/*.app;
	erlc -o loadpackage_infra_kube/repo  infra_kube/repo/src/*.erl;
	cp infra_kube/repo/src/*.app loadpackage_infra_kube/repo;
# staging
	cp loadpackage_infra_kube/repo/*.beam staging/unit_test/repo/ebin;
	rm staging/unit_test/repo/ebin/*;
	erlc -o staging/unit_test/repo/ebin infra_kube/repo/test_src/*.erl ;
	cp loadpackage_infra_kube/repo/* staging/unit_test/repo/ebin;
#
##-------- End repo ------------------------------------
##
#
##-------- Start dns --------------------------------
# compile
	erlc -o loadpackage_infra_kube/dns  infra_kube/dns/src/*.erl;
	cp infra_kube/dns/src/*.app loadpackage_infra_kube/dns;
	rm loadpackage_infra_kube/dns/*.beam;
	rm loadpackage_infra_kube/dns/*.app;
	erlc -o loadpackage_infra_kube/dns  infra_kube/dns/src/*.erl;
	cp infra_kube/dns/src/*.app loadpackage_infra_kube/dns;
# staging
	cp loadpackage_infra_kube/dns/*.beam staging/unit_test/dns/ebin;
	rm staging/unit_test/dns/ebin/*;
	erlc -o staging/unit_test/dns/ebin infra_kube/dns/test_src/*.erl ;
	cp loadpackage_infra_kube/dns/* staging/unit_test/dns/ebin;
##-------- End dns ------------------------------------
##
##-------- Start loader --------------------------------
# compile
	erlc -o loadpackage_infra_kube/loader  infra_kube/loader/src/*.erl;
	cp infra_kube/loader/src/*.app loadpackage_infra_kube/loader;
	rm loadpackage_infra_kube/loader/*.beam;
	rm loadpackage_infra_kube/loader/*.app;
	erlc -o loadpackage_infra_kube/loader  infra_kube/loader/src/*.erl;
	cp infra_kube/loader/src/*.app loadpackage_infra_kube/loader;
# staging
	cp loadpackage_infra_kube/loader/*.beam staging/unit_test/loader/ebin;
	rm staging/unit_test/loader/ebin/*;
	erlc -o staging/unit_test/loader/ebin infra_kube/loader/test_src/*.erl ;
	cp loadpackage_infra_kube/loader/* staging/unit_test/loader/ebin;
##-------- End loader ------------------------------------
#
##-------- Start lib --------------------------------
# compile
	erlc -o loadpackage_infra_kube/lib  infra_kube/lib/src/*.erl;
	cp infra_kube/lib/src/*.app loadpackage_infra_kube/lib;
	rm loadpackage_infra_kube/lib/*.beam;
	rm loadpackage_infra_kube/lib/*.app;
	erlc -o loadpackage_infra_kube/lib  infra_kube/lib/src/*.erl;
	cp infra_kube/lib/src/*.app loadpackage_infra_kube/lib;
# staging
	cp loadpackage_infra_kube/lib/*.beam staging/unit_test/lib/ebin;
	rm staging/unit_test/lib/ebin/*;
	erlc -o staging/unit_test/lib/ebin infra_kube/lib/test_src/*.erl ;
	cp loadpackage_infra_kube/lib/* staging/unit_test/lib/ebin;
##-------- End lib ------------------------------------
#
##-------- Start build local --------------------------------
#
#node_master 
	rm staging/local/node_master/loader/*;
	cp loadpackage_infra_kube/loader/* staging/local/node_master/loader;
#
#node_rpi_1 
	rm staging/local/node_rpi_1/loader/*;
	cp loadpackage_infra_kube/loader/* staging/local/node_rpi_1/loader;
#
#
#node_rpi_2 
	rm staging/local/node_rpi_2/loader/*;
	cp loadpackage_infra_kube/loader/* staging/local/node_rpi_2/loader;
#
##-------- End build local ------------------------------------
#
#---------------- End Makefile------------------
	echo
	echo
	echo  OK OK 0K  INFRA KUBE Build_succeded  OK OK OK
	echo
	echo
#--------------------------------------------------------
#	erlc -o test_ebin test_src/*.erl;
#	erl -pa staging/local/* -pa test_ebin -s local_test start -sname local_test



unit_test:
	erlc -o test_ebin test_src/*.erl;
	erl -pa staging/*/* -pa test_ebin -s unit_test_infra start -sname unit_test_infra
