# System Architecture Diagram Patterns

## Common Components

### Databases

- **Shape:** Cylinder
- **Use for:** SQL databases, NoSQL stores, data lakes
- **Labels:** Database name, type (PostgreSQL, MongoDB, etc.)

```
┌─────────────┐
│   ┌───┐     │
│   │███│     │  PostgreSQL
│   │███│     │  Primary DB
│   └───┘     │
└─────────────┘
```

### Services/Applications

- **Shape:** Rectangle
- **Use for:** Microservices, APIs, applications
- **Labels:** Service name, version, port

```
┌─────────────────────┐
│  API Gateway        │
│  v2.1.0 :8080       │
└─────────────────────┘
```

### External Services

- **Shape:** Cloud
- **Use for:** Third-party APIs, cloud services
- **Labels:** Provider, service name

```
     ╱╲╱╲╱╲
    ╱ AWS  ╲   S3 Bucket
   ╱ S3     ╲
  ╱╲╱╲╱╲╱╲╱╲
```

### Message Queues

- **Shape:** Rectangle with horizontal lines
- **Use for:** Kafka, RabbitMQ, SQS
- **Labels:** Queue name, broker

```
┌─────────────────────┐
│ ─────────────────── │
│ ─────────────────── │  Kafka
│ ─────────────────── │  Topic: orders
└─────────────────────┘
```

## Architecture Patterns

### 3-Tier Architecture

```
┌──────────────┐
│   Client     │  (Web/Mobile)
│   Layer      │
└──────┬───────┘
       │ HTTP/HTTPS
       ▼
┌──────────────┐
│   API        │  (Application)
│   Layer      │
└──────┬───────┘
       │ SQL/gRPC
       ▼
┌──────────────┐
│   Data       │  (Database)
│   Layer      │
└──────────────┘
```

### Microservices Architecture

```
                    ┌─────────────┐
                    │   API       │
                    │  Gateway    │
                    └──────┬──────┘
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│   User        │ │   Order       │ │   Product     │
│   Service     │ │   Service     │ │   Service     │
└───────┬───────┘ └───────┬───────┘ └───────┬───────┘
        │                  │                  │
        ▼                  ▼                  ▼
┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│   User DB     │ │   Order DB    │ │   Product DB  │
└───────────────┘ └───────────────┘ └───────────────┘
```

### Event-Driven Architecture

```
┌──────────┐    ┌──────────┐    ┌──────────┐
│ Service  │───▶│  Kafka   │───▶│ Service  │
│   A      │    │  Topic   │    │   B      │
└──────────┘    └──────────┘    └──────────┘
                       │
                       ▼
                ┌──────────┐
                │ Service  │
                │   C      │
                └──────────┘
```

## Connection Labels

Always label connections with:

- **Protocol:** HTTP, HTTPS, gRPC, TCP, UDP
- **Direction:** Use arrows appropriately
- **Data type:** JSON, Protobuf, XML (optional)

### Examples:

- `HTTPS (JSON)`
- `gRPC (Protobuf)`
- `JDBC`
- `AMQP`

## Best Practices

1. **Consistency:** Use the same shape for the same type of component
2. **Clarity:** Labels should be readable (min 10pt font)
3. **Grouping:** Use containers/boundaries for related services
4. **Color:** Use color sparingly to highlight important flows
5. **Legend:** Include a legend for complex diagrams

## Tools Integration

### Using this skill:

```bash
# Export architecture diagram
drawio -x architecture.drawio -o architecture.png --zoom 2

# Export to SVG for documentation
drawio -x architecture.drawio -o architecture.svg
```
