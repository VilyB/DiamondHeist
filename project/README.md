# Vault Exploit CTF Challenge

Welcome to the **Diamond Heist** Capture The Flag (CTF) challenge from Remedy! This repository contains smart contracts and scripts designed for participants to identify and exploit vulnerabilities within a simulated vault system.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Setup](#setup)
- [Deploying the Challenge](#deploying-the-challenge)
- [Exploiting the Challenge](#exploiting-the-challenge)
- [Scripts Overview](#scripts-overview)
- [License](#license)

---

## Introduction

Participants are tasked with exploiting a vulnerable vault system to manipulate token balances and gain unauthorized access. The challenge involves interacting with several smart contracts and utilizing Foundry scripts to execute the exploit. Details about the existing deployment on the private blockchain can be found in the contracts defined in src.

## Prerequisites

Ensure you have the following installed:

- **[Foundry](https://getfoundry.sh/)**: Ethereum development toolkit.
- **[Git](https://git-scm.com/)**
- **[Node.js](https://nodejs.org/)** (optional)
- **An Ethereum Node Provider**: e.g., [Infura](https://infura.io/), [Alchemy](https://www.alchemy.com/), or [Anvil](https://book.getfoundry.sh/anvil/introduction.html).

### Install Foundry
```bash
curl -L https://foundry.paradigm.xyz | bash
foundryup
forge --version
```

## Install Foundry
### Clone the Repository
```bash
git clone https://github.com/yourusername/vault-exploit-ctf.git
cd vault-exploit-ctf
```

### Install Dependencies
```bash
forge install
```

Before running the script, make sure you change the environment variables in script/deploy.sh.
To run the exploit, simply change directory to "project" and run "bash script/deploy.sh
