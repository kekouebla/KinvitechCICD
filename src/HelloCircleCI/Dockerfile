FROM microsoft/aspnetcore-build
 
WORKDIR /home/app
 
COPY . .
 
RUN dotnet restore
 
RUN dotnet publish ./src/HelloCircleCI/HelloCirclCI.csproj -o /publish/
 
WORKDIR /publish
 
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]