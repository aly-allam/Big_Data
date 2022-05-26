create database if not exists testdb;
use testdb;
create external table if not exists tweets (
  index bigint,
  tweet_date string,
  time string,
  username string,
  tweet string
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile location 'hdfs://namenode:8020/user/hive/testdb.db/tweets';
