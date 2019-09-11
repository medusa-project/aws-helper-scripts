#! /bin/bash

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo "\nListing Instances in region:'$region'..."
     aws  ec2 describe-instances --region $region --query 'Reservations[].Instances[].[InstanceId,PrivateIpAddress,State.Name,InstanceType,join(`,`,Tags[?Key==`Name`].Value),join(`,`,Tags[?Key==`Environment`].Value),join(`,`,Tags[?Key==`Contact`].Value),join(`,`,Tags[?Key==`Role`].Value),join(`,`,Tags[?Key==`DataClassification`].Value)]' --output table
     for instance in `aws  ec2 describe-instances --region $region --query Reservations[].Instances[].[InstanceId] --output text`
     do
         echo -e "\nDisable Api Termination value for instance:'$instance'..."
         aws ec2 describe-instance-attribute --instance-id $instance --region $region --attribute disableApiTermination --output table
     done
done
