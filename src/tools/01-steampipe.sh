#! /bin/bash

sudo /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/turbot/steampipe/main/install.sh)"
steampipe -v
steampipe plugin install steampipe
steampipe plugin install abuseipdb
steampipe plugin install crowdstrike
steampipe plugin install duo
steampipe plugin install shodan
steampipe plugin install splunk
steampipe plugin install virustotal
steampipe plugin install code
steampipe plugin install config
steampipe plugin install csv
steampipe plugin install docker
steampipe plugin install github
steampipe plugin install jira
steampipe plugin install net


cd /home/ubuntu
mkdir steampipe-mods && cd steampipe-mods
steampipe mod install github.com/turbot/steampipe-mod-aws-compliance
steampipe mod install github.com/turbot/steampipe-mod-terraform-aws-compliance
steampipe mod install github.com/turbot/steampipe-mod-kubernetes-compliance
steampipe mod install github.com/turbot/steampipe-mod-aws-insights
steampipe mod install github.com/turbot/steampipe-mod-aws-thrifty
steampipe mod install github.com/turbot/steampipe-mod-aws-perimeter
steampipe mod install github.com/turbot/steampipe-mod-net-insights
steampipe mod install github.com/turbot/steampipe-mod-aws-tags


steampipe completion bash > /tmp/steampipe-completion
sudo mv /tmp/steampipe-completion /etc/bash_completion.d/steampipe
rm /tmp/steampipe-completion

chown -R ubuntu /home/ubuntu

