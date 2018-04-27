# Docker HAProxy Reverse Proxy

## Run

    $ docker run -e TARGET=www.example.com:80 -p 8080:80 bsingr/docker-haproxy-reverseproxy 
    
    $ curl -s localhost:8080 | grep h1
    <h1>Example Domain</h1>

## Build

    $ docker build .

## License

[MIT LICENSE](LICENSE)
