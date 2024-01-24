FROM node:latest

# Instalar herramientas necesarias
RUN npm install -g @archwayhq/cli
RUN apt-get update && apt-get install -y curl

# Instalar Rust y herramientas de desarrollo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo install cargo-generate
RUN cargo install cargo-run-script

# Instalar Docker dentro del contenedor
RUN apt-get install -y docker.io

CMD ["sh", "-c", "tail -f /dev/null && export USER=prueba && git config --global --add safe.directory '*'"]
