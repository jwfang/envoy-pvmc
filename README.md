# envoy-pvmc

when there are both CDS/SDS, and CDS have service that SDS return an empty body, envoy will falut with "pure virtual method called".

this *docker-compose* reproduce it.

NOTE: i am using the **lyft/envoy** image here, it have *signal_trace=enabled*, so it will quit with backtrace.

## what's in the *docker-compose*

1. *eds*, a fake CDS/RDS service, just return content from *eds* directory
2. *pause*, it do nothing, just a place-holder
3. *envoy*, of course

## how to reproduce
1. install docker/docker-compose
2. run ./t.sh

the *logs* dir have some already captured envoy trace logs, for your convenience.

## NOTE
1. i tested a *sds* cluster with out CDS, no fault. it's in *sds-only* branch.

## FAQ
1. why there are docker ? since i encounter this when run it by docker-compose, and it falut on DNS callbacks.
