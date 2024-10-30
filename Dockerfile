FROM eclipse-temurin:23-jdk-alpine AS builder
WORKDIR /opt/app

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .

# Download the dependencies
RUN ./mvnw dependency:go-offline

COPY src src

RUN ./mvnw --activate-profiles docker --batch-mode --update-snapshots clean install package

FROM eclipse-temurin:23-jre-alpine
WORKDIR /opt/testapp

# Create a group and user
RUN addgroup -S testapp && \
    adduser -S -G testapp testapp && \
    chown -R testapp:testapp /opt/testapp

COPY --from=builder /opt/app/target/app.jar .

# Change to 'testapp' user
USER testapp

ENTRYPOINT ["java", "-jar", "/opt/testapp/app.jar"]