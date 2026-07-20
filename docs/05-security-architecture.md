# Security Architecture

## Security Groups

### ALB Security Group

Inbound:

- HTTP (80) from 0.0.0.0/0
- HTTPS (443) from 0.0.0.0/0

Outbound:

- HTTP (80) to App-SG

---

### Bastion Security Group

Inbound:

- SSH (22) from Administrator Public IP

Outbound:

- SSH (22) to App-SG

---

### Application Security Group

Inbound:

- HTTP (80) from ALB-SG
- SSH (22) from Bastion-SG

Outbound:

- MySQL (3306) to DB-SG

---

### Database Security Group

Inbound:

- MySQL (3306) from App-SG

Outbound:

- Default

---

## IAM

- EC2 instances use IAM Roles.
- No AWS Access Keys stored on servers.

---

## Security Principles

- Least Privilege
- Defense in Depth
- Private Application Layer
- Private Database Layer
- Bastion Host for Administration
