FROM    hasura/graphql-engine:v1.0.0-beta.9.cli-migrations

LABEL   org.label-schema.name = "Response GraphQL Service"
LABEL   org.label-schema.description = "The GraphQL service for Lavra Response"
LABEL   org.label-schema.url = "https://github.com/lavrahq/response" 
LABEL   org.label-schema.vcs-url = "https://github.com/lavrahq/response-graphql"
LABEL   org.label-schema.vendor = "Lavra"
LABEL   org.label-schema.schema-version = "1.0"
LABEL   io.lavra.stack.supported = "true"

COPY    ./migrations /hasura-migrations

ENV     HASURA_GRAPHQL_SERVER_PORT=8080 \
  HASURA_GRAPHQL_SERVER_HOST="*" \
  HASURA_GRAPHQL_ENABLE_CONSOLE=false \
  HASURA_GRAPHQL_ENABLE_TELEMETRY=true \
  HASURA_GRAPHQL_PG_STRIPES=1 \
  HASURA_GRAPHQL_PG_CONNECTIONS=50 \
  HASURA_GRAPHQL_PG_TIMEOUT=180 \
  HASURA_GRAPHQL_USE_PREPARED_STATEMENTS=true \
  HASURA_GRAPHQL_TX_ISOLATION="read-committed" \
  HASURA_GRAPHQL_STRINGIFY_NUMERIC_TYPES=false \
  HASURA_GRAPHQL_ENABLED_APIS="metadata,graphql,pgdump" \
  HASURA_GRAPHQL_LIVE_QUERIES_FALLBACK_REFETCH_INTERVAL=1000 \
  HASURA_GRAPHQL_LIVE_QUERIES_MULTIPLEXED_REFETCH_INTERVAL=1000 \
  HASURA_GRAPHQL_LIVE_QUERIES_MULTIPLEXED_BATCH_SIZE=100 \
  HASURA_GRAPHQL_ENABLE_ALLOWLIST=false \
  HASURA_GRAPHQL_ENABLED_LOG_TYPES="startup, http-log, webhook-log, websocket-log" \
  HASURA_GRAPHQL_LOG_LEVEL="info" \
  HASURA_GRAPHQL_UNAUTHORIZED_ROLE="anonymous"