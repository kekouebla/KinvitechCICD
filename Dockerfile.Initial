FROM microsoft/dotnet:2.1-sdk AS build
 
WORKDIR /home/app

COPY ./*.sln ./
COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

RUN dotnet restore
 
COPY . .
 
RUN dotnet publish ./src/HelloCircleCI/HelloCircleCI.csproj -o /publish/

FROM microsoft/dotnet:2.1-aspnetcore-runtime AS runtime
 
WORKDIR /publish

COPY --from=build /publish .
 
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
