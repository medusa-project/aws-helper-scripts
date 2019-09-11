# aws-helper-scripts
Various scripts to help with AWS tasks

list-snapshots.sh - a script that uses aws cli to list snapshots for a EBS Volume given the Name tag value.

list-all-vols.sh - a script that for each region produces Three EBS volume reports. These reports will help to tell which volumes are not attached (not being used).  Also the help determine if Volumes are properly tagged with the Name, Contact and backup-plan tags
 
