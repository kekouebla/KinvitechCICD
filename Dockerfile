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

FROM ubuntu:18.04
# Install Docker CLI in the agent
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
RUN apt-get update && apt-get install -y docker-ce
ENTRYPOINT ["dotnet", "HelloJenkins.dll"]