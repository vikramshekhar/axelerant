Criteria: memory_usage > 60% + disk_usage > 80% + cpu_usage > 70%

Monitoring Interval: 5 seconds

Instance: EC2 Instance

Monitoring service: Cloudwatch with above criteria will monitor the stats sent by the EC2 instance. The SNS subscribed to the Cloudwatch can send notification to PagerDuty that will inform the OnCall folks and alert the Support teams.

The PagerDuty will be able to integrate with Slack channel and can notify all the members of the configured Group.

We can also write an automation to allow members in that Slack channel to create tracking tickets in Jira and link the PagerDuty incidents to the Jira ticket.
