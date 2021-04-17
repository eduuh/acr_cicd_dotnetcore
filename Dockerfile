FROM mcr.microsoft.com/dotnet/sdk:5.0 As build
WORKDIR /app
COPY ["acr_cicd_dotnetcore.csproj", "mvc/"] 
RUN dotnet restore "mvc/acr_cicd_dotnetcore.csproj"
COPY . ./mvc
WORKDIR "/app/mvc/"
RUN dotnet publish "acr_cicd_dotnetcore.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0
ENV ASPNETCORE_ENVIRONMENT="Production"
ENV ASPNETCORE_URLS http://+:5001
EXPOSE 5001
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT [ "dotnet", "acr_cicd_dotnetcore.dll" ]

