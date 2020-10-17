'''
namafile: sba.py
Lembar kerja/script Latihan SBA
'''
# >>>>>>LEMBAR KERJA>>>>>>>>>
# lembar ini hanya berisi pendefinisian fungsi dan class saja

#email netacad
email = 'bagus.gov.id@gmail.com'

# >>>>>>Soal 1


def fungsiIO():
  pass
  while(True):
    try:
      array_of_number = input("Inputkan barisan angka: ").split()
      array_of_number = list(map(int, array_of_number))
      array_of_number.sort()

      for number in array_of_number:
        print('*' * number)

      break
    except:
      print('Please input value using space like this: 2 3 11')

# >>>>>>Akhir Soal 1

# >>>>>>Soal 2


def caseShopia(txt):
  pass
  # Mulai kode anda dari sini
  new_txt = ''
  for alphabet in txt:
    if alphabet.islower():
      new_txt += alphabet.upper()
    if alphabet.isupper():
      new_txt += alphabet.lower()

  return(new_txt)

# >>>>>>Akhir Soal 2


# Jangan diubah biarkan seperti ini
dcur2idr = {'USD': 14425, 'EUR': 16225, 'AUD': 9925, 'CAD': 10500,
            'GBP': 17800, 'CHF': 15200, 'SGD': 10375, 'HKD': 1775,
            'JPY': 132500, 'MYR': 3250, 'SAR': 3500, 'WON': 10750,
            'IDR': 1}

# >>>>>> Soal 3


def usd2eur(usd):
  pass
  # Mulai kode anda dari sini
  eur = usd / dcur2idr['EUR'] * dcur2idr['USD']

  return eur


# >>>>>>Akhir Soal 3


# >>>>>>Soal 4
class MoneyChanger:
  def __init__(self, dcurrency, base='IDR', percent=2):
    pass
    # Mulai kode anda dari sini
    self.dcurrency = dcurrency
    self.base = base
    self.percent = percent

  def selling_price(self, nominal, curr):
    pass
    # Mulai kode anda dari sini
    currency_value = nominal / self.dcurrency[self.base] * self.dcurrency[curr]
    real_selling_price = currency_value + (currency_value * self.percent / 100)

    return real_selling_price

  def buying_price(self, nominal, curr):
    pass
    # Mulai kode anda dari sini
    currency_value = nominal / self.dcurrency[self.base] * self.dcurrency[curr]
    real_buying_price = currency_value - (currency_value * self.percent / 100)
    
    return real_buying_price

  def change_base(self, new_base):
    pass
    # Mulai kode anda dari sini
    self.base = new_base


# >>>>>>Akhir Soal 4

# >>>>>>AKHIR LEMBAR KERJA>>>>>>>>>


# KODE DI BAWAH INI UNTUK TESTING
# ANDA BOLEH MEMBUANG SEMUA KODE DI SAAT SUBMISI KE NETACAD

def main():
  pass
  # >>>>>TEST DI SINI>>>>>>
  # gunakan BLOCK MAIN ini untuk mengetes
  # untuk pengetesan kode hanya boleh di bagian sini
  # silakan test sesuka hati di sini

  #############################################
  # uncomment script di bawah ini untuk testing
  #############################################

  # print('test soal 1')
  # fungsiIO() # contoh input: 7 4 5 2 1 3

  # print('test soal 2')
  # print(caseShopia('@ˆ@&#*@(@8989As'))

  # print('test soal 3')
  # print(usd2eur(100))  # mengubah 100 USD ke EUR

  # print('test soal 4')
  # mc = MoneyChanger(dcur2idr,base='EUR') # object mc dengan base EUR
  # print('base', mc.base)
  # print(mc.selling_price(100,'USD')) # nilai jual 100 USD ke EUR (Base)
  # print(mc.buying_price(100,'USD')) # nilai beli 100 USD ke EUR (Base)

  # mc.change_base('IDR') # Ganti Base object mc ke IDR
  # print('base', mc.base)
  # print(mc.selling_price(100,'USD')) # nilai jual 100 USD ke IDR (Base)
  # print(mc.buying_price(100,'USD'))  # nilai beli 100 USD ke IDR (Base)

  # >>>>>AKHIR TEST DI SINI>>>>>>


if __name__ == '__main__':
  main()
