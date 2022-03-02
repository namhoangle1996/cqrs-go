### Golang CQRS Kafka gRPC Postgresql MongoDB Redis microservices example 👋

Note : Tác giả đã thực hiện kiến trúc Command Query Responsibility Segregation - Event Sourcing)

Tách biệt 2 phần để tận dụng tối đa hiệu năng :
 - Command (gồm Create, Update, Delete) : thực hiên trên Postgresql
 - Query (Get) : thực hiện truy vấn bản ghi trên Mongodb (tốc độ đọc của Mongo là rất tốt)

Flow :
- Với mỗi thao tác ghi (C,U,D), tạo command ghi vào Postgresql -> publish Kafka -> Tại write service, consumer thực hiện ghi trên MongoDb
- Thao tác Read : sẽ call trục tiếp đến reader service để lấy dữ liệu

#### 👨‍💻 Full list what has been used:
[Kafka](https://github.com/segmentio/kafka-go) as messages broker<br/>
[gRPC](https://github.com/grpc/grpc-go) Go implementation of gRPC<br/>
[PostgreSQL](https://github.com/jackc/pgx) as database<br/>
[Jaeger](https://www.jaegertracing.io/) open source, end-to-end distributed [tracing](https://opentracing.io/)<br/>
[Prometheus](https://prometheus.io/) monitoring and alerting<br/>
[Grafana](https://grafana.com/) for to compose observability dashboards with everything from Prometheus<br/>
[MongoDB](https://github.com/mongodb/mongo-go-driver) Web and API based SMTP testing<br/>
[Redis](https://github.com/go-redis/redis) Type-safe Redis client for Golang<br/>
[swag](https://github.com/swaggo/swag) Swagger for Go<br/>
[Echo](https://github.com/labstack/echo) web framework<br/>

### Jaeger UI:

http://localhost:16686

### Prometheus UI:

http://localhost:9090

### Grafana UI:

http://localhost:3000

### Swagger UI:

http://localhost:5001/swagger/index.html


For local development 🙌👨‍💻🚀:

```
make migrate_up // run sql migrations
make mongo // run mongo init scripts
make swagger // generate swagger documentation
make local or docker_dev // for run docker compose files
```

