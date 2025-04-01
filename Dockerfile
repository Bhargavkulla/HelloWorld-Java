FROM openjdk:17
WORKDIR /app
COPY . .
RUN javac HelloWorld.java
CMD ["java", "HelloWorld"]
