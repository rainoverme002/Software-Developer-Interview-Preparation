#include <iostream>
#include <vector>

using namespace std;

class PairWithTargetSum {
 public:
   /* [function] Search
    input: 
      - vector int arr
      - int target_sum
    output:
      - pair
    description:
      - Find the index of numbers that their sum is equal to target_sum
    assumption:
      - the array is sorted
    example:
      arr = vector<int>{1, 2, 3, 4, 6}
      target_sum = 6
  */

   static pair<int, int> Search(const vector<int> &arr, int target_sum)
   {
     // the left_iterator start from first_index and right_terator from the last index
     int left_iterator = 0;
     int right_iterator = arr.size() - 1;

     while (left_iterator < right_iterator)
     {

       // calculate current sum
       int current_sum = arr[left_iterator] + arr[right_iterator];

       if (current_sum == target_sum)
       {
         return make_pair(left_iterator, right_iterator);
       };

       // it will increment left_iterator to find bigger number inside arr
       if (current_sum < target_sum)
       {
         left_iterator++;
       }
       else
       {
         right_iterator--;
       };
     };

     return make_pair(-1, -1);
  }
};

int main(int argc, char *argv[])
{
  auto result = PairWithTargetSum::Search(vector<int>{1, 2, 3, 4, 6}, 6);
  cout << "Pair with target sum: [" << result.first << ", " << result.second << "]" << endl;
  result = PairWithTargetSum::Search(vector<int>{2, 5, 9, 11}, 11);
  cout << "Pair with target sum: [" << result.first << ", " << result.second << "]" << endl;
}
