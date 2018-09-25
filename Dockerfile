FROM microsoft/dotnet
 
WORKDIR /home/app

COPY ./src/HelloCircleCI/HelloCircleCI.csproj ./src/HelloCircleCI/HelloCircleCI.csproj
COPY ./src/HelloWercker/HelloWercker.csproj ./src/HelloWercker/HelloWercker.csproj
COPY ./Kinvitech.CICD.sln .

RUN dotnet restore
 
COPY . .
 
RUN dotnet publish ./src/HelloCircleCI/HelloCircleCI.csproj -o /publish/
 
WORKDIR /publish
 
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
