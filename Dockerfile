
FROM mcr.microsoft.com/dotnet/framework/sdk:4.7.2-windowsservercore-ltsc2019 AS build
WORKDIR C:/src

COPY ["ZPL to PDF converter\\", "ZPL to PDF converter\\"]
COPY ["packages\\", "packages\\"]
COPY ["ZPL to PDF converter.sln", "."]

RUN nuget restore "ZPL to PDF converter.sln"

WORKDIR "C:/src/ZPL to PDF converter"
RUN msbuild "ZPLtoPDFconverter.csproj" /p:Configuration=Release /p:OutputPath=C:\app\publish

FROM mcr.microsoft.com/dotnet/framework/runtime:4.7.2-windowsservercore-ltsc2019 AS runtime
WORKDIR C:/app
COPY --from=build C:/app/publish .
ENTRYPOINT ["C:\\app\\ZPLtoPDFconverter.exe"]
