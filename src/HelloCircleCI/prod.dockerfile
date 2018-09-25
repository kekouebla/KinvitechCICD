FROM microsoft/aspnetcore-build as publish
WORKDIR /publish
COPY HelloCircleCI.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish --output ./out

FROM microsoft/aspnetcore
LABEL author="Kinvi Ekoue-Bla"
WORKDIR /app
COPY --from=publish /publish/out .
ENV ASPNETCORE_URLS=http://*:5000
EXPOSE 5000
ENTRYPOINT ["dotnet", "HelloCircleCI.dll"]
