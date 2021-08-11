#!/usr/bin/env python

import json
import urllib
import urllib.parse
import urllib.request
import os


def main():
    city = 4724129
    api_key = "bdb7e02bbaa5e17d1616b3023623ad41"

    try:
        data = urllib.parse.urlencode({'id': city, 'appid': api_key, 'units': 'imperial'})
        weather = json.loads(urllib.request.urlopen(
            'http://api.openweathermap.org/data/2.5/weather?' + data)
            .read())
        desc = weather['weather'][0]['description'].capitalize()
        icons = {"Thunderstorm":"", "Drizzle":"", "Rain":"", "Snow":"", "Mist":"", "Smoke":"", "Haze":"", "Dust":"", "Fog":"", "Sand":"", "Dust":"", "Ash":"", "Squall":"", "Tornado":"", "Clear":"", "Clouds":"", "Overcast clouds":""}
        icon = icons.get(desc, 'none')
        temp = int(float(weather['main']['temp']))
        #return icon + ' ' + desc + ' ' + temp + ''
        return ' {}  {}, {}°F '.format(icon, desc, temp)
        #return '{}°C'.format(temp)
    except:
        return ''


if __name__ == "__main__":
	print(main())
