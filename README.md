🚀 Terraform DevSecOps CI/CD Pipeline
Overview

This repository demonstrates a production-grade CI/CD pipeline for deploying Terraform-based AWS infrastructure using DevSecOps best practices.

It is designed to pair with the J-Tele-Doctor Global AWS Architecture project and focuses on safe, compliant, and auditable infrastructure delivery, suitable for regulated environments such as healthcare.

🎯 What This Pipeline Solves

Prevents unsafe infrastructure changes before deployment

Enforces compliance automatically (not manually)

Separates planning from production deployment

Adds security and policy checks to Infrastructure as Code

Detects configuration drift over time

🧱 Key Technologies

Terraform – Infrastructure as Code

GitHub Actions – CI/CD automation

Snyk – IaC security scanning

OPA / Conftest – Policy-as-Code enforcement

🔄 CI/CD Workflow Summary
1️⃣ Pull Request Pipeline (Safe by Default)

Triggered on every Pull Request to main.

What happens:

Terraform formatting check

Terraform validation

OPA policy enforcement

Snyk IaC security scanning

Terraform plan (read-only)

❌ No infrastructure changes are applied at this stage.

2️⃣ Production Deployment Pipeline

Triggered only when code is merged into main.

Protections in place:

Manual approval via GitHub Environments

Explicit production gate

Controlled terraform apply

This ensures no unreviewed changes reach production.

3️⃣ Drift Detection

Runs on a scheduled basis.

Purpose:

Detects changes made outside Terraform

Surfaces configuration drift early

Supports long-term operational stability

🛡️ Policy-as-Code (OPA)

Compliance rules are enforced automatically during CI.

Example policies:

Databases may only be deployed in Japan

EC2 instances must not be publicly accessible

Network routes must be explicitly restricted

If a policy is violated:

The pipeline fails

The Pull Request cannot be merged

🔐 Security Controls

No secrets stored in code

Snyk API token stored securely in GitHub Secrets

No direct AWS credentials committed

Deployment access controlled via approvals

🧠 Design Philosophy

This pipeline is designed to ensure:

Compliance is enforced by automation

Security issues are caught early

Production changes are intentional and reviewed

Infrastructure remains the source of truth

🔗 Related Architecture Project

This CI/CD pipeline is designed to deploy and protect the infrastructure defined in:

J-Tele-Doctor – Global AWS Architecture (Terraform)
→ Stateless global application delivery
→ Japan-centric data residency
→ Controlled Transit Gateway connectivity

📌 Why This Matters

This repository demonstrates the ability to:

Build safe Terraform delivery pipelines

Apply DevSecOps principles in practice

Enforce compliance without slowing teams down

Operate infrastructure responsibly at scale
