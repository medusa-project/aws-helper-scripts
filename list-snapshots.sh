#! /bin/bash 

echo
echo "This script lists snapshots for the EBS Volume with the 'Name' tag that you enter below (medusa-prod, databank-demo,etc.)."
echo "The list of snapshots is sorted by snap shot start date in ascending order."
echo "NOTE: Volume 'Name' tags are the same as the EC2 'Name' tag."
echo "NOTE: AWS CLI is a prerequisite"
echo
echo "Enter Volume 'Name' tag value: \c"

read NameTAG

echo "SnapShotID--------------Progress--Size-----SnapShotStartDate------------VolumeId"

aws ec2 describe-snapshots --filters Name=tag:Name,Values="$NameTAG" --query "Snapshots[*].{Time:StartTime,ID:SnapshotId,Volume:VolumeId,SizeinGB:VolumeSize,Progress:Progress}"  --output text | sort -k4
