"""""
def listFunc():
    return [i for i in range(1, 6)] #Create list of ints from 1 to 5, Haskell equivalent [1..5]

def applicatorFunc(inpFunc, s):
    if s=='s':
        return sum(inpFunc())
    else:
        return sum(inpFunc())/5

print(applicatorFunc(listFunc, 's'))
"""
#this is a more generla version of the above function
def listFunc(a, b): 
  return [i for i in range(a, b+1)] #Create list of ints from 1 to 5, Haskell equivalent [1..5]
 
def applicatorFunc(inpFunc, s, a, b):
  if s=='s': 
    return sum(inpFunc(a, b)) 
  else: 
    return sum(inpFunc(a, b))/(b-a+1)
 
print(applicatorFunc(listFunc, 'a', 1, 10))