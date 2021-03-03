/******************************************************************************
 * Author:           LeiruiCN (Ruiqi Lei)
 * License:          GNU GPL v3+
 ******************************************************************************/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>


int day_diff(int year_start, int month_start, int day_start,
             int year_end, int month_end, int day_end)
{
     int y2, m2, d2;
     int y1, m1, d1;

     m1 = (month_start + 9) % 12;
     y1 = year_start - m1 / 10;
     d1 = 365 * y1 + y1 / 4 - y1 / 100 + y1 / 400 + (m1 * 306 + 5) / 10 + (day_start - 1);

     m2 = (month_end + 9) % 12;
     y2 = year_end - m2 / 10;
     d2 = 365 * y2 + y2 / 4 - y2 / 100 + y2 / 400 + (m2 * 306 + 5) / 10 + (day_end - 1);

     return (d2 - d1);
}

int main(int argc)
{
     FILE *fin;
     int remain;
     int cur_year, cur_month, cur_day;
     int des_year, des_month, des_day;
     time_t timep;
     struct tm *p;
     time(&timep);

     fin = fopen("/home/rn7s2/bin/ccee/time.txt", "r");

     p = localtime(&timep);
     cur_day = p->tm_mday;
     cur_month = 1 + p->tm_mon;
     cur_year = 1900 + p->tm_year;

     fscanf(fin, "%d%d%d", &des_year, &des_month, &des_day);
     fclose(fin);

     remain = day_diff(cur_year, cur_month, cur_day,
		       des_year, des_month, des_day);

     char cmd[1000];
    
     if(remain >= 0 && remain <= 366)
	  sprintf(cmd, "gsettings set org.cinnamon.desktop.background picture-uri file:///home/rn7s2/bin/ccee/pic/%d.jpg", remain);
     else
	  sprintf(cmd, "gsettings set org.cinnamon.desktop.background picture-uri file:///home/rn7s2/bin/ccee/pic/linuxmint.jpg");

     printf("%s\n", cmd);
     system(cmd);
    
     return 0;
}
