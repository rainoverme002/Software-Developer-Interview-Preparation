#include <vector>
#include <deque>
#include <iostream>

using namespace std;

/* [function] visualize_window
    input: 
      - deque int window
    output:
      - void
    description:
      - Output the number inside the window
*/

void visualize_window(deque<int>& window){
  // window visualisation
  for (int i = 0; i < window.size(); ++i)
    cout << window[i] << ", ";
  cout << endl;
}

/* [function] find_max_sliding_window
    input: 
      - vector int input
      - int window_size
    output:
      - vector int result
    description:
      - Find the maximum number inside sliding window
        1. It will always push current number
        2. Check if current number is bigger than number inside the window, it will pop the window
    example:
      input = [-4, 2, -5, 3, 6]
      windows_size = 3
*/

vector<int> find_max_sliding_window(vector<int>& input, int window_size) {
  vector<int> result;

  // **Important** window is used to save the index of number in current window
  deque<int> window;

  // find the maximum for first window
  for(int i = 0; i < window_size; i++){
    //remove all numbers that are smaller than current number
    while(!window.empty() && input[i] >= input[window.back()]){
      window.pop_back();
    }

    window.push_back(i);

    // visualization
    visualize_window(window);
  };

  // push the maximum of the first window to result
  result.push_back(input[window.front()]);

  // find the maximum for the next window
  for(int i = window_size; i < input.size(); i++){

    //remove all numbers that are smaller than current number
    //from the tail of list
    while (!window.empty() && input[i] >= input[window.back()])
    {
      window.pop_back();
    }

    //remove first number if it doesn't fall in the window anymore
    if (!window.empty() && window.front() <= i - window_size)
    {
      window.pop_front();
    }

    window.push_back(i);
    result.push_back(input[window.front()]);

    // visualization
    visualize_window(window);
  }

  return result;
}

/* [main] */

int main(int argc, const char *argv[])
{
  // defining first array
  vector<int> x = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}; //

  // printing first array
  cout << "Array = ";
  for (int i = 0; i < x.size(); ++i)
    cout << x[i] << ", ";
  cout << endl;

  auto res1 = find_max_sliding_window(x, 3);

  //printing the first result
  cout << "Max = ";
  for (int i = 0; i < res1.size(); ++i)
    cout << res1[i] << ", ";
  cout << endl;

  // defining second array
  x = {10, 6, 9, -3, 23, -1, 34, 56, 67, -1, -4, -8, -2, 9, 10, 34, 67};

  //printing the second array
  cout << "Array = ";
  for (int i = 0; i < x.size(); ++i)
    cout << x[i] << ", ";
  cout << endl;

  auto res2 = find_max_sliding_window(x, 3);

  //printing the second result
  cout << "Max = ";
  for (int i = 0; i < res2.size(); ++i)
    cout << res2[i] << ", ";
  cout << endl;

  return 0;
}
