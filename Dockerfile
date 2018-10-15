FROM microsoft/dotnet:2.1-sdk as build
WORKDIR /src
COPY src/*/*.csproj src/HelloJenkins/
RUN dotnet restore src/HelloJenkins/HelloJenkins.csproj
COPY . .
WORKDIR /src/src/HelloJenkins
RUN dotnet publish HelloJenkins.csproj -c Release -o /app

FROM microsoft/dotnet:2.1-runtime
WORKDIR /app
COPY --from=build /app .
# Install Docker CLI in the agent
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce --allow-unauthenticated