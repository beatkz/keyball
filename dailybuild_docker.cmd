pushd "%~dp0"
docker compose run --rm build
timeout /t 10
popd
