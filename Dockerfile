FROM microsoft/dotnet
 
WORKDIR /home/app

COPY ./src/HelloCircleCI/HelloCircleCI.csproj ./HelloCircleCI/

RUN dotnet restore
 
COPY . .
 
RUN dotnet publish ./src/HelloCircleCI/HelloCircleCI.csproj -o /publish/
 
WORKDIR /publish
 
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
