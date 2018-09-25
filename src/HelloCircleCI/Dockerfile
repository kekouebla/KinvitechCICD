FROM microsoft/aspnetcore-build

LABEL author="Kinvi Ekoue-Bla"

WORKDIR /app

COPY . .

RUN dotnet restore

RUN dotnet publish ./src/HelloCircleCI/HelloCircleCI.csproj -o /publish/

WORKDIR /publish

ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
