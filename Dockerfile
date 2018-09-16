FROM microsoft/dotnet:sdk AS build-env

WORKDIR /app

COPY . .
 
RUN dotnet restore
 
RUN dotnet publish ./src/HelloCircleCI/HelloCircleCI.csproj -o /publish/
 
WORKDIR /publish

ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
