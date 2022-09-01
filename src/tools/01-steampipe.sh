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
git clone https://github.com/turbot/steampipe-mod-aws-compliance.git
git clone https://github.com/turbot/steampipe-mod-terraform-aws-compliance.git
git clone https://github.com/turbot/steampipe-mod-kubernetes-compliance.git
git clone https://github.com/turbot/steampipe-mod-aws-insights.git
git clone https://github.com/turbot/steampipe-mod-aws-thrifty.git
git clone https://github.com/turbot/steampipe-mod-aws-perimeter.git
git clone https://github.com/turbot/steampipe-mod-net-insights.git
git clone https://github.com/turbot/steampipe-mod-aws-tags.git

chown -R ubuntu /home/ubuntu