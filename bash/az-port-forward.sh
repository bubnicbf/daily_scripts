#!/bin/bash
# connect to azure resource

az login --tenant ceaa63aa-5d5c-4c7d-94b0-02f9a3ab6a8c

echo "Press any key to continue"
while [ true ] ; do
read -t 10 -n 1
if [ $? = 0 ] ; then
break ;
else
echo "waiting for the keypress"
fi
done

az account set --subscription db82c7b1-ac93-45f1-9fb1-c26407a2dabb
az aks get-credentials --resource-group hdp-dev-eastus2-compute --name whpa-hdp-hdpdev
kubectl port-forward svc/whpa-fhir 9080:9080 -n hdpperf
