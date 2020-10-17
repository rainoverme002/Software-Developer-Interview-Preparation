# nama file p3.py 
# Isikan email anda dan copy semua cell code yang dengan komentar #Graded

# untuk revisi dan resubmisi sebelum deadline
# silakan di resubmit dengan nilai variable priority yang lebih besar dari
# nilai priority submisi sebelumnya
# JIKA TIDAK ADA VARIABLE priority DIANGGAP priority=0
priority = 0

#netacad email cth: 'abcd@gmail.com'
email='bagus.gov.id@gmail.com'
 
# copy-paste semua #Graded cells YANG SUDAH ANDA KERJAKAN di bawah ini

# Graded
def caesar_encript(txt,shift):
  pass
  # Mulai Kode anda di sini
  result = ""

  for word in txt:
    if word.isalpha() == True:
        ASCII_number = ord(word) + shift
        
        if word.islower() == True and ASCII_number > 122:
            ASCII_number = ord(word) + shift - 122
        elif word.isupper() == True and ASCII_number > 90:
            ASCII_number = ord(word) + shift - 90
            
        result += chr(ASCII_number)
    else:
        result += word
  

  return result
    
# Fungsi Decript caesar
def caesar_decript(chiper,shift):
  return caesar_encript(chiper,-shift)


# Graded
 
# Fungsi mengacak urutan
def shuffle_order(txt,order):
  return ''.join([txt[i] for i in order])
 
# Fungsi untuk mengurutkan kembali sesuai order
def deshuffle_order(sftxt,order):
  pass
  # Mulai Kode anda di sini
  result = []
  
  for i in order:
    result.append(0)

  for i in order:
       result[i] = sftxt[order.index(i)]  

  return "".join(result)

# Graded
 
import math
 
 
# convert txt ke dalam bentuk list teks yang lebih pendek
# dan terenkrispi dengan urutan acak setiap batchnya
def send_batch(txt,batch_order,shift=3):
  pass
  # Mulai Kode anda di sini
  encrypted_txt = caesar_encript(txt, shift)

  result = []
  batch_word = []
  counter = 0
  
  # Check how many "_"to be added
  diff = len(batch_order) - (len(encrypted_txt) % len(batch_order))
  
  # Adding "_"
  for i in range(0, diff):
    encrypted_txt+= '_'
    

  for word in encrypted_txt:
    batch_word.append(word)

    if len(batch_word) == len(batch_order):
        result.append(shuffle_order(''.join(batch_word),batch_order))
        batch_word = []
        
        
  return result
  
 
 
# batch_cpr: list keluaran send_batch
# fungsi ini akan mengembalikan lagi ke txt semula
def receive_batch(batch_cpr,batch_order,shift=3):
  batch_txt = [caesar_decript(deshuffle_order(i,batch_order),shift) for i in batch_cpr]
  return ''.join(batch_txt).strip('_')
