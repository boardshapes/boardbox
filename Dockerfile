FROM barichello/godot-ci:4.5 AS builder
WORKDIR /app
COPY . .
RUN mkdir /build
RUN godot --export-release "Web" /build/index.html --headless

FROM alpine:latest AS copier
COPY --from=builder /build /build
VOLUME [ "/out" ]
CMD ["cp", "-r", "/build/.", "/out"]