-- StreamPulse schema
-- Runs once on first Postgres startup.

CREATE TABLE IF NOT EXISTS events (
    id           TEXT PRIMARY KEY,          -- Redis message ID, ensures idempotency
    ts           TIMESTAMPTZ NOT NULL,      -- event timestamp from producer
    received_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    source       TEXT NOT NULL,             -- e.g. 'web', 'mobile', 'sensor'
    metric       TEXT NOT NULL,             -- e.g. 'clicks', 'latency_ms'
    value        DOUBLE PRECISION NOT NULL,
    lag_ms       INTEGER                    -- received_at - ts, in milliseconds
);

CREATE INDEX IF NOT EXISTS idx_events_metric_ts ON events (metric, ts DESC);
CREATE INDEX IF NOT EXISTS idx_events_received_at ON events (received_at DESC);

CREATE TABLE IF NOT EXISTS anomalies (
    id           BIGSERIAL PRIMARY KEY,
    detected_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    metric       TEXT NOT NULL,
    detector     TEXT NOT NULL,             -- 'ewma', 'zscore', 'rate_of_change'
    severity     TEXT NOT NULL,             -- 'low', 'medium', 'high'
    value        DOUBLE PRECISION NOT NULL,
    baseline     DOUBLE PRECISION,          -- what the detector expected
    context      JSONB                      -- extra detector metadata
);

CREATE INDEX IF NOT EXISTS idx_anomalies_detected_at ON anomalies (detected_at DESC);
CREATE INDEX IF NOT EXISTS idx_anomalies_severity ON anomalies (severity, detected_at DESC);