# Use latest Ubuntu version
FROM ubuntu:latest

# Update apt and install necessary dependencies
RUN apt-get update && \
    apt-get install -y sudo wget unzip g++ cmake curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Setup working directory
WORKDIR /app

# Download and unzip Crow
RUN wget https://github.com/CrowCpp/Crow/releases/download/v1.0%2B5/crow-v1.0+5.tar.gz && \
    mkdir crow && \
    tar xvfz crow-v1.0+5.tar.gz -C crow --strip-components=1 && \
    rm crow-v1.0+5.tar.gz

# Download and unzip Boost
RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.83.0/source/boost_1_83_0.tar.gz && \
    tar -xzvf boost_1_83_0.tar.gz && \
    rm boost_1_83_0.tar.gz

# Copy main.cpp and CMakeLists.txt into the Docker container 
COPY main.cpp CMakeLists.txt /app/

# Setup for building the app using CMake
RUN mkdir build
WORKDIR /app/build

# Run cmake and make
RUN cmake .. && make

# Expose port 8080
EXPOSE 8080

# Command to run your CrowSample app
CMD ["./CrowSample"]