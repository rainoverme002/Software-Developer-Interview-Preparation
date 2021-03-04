# nama file p2.py 
# Isikan email anda dan copy semua cell code yang dengan komentar #Graded

# untuk revisi dan resubmisi sebelum deadline
# silakan di resubmit dengan nilai variable priority yang lebih besar dari
# nilai priority submisi sebelumnya
# JIKA TIDAK ADA VARIABLE priority DIANGGAP priority=0
import random
priority = 0

#netacad email cth: 'abcd@gmail.com'
email='bagus.gov.id@gmail.com'
 
# copy-paste semua #Graded cells YANG SUDAH ANDA KERJAKAN di bawah ini

#Graded

def isPointInCircle(x, y, r, center=(0, 0)):
  pass
  # MULAI KODEMU DI SINI
  right_sign = r**2
  left_sign = (x-center[0])**2 + (y-center[1])**2
  if left_sign < right_sign:
    return True
  if left_sign > right_sign:
    return False
  if left_sign == right_sign:
    return True


#Graded

def generateRandomSquarePoints(n, length, center=(0, 0)):
  pass
  # MULAI KODEMU DI SINI
  minx = center[0]-length/2
  miny = center[1]-length/2
  maxx = center[0]+length/2
  maxy = center[1]+length/2

  # Gunakan list comprehension dengan variable minx, miny, length, dan n
  points = []

  for i in range(n):
    points.append([random.uniform(minx, maxx), random.uniform(miny, maxy)])

  return points

#Graded


def MCCircleArea(r, n=100, center=(0, 0)):
  pass
  # MULAI KODEMU DI SINI
  points = generateRandomSquarePoints(n, r*2, center)

  point_inside = 0
  point_outside = 0
  square_area = (r*2)**2

  for point in points:
    if isPointInCircle(point[0], point[1], r, center) == True:
      point_inside += 1
    if isPointInCircle(point[0], point[1], r, center) == False:
      point_outside += 1

  return point_inside/(point_inside + point_outside) * square_area

#Graded

def LLNPiMC(nsim, nsample):
  pass
  # MULAI KODEMU DI SINI
  total_of_circle_area = 0

  for i in range(nsim):
    total_of_circle_area += MCCircleArea(1, nsample)

  return total_of_circle_area / nsim

# Graded


def relativeError(act, est):
  pass
  # MULAI KODEMU DI SINI
  return abs(est - act)/act * 100
  
  
