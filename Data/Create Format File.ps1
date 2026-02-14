bcp "raw_data.mexican_restaurants_Dublin" format nul ^
   -d burrito-bot-db ^
   -c ^
   -t"," ^
   -r"\n" ^
   -f "C:\git\aipoweredsearch\Data\Raw Data\restaurants.xml" ^
   -x ^
   -S localhost ^
   -T ^
   -u