#include <iostream>
#include <vector>

using namespace std;

class Knapsack
{
public:

  /* [function] SolveKnapsack
    input: 
      - vector int profits
      - vector int weights
      - vector int capacity
    output:
      - int
    description:
      - Find maximum profit from items in certain capacity
    assumption:
      - the data is integer
    example:
      vector<int> profits = {1, 6, 10, 16};
      vector<int> weights = {1, 2, 3, 5};
  */

  int SolveKnapsack(const vector<int> &profits, vector<int> &weights, int capacity)
  {
    // Create vector of vector with value -1 to store the memoization
    vector<vector<int>> storage(profits.size(), vector<int>(capacity + 1, -1));

    return FindMaximumProfitRecursively(storage, profits, weights, capacity);
  };

private:

  /* [function] FindMaximumProfitRecursively
    input: 
      - vector of vector int storage
      - vector int profits
      - vector int weights
      - vector int capacity
    output:
      - int
    description:
      - Recursive method to find maximum profit
    assumption:
      - the data is integer
    example:
      vector<int> profits = {1, 6, 10, 16};
      vector<int> weights = {1, 2, 3, 5};
  */

  int FindMaximumProfitRecursively(vector<vector<int>> &storage, const vector<int> &profits, vector<int> &weights, int capacity, int current_index = 0)
  {

    // return if capacity is full or current_index is bigger than size
    if (capacity <= 0 || current_index >= profits.size())
    {
      return 0;
    }

    // if we have already the data inside our storage, we will fetch it from there
    if (storage[current_index][capacity]){
      storage[current_index][capacity];
    };

    // recursive call after choosing the element at the currentIndex
    // if the weight of the element at currentIndex exceeds the capacity, we shouldn't process this
    int profit_from_current_step = 0;
    if(weights[current_index] <= capacity){
      profit_from_current_step = profits[current_index] + FindMaximumProfitRecursively(storage, profits, weights, capacity - weights[current_index], current_index + 1);
    };

    // recursive call after excluding the element at the currentIndex
    int proft_from_next_step = FindMaximumProfitRecursively(storage, profits, weights, capacity, current_index + 1);

    // Find the maximum between two profits
    storage[current_index][capacity] = max(profit_from_current_step, proft_from_next_step);

    return storage[current_index][capacity];
  };
};

int main(int argc, char *argv[])
{
  Knapsack ks;
  vector<int> profits = {1, 6, 10, 16};
  vector<int> weights = {1, 2, 3, 5};
  int maxProfit = ks.SolveKnapsack(profits, weights, 6);
  cout << "Total knapsack profit ---> " << maxProfit << endl;
  maxProfit = ks.SolveKnapsack(profits, weights, 7);
  cout << "Total knapsack profit ---> " << maxProfit << endl;

  return 0;
}
