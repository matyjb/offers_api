FROM ghcr.io/cirruslabs/flutter:stable AS build
WORKDIR /app
COPY . .

RUN flutter config --enable-web && \
    flutter pub get && \
    flutter build web --release

FROM nginx:alpine AS host
COPY --from=build /app/build/web /usr/share/nginx/html

# Expose port 80 for nginx
EXPOSE 80

# Start nginx and Firebase emulators
CMD ["/bin/sh", "-c", "nginx -g 'daemon off;'"]