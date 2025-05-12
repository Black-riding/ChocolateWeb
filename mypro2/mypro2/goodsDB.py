# -*- coding: utf-8 -*-
"""
Created on Wed Apr  3 19:46:22 2024

@author: USER
"""

import requests
import json
# import db
# import datetime


url = "https://24h.pchome.com.tw/search/v4.3/all/results"

headers = {
    'User-Agent':
'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36'
    }


params = {
 'q':'switch',
 'page':1,
 'sort':'rnk/dc'   
    }

params['q'] = '白巧克力'

for i in range(1,6):
    params['page'] = i

    data = requests.get(url,headers=headers,params=params)
    data.encoding = 'utf-8'
    data = data.text
    
    goods = json.loads(data)
    
    allGoods = goods['Prods']
    for item in allGoods:
        Id = "https://24h.pchome.com.tw/prod/" + item['Id']
        PicS = "https://img.pchome.com.tw/cs" + item['PicS']
        Name = item['Name']
        Describe = item['Describe']
        Price = item['Price']
        print(Id)
        print(PicS)
        print(Name)
        print(Describe)
        print(Price)
        print()
        
#         sql = "select name from product where platform='Pchome' and name='{}' ".format(Name)
#         db.cursor.execute(sql)  # 執行SQL語法
#         if db.cursor.rowcount == 0:  # 等於0 表示查無任何資料
#             today = datetime.datetime.today()
#             now = today.strftime("%Y-%m-%d")
#
#             sql = "insert into product(name,platform,price,discount,photo_url,link,create_date) values(%s,%s,%s,%s,%s,%s,%s)"
#             db.cursor.execute(sql,[Name,'Pchome',Price,0,PicS,Id,now])
#             db.conn.commit()
#
# db.conn.close()


            


