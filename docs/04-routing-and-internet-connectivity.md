# Routing and Internet Connectivity

## Internet Gateway

- Provides Internet access to the VPC.
- Attached at the VPC level.
- Used by public subnets.

## Public Route Table

| Destination | Target |
|-------------|--------|
| 10.0.0.0/16 | Local |
| 0.0.0.0/0 | Internet Gateway |

## Private Route Table

| Destination | Target |
|-------------|--------|
| 10.0.0.0/16 | Local |
| 0.0.0.0/0 | NAT Gateway |

## NAT Gateway

Purpose:
- Allow outbound Internet access for private resources.
- Prevent inbound Internet connections.

## Bastion Host

Purpose:
- Secure SSH access to private EC2 instances.
- Located in a public subnet.

## Design Benefits

- Improved security
- High availability
- Controlled administration
- Secure software updates
- Separation of public and private workloads
