#! /bin/bash

cron='2-59/5 *     *   *   *     /var/www/nvtvserver/Sintonia/bin/get_sintonia_schedule.bash  >/dev/null 2>&1'

(
    
    crontab -l | grep -v /var/www/nvtvserver/Sintonia/bin/get_sintonia_schedule.bash
    echo "$cron"
    
) | crontab


