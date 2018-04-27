global
    spread-checks 4
    tune.maxrewrite 1024
    tune.ssl.default-dh-param 2048

defaults
    mode    http
    balance roundrobin
    
    option  redispatch

    maxconn 5000
    timeout connect 5s
    timeout client  20s
    timeout server  20s
    timeout queue   30s
    timeout http-request 5s
    timeout http-keep-alive 15s

resolvers internaldns
  nameserver            internaldns1 {{DNS_RESOLVER}}
  resolve_retries       3600
  timeout retry         1s
  hold valid            1s

frontend http-in
    bind *:80
    default_backend nodes-http

backend nodes-http
    http-request set-header host {{TARGET}}
    server node1 {{TARGET}} resolvers internaldns resolve-prefer ipv4 check inter 1000
