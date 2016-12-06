defmodule HedwigSimpleResponders.TestWundergroundApi do
  @behaviour HedwigSimpleResponders.Wunderground.ApiClient
  
  def get(:weather, _) do
    sample_weather    
  end

  def get(:forecast, location) do
    get(:weather, location)
  end

  def get(:radar, _) do
    sample_radar    
  end

  def get(:satellite, _) do
    sample_satellite    
  end

  def get(:weathercam, _) do
    sample_weathercam    
  end

  def get(:webcams, location) do
    get(:weathercam, location)
  end

  defp sample_weather do
    {:ok,
    %{"forecast" => %{"simpleforecast" => %{"forecastday" => [%{"avehumidity" => 58,
              "avewind" => %{"degrees" => 304, "dir" => "NW", "kph" => 18,
                "mph" => 11}, "conditions" => "Partly Cloudy",
              "date" => %{"ampm" => "PM", "day" => 6, "epoch" => "1481079600",
                "hour" => 19, "isdst" => "0", "min" => "00", "month" => 12,
                "monthname" => "December", "monthname_short" => "Dec",
                "pretty" => "7:00 PM PST on December 06, 2016", "sec" => 0,
                "tz_long" => "America/Los_Angeles", "tz_short" => "PST",
                "weekday" => "Tuesday", "weekday_short" => "Tue", "yday" => 340,
                "year" => 2016},
              "high" => %{"celsius" => "14", "fahrenheit" => "57"},
              "icon" => "partlycloudy",
              "icon_url" => "http://icons.wxug.com/i/c/k/partlycloudy.gif",
              "low" => %{"celsius" => "6", "fahrenheit" => "43"},
              "maxhumidity" => 0,
              "maxwind" => %{"degrees" => 304, "dir" => "NW", "kph" => 24,
                "mph" => 15}, "minhumidity" => 0, "period" => 1, "pop" => 0,
              "qpf_allday" => %{"in" => 0.0, "mm" => 0},
              "qpf_day" => %{"in" => 0.0, "mm" => 0},
              "qpf_night" => %{"in" => 0.0, "mm" => 0}, "skyicon" => "",
              "snow_allday" => %{"cm" => 0.0, "in" => 0.0},
              "snow_day" => %{"cm" => 0.0, "in" => 0.0},
              "snow_night" => %{"cm" => 0.0, "in" => 0.0}},
            %{"avehumidity" => 62,
              "avewind" => %{"degrees" => 94, "dir" => "E", "kph" => 10,
                "mph" => 6}, "conditions" => "Chance of Rain",
              "date" => %{"ampm" => "PM", "day" => 7, "epoch" => "1481166000",
                "hour" => 19, "isdst" => "0", "min" => "00", "month" => 12,
                "monthname" => "December", "monthname_short" => "Dec",
                "pretty" => "7:00 PM PST on December 07, 2016", "sec" => 0,
                "tz_long" => "America/Los_Angeles", "tz_short" => "PST",
                "weekday" => "Wednesday", "weekday_short" => "Wed", "yday" => 341,
                "year" => 2016},
              "high" => %{"celsius" => "11", "fahrenheit" => "51"},
              "icon" => "chancerain",
              "icon_url" => "http://icons.wxug.com/i/c/k/chancerain.gif",
              "low" => %{"celsius" => "9", "fahrenheit" => "49"},
              "maxhumidity" => 0,
              "maxwind" => %{"degrees" => 94, "dir" => "E", "kph" => 16,
                "mph" => 10}, "minhumidity" => 0, "period" => 2, "pop" => 40,
              "qpf_allday" => %{"in" => 0.63, "mm" => 16},
              "qpf_day" => %{"in" => 0.04, "mm" => 1},
              "qpf_night" => %{"in" => 0.59, "mm" => 15}, "skyicon" => "",
              "snow_allday" => %{"cm" => 0.0, "in" => 0.0},
              "snow_day" => %{"cm" => 0.0, "in" => 0.0},
              "snow_night" => %{"cm" => 0.0, "in" => 0.0}},
            %{"avehumidity" => 90,
              "avewind" => %{"degrees" => 178, "dir" => "S", "kph" => 26,
                "mph" => 16}, "conditions" => "Rain",
              "date" => %{"ampm" => "PM", "day" => 8, "epoch" => "1481252400",
                "hour" => 19, "isdst" => "0", "min" => "00", "month" => 12,
                "monthname" => "December", "monthname_short" => "Dec",
                "pretty" => "7:00 PM PST on December 08, 2016", "sec" => 0,
                "tz_long" => "America/Los_Angeles", "tz_short" => "PST",
                "weekday" => "Thursday", "weekday_short" => "Thu", "yday" => 342,
                "year" => 2016},
              "high" => %{"celsius" => "14", "fahrenheit" => "58"},
              "icon" => "rain",
              "icon_url" => "http://icons.wxug.com/i/c/k/rain.gif",
              "low" => %{"celsius" => "12", "fahrenheit" => "54"},
              "maxhumidity" => 0,
              "maxwind" => %{"degrees" => 178, "dir" => "S", "kph" => 32,
                "mph" => 20}, "minhumidity" => 0, "period" => 3, "pop" => 100,
              "qpf_allday" => %{"in" => 0.53, "mm" => 13},
              "qpf_day" => %{"in" => 0.43, "mm" => 11},
              "qpf_night" => %{"in" => 0.09, "mm" => 2}, "skyicon" => "",
              "snow_allday" => %{"cm" => 0.0, "in" => 0.0},
              "snow_day" => %{"cm" => 0.0, "in" => 0.0},
              "snow_night" => %{"cm" => 0.0, "in" => 0.0}},
            %{"avehumidity" => 95,
              "avewind" => %{"degrees" => 196, "dir" => "SSW", "kph" => 11,
                "mph" => 7}, "conditions" => "Chance of Rain",
              "date" => %{"ampm" => "PM", "day" => 9, "epoch" => "1481338800",
                "hour" => 19, "isdst" => "0", "min" => "00", "month" => 12,
                "monthname" => "December", "monthname_short" => "Dec",
                "pretty" => "7:00 PM PST on December 09, 2016", "sec" => 0,
                "tz_long" => "America/Los_Angeles", "tz_short" => "PST",
                "weekday" => "Friday", "weekday_short" => "Fri", "yday" => 343,
                "year" => 2016},
              "high" => %{"celsius" => "15", "fahrenheit" => "59"},
              "icon" => "chancerain",
              "icon_url" => "http://icons.wxug.com/i/c/k/chancerain.gif",
              "low" => %{"celsius" => "11", "fahrenheit" => "51"},
              "maxhumidity" => 0,
              "maxwind" => %{"degrees" => 196, "dir" => "SSW", "kph" => 16,
                "mph" => 10}, "minhumidity" => 0, "period" => 4, "pop" => 70,
              "qpf_allday" => %{"in" => 0.69, "mm" => 18},
              "qpf_day" => %{"in" => 0.17, "mm" => 4},
              "qpf_night" => %{"in" => 0.52, "mm" => 13}, "skyicon" => "",
              "snow_allday" => %{"cm" => 0.0, "in" => 0.0},
              "snow_day" => %{"cm" => 0.0, "in" => 0.0},
              "snow_night" => %{"cm" => 0.0, "in" => 0.0}}]},
        "txt_forecast" => %{"date" => "11:15 AM PST",
          "forecastday" => [%{"fcttext" => "A mix of clouds and sun. High 57F. Winds NW at 10 to 15 mph.",
              "fcttext_metric" => "Sun and clouds mixed. High 13C. Winds NW at 15 to 25 km/h.",
              "icon" => "partlycloudy",
              "icon_url" => "http://icons.wxug.com/i/c/k/partlycloudy.gif",
              "period" => 0, "pop" => "0", "title" => "Tuesday"},
            %{"fcttext" => "Partly cloudy skies this evening will become overcast overnight. Low 43F. Winds N at 5 to 10 mph.",
              "fcttext_metric" => "Partly cloudy this evening, then becoming cloudy after midnight. Low 6C. Winds N at 10 to 15 km/h.",
              "icon" => "nt_mostlycloudy",
              "icon_url" => "http://icons.wxug.com/i/c/k/nt_mostlycloudy.gif",
              "period" => 1, "pop" => "0", "title" => "Tuesday Night"},
            %{"fcttext" => "Cloudy with occasional showers for the afternoon. High 51F. Winds E at 5 to 10 mph. Chance of rain 40%.",
              "fcttext_metric" => "Considerable cloudiness. Occasional rain showers in the afternoon. High around 10C. Winds E at 10 to 15 km/h. Chance of rain 50%.",
              "icon" => "chancerain",
              "icon_url" => "http://icons.wxug.com/i/c/k/chancerain.gif",
              "period" => 2, "pop" => "40", "title" => "Wednesday"},
            %{"fcttext" => "Rain. Low 49F. Winds SE at 10 to 20 mph. Chance of rain 100%. Rainfall around a half an inch.",
              "fcttext_metric" => "Rain likely. Low 9C. Winds SE at 15 to 30 km/h. Chance of rain 100%. Rainfall around 12mm.",
              "icon" => "nt_rain",
              "icon_url" => "http://icons.wxug.com/i/c/k/nt_rain.gif",
              "period" => 3, "pop" => "100", "title" => "Wednesday Night"},
            %{"fcttext" => "Rain. High 58F. Winds S at 10 to 20 mph. Chance of rain 100%. Rainfall near a half an inch.",
              "fcttext_metric" => "Periods of rain. High 14C. Winds S at 15 to 30 km/h. Chance of rain 100%. Rainfall near 12mm.",
              "icon" => "rain",
              "icon_url" => "http://icons.wxug.com/i/c/k/rain.gif", "period" => 4,
              "pop" => "100", "title" => "Thursday"},
            %{"fcttext" => "Considerable cloudiness with occasional rain showers. Low 54F. Winds S at 10 to 15 mph. Chance of rain 60%.",
              "fcttext_metric" => "Cloudy with occasional rain showers. Low 12C. Winds S at 15 to 25 km/h. Chance of rain 60%.",
              "icon" => "nt_chancerain",
              "icon_url" => "http://icons.wxug.com/i/c/k/nt_chancerain.gif",
              "period" => 5, "pop" => "60", "title" => "Thursday Night"},
            %{"fcttext" => "Cloudy with occasional light rain. High 59F. Winds SSW at 5 to 10 mph. Chance of rain 70%.",
              "fcttext_metric" => "Cloudy. Some light rain is likely. High near 15C. Winds SSW at 10 to 15 km/h. Chance of rain 70%.",
              "icon" => "chancerain",
              "icon_url" => "http://icons.wxug.com/i/c/k/chancerain.gif",
              "period" => 6, "pop" => "70", "title" => "Friday"},
            %{"fcttext" => "Rain likely. Low 51F. Winds SSW at 10 to 15 mph. Chance of rain 70%. Rainfall near a half an inch.",
              "fcttext_metric" => "Periods of rain. Low around 10C. Winds SSW at 15 to 25 km/h. Chance of rain 70%. Rainfall around 12mm.",
              "icon" => "nt_rain",
              "icon_url" => "http://icons.wxug.com/i/c/k/nt_rain.gif",
              "period" => 7, "pop" => "70", "title" => "Friday Night"}]}},
      "response" => %{"features" => %{"forecast" => 1},
        "termsofService" => "http://www.wunderground.com/weather/api/d/terms.html",
        "version" => "0.1"}}}    
  end

  defp sample_radar do
    {:ok,
    %{"radar" => %{"image_url" => "http://resize.wunderground.com/cgi-bin/resize_convert?ox=gif&url=radblast/cgi-bin/radar/WUNIDS_composite%3Fcenterlat=37.77999878%26centerlon=-122.41999817%26radius=75%26newmaps=1%26smooth=1%26reproj.automerc=1%26api_key=cdf85fc94d141f3d",
        "url" => "http://www.wunderground.com/radar/radblast.asp?ID=MUX&region=c1&lat=37.77999878&lon=-122.41999817"},
      "response" => %{"features" => %{"radar" => 1},
        "termsofService" => "http://www.wunderground.com/weather/api/d/terms.html",
        "version" => "0.1"}}}    
  end

  defp sample_satellite do
    {:ok,
    %{"response" => %{"features" => %{"satellite" => 1},
        "termsofService" => "http://www.wunderground.com/weather/api/d/terms.html",
        "version" => "0.1"},
      "satellite" => %{"image_url" => "http://wublast.wunderground.com/cgi-bin/WUBLAST?lat=37.77999878&lon=-122.41999817&radius=75&width=300&height=300&key=sat_ir4_thumb&gtt=0&extension=png&proj=me&num=1&delay=25&timelabel=0&basemap=1&borders=1&theme=WUBLAST_WORLD&rand=1481057736&api_key=cdf85fc94d141f3d",
        "image_url_ir4" => "http://wublast.wunderground.com/cgi-bin/WUBLAST?lat=37.77999878&lon=-122.41999817&radius=75&width=300&height=300&key=sat_ir4_thumb&gtt=0&extension=png&proj=me&num=1&delay=25&timelabel=0&basemap=1&borders=1&theme=WUBLAST_WORLD&rand=1481057736&api_key=cdf85fc94d141f3d",
        "image_url_vis" => "http://wublast.wunderground.com/cgi-bin/WUBLAST?lat=37.77999878&lon=-122.41999817&radius=75&width=300&height=300&key=sat_vis_thumb&gtt=0&extension=png&proj=me&num=1&delay=25&timelabel=0&basemap=1&borders=1&theme=WUBLAST_WORLD&rand=1481057736&api_key=cdf85fc94d141f3d"}}}          
  end

  defp sample_weathercam do
    {:ok,
    %{"response" => %{"features" => %{"webcams" => 1},
        "termsofService" => "http://www.wunderground.com/weather/api/d/terms.html",
        "version" => "0.1"},
      "webcams" => [%{"CAMURL" => "http://www.wunderground.com/webcams/wntdone/1/show.html",
          "CURRENTIMAGEURL" => "http://icons.wunderground.com/webcamramdisk/w/n/wntdone/1/current.jpg?t=1481057760",
          "WIDGETCURRENTIMAGEURL" => "http://icons.wunderground.com/webcamramdisk/w/n/wntdone/1/widget.jpg?t=1481057760",
          "assoc_station_id" => "", "cameratype" => "", "camid" => "wntdoneCAM1",
          "camindex" => "1", "city" => "Livermore", "country" => "US",
          "downloaded" => "2016-11-27 18:27:42", "handle" => "wntdone",
          "isrecent" => "1", "lat" => "37.65081787", "link" => "http://",
          "linktext" => "", "lon" => "-121.78880310",
          "neighborhood" => "Traviso-Circle", "organization" => "", "state" => "CA",
          "tzname" => "America/Los_Angeles", "updated" => "2016-12-06 19:38:33",
          "updated_epoch" => "", "zip" => "94550"},
        %{"CAMURL" => "http://www.wunderground.com/webcams/ampledata/1/show.html",
          "CURRENTIMAGEURL" => "http://icons.wunderground.com/webcamramdisk/a/m/ampledata/1/current.jpg?t=1481057760",
          "WIDGETCURRENTIMAGEURL" => "http://icons.wunderground.com/webcamramdisk/a/m/ampledata/1/widget.jpg?t=1481057760",
          "assoc_station_id" => "KCASANFR302", "cameratype" => "",
          "camid" => "ampledataCAM1", "camindex" => "1", "city" => "San Francisco",
          "country" => "US", "downloaded" => "2016-12-06 19:49:45",
          "handle" => "ampledata", "isrecent" => "1", "lat" => "37.76002884",
          "link" => "http://www.twoeight.net", "linktext" => "28 Blocks Later",
          "lon" => "-122.49762726", "neighborhood" => "Outer Sunset",
          "organization" => "28 Blocks Later", "state" => "CA",
          "tzname" => "America/Los_Angeles", "updated" => "2016-12-06 19:49:33",
          "updated_epoch" => "", "zip" => "94122"},
        %{"CAMURL" => "http://www.wunderground.com/webcams/CastroCam/2/show.html",
          "CURRENTIMAGEURL" => "http://icons.wunderground.com/webcamramdisk/c/a/CastroCam/2/current.jpg?t=1481057760",
          "WIDGETCURRENTIMAGEURL" => "http://icons.wunderground.com/webcamramdisk/c/a/CastroCam/2/widget.jpg?t=1481057760",
          "assoc_station_id" => "KCASANFR114", "cameratype" => "Axis 2120",
          "camid" => "CastroCamCAM2", "camindex" => "2", "city" => "San Francisco",
          "country" => "US", "downloaded" => "2016-12-06 19:45:05",
          "handle" => "CastroCam", "isrecent" => "1", "lat" => "37.76245499",
          "link" => "https://castrocam.net",
          "linktext" => "Harvey Milk Plaza pride flag from the CastroCam",
          "lon" => "-122.43499756", "neighborhood" => "The Castro",
          "organization" => "Harvey Milk Plaza", "state" => "CA",
          "tzname" => "America/Los_Angeles", "updated" => "2016-12-06 19:44:38",
          "updated_epoch" => "", "zip" => "94114"}]}}    
  end

  
            
end