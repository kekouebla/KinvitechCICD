FROM microsoft/dotnet:2.1-sdk
WORKDIR /app
COPY bin/Debug/netcoreapp1.0/publish /app
ENV ASPNETCORE_URLS http://*:5000
EXPOSE 5000

ENTRYPOINT /bin/bash -c "dotnet HelloCircleCI.dll"
