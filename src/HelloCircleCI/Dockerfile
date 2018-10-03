FROM microsoft/dotnet:2.1-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY src/HelloCircleCI/HelloCircleCI.csproj src/HelloCircleCI/
RUN dotnet restore src/HelloCircleCI/HelloCircleCI.csproj
COPY . .
WORKDIR /src/src/HelloCircleCI
RUN dotnet build HelloCircleCI.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish HelloCircleCI.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
