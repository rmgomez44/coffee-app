## Athena

 - Athena table creation query

 - CREATE EXTERNAL TABLE IF NOT EXISTS vpcflowlog (
version string, 
account_id string, 
interface_id string, 
srcaddr string, 
dstaddr string, 
srcport int,
dstport int,
protocol int,
packets int,
bytes int,
start_time string,
end_time string,
action string,
log_status string 
  ) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
'serialization.format' = ' ',
'field.delim' = ' '
)
LOCATION 's3://{bucket_name}/AWSLogs/';


 - Athena table SELECT query

 - select
interface_id,srcaddr,dstaddr,srcport,dstport,protocol,action,log_status
from vpcflowlog 
where version not in ('version') 
order by interface_id,action,log_status;
