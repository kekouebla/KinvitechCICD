FROM microsoft/aspnetcore-build

LABEL author="Kinvi Ekoue-Bla"

ENV ASPNETCORE_URLS=http://*:5000

WORKDIR /app

CMD ["bin/bash", "-c", "dotnet restore && dotnet run"]
