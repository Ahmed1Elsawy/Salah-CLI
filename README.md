# Salah-CLI

Description
---------------
A group of commands that add the prayer times to the cron scheduler (daily), and it should alarm you at the prayer times.

It's a CLI program it does not use the GUI, I think it should be light and won't use much resources from the computer, and the best part is that it will run at the background.

----------
Building
--------
You should also install [xidel][1], [parallel][2] and [anacrontab][3].

And you should edit the file ` /etc/anacrontab ` and add something like this line
```
1       3       salah.update    /home/ahmed/.salah/update
```

so that the scheduler will be updated daily.

after that you make a directory for the salah files and cd to it.
```
mkdir ~/.salah
cd ~/.salah
```

Add the commands that will run at each prayer to the files something like the following note also that you have to make them executable
I have vlc installed and I have a file named S.m4a in ` ~/.salah` directory
```
echo -e '#!/bin/bash\ncvlc ~/.salah/S.m4a' | tee Fajr Dhuhr Asr Maghrib > Ishaa
chmod +x Fajr Dhuhr Asr Maghrib Ishaa
```
Now you have to make the update file

Make the file `~/.salah/update` which will have something like this:
```
if ! cmp -s p d/$(date +%-j)
then
    grep -vf p <(crontab -l) > my-crontab
    cat <(cat my-crontab) <(cat d/$(date +%-j) | tee p) > my-crontab
fi
```

  [1]: http://www.videlibri.de/xidel.html#downloads
  [2]: https://www.gnu.org/software/parallel/
  [3]: https://sourceforge.net/projects/anacron/
