FROM docker.n8n.io/n8nio/n8n:latest

# Set timezone to Cairo
ENV GENERIC_TIMEZONE=Africa/Cairo
ENV TZ=Africa/Cairo

# Optional: set basic auth (change in Railway/Render variables)
# ENV N8N_BASIC_AUTH_ACTIVE=true
# ENV N8N_BASIC_AUTH_USER=admin
# ENV N8N_BASIC_AUTH_PASSWORD=admin

EXPOSE 5678

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:5678/healthz || exit 1
