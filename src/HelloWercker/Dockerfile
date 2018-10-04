FROM microsoft/dotnet:2.1-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY src/HelloWercker/HelloWercker.csproj src/HelloWercker/
RUN dotnet restore src/HelloWercker/HelloWercker.csproj
COPY . .
WORKDIR /src/src/HelloWercker
RUN dotnet build HelloWercker.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish HelloWercker.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "HelloWercker.dll"]
