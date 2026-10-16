FROM eclipse-temurin:11-jre

WORKDIR /app

COPY target/dptweb-1.0.war app.war

EXPOSE 8080

CMD ["java", "-jar", "app.war"]