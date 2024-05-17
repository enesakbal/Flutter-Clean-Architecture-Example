echo "Refreshing..."

flutter clean

flutter pub get

cd ios

pod install

cd ..

echo "Refreshed"