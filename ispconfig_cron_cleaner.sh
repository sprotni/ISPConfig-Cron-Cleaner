#!/bin/bash

# Prompt for database credentials
read -p "Enter your database username: " db_user
read -sp "Enter your database password: " db_password
echo

# Connect to the database and show the current contents of the sys_cron table
echo "Current contents of the sys_cron table:"
mysql -u"$db_user" -p"$db_password" -e "USE dbispconfig; SELECT * FROM sys_cron;"

# Clear the sys_cron table
echo "Clearing the sys_cron table..."
mysql -u"$db_user" -p"$db_password" -e "USE dbispconfig; DELETE FROM sys_cron;"

# Confirm the table has been cleared
echo "The sys_cron table has been cleared."

# Run the ISPConfig scripts without changing directories
echo "Running server.sh..."
/usr/local/ispconfig/server/server.sh

echo "Running cron.sh..."
/usr/local/ispconfig/server/cron.sh

echo "Scripts have been executed."

# Ask if user wants to check the root crontab
read -p "Do you want to check if the root crontab contains the necessary cron entries? (yes/no) " answer
if [[ $answer = "yes" ]]; then
  # Define the required cron jobs
  cronjob1="* * * * * /usr/local/ispconfig/server/server.sh 2>&1 | while read line; do echo `/bin/date` \"$line\" >> /var/log/ispconfig/cron.log; done"
  cronjob2="* * * * * /usr/local/ispconfig/server/cron.sh 2>&1 | while read line; do echo `/bin/date` \"$line\" >> /var/log/ispconfig/cron.log; done"

  # Check the root crontab for the entries
  if ( crontab -l | grep -Fq "$cronjob1" ) && ( crontab -l | grep -Fq "$cronjob2" ); then
    echo "Both cron entries are correctly set in the root crontab."
  else
    echo "Cron entries are missing or incorrect in the root crontab."
  fi
else
  echo "Skipping crontab check."
fi
