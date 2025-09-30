FROM barichello/godot-ci:4.5
WORKDIR /app
COPY . .
RUN mkdir /build
RUN godot --export-release "Web" /build/index.html --headless
VOLUME [ "/out" ]
CMD ["cp", "-r", "/build/.", "/out"]