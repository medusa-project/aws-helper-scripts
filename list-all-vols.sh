#! /bin/bash

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo "\nListing Volumes in region:'$region'..."

     aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId,InstanceId:Attachments[0].InstanceId,AZ:AvailabilityZone,Size:Size,ztagBackupPlan:Tags[?Key==`backup-plan`].Value | [0]}' --output table

     aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId,InstanceId:Attachments[0].InstanceId,AZ:AvailabilityZone,Size:Size,ztagName:Tags[?Key==`Name`].Value | [0]}' --output table

     aws ec2 describe-volumes --region $region --query 'Volumes[*].{ID:VolumeId,InstanceId:Attachments[0].InstanceId,AZ:AvailabilityZone,Size:Size,ztagContact:Tags[?Key==`Contact`].Value | [0]}' --output table

done

