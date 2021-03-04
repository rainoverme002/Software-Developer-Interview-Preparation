# nama file p1.py 
# Isikan email anda dan copy semua cell code yang dengan komentar #Graded
# Isikan juga priority file

# untuk resubmisi, grader hanya akan mengambil priority yang paling besar
# jadi kalau anda ingin merevisi kode anda:
# silakan di resubmit dengan nilai variable priority yang lebih besar dari
# nilai priority submisi sebelumnya
# JIKA TIDAK ADA VARIABLE priority DIANGGAP priority=0

priority = 0


#netacad email cth: 'abcd@gmail.com'
email='bagus.gov.id@gmail.com'

# copy-paste semua #Graded cells di bawah ini

# PASTE KODE ANDA DISINI 
#Graded

# Manual, filter, list comprehension
def letter_catalog(items,letter='A'):
  pass
  # MULAI KODEMU DI SINI
  answer = []
  for item in items:
    if item[0] == letter:
        answer.append(item)
            
  return answer

#Graded

def counter_item(items):
  pass
  # MULAI KODEMU DI SINI
  answer = {}
  for item in items:
        if item in answer:
            answer[item]+=1
        else:
            answer[item] = 1
  
  return answer

#Graded

# dua variable berikut jangan diubah
fruits = ['Apple','Avocado','Banana','Blackberries','Blueberries','Cherries','Date Fruit','Grapes','Guava','Jackfruit','Kiwifruit']
prices = [6,5,3,10,12,7,14,15,8,7,9]

# list buah
chart = ['Blueberries','Blueberries','Grapes','Apple','Apple','Apple','Blueberries','Guava','Jackfruit','Blueberries','Jackfruit']

# MULAI KODEMU DI SINI
fruit_price = {}
for index, fruit in enumerate(fruits):
    fruit_price[fruit] = prices[index]


def total_price(dcounter,fprice):
  pass
  # MULAI KODEMU DI SINI
  ttl_price = 0
  for key, value in dcounter.items():
    ttl_price+= fprice[key] * value
  
  return ttl_price

#Graded

def discounted_price(total,discount,minprice=100):
  pass
  # MULAI KODEMU DI SINI
  if total > minprice:
    discounted_total = total - (total * discount/100)
    
  return discounted_total


#Graded

def print_summary(items,fprice):
  pass
  # MULAI KODEMU DI SINI
  items_in_basket = counter_item(items)
  
  for key, value in sorted(items_in_basket.items()):
    singular_price = fprice[key] * value
    print(value, key,':', singular_price)
    
  print('total :',total_price(items_in_basket, fprice))
  print('discount price :', discounted_price(total_price(counter_item(items),fprice),10,minprice=100))
