import random

CHOICE_NAME = {
  1: 'Rock',
  2: 'Paper',
  3: 'Scissor'
}

def game_intro():
    print('\n')
    print('This game will have the following rules : \n\n'
          + 'Rock VS Paper -> the winner is PAPER \n'
          + 'Rock VS Scissor -> the winner is ROCK \n'
          + 'Paper VS Scissor -> the winner is SCISSOR \n')

def get_player_choice():
    print('Well, you can enter your choices number : \n\n 1. Rock \n 2. Paper \n 3. Scissor \n')
    choices = int(input('Your turn: '))

    while choices > 3 or choices < 1:
        choices = int(input('Enter your valid input here: '))

    print('Your choices is: ' + CHOICE_NAME[choices] + '\n')
  
    return choices

def get_computer_choice():
    print('Now the computer will turn to initiate.....')

    computer_choice = random.randint(1, 3)

    print('Computer choice is: ' + CHOICE_NAME[computer_choice] + '\n')

    return computer_choice

def battle(choices, computer_choice):
    print('== ' + CHOICE_NAME[choices] + ' VS ' + CHOICE_NAME[computer_choice] + ' ==\n')

    if((choices == 1 and computer_choice == 2) or
         (choices == 2 and computer_choice == 1)):
          print('== The winner is PAPER ==\n', end='')
    elif ((choices == 1 and computer_choice == 3) or
          (choices == 3 and computer_choice == 1)):
        print('== The winner is ROCK ==\n', end='')
    elif ((choices == 2 and computer_choice == 3) or
          (choices == 3 and computer_choice == 2)):
        print('== The winner is SCISSOR ==\n', end='')
    else:
        print('DRAW')

def play_again():
    print('\n')
    print('Hey, do you want to play again? (Y/N)')
    answer = input()

    return answer


if __name__ == "__main__":
    while True:
      game_intro()
      player_choice = get_player_choice()
      computer_choice = get_computer_choice()
      battle(player_choice, computer_choice)
      player_want_play_again = play_again()
      

      if player_want_play_again == 'n' or player_want_play_again == 'N':
        print('Thank your for playing with us :)\n')
        break
          

