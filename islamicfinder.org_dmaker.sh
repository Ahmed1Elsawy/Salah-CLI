#!/bin/bash
# Note that this file will generate the prayer times from sites on the internet.
# Currently available is the site islamicfinder.
# You should download the page of the year 2017
# from this URL: https://www.islamicfinder.org/prayer-times/print-yearly-prayers?timeInterval=year&calendarType=Gregorian&year=2017
# do that after you check you settings at https://www.islamicfinder.org/
# Put the .html file in the ~/.salah directory and cd to ~/.salah
# and then run this script to generate the directory d
# You should make sure that you have installed xidel and parallel

mkdir d
xidel -s Yearly\ prayer\ times.html -e "//div[2 or 3]/div/div/table/tbody/tr[not (@class='row-title')]/td[position()>1]" | xargs -I{} date -d "{}" +'%-M %-H * * * ~/.salah/' | parallel -N6 'echo -en {1}Fajr\\n{3}Dhuhr\\n{4}Asr\\n{5}Maghrib\\n{6}Ishaa\\n > d/{#}'
