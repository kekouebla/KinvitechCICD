FROM microsoft/dotnet:2.1-runtime AS base
WORKDIR /app

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY src/HelloJenkins/HelloJenkins.csproj /src/HelloJenkins/
RUN dotnet restore src/HelloJenkins/HelloJenkins.csproj
COPY . .
WORKDIR /src/src/HelloJenkins
RUN dotnet build HelloJenkins.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish HelloJenkins.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "HelloJenkins.dll"]
