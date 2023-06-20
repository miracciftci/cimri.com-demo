import requests
from bs4 import BeautifulSoup
import pymongo
from flask import Flask

class Product:
    def __init__(self):
        self.id = None
        self.marka = ''
        self.name = ''
        self.image = ''
        self.kargoDurum = ''
        self.rating = ''
        self.modelNo = ''
        self.ram = ''
        self.diskTuru = ''
        self.islemci = ''
        self.ekranBoyutu = ''
        self.diskKapasitesi = ''
        self.isletimSistemi = ''
        self.linkn11 = ''
        self.fiyatn11 = ''
        self.linkTeknosa = ''
        self.fiyatTeknosa = ''
        self.linkHepsiburada = ''
        self.fiyatHepsiburada = ''
        self.linkTrendyol = ''
        self.fiyatTrendyol = ''

diziProduct = []


# N11.com
sayi = 0
for j in range(1,1):
    url = "https://www.n11.com/bilgisayar/dizustu-bilgisayar?pg="
    url = url + "{}".format(j)
    response = requests.get(url)
    html_icerigi = response.content
    soup = BeautifulSoup(html_icerigi, "html.parser")
    list = soup.find_all("li", {"class": "column"})

    for i in list:
        p = Product()
        p.id = sayi
        sayi +=1
        p.fiyatn11 = i.div.find("span", {"class": "newPrice cPoint priceEventClick"}).text.strip().strip("TL")
        if p.fiyatn11.count(",") == 0:
            p.fiyatn11 += "{}".format(",00")
            p.fiyatn11 = p.fiyatn11.replace(" ","")

        p.name = i.h3.text
        title = p.name.split(' ')
        p.marka = title[0].title()
        p.linkn11 = i.div.a.get("href")
        p.image = i.find("img", {"class": "lazy cardImage"}).get("data-original")
        p.kargoDurum = i.find("span", {"class": "cargoBadgeText"}).text.replace("Ü","U").replace("İ","I")
        p.rating = i.div.find("span", {"class": "ratingText"}).text.strip("()")
        
        html = BeautifulSoup(requests.get(p.linkn11).content,"html.parser")
        html = html.find_all("li",{"class":"unf-prop-list-item"})
        for i in html:
            if i.find_all("p")[0].text == "Disk Türü":
                p.diskTuru = i.find_all("p")[1].text.lower().strip()
            elif i.find_all("p")[0].text == "Bellek Kapasitesi":
                p.ram = i.find_all("p")[1].text.lower().strip()
            elif i.find_all("p")[0].text == "İşlemci":
                p.islemci = i.find_all("p")[1].text
            elif i.find_all("p")[0].text == "Ekran Boyutu":
                p.ekranBoyutu = i.find_all("p")[1].text.strip("\"").strip()
            elif i.find_all("p")[0].text == "Disk Kapasitesi":
                p.diskKapasitesi = i.find_all("p")[1].text.lower().strip()
            elif i.find_all("p")[0].text == "İşletim Sistemi":
                p.isletimSistemi = i.find_all("p")[1].text
            if i.find_all("p")[0].text == "Model":
                p.modelNo = i.find_all("p")[1].text.strip().lower().replace(" ","")
                break
 
        diziProduct.append(p)

# HEPSİBURADA
headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36'}
for j in range(1,1):
    url = "https://www.hepsiburada.com/laptop-notebook-dizustu-bilgisayarlar-c-98?sayfa="
    url = url + "{}".format(j)
    response = requests.get(url, headers=headers)
    html_icerigi = response.content
    soup = BeautifulSoup(html_icerigi, "html.parser")
    list = soup.find_all("li", {"class": "productListContent-zAP0Y5msy8OHn5z7T_K_"})

    for i in list:
        name = i.a.get("title").strip().lower().replace(" ","")
        fiyat = i.find("div", {"data-test-id": "price-current-price"}).text.strip().strip("TL")
        if fiyat.count(",") == 0:
            fiyat += "{}".format(",00")
            fiyat = fiyat.replace(" ","")

        link = "https://www.hepsiburada.com" + i.a.get("href")
        if len(link) >250:
            continue
        
        for d in diziProduct:
            if name.count(d.modelNo) > 0:
                diziProduct[d.id].linkHepsiburada = link
                diziProduct[d.id].fiyatHepsiburada = fiyat
                break


# TEKNOSA
for j in range(1,1):
    url = "https://www.teknosa.com/laptop-notebook-c-116004?s=%3Arelevance&page="
    url = url + "{}".format(j)
    response = requests.get(url)
    html_icerigi = response.content
    soup = BeautifulSoup(html_icerigi, "html.parser")
    list = soup.find_all("div", {"id": "product-item"})
   
    for i in list:
        fiyat = i.find("span", {"class": "prc prc-last"}).text.strip("TL").strip()
        if fiyat.count(",") == 0:
            fiyat += "{}".format(",00")
            fiyat = fiyat.replace(" ","")

        name = i.get("data-product-name").strip().lower().replace(" ","")
        link = "https://www.teknosa.com" + i.find("a", {"class": "prd-link"}).get("href")

        for d in diziProduct:
            if name.count(d.modelNo) > 0:
                diziProduct[d.id].linkTeknosa = link
                diziProduct[d.id].fiyatTeknosa = fiyat
                break


# TRENDYOL
for j in range(1,1):
    url = "https://www.trendyol.com/laptop-x-c103108?pi="
    url = url + "{}".format(j)
    response = requests.get(url)
    html_icerigi = response.content
    soup = BeautifulSoup(html_icerigi, "html.parser")
    list = soup.find_all("div", {"class": "p-card-wrppr with-campaign-view"})

    for i in list:
        fiyat = i.a.find("div", {"class": "prc-box-dscntd"}).text.strip("TL")
        if fiyat.count(",") == 0:
            fiyat += "{}".format(",00")
            fiyat = fiyat.replace(" ","")

        name = i.a.find("div", {"class": "p-card-img-wr"}).img.get("alt").strip().lower().replace(" ","")
        link = "https://www.trendyol.com" + i.a.get("href")
   
        for d in diziProduct:
            if name.count(d.modelNo) > 0:
                diziProduct[d.id].linkTrendyol = link
                diziProduct[d.id].fiyatTrendyol = fiyat
                break
       


myclient = pymongo.MongoClient("mongodb://localhost:27017")
mydb = myclient["Eticaret"]
mycollection = mydb["products"]


#kayıtları silme
#result = mycollection.delete_many({})
#print(f"{result.deleted_count} adet kayıt silindi")


#kayıt ekleme
num = 1
for i in diziProduct:
    if(i.linkTeknosa == '' and i.linkHepsiburada == '' and i.linkTrendyol == '' ):
        continue

    product = {"id": num,
                "marka": i.marka,
                "modelNo":i.modelNo,
               "name": i.name,
               "image": i.image,
               "kargoDurumu": i.kargoDurum,
               "diskTuru": i.diskTuru,
               "ram":i.ram,
               "rating": i.rating,
               "islemci": i.islemci,
               "ekranBoyutu":i.ekranBoyutu,
               "isletimSistemi": i.isletimSistemi,
               "diskKapasitesi": i.diskKapasitesi,
               "fiyatn11":i.fiyatn11,
                "Linkn11":i.linkn11,
                "fiyatTeknosa":i.fiyatTeknosa,
                "LinkTeknosa":i.linkTeknosa,
                "fiyatHepsiburada":i.fiyatHepsiburada,
                "linkHepsiburada":i.linkHepsiburada,
                "fiyatTrendyol":i.fiyatTrendyol,
                "linkTrendyol":i.linkTrendyol               
                }
    mycollection.insert_one(product)
    num+=1

print(num , " kayıt başarıyla veri tabanına eklendi...")



tools = []

count = 0
for i in mycollection.find():
    tools.append(i)
    tools[count].pop("_id")
    count += 1


app = Flask(__name__)


@app.route("/")
def index():
    return tools


if (__name__ == "__main__"):
    app.run(debug=True)
