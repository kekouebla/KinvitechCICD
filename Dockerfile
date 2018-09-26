FROM microsoft/dotnet
 
WORKDIR /home/app

COPY ./*.sln ./
COPY src/*/*.csproj ./
RUN for file in $(ls *.csproj); do mkdir -p src/${file%.*}/ && mv $file src/${file%.*}/; done

RUN dotnet restore
 
COPY . .
 
RUN dotnet publish ./src/HelloCircleCI/HelloCircleCI.csproj -o /publish/
 
WORKDIR /publish
 
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
