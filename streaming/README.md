# streaming/

Streaming pipelines — Kafka, Kinesis, or Google Pub/Sub. Filled in during **Module 7 (Streaming Data Engineering)**.

## What will go here

- **producers/taxi_trip_producer.py** — Simulates live taxi trips streaming into Kafka (one trip event per pickup).
- **consumers/trip_enrichment_consumer.py** — Reads from Kafka, enriches with zone metadata, writes to a downstream topic.
- **connectors/taxi_kafka_to_warehouse.yml** — Kafka Connect config that lands trip events into your warehouse.
- **docker-compose.yml** — Local Kafka + Zookeeper + Schema Registry for development.

## What streaming adds

Beyond batch:

- **Low-latency dashboards** — driver availability updated every 5 seconds, not once an hour
- **Real-time alerts** — surge pricing kicks in when demand spikes in a zone
- **Event-driven architectures** — trip completion triggers downstream fare calculation immediately
- **Schema evolution** — Avro/Protobuf schemas enforced at produce/consume boundary

## Getting ready

Local Kafka via Docker Compose:

```bash
docker compose up -d kafka zookeeper schema-registry
```

Producer sketch:

```python
from confluent_kafka import Producer
import json, time

p = Producer({"bootstrap.servers": "localhost:9092"})

for trip in stream_of_taxi_trips():
    p.produce("taxi_trips", value=json.dumps(trip).encode())
    p.poll(0)
p.flush()
```

Module 7 walks through the full streaming pipeline: producer → Kafka → stream processor (Faust or Flink) → warehouse sink → real-time dashboard.
