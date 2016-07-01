# haproxycmd

HAProxy Unix Socket commands CLI.

## Usage

```
$ haproxy -v
HA-Proxy version 1.6.6 2016/06/26
Copyright 2000-2016 Willy Tarreau <willy@haproxy.org>

$ haproxycmd -h
Usage of haproxycmd:
  -socket string
      haproxy socket path

$ sudo haproxycmd
Unknown command. Please enter one of the following commands only :
  clear counters : clear max statistics counters (add 'all' for all counters)
  clear table    : remove an entry from a table
  help           : this message
  prompt         : toggle interactive mode with prompt
  quit           : disconnect
  show backend   : list backends in the current running config
  show info      : report information about the running process
  show pools     : report information about the memory pools usage
  show stat      : report counters for each proxy and server
  show stat resolvers [id]: dumps counters from all resolvers section and
                            associated name servers
  show errors    : report last request and response errors for each proxy
  show sess [id] : report the list of current sessions or dump this session
  show table [id]: report table usage stats or dump this table's contents
  show servers state [id]: dump volatile server information (for backend <id>)
  get weight     : report a server's current weight
  set weight     : change a server's weight
  set server     : change a server's state, weight or address
  set table [id] : update or create a table entry's data
  set timeout    : change a timeout setting
  set maxconn    : change a maxconn setting
  set rate-limit : change a rate limiting value
  disable        : put a server or frontend in maintenance mode
  enable         : re-enable a server or frontend which is in maintenance mode
  shutdown       : kill a session or a frontend (eg:to release listening ports)
  show acl [id]  : report available acls or dump an acl's contents
  get acl        : reports the patterns matching a sample for an ACL
  add acl        : add acl entry
  del acl        : delete acl entry
  clear acl <id> : clear the content of this acl
  show map [id]  : report available maps or dump a map's contents
  get map        : reports the keys and values matching a sample for a map
  set map        : modify map entry
  add map        : add map entry
  del map        : delete map entry
  clear map <id> : clear the content of this map
  set ssl <stmt> : set statement for ssl

$ sudo haproxycmd show info
Name: HAProxy
Version: 1.6.6
Release_date: 2016/06/26
Nbproc: 1
Process_num: 1
Pid: 10826
Uptime: 0d 1h33m19s
Uptime_sec: 5599
Memmax_MB: 0
Ulimit-n: 4031
Maxsock: 4031
Maxconn: 2000
Hard_maxconn: 2000
CurrConns: 0
CumConns: 20
CumReq: 26
MaxSslConns: 0
CurrSslConns: 0
CumSslConns: 0
Maxpipes: 0
PipesUsed: 0
PipesFree: 0
ConnRate: 0
ConnRateLimit: 0
MaxConnRate: 1
SessRate: 0
SessRateLimit: 0
MaxSessRate: 1
SslRate: 0
SslRateLimit: 0
MaxSslRate: 0
SslFrontendKeyRate: 0
SslFrontendMaxKeyRate: 0
SslFrontendSessionReuse_pct: 0
SslBackendKeyRate: 0
SslBackendMaxKeyRate: 0
SslCacheLookups: 0
SslCacheMisses: 0
CompressBpsIn: 0
CompressBpsOut: 0
CompressBpsRateLim: 0
ZlibMemUsage: 0
MaxZlibMemUsage: 0
Tasks: 4
Run_queue: 1
Idle_pct: 100
node: vagrant-ubuntu-trusty-64
description:

```
