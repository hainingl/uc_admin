# import Config
import json

import gmplot
import requests


class GoogleMapper:
    street_info = '3902 Washington Blvd, Fremont, CA '

    def create_map(self):
        global street_info
        gmap = gmplot.GoogleMapPlotter('37.51', '-121.93', 11)
        lat, lon = gmap.geocode(street_info)
        gmap = gmplot.GoogleMapPlotter(lat, lon, 18)
        gmap.draw("/tmp/tmp.gmap.html")
        print(lat, lon)
        aa = gmap.from_geocode('150 W Evelyn Ave #300, Mountain View, CA 94041', 13)
        aa.draw("/tmp/tmp.4.html")
        print(aa)

    def close(self):
        if self.con_pgres is not None:
            self.con_pgres.close()

    def call_direct(self, location_string):
        global street_info
        geocode = requests.get(
            'https://maps.googleapis.com/maps/api/geocode/json?address="%s" ' % location_string)
        gg=requests.get('https://maps.googleapis.com/maps/api/geocode/json?address=%2243964%20rosemere%20dr.%20fremont,%20ca%22'
                        '&key=AIzaSyBbnzVzfE1OXnU6vSiU1q3hNN6I2-d2igE')
        print(gg.text)
        geocode = json.loads(geocode.text)
        latlng_dict = geocode['results'][0]['geometry']['location']
        # return latlng_dict['lat'], latlng_dict['lng']
        return geocode


def main():
    mapper = GoogleMapper()
    # mapper.create_map()

    street_info = '3902 Washington Blvd, Fremont, CA '
    res_json = mapper.call_direct(street_info)
    mapper.close()


if __name__ == "__main__":
    try:
        main()
    except Exception as e:
        print ('Failed to generate cohort')
