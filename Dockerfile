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
RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/
USER jenkins

VOLUME [$JENKINS_HOME, "/var/run/docker.sock"]