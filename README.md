# 🚀 StreamPulse

> Real-time event pipeline with streaming anomaly detection and a live dashboard.

**Status:** 🚧 In development — Day 1 of 30.

## What it does

StreamPulse ingests high-volume events from any source, processes them through distributed workers, detects anomalies in real time, and serves a live-updating dashboard.

Everything is containerized, deployable to the cloud, and built to run 24/7.

## Stack

- **Queue:** Redis Streams
- **Storage:** PostgreSQL
- **Backend:** FastAPI + WebSockets
- **Workers:** Python
- **Frontend:** React + Recharts
- **DevOps:** Docker, GitHub Actions, Railway

## Quick Start (dev)

```bash
docker compose up -d
```

Redis → localhost:6379
Postgres → localhost:5432 (user: streampulse, pass: streampulse_dev)

## Roadmap

- [x] Day 1: Docker Compose with Redis + Postgres
- [ ] Week 1: Producer → queue → worker → storage
- [ ] Week 2: Streaming anomaly detection
- [ ] Week 3: WebSocket dashboard
- [ ] Week 4: CI/CD + cloud deploy

## Author

**Angellina Joyce Paul** — [GitHub](https://github.com/AngellinaJoycePaul)
