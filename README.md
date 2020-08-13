# StrongSwan mesh PoC

Proof of concept for a redundant mesh VPN network between 3 locations using StrongSwan and routed interfaces, using docker-compose for lab-setup.

## Network setup

All containers are joined in a shared network "internet", and each have an additional unique network that resembles their local network.

```
host: strong1
public ip: 192.168.100.101/24
private ip: 192.168.101.254/24

host: strong2
public ip: 192.168.100.102/24
private ip: 192.168.102.254/24

host: strong3
public ip: 192.168.100.103/24
private ip: 192.168.103.254/24
```

## Docker config

Each container gets it's own ipsec.conf and init.sh mounted from their respective folder.

In ```init.sh``` a xfrm interface is created with an interface_id, and routes are added over the interfaces.

## Usage

Staring the environment  
```docker-compose up -d```

Going inside a container  
```docker-compose exec strong1 bash```

Shutting down the environment  
```docker-compose down```