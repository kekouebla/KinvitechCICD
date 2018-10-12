FROM microsoft/dotnet:2.1-sdk as build
WORKDIR /src
COPY src/*/*.csproj src/HelloJenkins/
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done
RUN dotnet restore src/HelloJenkins/HelloJenkins.csproj
COPY . .
RUN dotnet publish HelloJenkins.csproj -c Release -o /app

FROM microsoft/dotnet:2.1-runtime
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "HelloJenkins.dll"]



