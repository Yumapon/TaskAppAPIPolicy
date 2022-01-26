FROM openpolicyagent/opa

LABEL version="1.0"
LABEL description="Opa image"

CMD ["run", "--server", "--addr", ":8181"]
