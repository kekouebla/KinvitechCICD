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