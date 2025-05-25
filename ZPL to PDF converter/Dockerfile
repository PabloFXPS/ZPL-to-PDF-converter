FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY *.sln ./
COPY <projeto_pasta>/*.csproj ./<projeto_pasta>/
RUN dotnet restore
COPY . .
RUN dotnet publish -c Release -o /app/out


FROM mcr.microsoft.com/dotnet/aspnet:7.0-alpine AS runtime
WORKDIR /app
RUN apk add --no-cache libgdiplus
COPY --from=build /app/out ./
ENTRYPOINT ["dotnet", "ZPL-to-PDF-converter.dll"]
