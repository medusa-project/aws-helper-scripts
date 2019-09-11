# aws-helper-scripts
Various scripts to help with AWS tasks

list-snapshots.sh - a script that uses aws cli to list snapshots for a EBS Volume given the Name tag value.

list-all-vols.sh - a script that for each region produces Three EBS volume reports. These reports will help to tell which volumes are not attached (not being used).  Also the reports help determine if Volumes are properly tagged with the Name, Contact and backup-plan tags.

list-all-ecs.sh - a script to list ec2 instances by region, and also report the terminiation attribute for each ec2.  These reports produce a complete inventory of all instances in the account, and help to tell if instances are properly tagged.
 
